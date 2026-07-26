---
title: Architecture Rots With or Without AI
subtitle: We were always bad at predicting the future, we just got faster at being wrong
categories:
  - AI
  - Software Engineering
tags:
  - ai
  - architecture
  - technical-debt
  - coding-agents
  - maintainability
header:
  image: assets/alpha/commonPartsWide.png
  image_description: Reaching for the pieces that were supposed to fit together.
description: AI coding agents are blamed for architectural decay, but rot predates them. Architecture is a bet on a future we can't see, and the only defense is encoding your constraints where the machine can read them.
excerpt_separator: <!--more-->
---

I read Dex Horthy's ["Why Software Factories Fail"](https://github.com/humanlayer/advanced-context-engineering-for-coding-agents/blob/main/wsff.md) last week and one line has been rattling around my head since: tests give you feedback in seconds, but the cost function of bad architecture is measured in weeks, months, maybe even years. He is writing about coding agents and why the lights-off software factory does not work. It got me thinking about something adjacent, which is where the rot comes from in the first place.

<!--more-->

Because I have watched architectures rot for twenty years, and not one of those was the fault of a machine.

## What architecture is, and what rot is

When I design a system I am trying to get three things at once. I want it **simple**, so the next person can hold it in their head. I want it **robust**, so the thing it does, it does well and it keeps doing it. And I want it **flexible**, so it can grow in the directions it will need to grow.

Two of those are about today. Simplicity and robustness are things I can look at, measure, argue about in a review. I can point at a module and say this is too clever, or this will fall over when the network hiccups. They are claims about code that exists.

Flexibility is different. Flexibility is a bet. I am guessing which parts of the system will need to bend, and I am spending complexity today to buy an option on tomorrow. Every interface I extract, every plugin point I add, every "we will probably need to swap this out eventually" is a prediction about a future I cannot see.

And this is where rot comes from. **Rot is drift**. Not because the bets were careless, but because they were bets. We do not guess blindly: we know the business, we know how this industry tends to move, we have sat in enough meetings with this client to know which parts of the domain are settled and which ones are still an argument. We build the seams where we expect movement. The pricing rules will change, so pricing gets its own module. Integrations always multiply, so there is an adapter layer. And sometimes the bet is about the people rather than the code, because we know this customer will change their mind about the onboarding flow, they always do, so we keep it soft. These are educated guesses, and most of them are good ones. But an educated guess is still a guess, and the future only has to surprise us in one direction we did not price in.

So rot is not a failure of craft. It is a failure of prediction, and the flexibility we bought turns out to be flexibility in the wrong place.

## The same thing happens with AI

Which brings me back to the agents. There is a growing pile of evidence that AI-assisted codebases decay, and it is worth looking at, because the interesting part is not that it happens. It is that it looks exactly like what we have always done to ourselves.

GitClear has been [tracking what happens to code as AI assistance spread through it](https://www.gitclear.com/the_ai_code_quality_maintainability_gap), across a sample big enough that it is hard to wave away. Duplicated blocks are piling up, and refactoring has nearly stopped being a thing that happens at all. That is not a story about bad code being written. It is a story about nobody going back to unify anything, so every fix has to be applied in four places, and eventually somebody applies it in three.

The field reports rhyme with that in a way that is almost funny. An audit of five vibe-coded startups found [the same three problems in every single codebase](https://altersquare.io/vibe-coded-startups-audit-common-codebase-problems/): duplicated logic, missing error handling, weak architecture with no tests.

There is even a paper measuring the decay directly. Shukla, Joshi and Syed took the loop we all do without thinking (ask the model to improve its own code, then ask again) and found that [the critical vulnerabilities go up, not down](https://arxiv.org/abs/2506.11022), and it only takes a handful of rounds to get there. Not five years of maintenance by a rotating cast of contractors. A handful of prompts.

Read that list again and squint a little. Duplicated logic. Boundaries that exist in the diagram and not in the calls. No tests, so no signal when something moves. If you handed me those findings with the words "AI" and "vibe-coded" removed, I would assume I was reading a due diligence report on a seven-year-old startup codebase. The timeline got shorter. The shape did not change at all.

## "But how do humans do it?"

They don't.

Every engineer I have ever worked with has a legacy codebase they complain about, and the funniest ones are the codebases they wrote themselves. Every engineer has the fantasy too: we tear it down, we rebuild it, and this time we do it *right*, with the knowledge we have today and with the framework that came out last year and looks so much nicer. Even the big shops give in to it every once in a while and it makes the news. Meta rewriting parts of WhatsApp in Rust is the one that comes to mind first.

Brilliant people, enormous budgets, and the code still ends up in a state where the most attractive option is to burn it down. That should tell us the problem is not sitting between the keyboard and the chair.

Sooner or later a system has to support a path that nobody accounted for. That is the whole thing. It is not that the original engineers were careless or that they picked the wrong pattern. It is that flexibility was a guess, the guess did not cover this case, and the case showed up anyway. And time is always a problem, so we take the shortcut that fits in this sprint instead of the one that fits the architecture.

Anyways... bad architectures and bad decisions do exist. Not the point of this article but... beware.

## Encode it or lose it

Now, AI does derail expectations faster than we do, and I think I know why, though I cannot prove it and I would love to be shown where I am wrong.

Think about where the architectural constraints of your current project actually live. Not the ones in the code. The other ones. The reason nobody puts a database call in that layer. The reason those two modules talk through events instead of direct calls. The convention about where validation happens. In most teams I have been on, those live in the heads of three people, in a decision made in a meeting eighteen months ago, in the shape of the existing code that a new hire absorbs by reading it for a month. Some of it is not even articulated. It is just taste, and the code review where somebody says this does not feel right here.

A new engineer picks that up by osmosis. Slowly, imperfectly, but they pick it up, because they sit next to the people who hold it.

An agent gets none of it. It gets the code, whatever is in the context window, and the ticket. Every constraint that exists only as an assumption, a hallway conversation, or a sense of elegance is invisible to it. So it writes something that satisfies the ticket, passes the tests, and quietly violates three rules it was never told about. Then it does that again tomorrow, faster than any team of humans could.

This is why Spec-Driven Development has helped so much. It is because those decisions are documented and present in a place where the agents see them and consider them again and again. I don't think this is the final version of the solution... but **my hypothesis here is that it's the solution in some shape**.

So the fix is not to slow the agents down, and it is definitely not the rewrite (there is never time for the rewrite). The fix is to get the architecture out of your head and into something that pushes back. Tests that fail when a boundary is crossed. Lint rules and dependency checks that make the illegal import an error instead of a preference. Module structures where the wrong call is not reachable. ADRs that say what we decided and why we rejected the alternative. Specs the agent reads before it writes. Dex's approach of front-loading the thinking into requirements, architecture and program design before any code gets generated is one shape of this, and a good one.

The general rule I keep coming back to is blunter than that: **an architectural constraint that is not written down does not exist.** It never really did. We just used to have enough time between mistakes to pretend otherwise.

Rot was never about people, and it is not about models either. It is about being wrong about the future, which is a thing we are all reliably bad at. AI does not make us more wrong. It makes us wrong faster, and it turns out that being wrong slowly was doing a lot of work for us.
