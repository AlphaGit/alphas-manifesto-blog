---
title: Debugging? Where we're going we don't need debugging.
subtitle: A thought on how we've been abstracting ourselves away from development work
categories:
  - AI
  - Thoughts
tags:
  - artificial intelligence
  - projects
  - agentic AI
  - futurology
  - thoughts
  - best practices
  - software development
header:
  image: assets/alpha/Pizza.jpg
  image_description: Slacking on the job
description: A thought on how we've been abstracting ourselves away from development work
excerpt_separator: <!--more-->
---

I've been seeing a change in the overall community's opinion of vibe coding. I wasn't able to accept a lot of it but now I surprisingly find it... alluring.

For this story, we're going to be going through the years across patterns on how software was built. 

<!--more-->

Before we start, a few disclaimers:

Disclaimer 1: I know that not all industries are the same. This is a broad generalization on the startup and mid-market industry. Bigger companies and specialized industries have their own cycles and their story might be a bit different, but I would bet it's not diametrically opposed. (Embedded developers, you're exempted from this one.)

Disclaimer 2: I don't have trustworthy sources nor I will dedicate a lot of time looking for them. This is a "trust me, bro" situation, where I'm explaining my views on what I've seen happen over the years. Am I wrong? Please reach out and tell me your point of view!

## Reusable software

Back in the day when development was difficult (like *really* difficult), getting a system's requirements meant doing a very detailed design, from top to bottom or the other way around, where we'd end up writing a full detailed specification of what was going to be coded.

There was inherent complexity in all of this, meaning that each part needed to be tested, then integrations needed to be tested, then interfaces with other systems needed to be tested, then overall interactions... you know the deal. However, the point here is that complexity required a lot of detailed code writing, testing, validation and iteration. Multiple things could go wrong because... well, multiple things can go wrong.

This is where the story of complex software falling apart for the dumbest of reasons are the stories that are still passed around. Maybe [the miles/meters error on the Lockheed Martin Mars Orbiter](https://www.cnn.com/TECH/space/9909/30/mars.metric.02/index.html) still makes the rounds where a single mistake snowballs into something out of control and a multi-million disaster. We like to tell these stories because they show how complex systems really _are_ complex.

This complexity arises over the degrees of freedom that any particular component can add to the system, in a multiplicative fashion. Figuring out the combinations in which something complex can fail is a science of its own — this is where Quality Engineers make a living.

As we've built tons of systems, we've hoped to take our experience and reuse it to prevent us from making the same mistakes again. If possible, that experience can take the form of modules, where it outlives the presence of any particular person, and we've got libraries and utilities that already take care of situations we had to learn from. This is what I'm calling **reusable software**.

## No more design, only integration

As this went on, the library ecosystem became more and more sophisticated, including not only libraries, but also the proliferation of frameworks and customizable systems that were ready for adoption to your own industry. Anything from headless APIs to full on development frameworks, we've seen the rise of industry-specialized canned applications.

At this point, most of us developers found that part of the great joy of developing (solving algorithmic problems) was no longer needed. At no point you would have to write a sorting algorithm, or a graph traversal algorithm. However, it was still possible that complex logic came out of the particularities of a specific requirement.

This was a good thing! We didn't need to spend so much time and brain power in plumbing, and we could focus in domain entities and their interactions, business logic and their implications. We no longer had to care about the specific aspect of how a record was retrieved — but knowing about it certainly helped.

There was still the joy of designing applications in a more general sense. There was still this algorithmic puzzling present, just at a different level. We still had to care about caching, race conditions, threading, SELECT N+1 and a plethora of other high-level problems that still require technical knowledge to solve.

Furthermore, the most experienced developers would be the ones that knew the intricacies of those underlying systems. Choosing a particular type of index in the database for particular fields, or finding the most efficient way to design ViewModels for the UI layer, or deciding how to structure APIs, and so on.

However, a lot of that work became repetitive too. Some people were saying that developers nowadays did not need to know real development — they were mostly integrators between frameworks, libraries and plumbing code. That wasn't entirely true, but it wasn't entirely false either. Most domains and applications don't require custom industry-specialized algorithms, and you'd still be writing your thousandth CRUD again and again.

So the work became repetitive, yet again.

## Low-Code / No-Code

The wheels move again and we've gone another iteration in this circle: now everything that could be abstracted away was abstracted away and then Low-Code or No-Code applications saw their niche arise. With very limited technical knowledge and high productivity, developers could create applications entirely from just designing the data layer and have everything else come together.

Of course, this attracted the non-technical public as well, as they didn't have to face any of the highly-technical challenges that I mentioned above. See, these applications were really built on the concept of "integrating, not developing", so it was fast to build, but for scalability or fine grained control, they wouldn't provide a lot of benefit. Either the platforms didn't fulfill it at all (most no-code platforms fell flat here) or they opened a place where you could create your own components without a lot of help (low-code). But this was developing again and non-technical folks required developers once again.

The point is: creating applications was just putting some parts together, and having a professional polish any unfinished corners. Putting parts together was kind of repetitive, as most applications have a data source, some kind of data processing, and some output in different shapes. That's about it.

You can probably see where this is going...

## Vibe-coding

Generative AI came to the world and the concept of vibe-coding spawned. You ask an AI (today, an agent) to create an application for you and it puts together the right pieces so that they integrate together. It would seem as if we're back one step (because most AIs will write code file by file, rather than using integrated components), but not really if you think about it from the users' point of view.

You're not thinking about low level details, you're not thinking about high level details. You're not thinking about details at all — they just happen for you and you correct them as required.

This is, of course, very challenging to get right, and very dangerous too — we've already heard stories of disasters happening because a vibe coded app was not properly engineered, like [the Tea app catastrophe](https://netlas.io/blog/vibe-coding-security-risks/): an application developed and deployed with AI-augmented tools and resulted in data stored openly, which was promptly "hacked".[^1]

As I write this, vibe coding is still evolving as people find out new patterns of requesting work and having it done, the newest approach being *The Ralph Wiggum Shot*.

<div class="tenor-gif-embed" data-postid="14149962" data-share-method="host" data-aspect-ratio="1.78439" data-width="100%"><a href="https://tenor.com/view/chuckles-im-in-danger-ralph-wiggum-the-simpsons-gif-14149962">Chuckles Im In Danger GIF</a> from <a href="https://tenor.com/search/chuckles-gifs">Chuckles GIFs</a></div> <script type="text/javascript" async src="https://tenor.com/embed.js"></script><br/>

It's called like this because you need to allow the agent to do whatever it wants with your system in order to progress fully autonomously, usually through a flag called `--dangerously-skip-permissions`.

But the upside is that you can get (at least so they claim) a fully developed product in a single night, while you sleep.

## Back to The Future

Tangent aside, let's bring it back to our discussion about the different levels of abstractions. I recently found this, which I can't truly figure out if it was written as a parody or seriously: [NERD: No Effort Required, Done](https://www.nerd-lang.org/), an LLM-native programming language. The whole point of it is to have a programming language that agents can write better, not humans. And code is compiled directly to native machine code.

I would say out flat: "that's a bad idea".

But then these lines got me thinking ([source](https://www.nerd-lang.org/about)):

> **"But I need to debug!"**
>
> Do you debug JVM bytecode? V8's internals? No. You debug at your abstraction layer. If that layer is natural language, debugging becomes: "Hey Claude, the login is failing for users with + in their email."

Now, I'll be honest, I completely disagree with the approach and I think it's a bad idea... but there's something true to all of it. Are we about to climb another layer in the abstraction tower?

We might as well be. As soon as LLMs become better coders (and they are, by the week), programming might be more about prompting and connecting tools to the right agent. 

I'm still skeptical, but I can't deny we're closer to "automated development" that we've ever been. It's palpable. 

I do agree that a certain amount of skills might become outdated, or reserved for "the experienced ones", the ones that can learn and interpret the specificities of a language. But most of the time, it wouldn't be required — agents would be the ones doing the work.

So for repeatable abstractions: code was just in the way. Maybe, if this happens to be our next step, we can just speak what we need and have agents make it. Maybe we don't need coding anymore, as much as business owners don't need coding and they still get their apps published. (Plot twist: we were the LLM's all along.)

## So what will happen?

Beats me. But I don't think anybody knows for sure.

But we can see times are changing. Even if AI-automated development results to be a fad[^2], some things will have changed forever.

I would truly like for this to be our next step, even if it makes most of my knowledge obsolete, because it would mean that a world of opportunities opens up for a lot more people. Wonderful ideas from almost anywhere (not only "the experienced ones") could become successes each day and benefit everyone.

[^1]: I'd argue it still counts as a hack even if attackers did not have to do much: it was still accessing data which was not meant to be accessible. No matter the culprit, it's still a security issue, hence, exploiting it is a hack. You would still call it a robbery, even if you invite the robbers at your place.

[^2]: Might result a fad because of popularity, market, or legal requirements. Might be too dangerous to gain widespread adoption. Might just fall down when the bubble explodes and the LLM-winner hikes up the prices beyond what's redituable. I don't know, man.
