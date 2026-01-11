---
title: Emergent behaviour and the boom of AI
subtitle: How a simple concept gave rise to so much more
categories:
  - AI
  - Thoughts
tags:
  - OpenAI
  - AI
  - AGI
  - Complexity
header:
  image: assets/alpha/BeeDrones.jpg
  image_description: Bee drones header image
description: >-
  Exploring how a simple concept gave rise to so much more, and how this particular concept is the basis of current explosion of complexity in AI.
excerpt_separator: <!--more-->
---

This year has witnessed a significant transformation in the world, all thanks to a singular technological advancement: improved text prediction.

It is not a joke nor an exaggeration. The blossoming of AI that we've seen can be traced back to OpenAI's text completion model, GPT. It is not the first, nor the last, nor the best, but it made itself available to everyone in a way that allowed people to build over it. Applications quickly proliferated, finding new uses and capabilities that were previously unimaginable.

How is this possible?

It all stems from a concept known as "emergent behaviour."

<!--more-->

## Emergent behaviour

Emergent behaviour is a phenomenon seen in complex systems, even when they consist of simple components. It entails the emergence of intricate behaviours or patterns at a higher level of organization. We have seen this in nature with the organizational skills of ants, or the collective flocking of birds. Also in human-made systems like traffic patterns within cities, or self-organization in social networks. Furthermore, in artificial concepts like Conway's Game of Life, or market dynamics in economy.

My favourite example is Conway's Game of Life, because it starts with rules so simple that it's almost impossible to imagine how it can grow into something much more complex. Let's explore it.

## Conway's Game of Life

This is a mathematical concept. Imagine a grid, a two-dimensional grid with squares all over. Every square in the grid is a cell. A cell can be either "dead" or "alive" (not both, like that quantum craziness). You can start with any combination of cells however you'd like.

Each cell has eight neighbours: the ones above and below it, the ones to its right and left, and the four to their corners.

We'll take a picture of the current state of the grid and run a few rules to understand what happens in the next generation (next state):

- If a live cell has less than two neighbours, it dies of loneliness (underpopulation).
- If a live cell has more than three neighbours, it does of suffocation (overpopulation).
- If a dead cell has exactly three neighbours, it comes back to life (reproduction).

![]({{ site.baseurl }}/assets/2023-09-04-emergent-ai/acorn.png){:style="display: block; margin-left: auto; margin-right: auto;"}

{:refdef: style="text-align: center;"}
(Acorn pattern, [Wikipedia](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life#Examples_of_patterns))
{: refdef}

### Complexity level 1: described behaviour

If we run a simulation we'll see exactly what we "programmed": certain configuration of cells give birth to more cells, certain configurations of cells die. Nothing fancy.

But certain configurations show some other properties. Some of them multiply and grow, some others decrease in size.

The takeaway here is that there are behaviours that we didn't specifically implement in the rules, but still are present. Yes, they are an obvious result of the application of the rules. Still, let's keep going.

### Complexity level 2: patterns

Certain patterns can become stable, as they don't change anymore and stay as they are. ("Still lifes").

Certain others might change their shape and go back to the original shape eventually. They will move, but because they come back to their original shape, they are stable and can keep on living. We call these "oscillators". As they oscillate, they exhibit a property on the period of their oscillation: some will take just 2 turns to go back to their original form, some 3, some 15 and some even more.

Certain others are stable but move around the grid as they come back to their original shape. We call these spaceships.

The takeaway here is that while the rules we initially created gave rise to all of this, they're not a good level of abstraction anymore to discuss these systems. We've gone to a higher level where the underlying mechanisms do not matter anymore. Say, who models a car crash with subatomic interactions? No one, and not because it's wrong, it's just a model that doesn't help.

![]({{ site.baseurl }}/assets/2023-09-04-emergent-ai/g-o-l.webp){:style="display: block; margin-left: auto; margin-right: auto;"}

{:refdef: style="text-align: center;"}
(Examples of patterns, [Wikipedia](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life#Examples_of_patterns))
{: refdef}

### Complexity level 3: emissions

Since we're already looking at the high level of "objects" rather than cells, some of these objects can be put together in a way that they produce other escaped objects (spaceships) from a stable configuration (oscillators). We call these "guns".

Alternatively, the whole spaceship could leave some stable life behind, in which case they're called "puffers".

![]({{ site.baseurl }}/assets/2023-09-04-emergent-ai/p112-puffer.webp){:style="display: block; margin-left: auto; margin-right: auto;"}

{:refdef: style="text-align: center;"}
(P112 puffer, [ConwayLife Wiki](https://conwaylife.com/wiki/P112_puffer))
{: refdef}

### Complexity level 4: interactions

But as well, these different objects can interact with each other. 

"[Salvo](https://conwaylife.com/wiki/Salvo)" is a collection of spaceships that travel in the same direction, which come in different flavours as well.

Such is the case of demonoids, which are structures that self-assemble from smaller parts and become static, but later on proceed to self-destruct and disappear.

There are more complex behaviours here. Regardless, our lesson is that our initial universe rules now have created very complex objects, mechanisms and ways in which they can interact. These rules and behaviours create more complex concepts of their own, which can intermingle and create more as well, creating a whole science where a simple 3-rule sentence was all there was.

### Complexity level: ?

At this point I had to stop because this was all going so much over my head. At some point, people started building configurations that end in binary switches, memory storage, bits and bites.

My favourite example is someone building a full microprocessor out of it that could be use to run personal computers, like we know them. If you're patient enough, of course.

As a simpler example, you can check this craziness of a full digital clock running in the game of life:

<iframe width="560" height="315" src="https://www.youtube.com/embed/3NDAZ5g4EuU?si=pP41dcSCJWSwQm2P" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

How did it come that after setting three ground rules, we can create complex interacting entities that organize themselves to tell time and show a digital clock, in all the master glory of 7-segment displays? It looks like magic.
## Text prediction

What would it look like if we only predicted, like these models, one word at a time?

Here's a version that was used to generate a story (even when not done intentionally!), for the purpose of comedy:

<iframe width="560" height="315" src="https://www.youtube.com/embed/qUUUJP9S1PA?si=55SAl21P1PW0nABC" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

The surprising aspects of the story, that make this hilarious, are all emergent behaviours of the simple rule of predicting one word at a time. How crazy the participants allow the next word to be is what in models call `temperature`.

I won't go as much as detail as I did with all the complexity levels before, but consider these examples.

If a text prediction engine is so good that it always gets the right answer to `"The capital of <country> is: ____"`, we could say it has some level of geographical knowledge.

If a text prediction engine is so good that it always gets the right answer to `"The idiom <text> can be translated to <language> as: ____"`, we could say it has some level of translator abilities.

Or it could pick between a few options to do classification.

Or it could rewrite some text to become shorter, that's summarization.

Or it could expand some text to be more detailed, that's generation.

Of course, it all depends on the text pre-pending the request, which will greatly drive the contents that the engine generates. This is why prompt engineering became such a hot topic lately.

In the bottom of it all, it's just text prediction.

## Applications

Taking advantage of these emerging behaviours, businesses and people saw opportunities. Some of them laid the groundwork to automate some boring tasks, like writing out emails.

Some other levels of complexity would allow the text prediction engine to classify its own responses and tell you which one was better, creating feedback that could be used to improve the models. (Psst, [it is as efficient as when done by humans](https://arxiv.org/pdf/2309.00267.pdf).)

Some other levels of complexity would allow the text prediction engine to request for information from external tools, creating "agents" that can "do" things, like search information online, or create records in databases, or notify about something relevant. This gave rise to applications like automation of certain tasks across the industry, allowing you to get your own \<insert role here\>. You name it: your own financial advisor, your own accountant, your own developer, your own copywriter, etc.

Some other behaviours would allow the models to reason about an objective and create a plan, then follow the plan step by step until it decides it reached the desired goal all on its own (e.g. [SuperAGI](https://github.com/TransformerOptimus/SuperAGI)). This concept has been packaged in applications that take on the roles of several different people in organizations and allow you to run your own enterprise without real humans.

## What's next?

This is a field where predictions are a wild guess. Still, I think visual and music/sound generation barely got off the ground and we'll soon get to see the disruption they change, and emergence on them as not yet been that powerful (mostly because a good portion of internet is text-based today). But I'm sure we'll see some of that soon.

But as for the explosion of AI so far, and the emergent behaviours that gave rise to them, just remember: **all we're doing is generating the next word**.
