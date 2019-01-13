---
layout: post
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
  content: "[&#8230;] covered a little bit of this idea in my previous post,&nbsp;Taming
    your tools. Every content of the pull request that is not helping to achieve the
    goal is helping to hide it. [&#8230;]"
---

![](/assets/whip.png)

They should work for you!

<p style="text-align: justify;">Have you ever met a carpenter that would pick up a wrench and hit a nail with it? Probably not, and if you saw that, you would probably be thinking in taking your business elsewhere. And if you wouldn't, then you should. Here's why.</p>
<p><!--more--></p>
<p style="text-align: justify;">It drives me crazy when I see a commit change with too many changes in it that are accidental, "because git just includes them". Or seeing people ignoring test failures because "it has always been like that". But let me step back from software for a second...</p>
<h2 style="text-align: justify;">Tools</h2>
<p style="text-align: justify;">Whatever the job you do, there are some tools that you need to accomplish it. Some tools are absolutely necessary (would you do bike racing without a bike?), some tools are not essential, but nice additions (if you do finances, you probably don't <i>need</i>&nbsp;a calculator, but it makes it a lot easier, right?)</p>
<p style="text-align: justify;">Tools are the objects and methods you use to <strong>make your work easier for you and more reliable for everyone</strong>. The point of them is not only to automate work for you, or for the work to look good, is to take concerns out of your mind so you can focus on the important stuff that cannot be automated.</p>
<p style="text-align: justify;">As you probably know, I work in IT software development. IDEs have editors and compilers together, so you don't need to go back and forth between programs to know if your code compiles well. Furthermore, syntax highlighting doesn't only make code prettier, but it also help spot errors right away. This means that <b>less errors make it out to the final product</b>. I have been recently working on the .NET stack and have fell in love with JetBrains ReSharper, and with NCrunch. The first one takes care of so many style adjustments, error checking, automatic refactors it's like almost having a peer reviewer on top of you, without the awkwardness. And NCrunch tells you the status of unit testing on every key press. If you remember my post on&nbsp;<a href="https://blog.alphasmanifesto.com/2015/03/30/how-tdd-pays-off/">How TDD pays off</a>, this is spot on.</p>
<p style="text-align: justify;">I could keep going on, but you probably got the point.</p>
<p style="text-align: justify;">As such, the more you know what your tools can do for you, the more you can put them to good use. Here's a few things to consider for software tools:</p>
<ul style="text-align: justify;">
<li><b>Does it "feel" good?</b> As in, does it make the usage of the tool a gratifying experience instead of a nuissance?</li>
<li><b>Does it go with your workflow?</b> If so, is it worth changing your workflow for the benefits you'll get?</li>
<li><b>Have you learnt the shortcuts? </b>Does it even have shortcuts?</li>
<li><b>Can you turn off the options that you're not going to use? </b>Do you know the full extent of what it can do for you? Maybe it's worth checking that manual or that book.</li>
<li><b>Does it make you think?</b> (This is not a good thing.)</li>
<li><b>Does it slow you (or your computer) down?</b> Too much? When you find yourself waiting for something to finish, it's too much.</li>
</ul>
<p style="text-align: justify;">For those that have read&nbsp;<a href="https://blog.alphasmanifesto.com/2016/01/03/code-complete-second-edition/">Code Complete</a>, this is what Steve McConnel refers to as "programming <i>into</i> your language, not <i>in</i> it". Programming languages are a tool. Spoken languages are a tool. Learn them, use them so that they help <i>you</i>.</p>
<p style="text-align: justify;">And when you join a group that already has their toolset built, learn those tools as much as you can. Those are not more imposed unto you as they are unto them. Once you truly understood how those tools work, you can start challenging them for their pitfalls, so that the group can be better off your outsider knowledge. Present options, bring ideas. Don't accept how things are just because everybody does them, but find why everybody does them and make everyone better. (Your results may vary in each group depending on the people and processes. When in doubt, consult your tech lead. Alpha's Manifesto cannot be held responsible for beatings, arguments, spontaneous combustion or sudden death.)</p>
<h2 style="text-align: justify;">Learning curve and risks</h2>
<p style="text-align: justify;">Nothing&nbsp;is free, of course.</p>
<p style="text-align: justify;">I learnt to drive a car not that many years ago. Reason being that I just simply never needed one, I used to walk everywhere, or where things were far apart, take&nbsp;public transportation. Eventually, I moved to a place where nothing was really close to me, so I learnt to drive and bought a car.</p>
<p style="text-align: justify;">Of course, learning is difficult. You will need new knowledge, you will need to practice a new skill set, which may come natural to you or not. You will need to watch out for new problems, but you may also forget about some of the old ones.</p>
<p style="text-align: justify;">In my example, the metaphor holds: now with a car, I could get to farther places, and in less time. I did not have to worry about weather that much, or about the walk leaving me sweaty and un-presentable. But now I had to worry about traffic conditions, maintenance of a huge machine like a car is, costs, and all security precautions while driving.</p>
<p style="text-align: justify;">All tools are like that: they have a learning curve and once they become part of your flow, you have a new skill set that you'll develop and get better at. You'll have some problems solved for you and you'll have new problems that you need to face. Hopefully, these new problems will be closer the ones that you actually wanted to solve in the first place.</p>
<p style="text-align: justify;">"Oh, the engine light? I don't know, it just turned on but everything looks fine, so I didn't bother". You probably can start seeing where my advice starts to make sense.</p>
<p style="text-align: justify;">It is important that&nbsp;<strong>you have control over your tools</strong>. Don't trust them magically, understand them, up to the point where you can tell if something is wrong before its too late.</p>
