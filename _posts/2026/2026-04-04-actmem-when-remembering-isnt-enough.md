---
title: "ActMem: when remembering isn't enough"
subtitle: Bridging the gap between retrieval and reasoning in agent memory
categories:
  - AI
tags:
  - artificial intelligence
  - agents
  - memory
  - knowledge graphs
  - papers
header:
  image: assets/alpha/Journal.gif
  image_description: Writing it down for later remembering
description: A deep dive into ActMem, a framework that argues finding the right memory is only half the battle — the other half is reasoning about what it means.
excerpt_separator: <!--more-->
math: true
---

I've been reviewing papers on agent memory, since it's one of the latest unsolved problems. Turns out there are multiple ways to take on this problem and I was hoping to summarise the most popular approaches, but there are too many and too extensive for a single post. So I'll start with this one: bridging the gap between retrieval and reasoning.

<!--more-->

## The RAG we want vs. the RAG we need

Here's a scenario that I think captures the whole paper in thirty seconds. You've been chatting with an AI assistant for weeks. At some point you mentioned your new puppy, how he's teething, chewing on everything in the house. Shoes, furniture, cables. The assistant gave you advice, you moved on.

A few weeks later, you want to buy plants and you ask: "Where can I buy Sago Palms nearby?"

A system with good *retrieval* finds your plant-shopping preferences and gives you store recommendations. A system with good *reasoning* connects the dots: Sago Palms contain cycasin, which is highly toxic to dogs. Your puppy chews on everything. This is a dangerous purchase.

The memory about the puppy is right there in the history. The system stored it just fine. It could even retrieve it if you asked "what's my puppy up to?" But because you asked about *plants*, the puppy facts are semantically invisible. No retrieval system based on embedding similarity is going to bridge the gap between "Sago Palms on sale" and "teething puppy chews on everything."

This is the core thesis of [ActMem](https://arxiv.org/abs/2603.00026) (Zhang et al., Nanjing University + Alibaba, February 2026): most agent memory frameworks optimise for **the capacity to recall**, when what actually matters is **the utility of memory for action**. Can the agent use what it remembers to make better decisions? Their answer is that retrieval and reasoning need to be fused, not treated as separate steps, and they back it up with both a framework and a purpose-built benchmark.

## How ActMem works

The framework is a four-stage pipeline. Each stage feeds into the next, transforming raw dialogue into a structured knowledge graph and then querying it with a reasoning-augmented retrieval process.

![ActMem architecture: a four-stage pipeline from fact extraction through clustering and knowledge graph construction to counterfactual retrieval]({{ site.baseurl }}/assets/actmem-diagram.svg)

### Stage 1: Fact extraction

Raw conversation gets compressed into atomic memory facts by an LLM. Not summaries (which lose detail) but individual, self-contained statements:

> - User's puppy drove him crazy on Jan 24, 2025.
> - User's puppy is teething.
> - User's puppy has started chewing on everything in the house.
> - User needs to keep anything dangerous out of reach.

The key word is *atomic*. Each entity and event gets its own fact. A summary might say "user has a teething puppy that chews things"; the fact extractor gives you four separate nodes to reason over. This granularity pays off later when the system needs to identify which specific facts participate in causal chains.

### Stage 2: Fact clustering

Mining causal relationships across every pair of facts in the whole history would be prohibitively expensive. So ActMem groups related facts into clusters using a single-pass incremental algorithm over embeddings (they use Qwen3-Embedding-8B). Each incoming fact gets compared to existing cluster centroids; if similarity exceeds a threshold, it joins the cluster. Otherwise, it seeds a new one. Similar to a cluster-based mechanism that is used to store memories.

The puppy facts end up in a "puppy care" cluster. Plant facts end up in "plant shopping." This is both a performance optimisation and a design choice: causal mining stays local to topically related groups.

### Stage 3: Memory knowledge graph

This is where ActMem distinguishes itself from flat memory stores. The system builds a knowledge graph $$\mathcal{G} = (\mathcal{V}, \mathcal{E})$$, where $$\mathcal{G}$$ is the full graph, $$\mathcal{V}$$ is the set of memory fact nodes, and $$\mathcal{E}$$ is the set of edges connecting them. Those edges come in two types:

**Semantic edges** are the straightforward kind: cosine similarity between fact embeddings, thresholded. If two facts are about similar topics, they get connected. Within the puppy cluster, all four facts would be semantically linked.

**Causal edges** are more interesting. Within each cluster, the LLM proposes candidate cause-effect pairs (e.g., "teething $$\rightarrow$$ chewing on everything"). But here's the catch: LLMs are really good at *confidently asserting* causal relationships that don't actually hold. The paper calls this "causal hallucination," and they address it with a PMI-based verification step using an entirely separate model (GPT2-Large). The idea is to measure whether knowing the cause actually reduces uncertainty about the effect:

$$S_{PMI}(f_i, f_j) = \mathcal{L}_\mathcal{M}(f_j \mid T_{uncond}) - \mathcal{L}_\mathcal{M}(f_j \mid T_{cond})$$

In plain terms: $$\mathcal{L}_\mathcal{M}$$ is the cross-entropy loss (how surprised the model is) when predicting $$f_j$$. $$T_{uncond}$$ is a neutral context ("The fact is that $$f_j$$"), while $$T_{cond}$$ includes the supposed cause ("$$f_i$$. As a result, $$f_j$$"). If the model is *less* surprised about the effect when it knows the cause, the difference is positive and the causal link is plausible.

If the score is positive and above a threshold, the causal link is real (or at least statistically supported). If not, it gets discarded. Using a smaller, independent model as the verifier means the main LLM can't just convince itself that a spurious correlation is causation. I really like this decision. It's the kind of "trust but verify" approach that more agent systems should adopt.

### Stage 4: Counterfactual retrieval

Given a query, ActMem doesn't just retrieve by vector similarity and call it a day. It does a three-step dance:

**Step 1** retrieves an initial set of facts by embedding similarity. For our Sago Palms query, this returns the plant-shopping facts. Nothing about the puppy.

**Step 2** asks a counterfactual question: *"If the user does this, what negative consequences might occur?"* The LLM generates commonsense knowledge like "Sago Palms contain cycasin, which is toxic to dogs and pets when ingested." This generated knowledge, $$k_{cs}$$, becomes a new retrieval anchor.

**Step 3** uses $$k_{cs}$$ for a second retrieval pass. Now "toxic to dogs" and "chewing on everything" and "keep dangerous things out of reach" are semantically close. The puppy facts get pulled in. The final context combines everything: plant facts, generated safety knowledge, and puppy facts.

The agent now has what it needs to warn the user instead of cheerfully recommending the nearest garden centre.

## What memory looks like over time

Let me walk through the full lifecycle to make the mechanics concrete.

After **Session 1** (the puppy conversation), the knowledge graph has a small, tightly-connected cluster:

> **Puppy care cluster**
> $$f_1$$: User's puppy drove him crazy (Jan 24, 2025)
> $$f_2$$: User's puppy is teething
> $$f_3$$: Puppy has started chewing on everything
> $$f_4$$: User needs to keep dangerous things out of reach
>
> Semantic edges: $$f_1 \leftrightarrow f_2 \leftrightarrow f_3 \leftrightarrow f_4$$ (all connected, high similarity)
> Causal edges: $$f_2 \rightarrow f_3$$ (teething causes chewing, PMI-verified)

After **Session 2** (plant shopping), a second cluster appears:

> **Plant shopping cluster**
> $$f_5$$: User is interested in buying indoor plants
> $$f_6$$: User wants to buy Sago Palms
>
> Semantic edges: $$f_5 \leftrightarrow f_6$$
> Causal edges: none (no cause-effect relationship between these)

At this point, the two clusters are completely isolated. No edges between them. No pre-computed relationship links puppies to plants. If you drew the graph, it would be two disconnected islands.

**At query time**, the counterfactual reasoning step builds a temporary bridge. The generated commonsense knowledge ("Sago Palms are toxic to dogs") doesn't get stored in the graph; it exists only as a retrieval anchor for this specific query. Next time the user asks something unrelated, the bridge vanishes.

This is the fundamental architectural difference from systems like A-MEM (which we'll explore in another post soon, as I really liked that paper too), where relationships between memories are established during *storage*. A-MEM would need to somehow predict, at the time you store the puppy facts, that they might later be relevant to a plant-shopping query. ActMem bets that you can't predict that, so it doesn't try. It reasons at query time instead.

## The benchmark: ActMemEval

Most memory benchmarks test whether an agent can *find* a fact. "What was the user's favourite restaurant?" The answer is literally in the dialogue history; you just need to locate it. ActMem's authors argue this is only testing retrieval, not reasoning, so they built a new benchmark called ActMemEval that specifically requires causal inference.

I'll be upfront: a paper introducing its own benchmark to evaluate itself always makes me a little suspicious. There *are* existing benchmarks for reasoning capabilities, and reaching for a custom one can be a way to pick a playing field that favours your approach. That said, I genuinely can't think of a benchmark that specifically evaluates the construction of reasoning chains out of individual, disconnected facts in a memory context. If that gap is real, building a new benchmark is the right call. I just can't fully tell if this is filling a legitimate gap or quietly dodging harder comparisons.

The construction pipeline is more rigorous than what I usually see. An LLM generates reasoning topologies (causal chains from background events through triggers to conflicting actions), a validator filters out logically inconsistent ones, a dialogue editor converts them to natural conversation across varying styles (formal, casual, verbose, concise), noise sessions get injected to mimic real chat, and finally human annotators verify the whole thing. Only 246 of 300 generated samples survived the process.

They also did a nice sanity check: they measured the semantic similarity between ground-truth answers and the raw dialogue history. LongMemEval (a standard retrieval benchmark) averages 0.347, meaning answers are often close to verbatim retrieval. ActMemEval averages 0.232. The gap confirms that their dataset genuinely requires reasoning, not just pattern matching.

## Results

Here's the main comparison on ActMemEval, with QA accuracy scored by DeepSeek-V3 as an LLM judge:

| LLM | Method | Retrieval Acc. | QA Acc. |
|---|---|---|---|
| DeepSeek-V3 | NaiveRAG | **84.86** | 61.54 |
| | Mem0 | 68.02 | 41.80 |
| | A-Mem | 64.31 | — |
| | MemoryOS | — | 13.36 |
| | LightMem | 56.88 | 63.97 |
| | **ActMem** | 71.66 | **76.52** |
| GPT-4o-mini | NaiveRAG | **86.03** | 34.00 |
| | Mem0 | 69.19 | 31.10 |
| | A-Mem | 66.41 | 18.42 |
| | MemoryOS | — | 12.20 |
| | LightMem | 66.59 | 40.49 |
| | **ActMem** | 76.92 | **52.22** |

Look at NaiveRAG: best retrieval accuracy across both backbones, mediocre-to-poor QA accuracy. It's a perfect illustration of the paper's thesis. You can have the most precise memory retrieval in the world and still give terrible answers if you can't reason about what those memories *mean*.

ActMem flips the priority. Its retrieval accuracy is lower than NaiveRAG's (it's retrieving different things, including causally-related facts that weren't in the original query's neighbourhood), but its QA accuracy is the highest by a comfortable margin.

The GPT-4o-mini rows add an interesting dimension. ActMem still wins, but the gap between retrieval accuracy and QA accuracy is much wider (76.92% vs. 52.22%) compared to DeepSeek-V3 (71.66% vs. 76.52%). The lighter model retrieves almost as well but can't close the reasoning loop as effectively. The framework gives you the right context, but you still need a strong enough model to synthesise it into a correct answer.

On LongMemEval (where the task *is* just retrieval), ActMem still does well: 75.60% vs. LightMem's 68.64% and NaiveRAG's 60.00%. The causal reasoning doesn't hurt conventional performance, which is reassuring.

The ablation study confirms what you'd expect. Removing counterfactual reasoning causes the biggest retrieval drop (~9%); without it, the semantic bridge between unrelated clusters never gets built. Removing causal edges yields the lowest QA accuracy; even when the right facts are retrieved, the agent can't form reasoning chains without explicit causal structure. Removing semantic edges also hurts, because they ensure topically related facts stay reachable even when no causal link exists between them.

## Where I'm less convinced

The retrieval accuracy gap is, frankly, a shame. The idea behind ActMem is genuinely good, but losing 10-15 points of retrieval accuracy against NaiveRAG is enough to give me serious pause. If your system can't reliably *find* the right facts, you won't know whether the good QA numbers come from sound reasoning or from getting lucky with the smaller set it does retrieve. The QA accuracy improvements are worth academic consideration and point toward a promising research direction, but I can't say I'd put this into a production system as-is.

The counterfactual question is specifically framed as "what negative consequences might occur?" That's perfect for the Sago Palms scenario. But what about cases where the reasoning involves positive implications, scheduling conflicts, or resource dependencies? A user mentions they're moving to a new apartment next month, and later asks about furniture delivery timelines. The relevant memory link isn't about danger, it's about logistics. I'd want to see this tested on scenarios where the reasoning doesn't involve risk.

The pipeline also has a lot of moving parts. An extractor LLM, an embedding model, a clustering module, a causal-mining LLM, a PMI verification model (GPT2-Large), a counterfactual reasoning LLM, and a final answering LLM. That's at least three distinct model invocations per query, plus the graph construction overhead. In production, coordinating all of this (and debugging it when something goes wrong) is a real engineering challenge. The efficiency comparison shows ActMem is significantly slower to construct than LightMem, though faster than heavyweights like A-Mem or MemoryOS.

ActMemEval only has 246 samples. By design, quality over quantity. But that's small enough that a few unlucky examples could swing the results. I'd feel more confident with a larger dataset, even if it meant a somewhat noisier construction process.

One thing that surprised me: this paper was published in February 2026, and they evaluated exclusively against DeepSeek-V3 and GPT-4o-mini. No reasoning models. No o1, no o3, no DeepSeek-R1. For a paper whose entire thesis is that the gap between retrieval and reasoning matters, not testing against models specifically designed for stronger reasoning feels like a significant omission. It's possible the results would look even better (the framework giving reasoning models the context they need to shine), or it's possible a strong reasoning model with plain NaiveRAG would close the gap on its own. Either way, the absence of that comparison is suspicious and leaves a hole in the evaluation.

And there's a philosophical question hiding underneath all of this: is baking reasoning into the *memory system* the right place for it? A sufficiently capable model with good retrieval might just... reason on its own. The paper partially addresses this (NaiveRAG's high retrieval + low QA accuracy shows that models *don't* just reason on their own), but I suspect this gap will narrow as models get better. ActMem's value might be inversely proportional to the base model's reasoning capability. The GPT-4o-mini vs. DeepSeek-V3 comparison already hints at this.

## What this means for agent memory

ActMem's biggest contribution isn't the specific architecture (knowledge graphs with causal edges have been around for a while). It's the *framing*. By cleanly separating "can you find it?" from "can you use it?", and building a benchmark that measures the latter, they've given the field something valuable. And this is truly the revelation behind this paper: we can find blind spots and reasoning gaps in an algorithmic way, which is a great advance.

The counterfactual retrieval idea, specifically, is worth stealing. Even if you don't adopt the full pipeline, the pattern of "retrieve, then ask what could go wrong, then retrieve again with that context" could be bolted onto almost any memory system. It's a two-query approach that turns a passive lookup into an active reasoning step, and the bridge it builds between disconnected memory clusters is something no amount of embedding refinement can replicate.

Whether the full KG construction (fact extraction, clustering, causal mining, PMI validation) is worth the overhead in production remains to be seen. But the question it forces you to ask ("does my memory system actually *think* about what it remembers?") is one that every agent developer should be sitting with.

*Paper: [ActMem: Bridging the Gap Between Memory Retrieval and Reasoning in LLM Agents](https://arxiv.org/abs/2603.00026) (Zhang et al., 2026). Code and dataset: [github.com/nju-websoft/ActMem](https://github.com/nju-websoft/ActMem).*
