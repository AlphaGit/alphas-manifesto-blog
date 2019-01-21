---
layout: post
excerpt_separator: <!--more-->
title: Technical Leaders **must** write code
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5677
wordpress_url: https://blog.alphasmanifesto.com/?p=5677
date: '2017-05-19 19:11:30 +0000'
date_gmt: '2017-05-20 00:11:30 +0000'
categories:
- Projects
- Technology
tags:
- coding
- team work
- development
- technical leader
- leadership
- practice
- TL
sub_title: And here's why
---

![]({{ site.baseurl }}/assets/ForgottenKeyboard.png)

While the premise sounds obvious, it is not so much once you get used to all the responsibilities that a Technical Leader has. And most of the time it turns out that writing code is a second priority to them. But here's why it shouldn't be dismissed at all.

<!--more-->

## What Technical Leaders do

Technical Leaders have, as a first responsibility, leading the team in the technical decisions of a particular project. They are the ones that have the birds-eye-view of the project general design and architecture, and at the same time can help in details here and there because of their knowledge with particular technologies. They guide the team, they help the team, and the team helps him move forward, doing most of the coding work in the project.

As such, technical leadership is, as most leadership positions, some kind of managerial job. It's not really focused on people management, but it has a good part of it. It is heavily focused on technical debt management and architecture/design. This, in turn, makes TLs the most appropriate point of contact for quick references on planning, technical dependencies, technical priorities and, as you might expect, technical decisions.

This means that a TL mostly spends time in (among other stuff):

- Creating / iterating / reviewing / teaching  the architecture design
- Creating / iterating / reviewing / teaching application design
- Reviewing team member's code to ensure it aligns with design and future vision
- Helping PMs / Scrum masters identify execution strategy (i.e., what needs to be done first and when)
- Helping PMs / Scrum masters / BAs identify technical risks, technical requirements, challenges
- Being the technical point of contact for the team, for example, for technical members of the customer team
- Being the central point of technical coordination across projects

So, where's the time for coding???

Most people find these activities as a surprise when they get promoted from their job as a developer into a Technical Leader, because even when the title sounds "technical", it's mostly leadership and not so much development, which most tech-geeks find to be a not-nice surprise.

And yes, this can be distributed into the team and not a single person, which is indeed recommended. However, that requires a mature team that can self-manage, have great communication, have great technical skills, coordination and ability to think as one. There are risks and challenges for this, and its a whole another level of maturity for teams, but that is not the subject of this article.

## Why is coding important for a Technical Leader?

If your TL is very technology-oriented, not only coding will be an enjoyable activity for them, but it is also a very crucial part of leadership.

When a TL produces code directly, the project and team benefit in the following ways:

- **The leader gains empathy for the problems that particular team members are having.** They may be struggling to resolve problems and the leader may not appreciate their struggles completely, when the environment where they work may not be appropriate. Maybe the legacy code was as bad as they said. Maybe the build process _is_ taking that long. Maybe the process is as cumbersome as someone mentioned.
- **The leader will experience first hand what are the problems in the code.** Seeing them directly allows for him to think of very direct, low-cost opportunities to fix it.
- **The leader can use his ability as a skilled person to see into blind spots that the team may have.** If the team members are just dealing with particular problems without acknowledging them, a leader may be the right person to say "this is not ok", without fear of a leader turning them down.
- **The team can feel the leader more connected to the group.** After all, everyone's part of the same team. Being really focused on different activities only helps into pointing out the differences in what they do instead of putting them together for what they work. If anybody in the team ever says something along the lines of "he doesn't know what it's like", this has already become a problem.
- **The leader will evaluate if standards and guidelines they set really help.** Standards and guidelines may look nice in theory but may be problematic in practice. Imagine a TL defining a set of rules and the team doing their best to meet them, even when they work against the team productivity. The TL experiencing it first-hand is a very good dose of their own medicine.
- **The leader will be reviewed by the team members.** Code reviews are a powerful tool for everyone involved to learn, not just the reviewed person. A TL is not different, and even if they are considered the most skilled person, they should not be exempt from being reviewed. Everyone makes mistakes. Also, they should lead by example, so if they require good code, they should show what they consider good code to be. Images may speak a thousand words, but `Code.SpeakWords(Int32.MaxValue)`.
- **They will be able to test the development workflow.** While this is not a technical part for the TL to evaluate, they are also responsible for the way that the team works, and they may find problems in the way they carry on with their work. Again, specially if the TL is one of the most skilled people, they definitely should try it out for themselves.
- **They will keep in touch with the technologies involved.** Time passes by, we get older and we forget things. Practice makes the master, and a TL that does not code cannot help coding very well. Every technology is different and while some of them are very similar to what we know, it's the little things that tell apart a skilled person from a true expert. You want your TL to be on point with the technologies they're working with right now.

## What type of code should a Technical Leader work in?

Since there are other activities they should be involved in, we cannot just take TLs as other members of the team with most of their time for development. We must account for their actual code productivity being smaller, because they will be working in other things too. As such, what we choose for them to do is not just "what's pending next", but should be chosen with a strategy.

A good choice is to select different parts of the system, so that the TL can get comfortable with all of them eventually. Being the ones that need to make decisions on the general design and architecture, having knowledge on most of the project will help them making better decisions. Also, they will better guide the team into working in these subsystems.

Special subsystems with higher standards (security, performance, etc.) are a good choice too. If the task is too difficult or design-specific for other developers to work on, having one of them assigned to it may just become a ping-pong of questions in a code review, which will be time-consuming and even frustrating. A TL is a good choice for this kind of tasks, if they can work out the time for these tasks. However, note that overall this is a symptom of poor communication, so handle with care.

## Conclusion

Teams shouldn't treat their leaders as being apart from the group. Working closely greatly benefits communication and empathy -- something that a leader must have.
