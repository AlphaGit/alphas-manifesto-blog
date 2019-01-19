---
layout: post
excerpt_separator: <!--more-->
status: publish
published: true
title: Taming your tools
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5564
wordpress_url: http://blog.alphasmanifesto.com/?p=5564
date: '2016-02-28 16:02:35 +0000'
date_gmt: '2016-02-28 22:02:35 +0000'
categories:
- Projects
- Technology
tags:
- Technology
- IDE
- TDD
- productivity
- learning
- tool
comments:
- id: 32584
  author: How to create a good pull request &#8211; Alpha&#039;s Manifesto
  author_email: ''
  author_url: https://blog.alphasmanifesto.com/2016/07/11/how-to-create-a-good-pull-request/
  date: '2016-07-11 22:33:19 +0000'
  date_gmt: '2016-07-12 03:33:19 +0000'
  content: "[&#8230;] covered a little bit of this idea in my previous post, Taming
    your tools. Every content of the pull request that is not helping to achieve the
    goal is helping to hide it. [&#8230;]"
---

![]({{ site.baseurl }}/assets/whip.png)

Have you ever met a carpenter that would pick up a wrench and hit a nail with it? Probably not, and if you saw that, you would probably be thinking in taking your business elsewhere. And if you wouldn't, then you should. Here's why.

<!--more-->

It drives me crazy when I see a commit change with too many changes in it that are accidental, "because git just includes them". Or seeing people ignoring test failures because "it has always been like that". But let me step back from software for a second...

## Tools

Whatever the job you do, there are some tools that you need to accomplish it. Some tools are absolutely necessary (would you do bike racing without a bike?), some tools are not essential, but nice additions (if you do finances, you probably don't _need_ a calculator, but it makes it a lot easier, right?)

Tools are the objects and methods you use to **make your work easier for you and more reliable for everyone**. The point of them is not only to automate work for you, or for the work to look good, is to take concerns out of your mind so you can focus on the important stuff that cannot be automated.

As you probably know, I work in IT software development. IDEs have editors and compilers together, so you don't need to go back and forth between programs to know if your code compiles well. Furthermore, syntax highlighting doesn't only make code prettier, but it also help spot errors right away. This means that **less errors make it out to the final product**. I have been recently working on the .NET stack and have fell in love with JetBrains ReSharper, and with NCrunch. The first one takes care of so many style adjustments, error checking, automatic refactors it's like almost having a peer reviewer on top of you, without the awkwardness. And NCrunch tells you the status of unit testing on every key press. If you remember my post on [How TDD pays off](https://blog.alphasmanifesto.com/2015/03/30/how-tdd-pays-off/), this is spot on.

I could keep going on, but you probably got the point.

As such, the more you know what your tools can do for you, the more you can put them to good use. Here's a few things to consider for software tools:

- **Does it "feel" good?** As in, does it make the usage of the tool a gratifying experience instead of a nuissance?
- **Does it go with your workflow?** If so, is it worth changing your workflow for the benefits you'll get?
- **Have you learnt the shortcuts? **Does it even have shortcuts?
- **Can you turn off the options that you're not going to use? **Do you know the full extent of what it can do for you? Maybe it's worth checking that manual or that book.
- **Does it make you think?** (This is not a good thing.)
- **Does it slow you (or your computer) down?** Too much? When you find yourself waiting for something to finish, it's too much.

For those that have read [Code Complete](https://blog.alphasmanifesto.com/2016/01/03/code-complete-second-edition/), this is what Steve McConnel refers to as "programming _into_ your language, not _in_ it". Programming languages are a tool. Spoken languages are a tool. Learn them, use them so that they help _you_.

And when you join a group that already has their toolset built, learn those tools as much as you can. Those are not more imposed unto you as they are unto them. Once you truly understood how those tools work, you can start challenging them for their pitfalls, so that the group can be better off your outsider knowledge. Present options, bring ideas. Don't accept how things are just because everybody does them, but find why everybody does them and make everyone better. (Your results may vary in each group depending on the people and processes. When in doubt, consult your tech lead. Alpha's Manifesto cannot be held responsible for beatings, arguments, spontaneous combustion or sudden death.)

## Learning curve and risks

Nothing is free, of course.

I learnt to drive a car not that many years ago. Reason being that I just simply never needed one, I used to walk everywhere, or where things were far apart, take public transportation. Eventually, I moved to a place where nothing was really close to me, so I learnt to drive and bought a car.

Of course, learning is difficult. You will need new knowledge, you will need to practice a new skill set, which may come natural to you or not. You will need to watch out for new problems, but you may also forget about some of the old ones.

In my example, the metaphor holds: now with a car, I could get to farther places, and in less time. I did not have to worry about weather that much, or about the walk leaving me sweaty and un-presentable. But now I had to worry about traffic conditions, maintenance of a huge machine like a car is, costs, and all security precautions while driving.

All tools are like that: they have a learning curve and once they become part of your flow, you have a new skill set that you'll develop and get better at. You'll have some problems solved for you and you'll have new problems that you need to face. Hopefully, these new problems will be closer the ones that you actually wanted to solve in the first place.

"Oh, the engine light? I don't know, it just turned on but everything looks fine, so I didn't bother". You probably can start seeing where my advice starts to make sense.

It is important that **you have control over your tools**. Don't trust them magically, understand them, up to the point where you can tell if something is wrong before its too late.
