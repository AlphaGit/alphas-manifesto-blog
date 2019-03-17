---
layout: post
excerpt_separator: <!--more-->
title: Interdisciplinary AI
categories:
    - AI
tags:
    - ethics
    - AI
    - OpenAI
    - paper
sub_title: Why we need multiple skills in the search for AGI
---

About a month ago OpenAI published a [post][OpenAI post] where they open their gates for social scientists into their organization. I think this is part of a profound matter that has not been completely discussed in that blog post. Aside from a short version of some points of it, I'll also provide what is this subject that hasn't been discussed yet.

<!--more-->

## The paper

First of all, if you don't mind a lengthy read (about 20-30 minutes), go check the [full paper][OpenAI full paper]. It is wonderfully explained, completely detailed and with a reasonable amount of information density.

This paper explains that OpenAI has been working to build decision making agents. More specifically, reasoning agents that can reach conclusions from pieces of information. As an example, check the experiments they came up with at [AI Safety via Debate][AI Safety via Debate]. Their line of thought on these particular experiments is: if they can figure out the process that makes a human make a good decision based on a set of facts (a judge), they can automate this process.

However, the implications of such a thing are a lot greater than just coming up with an algorithm. And they know it.

### Objective ethical truth and AI Alignment

First of all, for this to be possible, it would have to be true that there's a single, objective, truth to follow, independently of human biases. Note that this applies for pure reasoning tasks and for tasks that might require ethical judgement. If this wasn't true, removing humans from the equation could remove what we call moral decisions in the first place, having the purely-reasoned decisions be not really useful for a human world. In other words: building subjectivity in ML is not something that they could currently do (where would we even start from?).

> In these cases {of limited information}, a human may be unable to provide the right answer, but we still believe the right answer exists as a meaningful concept. We have many conceptual biases: imagine we point out these biases in a way that helps the human to avoid them. Imagine the human has access to all the knowledge in the world, and is able to think for an arbitrarily long time. We could define alignment as “the answer they give then, after these limitations have been removed”; in philosophy this is known as “reflective equilibrium”.

While this is still a debated concept, it's an useful one. Pretending that there is an objective (moral?) truth that we can strive to implies that we can generalize towards it and build upon practical and theorical data, which we can build from human knowledge.

### How to do that: schemes

At this point, the OpenAI engineers figured out that they need a way to build the data that would point us to the mechanisms of taking correct decisions. They also figured out that we don't really know of a good way of doing that. Asking direct questions leaves out important context. Debate is the option they explored the most, but still suffers from methodological problems. At this moment we cannot guarantee them as good methods of reaching true conclusions.

Each of these methodogies are _schemes_ that are being explored through experimentation.

> Given our lack of experience outside of ML, we are not able to precisely articulate all of the different experiments we need. The only way to fix this is to talk to more people with different backgrounds and expertise. We have started this process, but are eager for more conversations with social scientists about what experiments could be run, and encourage other AI safety efforts to engage similarly.

OpenAI recognizes that they need multidisciplinary work in order to achieve their goal correctly.

They also recognize that technology and algorithms are not yet at the point of making use of these findings. However, they anticipate that it'll happen soon, so it makes sense to start these investigations now.

## What else is happening here

But I'm seeing something else in this paper, something that drove me initially to make this blog post. Something more about its context rather than its contents.

OpenAI is not only reaching out to experts in other areas of science to continue with their work. They are also finding shortcomings in our existing scientific knowledge that needs to be addressed if we're to tackle the matter of intelligence head on.

And I think this is really important: philosophical, ethical, social and epistemological limits of knowledge are put to the test explicitly in the next steps they want to take.

I believe this is huge. If this makes any progress, whatever the result is, we would have made a huge advance to humanity.

As an example, say that it was found that the scheme of debates with particular characteristics are more biased towards concluding false results. Wouldn't this be a major breakthrough in legal science and judgement regulations?

Say that we were able to verify that ethics are really not universal -- wouldn't this be huge in the matter of international legal science and sociology? Even in history and anthropology?

**OpenAI realized that we humans don't know about ourselves enough, and has decided to get to work.**

We truly live in exciting times.

[OpenAI post]: https://openai.com/blog/ai-safety-needs-social-scientists/
[OpenAI full paper]: https://distill.pub/2019/safety-needs-social-scientists/
[AI Safety via Debate]: https://openai.com/blog/debate/