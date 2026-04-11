---
title: "A-MEM: Zettelkasten for agents"
subtitle: An actively managed memory network for LLMs
categories:
  - AI
tags:
  - artificial intelligence
  - agents
  - memory
  - knowledge graphs
  - papers
  - Zettelkasten
header:
  image: assets/alpha/gitTree.png
  image_description: Connected notes
description: A-MEM brings the Zettelkasten method to LLM agents, turning memory into an actively managed knowledge network. The results are promising, but the approach carries risks I know from personal experience.
excerpt_separator: <!--more-->
math: true
---

The Zettelkasten method is a note-taking system invented by Niklas Luhmann, a German sociologist who used it to produce over 70 books and hundreds of articles over his career. The idea is that every thought becomes a card, and the cards are linked to each other associatively rather than filed into categories. Luhmann described his 90,000-card system as a "conversation partner" because the network of connections would surface relationships he hadn't consciously made.

I've tried it myself. It wasn't for me. The problem wasn't the concept (which is genuinely elegant) but the upkeep. For Zettelkasten to work, you need to invest time at every step: writing atomic notes, choosing the right links, revisiting old cards to update them. If you slack off on any of those, the whole system degrades. Notes pile up unlinked, connections become stale, and you end up with something worse than a simple chronological notebook because now you *expect* the links to be there and they aren't.

So when I saw that A-MEM takes this exact method and hands the upkeep to an LLM, my first reaction was: genius or dumb? Let's find out!

<!--more-->

## The pitch

[A-MEM](https://arxiv.org/abs/2502.12110) (Xu et al., 2025, published at NeurIPS 2025) argues that agent memory should be an actively managed knowledge network, not a passive dump of past interactions. I agree with this completely. Most memory systems today are glorified append-only logs: interactions go in, embeddings get computed, and when you need something you do a cosine similarity search and hope for the best. That works for simple factual recall but falls apart when the agent needs to synthesise information across multiple past experiences.

A-MEM's answer is to model memory as a Zettelkasten: each memory becomes a richly annotated note with keywords, tags, a contextual description, an embedding, and links to other notes. The system actively maintains this network by updating old notes when new information arrives.

The [source code](https://github.com/agiresearch/A-MEM) is available on GitHub (in an organization called "AGI Research", how cool is that?).

## How it works

The system has three core operations that run every time a new memory arrives.

![A-MEM architecture: three-step pipeline from note construction through link generation to memory evolution]({{ site.baseurl }}/assets/a-mem-diagram.svg)

### Note construction

When a new interaction comes in, the LLM goes beyond storing the raw text. It generates a full memory note with seven components: the original content, a timestamp, LLM-generated keywords, LLM-generated tags, a contextual description, an embedding vector, and a set of links (initially empty). The embedding is computed over all the generated fields concatenated together:

$$e_i = f_{enc}[\text{concat}(c_i, K_i, G_i, X_i)]$$

The idea is that the embedding captures multiple angles of the same memory (content, topic keywords, categorical tags, contextual interpretation) rather than just the raw text. This makes retrieval more nuanced: two memories might share keywords but have different contexts, or vice versa.

I found this familiar, and I remembered that [LangGraph's memory system](https://langchain-ai.github.io/langmem/concepts/conceptual_guide/) uses tuple-based namespaces like `(some_id, something_else, "context")` to organize memories, enriched with metadata for filtering and semantic search. A-MEM's note structure is essentially the same intuition that LangGraph pursues (content alone isn't enough; you need structured metadata around it) taken to a more aggressive level, where the LLM itself decides what the metadata should be.

### Link generation

After constructing the note, the system finds existing memories that might be related. It computes cosine similarity against all stored embeddings, retrieves the top-k candidates, and then asks the LLM to evaluate each candidate: is this a genuine conceptual relationship, or just surface-level similarity?

This two-step process (embedding retrieval followed by LLM filtering) is important. Pure cosine similarity would connect "user's puppy is teething" to "user bought chew toys" (genuine relationship) but also to "user discussed dental insurance" (surface-level keyword overlap on "teething"). The LLM step is supposed to catch these false positives and only create links that represent real conceptual connections.

### Memory evolution

This is the part that's most distinctly Zettelkasten and the part that makes me both excited and nervous. When a new memory links to existing ones, the system re-evaluates the old memories in light of the new information and potentially *updates* them:

$$m_j^* \leftarrow \text{LLM}(m_n \| \mathcal{M}_{near} \\ m_j \| P_{s3})$$

So if you previously stored "user owns a dog" and now you learn "user's puppy is teething," the old memory might get updated to "user owns a young dog going through a teething phase." The tags, keywords, and contextual description can all change. The memory network grows and refines simultaneously: old memories don't sit there collecting dust, they get richer as new related experiences arrive.

### My scepticism kicks in here

In a human Zettelkasten, this refinement depends on the human's judgment being consistently good. When it is, the system is magical (Luhmann's productivity was legendary). When it isn't, mistakes propagate: a bad link leads to a bad update, which leads to more bad links, and the whole network drifts. For an LLM, the risk is the same but compounded. Any hallucination or reasoning error during note construction, link evaluation, or memory evolution has the chance to be propagated and made worse by every subsequent step of the process. The system is actively building on its own previous decisions, which is powerful when those decisions are correct and dangerous when they aren't.

## Results

They evaluated across six model families (GPT-4o-mini, GPT-4o, Qwen2.5 1.5B/3B, Llama 3.2 1B/3B, DeepSeek-R1-32B, Claude 3.0/3.5 Haiku) using all-minilm-l6-v2 as the text encoder and a default top-k of 10. The two benchmarks were [LoCoMo](https://arxiv.org/abs/2402.17753) (7,512 QA pairs across five question types: single-hop, multi-hop, temporal, open-domain, adversarial) and [DialSim](https://arxiv.org/abs/2406.13144) (1,300 multi-party dialogue sessions totalling ~350k tokens, built from TV show scripts).

Here are the full LoCoMo results (F1 scores across all five question categories):

| Model | Method | Multi-hop | Temporal | Open Domain | Single-hop | Adversarial |
|---|---|---|---|---|---|---|
| GPT 4o-mini | LoCoMo | 25.02 | 18.41 | 12.04 | 40.36 | 69.23 |
| | ReadAgent | 9.15 | 12.60 | 5.31 | 9.67 | 9.81 |
| | MemoryBank | 5.00 | 9.68 | 5.56 | 6.61 | 7.36 |
| | MemGPT | 26.65 | 25.52 | 9.15 | 41.04 | 43.29 |
| | **A-MEM** | **27.02** | **45.85** | **12.14** | **44.65** | 50.03 |
| GPT 4o | LoCoMo | 28.00 | 9.09 | 16.47 | **61.56** | **52.61** |
| | ReadAgent | 14.61 | 4.16 | 8.84 | 12.46 | 6.81 |
| | MemoryBank | 6.49 | 2.47 | 6.43 | 8.28 | 4.42 |
| | MemGPT | 30.36 | 17.29 | 12.24 | 60.16 | 34.96 |
| | **A-MEM** | **32.86** | **39.41** | **17.10** | 48.43 | 36.35 |
| Qwen2.5 1.5B | LoCoMo | 9.05 | 4.25 | 9.91 | 11.15 | 40.38 |
| | ReadAgent | 6.61 | 2.55 | 5.31 | 10.13 | 5.42 |
| | MemoryBank | 11.14 | 4.46 | 8.05 | 13.42 | 36.76 |
| | MemGPT | 10.44 | 4.21 | 13.42 | 9.56 | 31.51 |
| | **A-MEM** | **18.23** | **24.32** | **16.48** | **23.63** | **46.00** |
| Qwen2.5 3B | LoCoMo | 4.61 | 3.11 | 4.55 | 7.03 | 16.95 |
| | ReadAgent | 2.47 | 3.01 | 5.57 | 3.25 | 15.78 |
| | MemoryBank | 3.60 | 1.72 | 6.63 | 4.11 | 13.07 |
| | MemGPT | 5.07 | 2.94 | 7.04 | 7.26 | 14.47 |
| | **A-MEM** | **12.57** | **27.59** | **7.12** | **17.23** | **27.91** |
| Llama 3.2 1B | LoCoMo | 11.25 | 7.38 | 11.90 | 12.86 | 51.89 |
| | ReadAgent | 5.96 | 1.93 | 12.46 | 7.75 | 44.64 |
| | MemoryBank | 13.18 | 7.61 | 15.78 | 17.30 | 52.61 |
| | MemGPT | 9.19 | 4.02 | 11.14 | 10.16 | 49.75 |
| | **A-MEM** | **19.06** | **17.80** | **17.55** | **28.51** | **58.81** |
| Llama 3.2 3B | LoCoMo | 6.88 | 4.37 | 10.65 | 8.37 | 30.25 |
| | ReadAgent | 2.47 | 3.01 | 5.57 | 3.25 | 15.78 |
| | MemoryBank | 6.19 | 3.49 | 4.07 | 7.61 | 18.65 |
| | MemGPT | 5.32 | 2.68 | 5.64 | 4.32 | 21.45 |
| | **A-MEM** | **17.44** | **26.38** | **12.53** | **28.14** | **42.04** |

A-MEM wins or ties on almost every cell. The temporal reasoning column is where it really shines: 45.85 F1 on GPT-4o-mini where the next best baseline (MemGPT) only reaches 25.52. This makes sense because temporal queries are exactly the kind that benefit from enriched metadata. A raw embedding of "user mentioned moving to Boston" doesn't encode *when* it was mentioned, but A-MEM's timestamped, context-enriched note does.

For DialSim, the numbers are much lower across the board (the benchmark is genuinely hard for all systems), but the relative improvement holds:

| Method | F1 |
|---|---|
| LoCoMo | 2.55 |
| MemGPT | 1.18 |
| **A-MEM** | **3.45** |

An F1 of 3.45% isn't something to celebrate in absolute terms, but it's 192% better than MemGPT and 35% better than the LoCoMo baseline. The relative improvement is real, even if the task itself remains largely unsolved.

The ablation study is where the design really proves itself:

| Configuration | Multi-hop F1 |
|---|---|
| Base (no linking, no evolution) | 9.65% |
| + Link generation | 21.35% |
| + Link generation + Memory evolution | 27.02% |

Linking alone more than doubles performance. Evolution adds another meaningful bump on top. Both modules are pulling their weight.

Cost-wise, it's surprisingly efficient: ~1,200 tokens per operation (85-93% reduction from baselines at ~16,900 tokens), costing less than $0.0003 per operation. Processing takes 5.4 seconds on GPT-4o-mini or 1.1 seconds on Llama 3.2 1B. Retrieval at 1 million entries takes 3.70 microseconds with linear space complexity.

These metrics look promising and impressive. And it's worth noting that the benchmarks were done with what are now older models (the paper was published in early 2025). I have a lot of faith that newer models with stronger reasoning capabilities would show even more impressive numbers, particularly on the link generation and memory evolution steps where reasoning quality directly determines system quality. I haven't tested this myself, but the architecture seems designed to scale well with model capability.

## How it compares to ActMem

If you read my [previous post on ActMem]({{ site.baseurl }}/2026/04/04/actmem-when-remembering-isnt-enough/), you'll notice these two papers attack the same problem (agent memory is too passive) from opposite ends.

A-MEM invests everything at **storage time**. When a new memory arrives, it gets enriched, linked, and used to update existing memories. The knowledge graph is built and maintained incrementally. By the time you need to retrieve something, the structure is already there; retrieval is just a cosine similarity lookup that benefits from all the work done upfront.

ActMem invests everything at **query time**. Memories are stored as atomic facts in clusters, and the knowledge graph captures semantic and causal relationships within those clusters. But the real work happens during retrieval: the counterfactual reasoning step ("what could go wrong?") builds bridges between disconnected clusters that no pre-computed link would have anticipated.

The trade-off is clear. A-MEM's approach means your memory network is always rich and up-to-date, but you pay the cost on every write and you're trusting the LLM's judgment at storage time. ActMem's approach means your storage is cheaper and less error-prone, but you pay more on every read and you need a strong enough model to reason at query time.

ActMem actually uses A-MEM as a baseline in their evaluation. On their custom ActMemEval benchmark, A-MEM scored 64.31% retrieval accuracy with DeepSeek-V3 (and timed out on QA entirely). This isn't surprising: ActMemEval specifically tests scenarios where the relevant memories are *semantically disconnected* from the query, which is exactly the case where A-MEM's storage-time linking can't help because the connection was unpredictable. A-MEM shines on the opposite case: when memories are semantically related and benefit from being enriched and linked upfront.

Neither approach is strictly better. They're optimising for different scenarios. If your agent deals with recurring topics where memories build on each other over time (a personal assistant tracking someone's life), A-MEM's incremental enrichment is a natural fit. If your agent faces queries that require unexpected cross-domain reasoning (the Sago Palms example from ActMem, where plant shopping needs to connect to pet safety), query-time reasoning will serve you better.

However, I personally believe that most common use cases will fall in the former scenario: agents that have everything they need to consolidate memories at the time they gather new information: it's where A-MEM's approach feels more appropriate. I prefer this approach a bit more.

## Where I'm less convinced

My Zettelkasten concern isn't theoretical. The LLM is making organisation decisions at every single step: during note construction, during link evaluation, during memory evolution. That's three opportunities per memory for a hallucination or reasoning error to enter the system. And because memory evolution means new information *modifies* old memories, a mistake doesn't just sit in isolation; it propagates. A bad link today means a bad update tomorrow means more bad links next week. The paper doesn't directly address this failure mode, and I think it's the biggest practical risk.

The system also assumes the LLM can reliably tell the difference between genuine conceptual relationships and surface-level similarity. That's a strong assumption. For a model like GPT-4o, it probably holds most of the time. For Llama 3.2 1B (which they also tested), I'm less sure. The paper shows that A-MEM works across model sizes, but "works" and "works well enough to trust with cumulative memory management" might be different bars. Which might as well be reflected in the low improvement that they obtain on multi-hop benchmarks, but I'm not entirely sure that's the case.

DialSim's absolute numbers (F1 of 3.45%) deserve a mention too. Yes, it's 192% better than the baseline, but an F1 of 3.45% means the system is still failing on the vast majority of cases. The benchmark is genuinely hard for all systems, but it does suggest there are scenarios where the Zettelkasten approach doesn't buy you much.

There's also a question about whether the benchmarks tested here capture the failure mode I'm worried about. LoCoMo and DialSim test *retrieval quality*, but they don't specifically measure whether memory evolution introduces errors over time. A benchmark that runs hundreds of sequential memory operations and checks whether early memories degrade would be much more telling.

## What I'd want to see next

The paper was published in February 2025 and accepted at NeurIPS later that year. The model landscape has changed dramatically since then. I'd love to see this re-evaluated with newer reasoning models (o3, DeepSeek-R1, Claude 3.5 Sonnet) to see whether stronger reasoning at the link generation and evolution steps actually translates into better downstream performance. The architecture *should* benefit disproportionately from model improvements, since every step depends on LLM judgment quality.

I'd also want to see a long-horizon evaluation: run A-MEM through thousands of sequential interactions and measure whether the memory network stays healthy or gradually degrades. If it stays healthy, this approach is genuinely powerful. If it degrades, we'd need some kind of periodic validation or "memory hygiene" step, which is basically the agent equivalent of me spending a Sunday afternoon reorganising my Zettelkasten. And we know how well that went.

*Paper: [A-MEM: Agentic Memory for LLM Agents](https://arxiv.org/abs/2502.12110) (Xu et al., NeurIPS 2025). Code: [github.com/agiresearch/A-MEM](https://github.com/agiresearch/A-MEM).*
