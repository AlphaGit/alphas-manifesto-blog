---
layout: post
excerpt_separator: <!--more-->
title: The Clean Coder
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5635
wordpress_url: https://blog.alphasmanifesto.com/?p=5635
date: '2016-11-20 18:01:46 +0000'
date_gmt: '2016-11-21 00:01:46 +0000'
categories:
- Books
- Technology
tags:
- software
- book
- code
- book review
- professionalism
- software engineerng
- developing
- ethics
---

![]({{ site.baseurl }}/assets/the-clean-coder-cover.jpg)

I recently read Uncle Bob's "The Clean Coder". I have to say, this book slapped me in the face. There's so much to discuss.

<!--more-->

First of all, the title of the book has a subtlety that makes it quite different than what I expected. I thought it would discuss about good code practices, but it doesn't: it talks about _coders_, not _code_.

The book itself is built around the concept of _professionalism _and what does that mean for a person working in the software industry. It mostly describes the point of view of someone doing code, but of course, it rubs elbows with management, scheduling, testing and budgeting positions, which all work together to build software. It is also worded in a very down-to-the-ground language with specific examples and what's Uncle Bob's vision of the wrong and the right situation for several common problems.

Note that this book only talks about the professional behavior and ethics of a software developer. It does not go into the details of software building or even how to solve most of the typical problems that software engineering presents. It discusses the behavior that, as a professional, you should have.

The style of the book is very down-to-Earth. It is filled with examples and personal anecdotes. Those are then built into generalizations, but somehow it doesn't leave aside the feeling of a personal point of view. As such, the book feels opinionated instead of fallacious, and still with a good amount of truth in it. It is friendly and goes directly to the point, which makes the book quite short (160 pages without preface).

## Ethics

Uncle Bob dwells in an interesting, difficult to refute, approach to ethics and code.

### Testing

- If you are a professional, you will only build code that works.
- How do you know the code works? You need to test it.
- How do you know that the code always works? You always test it.
- How do you know that you're testing it correctly and efficiently each time? You automate testing.

From this, he concludes that **TDD is not only useful, but necessary**. If your code is not reliable, not only you are not reliable, but your code will negatively affect someone. It touches on the different types of testing but goes harder on unit testing, since it is what allows developers to work in short incremental cycles.

### Commitments

- If you are a professional, you will meet the dates that you give.
- How do you know how much something will take you? You don't, so you don't offer dates. You give estimates to refine.
- When is the refinement complete? Only when you are very sure about what you need to do. Otherwise, it doesn't.

He then proposes an approach of allowed uncertainty and delayed precision. He claims that being too precise about requirements will allow a system to become rigid and will need further change in the future (because no decisions are final).

### Technical debt

He absolutely bashes against technical debt. It should be the exception rather than the rule, because fixing it will never be a priority and it hinders progress, flexibility and good software practices. This is, to him, not pure theoretical cleanliness but real money that you're making your employee waste, which turns you into an unprofessional employee. **Do not allow technical debt of any kind: address it.**

## My internal controversy

For me, this is one of the books that leaves me thinking if what I'm doing is correct.

As a software professional, I've found lots of problems in driving a project to completion, and these problems vary in their nature. My behavior has always been that of facilitating: working through the problems, removing obstacles, doing that is necessary to continue forward.

Uncle Bob does not directly disagree with that, but he explicitly asks that your first reaction is a firm and decisive "No. It cannot be done." This is because, in his view, by bending our arm and accepting these things, we are undermining the very same meaning of our professionalism, allowing non-software related people to treat us like mere puppets, or become mere enablers. But I _do indeed_ accept these: to me these are the reasons why software engineering is a full discipline and not only a task to robotically execute.

Now, I would have clearly dismissed that as some Uncle Bob's extreme opinion if it wasn't that I was involved in the examples that he mentions, almost verbatim, happening to my teams. The accuracy was scary. It was like it was almost talking about myself.

At some point in the past I had the same controversy in me: I had saved a project from complete failure (into a mild success) after so many things happened to it, sacrificing much of my personal life and my team's. After it all finished, I didn't feel like a hero, I was exhausted and still stressed out. It wasn't worth it, so I question myself: should I just have said "Sorry, it cannot be done?" and let it fail? I didn't. Uncle Bob says I should have done exactly that.

What do you think? Have you been in such situations? What did you do?
