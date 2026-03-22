---
title: The Chinese Room has understanding
subtitle: It just can't prove it
categories:
  - AI
  - Thoughts
tags:
  - artificial intelligence
  - philosophy
  - consciousness
  - understanding
  - chinese room
  - qualia
  - thoughts
header:
  image: assets/alpha/roboticskunk.webp
  image_description: Do I have understanding? Who can say.
description: On Searle, compression, qualia, and why the pattern is the understanding.
excerpt_separator: <!--more-->
---

I recently came across an article called [Building the Chinese Room](https://www.verysane.ai/p/building-the-chinese-room) by SE Gyges. And it sucked me in. For real. It digs into John Searle's famous thought experiment of the Chinese Room and argues that it's fundamentally flawed. I went back and read Searle's original 1980 paper to see for myself, and what happened next was unexpected: the more I read, the more I found myself disagreeing with *everyone* — Searle, Gyges, and at several points, myself. (Well actually, that is very me.)

<!--more-->

Fair warning: this is long. Understanding "understanding" turns out to be a complicated business. Who knew.

## The Chinese Room

Let's start from the beginning, for those who haven't encountered Searle's thought experiment before.

John Searle was a philosopher at UC Berkeley who, in 1980, published a paper called *[Minds, Brains, and Programs](https://home.csulb.edu/~cwallis/382/readings/482/searle.minds.brains.programs.bbs.1980.pdf)*. His target was what he called **"strong AI"** — not the idea that AI is a useful tool for studying how we think (he had no problem with that), but the claim that a **computer running the right program doesn't just *simulate* a mind — it literally *has* one.** Real thinking and cognitive states.

To attack this, he proposed a thought experiment, **The Chinese Room:** Imagine a person locked in a room. They don't speak a word of Chinese. Through a slot in the door, someone passes in a batch of Chinese characters. The person inside has an enormous rulebook, written in English, that tells them exactly which Chinese characters to write in response to which inputs. They follow the rules, produce the output, and slide it back out through the slot.

![Diagram of the Chinese Room: a person who doesn't speak Chinese sits in a room with a rulebook written in English. Chinese characters come in through a slot, the person follows the rules to produce output, and Chinese answers go out the other slot.]({{ site.baseurl }}/assets/2026-03-21-the-chinese-room-has-understanding/chinese-room-diagram.svg)

From the outside, the room's answers to Chinese questions are perfect — completely indistinguishable from a native speaker's. The room passes every test you could throw at it.

Searle's question: does the room understand Chinese?

His answer: obviously not. The person inside is just shuffling symbols they don't understand. They're matching shapes to shapes according to rules. "Squiggle squiggle" gets followed by "squoggle squoggle," and none of it *means* anything to the person doing the shuffling. The symbols have no *semantics* — they're pure *syntax*. And Searle's conclusion is that if the room doesn't understand Chinese despite producing perfect outputs, then no computer program can understand anything either, because all a program does is manipulate formal symbols according to rules.

The argument is elegant and it has real intuitive force. You read it and you think: yeah, of course the person in the room doesn't understand Chinese. They're just following instructions.

But that intuition, I've come to think, hides a few things.

## Gyges' counter: compression requires understanding

Gyges, in [Building the Chinese Room](https://www.verysane.ai/p/building-the-chinese-room), makes what I think is the strongest structural objection to the Chinese Room. It's about scale.

Think about what the rulebook would actually have to contain. If it's a simple lookup table — for every possible Chinese input, store the correct Chinese output — the book would need to be impossibly large. Not "the size of a building" large, but "more entries than there are atoms in the observable universe" large. Chinese isn't a finite set of fixed exchanges. It's a living language with infinite possible sentences, contexts, ambiguities, and implications. No lookup table could cover it.

So the book has to be smarter than a lookup table. It has to contain *rules* — rules about grammar, about context, about meaning, about the relationships between concepts. It has to compress the infinite space of possible Chinese exchanges into a finite set of principles that can generate the right response to any input.

Gyges' argument gets even more interesting: to compress that space, you have to encode facts about how Chinese actually works. You have to capture the patterns, the structures, the relationships. **The book can't be both *simple enough* that it obviously doesn't understand Chinese and *complex enough* that it actually produces correct Chinese.** These two things pull in opposite directions, and Searle's argument depends on you holding both of them in your head at the same time without noticing the contradiction.

![Diagram showing that a Chinese Room rulebook has two options: a lookup table (infinite, physically impossible) or compressed rules that must encode grammar, semantics, context, inference, and disambiguation. Searle describes the second option's output but asks you to picture the first option's simplicity.]({{ site.baseurl }}/assets/2026-03-21-the-chinese-room-has-understanding/complexity-understanding-graph.svg)

The bottom line: if the room works, the rulebook is doing real work — not just pattern-matching, but encoding genuine structural knowledge about the language. And if that's the case, the room isn't as "dumb" as Searle wants you to picture it.

This reframing is compelling. It exposes that Searle is, in a way, asking you to imagine something incoherent.

## Compressing understanding creates a brain

But I don't think Gyges takes it in the right direction. He concludes that because the book must compress, and compression requires encoding real patterns, the book must contain understanding. As he puts it: "the only way to make the book smaller was to put understanding into the book." He concludes that in order to create understanding with real physical constraints, you need to replicate a brain.

I'm not so sure about that.

Consider a logistic regression. You have a dataset of, say, ten thousand medical records, and you want to predict whether a patient has a particular condition. You train the model, and it compresses those ten thousand records into a handful of coefficients — a few numbers. Those numbers capture real patterns. Genuine statistical regularities. They're not random; they reflect something true about the relationship between symptoms and diagnoses.

Does the logistic regression *understand* medicine? I don't think anyone would say yes. It found a pattern (a real one) but "found a pattern" and "understands the domain" feel like very different things.

Or take gzip. It compresses a text file by identifying repeated sequences and encoding them efficiently. It captures real structural regularities in the data. It doesn't understand what the text is about.

So here's the intermediate conclusion: **"compression requires encoding real patterns" is true, but "encoding real patterns is the same as understanding" is a leap.** You can mechanically extract regularities from data without anything resembling comprehension. Gyges argument is right about the direction: a working Chinese Room *must* be complex, but the conclusion that understanding requires a biological-like structure is a bit much. I believe there is something else that still applies.

## You can't see understanding from the outside

Before diving deeper into Searle's arguments, I want to step back and ask something more fundamental: how do we know *anything* understands *anything*?

### The Turing test

This is where the Turing test comes in. Alan Turing proposed it in 1950, three decades before Searle's paper. The basic idea: if a machine can engage in conversation and a human judge can't tell it apart from another human, then we have no principled reason to deny it thinking.

The Turing test gets misunderstood a lot. People treat it as a pass/fail exam — pass it and you're intelligent, fail it and you're not. But Turing's deeper point was about what we *can actually know*. We can't crack open someone's skull and directly observe "understanding." We never could. When you talk to someone and conclude they understand what you're saying, you're making an inference from behaviour. You're watching their outputs and deciding they match what an understanding person would say.

![Diagram of the Turing Test: a judge converses through a barrier with two participants — one human, one machine — without knowing which is which. Both produce similar responses. The judge must decide which is human.]({{ site.baseurl }}/assets/2026-03-21-the-chinese-room-has-understanding/turing-test-diagram.svg)

**I know it's incomplete.** But it's unbiased and that's important.

**We have attributed understanding to other people long before neuroscience existed.** Long before we had any idea what was happening inside a brain. The attribution was always based on behaviour: they respond the way an understanding entity would respond, so we grant them understanding. Neuroscience later enriched the picture — it gave us mechanisms, helped us study the *how*. But it didn't *cause* the attribution. We didn't wait for fMRI machines before deciding that other people could think.

### The double standard

And this is precisely the design of the Turing test: a double-blind experiment where the judge doesn't know which participant is human and which is machine. If the judge can't tell, then whatever criterion they're using to attribute understanding to the human *also* applies to the machine.

**Searle's argument depends on treating humans and machines differently** when they produce the same outputs. He looks at the Chinese Room and says: "it produces perfect answers, but it doesn't understand." Then he looks at a human Chinese speaker and says: "they produce the same answers, and they *do* understand." What justifies the difference?

Searle's answer is intentionality, a concept I'll get into in the next section. But stripped of the philosophical jargon, his position comes down to: humans have something extra that machines lack, and that something is what makes understanding real. The question is whether that "something extra" is a real distinction or just a label for the gap in the argument.

## Searle's argument

To be fair, Searle's argument is more sophisticated than "the room obviously doesn't understand." Let me lay out the strongest version.

### Syntax versus semantics

Searle's core claim is that **syntax is not sufficient for semantics**. A computer program operates on formal symbols, it manipulates syntax. But understanding, meaning, and what he calls intentionality are *semantic* properties. They involve symbols being *about* something. And no amount of syntactic manipulation, no matter how complex, can produce that "aboutness."

When you understand Chinese, the symbol 火 isn't just correlated with other symbols. It *means fire*. It connects to your experience of heat, danger, warmth, cooking. The symbols in the Chinese Room never achieve this, Searle argues. They're connected to each other but never to anything in the world.

So far, it's a reasonable point. The question is what follows from it.

### Intentionality as the missing ingredient

Searle calls this missing property *intentionality* — the feature of mental states being directed at or about objects in the world. Your belief that it's raining is *about* the weather. Your desire for coffee is *about* coffee. Intentionality is what gives your thoughts their content, their meaning.

For Searle, intentionality is biological. It's something brains produce because of their specific physical and chemical makeup, the way a stomach digests food because of *its* biological makeup. And you can't produce real digestion by simulating it on a computer. A simulation of a rainstorm won't get you wet. Simulation is not duplication.

In Searle's own framing: "I am a certain sort of organism with a certain biological structure, and this structure, under certain conditions, is causally capable of producing perception, action, understanding, learning, and other intentional phenomena."

### Arguments against Searle and his responses

Searle's paper is structured around objections his colleagues raised, and his responses. 

**The Systems Reply** (from Berkeley): The person in the room doesn't understand Chinese, sure. But the whole *system* — person plus rulebook plus room — does. Understanding isn't in any single component; it's a property of the system as a whole.

Searle counters: imagine the person memorizes the entire rulebook. Now the person *is* the whole system. And they still don't understand Chinese. If one person can absorb the entire system and still not understand, the system doesn't understand either.

**The Robot Reply** (from Yale): Instead of a room, put the Chinese-processing system inside a robot with cameras, microphones, and hands. Let it interact with the world. Now it's not just shuffling abstract symbols — it's grounded in physical reality.

Searle counters: as he describes it, "I just get more Chinese symbols coming in from the camera and more instructions for moving the motors. I'm still following rules about symbols, and I still don't know what any of it means." More inputs doesn't change the fundamental problem.

**The Brain Simulator Reply** (from Berkeley and MIT): What if the program simulates the actual firing pattern of a Chinese speaker's neurons, synapse by synapse?

Searle counters: imagine replacing the computation with water pipes, where each pipe connection corresponds to a synapse. Chinese input goes in, water flows through the pipes, Chinese output comes out. Does the water-pipe system understand Chinese? Obviously not. (Me: "But what if... it did?")

### Where I don't agree

**First: the Other Minds problem.** One of the objections in the paper says, basically: "How do you know other people understand Chinese? You only see their behaviour, same as the room's." Searle's answer is, essentially: "This is only worth a short reply. The problem isn't about how I know other people have cognitive states — it's that *I* know *I* have cognitive states. I understand English and I don't understand Chinese, and I know this from the inside."

True — but that only works for *him*. For everyone *else*, he's right back to behavioural inference. And the Turing test is precisely this: a double-blind setup where you *can't* rely on knowing what's inside. If behavioural equivalence is good enough to attribute understanding to other humans (and it is — it's all we've ever had), then it should be good enough for the room too. You can't accept behavioural evidence in one case and reject it in the other without explaining why. "Where are the cognitive states?" Searle would ask about the room. In the room's internal structure, same as in people — I'd answer.

**Second: the water-pipes argument.** Searle says that even if you replicate the exact causal structure of a brain (every synapse, every connection) in water pipes, there's no understanding. But think about what this commits him to. He's saying the functional organization of the brain, perfectly replicated, doesn't produce understanding if the substrate is wrong. The causal structure isn't enough — you need the right *stuff*.

But Searle insists he's not a dualist. He says intentionality is biological, not supernatural. So what *specifically* about biology produces intentionality that a perfect functional replica can't? If it's the causal organization, the water pipes have that. If it's the physical substrate itself, then we need to know what property of carbon-based chemistry produces understanding that silicon or water can't. Searle never gives this answer. He attributes it to "biological causal powers" as if that explains something, when really it just names the gap without filling it.

This is where I firmly part ways with Searle: **his position implies that the mind is something beyond the substrate.** Emergent properties of the substrate? Sure, I can get behind that. But if the causal organization is right, the emergent properties should follow regardless of what the thing is made of. Otherwise you're left with something that looks an awful lot like dualism wearing a lab coat.

## Understanding as a spectrum

There's another problem with the Chinese Room that I think is more fundamental than any specific objection: **Searle treats understanding as binary.** Either you understand Chinese or you don't. The room doesn't, humans do, end of story.

I don't think that's how understanding works.

### Consciousness as a continuum

Consider how the [Integrated Information Theory](https://iep.utm.edu/integrated-information-theory-of-consciousness/) (IIT) approaches consciousness. IIT proposes that consciousness isn't a switch that's either on or off, but rather a spectrum. Every system that integrates information has some degree of consciousness, from almost nothing (a thermostat) to an enormous amount (a human brain). The theory itself is controversial, but the *framing* — consciousness as a continuum — strikes me as more useful than the binary alternative.

### The same applies to understanding

I think understanding works the same way. It's not a threshold you cross; it's a gradient.

A linear regression that captures the relationship between symptoms and disease has a tiny, almost negligible degree of understanding of that medical domain. A deep neural network trained on millions of medical records has more. A medical student has more still. An experienced doctor has more on top of that. None of these are "zero understanding" suddenly jumping to "full understanding." Each step adds something.

Searle would probably object that this makes the word "understanding" meaningless. If everything from a thermostat to Einstein "understands" in some degree, the concept doesn't do any useful work.

I disagree. Light applies to both candles and the sun. Nobody argues that "light" is a meaningless concept because it covers such a wide range. We acknowledge there's a massive difference in degree without pretending it's a difference in *kind*. **Giving a concept gradation doesn't strip it of meaning — it adds nuance.** Harder to use casually, sure. But more useful, not less.

Searle also dismisses this kind of thinking by pointing out that a stomach "processes" food: does it "understand" nutrition? He means it as a *reductio ad absurdum*, but I'd actually say: yeah, the stomach handles nutrition better than a rock does. It sounds counterintuitive to call that "understanding," but that's because our everyday use of the word sits at the human-scale portion of the spectrum. We draw a line somewhere in the middle and call everything above it "understanding" and everything below "not understanding." But that line is anchored to human cognition as the reference point — it's not a natural boundary carved into the universe.

![Diagram contrasting Searle's binary view of understanding (a hard boundary between "doesn't understand" and "understands") with a gradient view, where systems from thermostats to experienced doctors fall along a spectrum. Searle's line is drawn somewhere in the middle, anchored to human cognition.]({{ site.baseurl }}/assets/2026-03-21-the-chinese-room-has-understanding/understanding-spectrum.svg)

This reframes the Chinese Room in an important way. Instead of "does the room understand Chinese, yes or no?" the question becomes "**how much** does the room understand?" And that question has a much less obvious answer.

## Mary's Room and the qualia problem

Before I get to my core argument, I need to address something that lurks beneath most discussions of machine understanding: qualia.

### The thought experiment

There's a famous thought experiment by philosopher Frank Jackson, usually called [Mary's Room](https://en.wikipedia.org/wiki/Knowledge_argument). Mary is a brilliant scientist who knows absolutely *everything* about colour. She knows the physics of light (wavelengths, frequencies, how photons interact with surfaces, etc.) She knows the neuroscience (which cone cells in the retina respond to which wavelengths, how signals travel along the optic nerve, which brain regions activate when someone sees red, etc.) She knows the psychology (how colour perception is affected by context, mood, culture, etc.) She has *complete physical information* about what happens when a person sees the colour red.

But Mary has lived her entire life in a black-and-white room. She's never actually *seen* red.

One day, she steps outside and sees a red rose.

Does Mary learn something new?

### What qualia is

If she does learn something new, then there's something about the *experience* of seeing red — the subjective quality, the "what it's like" — that isn't captured in any amount of physical information. That subjective quality is what philosophers call *qualia*. The redness of red, the painfulness of pain. Private, inner experiences that seem to go beyond what any physical description can capture.

### Why this matters for the Chinese Room

This connects directly to Searle. When he says the room's symbols aren't *about* anything, when he insists that 火 needs to connect to the *experience* of fire and not just to other symbols, he's making a qualia-style argument. There's a subjective dimension to understanding that formal symbol manipulation misses. The room has all the patterns but none of the experience, and the experience is what makes it *real* understanding.

I get the intuitive pull of this. There *does* seem to be something it's like to understand something, something that goes beyond information processing. When I understand a sentence, it doesn't feel like a mechanical process but rather like meaning. Something clicks.

### Why I think qualia is like ether

But I think qualia is the ether of consciousness studies.

The luminiferous ether was a substance that 19th-century physicists believed *must* exist because they couldn't imagine how light waves could propagate through empty space. There had to be a medium — something for the waves to wave *in*. It seemed perfectly logical. It turned out not to exist. Light didn't need a medium. It just propagated through space on its own.

I think qualia plays the same role. We feel like there *must* be something extra — some subjective "redness" floating on top of the physics and neuroscience — because we can't imagine how raw physical processes could produce the *feeling* of understanding. But maybe there's nothing extra. **Maybe the "experience of redness" just *is* a particular configuration of neurons firing.** Not "accompanied by" or "correlated with" — it *is* that configuration. The subjective feeling isn't an ingredient floating above the substrate; it is the substrate in a particular state.

If that's the case, Mary doesn't learn a new *fact* when she sees red. She activates a neural pathway she hadn't activated before. A new physical configuration occurs. But no new information enters the picture. Everything she knew before was complete — she just hadn't instantiated that particular physical state in her own brain yet.

### The fire that nobody taught you to fear

Here's an example that I think illustrates this well. Newborn babies have never experienced fire, heat, or pain of any kind. And yet, [research shows](https://www.nature.com/articles/srep12519) that from about 35 weeks of gestation, the brain develops nociceptive-specific neural circuits (pain-specific wiring) that are fully operational at birth. When a newborn touches something hot, they withdraw. No prior experience of fire needed. The "understanding" of pain, if you want to call it that, is baked into the physical structure of the brain before any experience has occurred.

Now imagine you could somehow assemble a human brain from scratch, atom by atom, with all its wiring intact. Give it sensory inputs. Touch it with something hot. It would react — with withdrawal, with the neural correlates of pain, with everything we associate with the *experience* of burning. Not because someone taught it, not because it "experienced" fire in some prior life, but because the physical pattern is there, and that pattern is what produces the response.

The qualia (the "feeling" of pain) isn't something extra layered on top. It's what that particular physical arrangement *does* when activated.

And if that's right, then the demand for "experiential grounding" in understanding is misplaced. A system doesn't need to have *felt* fire to understand fire. It needs to have the right patterns in its structure. Whether those patterns were built from sensory experience, from text, or from statistical regularities in data... it's the pattern thatn determines the outcome.

## The pattern is the understanding

This brings me to what I actually believe (at least, until someone shows me where I'm wrong) after all this reading and arguing with myself.

If we're materialists, that is, if we believe there are no souls, no magic, no ghostly substances hovering above the physical, then we have to accept a straightforward consequence: **if understanding exists (and it does, because we experience it), it must be physically realized.** It must be *in* the matter. In the configuration of neurons, in the weights of connections, in the patterns of activation... or whatever other pattern that happens to be the substrate of the emergent property. DNA, neurons, whatever.

There is nothing else it *could* be.

And if understanding is physically realized, then it is a pattern in the substrate. A particular arrangement of matter that does a particular kind of work. Synaptic weights in a brain. Weights in a neural network. Coefficients in a regression. At different scales, at very different degrees of richness, but the same kind of thing: **a compressed, functional representation of regularities.**

I think the pattern *is* where the understanding is. The compressed functional representation, when operative in a system, is what we call understanding.

When a brain learns Chinese, the synaptic configuration that results from that learning *is* the understanding of Chinese — which is precisely why Gyges argues that a room capable of real Chinese comprehension would need to have something resembling a brain's complexity and structure in its rulebook. When an LLM's weights are trained on language and it develops the ability to reason about context, produce coherent text, and respond to novel situations, those weights *are* whatever degree of understanding it has. When a logistic regression captures the relationship between inputs and outputs, those coefficients *are* its tiny sliver of understanding.

**Understanding exists when patterns are both present and operative**, when they're in a system that *uses* them to take inputs and produce outputs. A book about Chinese stores patterns about Chinese, but it can't do anything with them on its own. A running system can. The understanding isn't in the static storage; it's in the active use of the pattern.

### How this connects back to compression

This is where Gyges's compression argument becomes relevant again — but for different reasons than he intended.

Gyges says that compression *requires putting understanding into the book*. As if understanding is something you inject during the encoding step. I don't think that's quite right. Understanding isn't something you pour in — it's what you get when a sufficiently rich compressed representation is operative in a system.

But Gyges is right about the direction. A system that compresses the infinite space of possible Chinese exchanges into a finite, workable set of principles has, in that compressed representation, the patterns that *constitute* its understanding. The compression didn't put understanding in, but rather **the compressed functional pattern *is* the understanding.**

### What about how the understanding was created?

One more thing worth mentioning. Creating a compressed representation (training a model, writing a program, evolving a brain) probably requires some degree of understanding in the process that builds it. A programmer brings their understanding. A training procedure uses data that humans produced. Evolution worked through billions of years of environmental feedback.

But that's a question about *origins*, not about the resulting system's properties. Imagine someone who wakes up tomorrow fluent in Chinese with no memory of how they got there... I don't know, some freak neurological event rearranged their brain overnight. Do they understand Chinese? Of course they do. The fact that they didn't earn it through years of study doesn't change what's currently in their brain. **The understanding is in the current state, regardless of how it came to be.** And whether the system that holds this understanding is biological or mechanical doesn't matter under materialism — as long as the pattern is there and operative, the understanding is there.

## Back to the Chinese Room

So, finally: does the Chinese Room understand Chinese?

If the room actually works... if it truly produces outputs indistinguishable from a native speaker, handles novel situations, responds to context... then the patterns required to do this are enormously complex. They must capture grammar, semantics, pragmatics, cultural context, inference, ambiguity. They must be rich enough to handle the infinite generativity of natural language.

Those patterns, in whatever substrate they exist *are* the understanding. Not a sign of it. The thing itself.

Searle asks us to imagine that the room works perfectly while being simple enough that it obviously lacks understanding. Those two things can't both be true. If the room works, the patterns are there. And if the patterns are there, the understanding is there. The fact that the person shuffling symbols doesn't personally feel it is beside the point. After all, a single neuron in your brain doesn't feel like it understands English either. Understanding is a property of the system, not of its components.

We can't verify this from the outside. We can't crack open the room and point at "understanding" any more than we can crack open a skull and point at it. But that's the epistemological constraint we've always lived with. We attribute understanding based on behaviour, and we always have. If the Chinese Room passes the test, then from all I can tell, it has understanding. 

Inspecting the room and discovering it's all rulebooks and shuffled papers doesn't remove understanding, any more than inspecting a brain and discovering it's all neurons and electrical signals does.
