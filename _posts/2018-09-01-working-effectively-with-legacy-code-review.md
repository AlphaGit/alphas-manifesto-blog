---
layout: post
status: publish
published: true
title: Working effectively with legacy code (review)
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 6517
wordpress_url: https://blog.alphasmanifesto.com/?p=6517
date: '2018-09-01 16:32:24 +0000'
date_gmt: '2018-09-01 20:32:24 +0000'
categories:
- Books
tags:
- design
- best practices
- review
- book
- book review
- legacy code
- maintenance
- system design
comments:
- id: 88579
  author: simplivllc
  author_email: simplivllc@gmail.com
  author_url: https://www.simpliv.com
  date: '2018-11-23 07:18:36 +0000'
  date_gmt: '2018-11-23 12:18:36 +0000'
  content: "Well written and presented stuff.Keep it up.\r\nhttps://www.simpliv.com"
---

![](/assets/working-effectively-legacy.jpg)

Your weapons against any badly designed code

I just finished reading _Working effectively with legacy code_, by Michael Feathers. The title is perfectly descriptive and quite ambiguous at the same time. Let me explain to you why.

<!--more-->

First of all, I thought, due to the title, that the book would be a long rant about the inefficiencies of poorly design code, the set of problems that it can cause, and how to prevent most of them. In that, I expected a lot of repeat on other books about proper design, but I was wrong. The author goes directly into the point of explaining the usual problems that we have with legacy code, and gets past that pretty quickly to explain how to deal with them.

He clearly explains how this book is not about good design, but rather, to cope correctly with the results of poor design and coding. It's about being able to see the light out of those issues and find your way out of them.

Now, that sounds easier said than done, so Mr. Feathers actually goes directly into specifying the two big problems that we usually have with legacy code:

1. Understanding it
1. Changing it

For help with understanding poorly design code, he explains several strategies to make sense of them, like scratch-refactoring, method extraction, effect sketches, top-down system descriptions, etc. For help with changing the code, it all comes into a single strategy: surround the code with tests, then test it.

So now the problem translates into how to properly test poorly design code. As we know, testing itself requires some design choices (usually seen as best practices), but now to change code, we need to test it, and to test it we need to change it. How do we solve this chicken-and-egg problem?

_Working effectively with legacy code_ is the answer to that question. Michael Feathers explains several techniques that help to reduce the risk of change so that you can test around the code to go ahead and introduce the changes you need.

Some of the proposed techniques will actually deteriorate the design of the code, but this is something that's fully accepted and pointed out in the book: the goal of the techniques is not to design well, but rather, to get the platform needed to do it without introducing bugs.

All in all, I think this is a great book, focused in a very common problem: getting things done the right way without getting in the way of business (which is why most software done after all). While we might not need to fully remember in detail each particular technique, knowing the general philosophy behind them and that they exist, make it really easier to go ahead and keep improving our code bases, not matter how bad they are.
