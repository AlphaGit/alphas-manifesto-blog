---
layout: post
status: publish
published: true
title: How TDD pays off
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5272
wordpress_url: http://blog.alphasmanifesto.com/?p=5272
date: '2015-03-30 22:34:26 +0000'
date_gmt: '2015-03-31 03:34:26 +0000'
categories:
- Projects
- Technology
tags:
- testing
- TDD
- unit testing
- mongo-faceted
- software development
- software engineering
- methodologies
- automated testing
comments:
- id: 28600
  author: Taming your tools &#8211; Alpha&#039;s Manifesto
  author_email: ''
  author_url: http://blog.alphasmanifesto.com/2016/02/28/taming-your-tools/
  date: '2016-02-28 16:05:39 +0000'
  date_gmt: '2016-02-28 22:05:39 +0000'
  content: "[&#8230;] And NCrunch tells you the status of unit testing on every key
    press. If you remember my post on&nbsp;How TDD pays off, this is spot [&#8230;]"
- id: 29282
  author: Testability vs. simple design &#8211; Alpha&#039;s Manifesto
  author_email: ''
  author_url: https://blog.alphasmanifesto.com/2016/03/22/testability-vs-simple-design/
  date: '2016-03-22 20:21:42 +0000'
  date_gmt: '2016-03-23 01:21:42 +0000'
  content: "[&#8230;] But tests are still part of your codebase, and you need to account
    for them in your design. This becomes increasingly important when you actually
    need your tests to perform changes, to fix bugs, or to verify how something works.
    Really, it pays off. [&#8230;]"
- id: 48649
  author: Failed experiments and what I&#8217;ve learned from them &#8211; Alpha&#039;s
    Manifesto
  author_email: ''
  author_url: https://blog.alphasmanifesto.com/2017/03/26/failed-experiments-and-what-ive-learned-from-them/
  date: '2017-03-26 21:54:19 +0000'
  date_gmt: '2017-03-27 02:54:19 +0000'
  content: "[&#8230;] I wasn&#8217;t convincing enough with my How TDD pays off post,
    here&#8217;s another reason to test your stuff: you may make the smallest of mistakes
    and [&#8230;]"
---

![](/assets/Semaforo1.png)

A success story from the side of the doubtful

<p style="text-align: justify;"><strong>Software engineers, amirite?</strong> They keep blabbing about this fancy-pantsy weird wibbly-wobbly stuff nobody understands and they just want to keep things complicated. They want to&nbsp;<em>test</em> things even before they are done and <em>then</em> develop the app. Are they insane? And it even takes more time, so it's a waste of money.</p>
<p style="text-align: justify;">Well, my little <em>friend-that-does-not-adhere-to-software-methodologies</em>, they are right on what they do. And <strong>it does pay off</strong>. Let me tell you why.</p>
<p style="text-align: justify;">(In here also: an update on the mongo-faceted project.)</p>
<p style="text-align: justify;"><!--more--></p>
<h2 style="text-align: justify;">Test-Driven&nbsp;Development: what's its value?</h2>
<p style="text-align: justify;">TDD,&nbsp;as its best known, is a very counter-intuitive process where you first decide what and how you want to test your system and code those tests, and later on build the system. You probably have heard of it already, but there's something else to discuss: why it matters.&nbsp;What you'll hear about it,&nbsp;of course, is that you'll have automated tests. Yes, you can run these whenever you want. Yes, you'll pick up regressions easier. But there's something more meaningful than that.</p>
<p style="text-align: justify;">TDD accounts for the human limitation of our mental capacity.</p>
<p style="text-align: justify;">When we develop and design a system, its really hard to keep all important concerns in mind. We usually work from the top-down, where we have an idea of the goal&nbsp;we need to accomplish, and then we get into the details. Your request may have been to get a billing system working to send invoices to your clients, but we will spend some time looking&nbsp;at the exact headers that the HTTP request needs to send to be authorized. There's no way around it: details are part of the job. Maybe a little more than we want them&nbsp;to. The devil is on the details, and we need to be on top of <em>everything</em>, being details or wide-system goals.</p>
<p style="text-align: justify;">We can't. We just can't. At some point we will forget that we needed to update a configuration file when moving to another environment. We will forget that after we finished with the release we needed to update the regex to consider new TLD domains, and make sure that <em>everything</em> worked as expected. (Did you say "everything" again? Take a cookie.)</p>
<p style="text-align: justify;">That's where TDD comes to the rescue: we don't need to remember because the tests&nbsp;will remember for us. They are our method of remembering, of keeping the details.</p>
<h3 style="text-align: justify;">But why do it before coding?</h3>
<p style="text-align: justify;">Great question, my <em>friend-that-interacts-with-me-in-the-form-of-titles</em>.</p>
<p style="text-align: justify;">TDD is about covering your bases, but as any developer has experienced sometime, if you remember a new concern&nbsp;when you were almost done with the rest, you may have to rewrite <em>everything</em> from scratch. Having all of these beforehand really help into making sure nothing gets lost along the way. When you think you finished a feature, no other feature&nbsp;should be undone, and if tests say otherwise, you just detected a problem in your line of thought before getting to the end.</p>
<p style="text-align: justify;">Of course, if you were to code&nbsp;<em>all</em> the tests for your system and start with an empty codebase, you'll just have that: hundreds of tests screaming at you because&nbsp;they're all failing. And that can be overwhelming and distracting, which we don't want.&nbsp;This is why TDD introduces these changes one by one. You test, it fails, you fix, you repeat. Nowhere along those lines you should be breaking more than the test you're trying to fix right now.</p>
<p style="text-align: justify;">This allows for the programmer to experiment new approaches only&nbsp;after they have focused into the feature&nbsp;that&nbsp;needs to be done. They can re-write without fear of losing those details, because he/she knows that other&nbsp;features were&nbsp;working before, validated by tests.&nbsp;The only missing task&nbsp;is to rewrite how that logic is done to&nbsp;accommodate for the new&nbsp;feature. This is the refactor process of TDD.</p>
<h3 style="text-align: justify;">And how does it save time?</h3>
<p style="text-align: justify;">Of course. Time. Time is money. And irreplaceable. Drifting away. You don't want to spend it wrongly, do you?</p>
<p style="text-align: justify;">Imagine the following scenario: you have none, or maybe just a few tests. Your developers introduce a new feature and when they check, the new feature seems to be working fine. But something else broke, they are not sure why, because they didn't intend for that to happen. They say some more things may be broken, but are not sure. And since they don't know why, they don't know how much it'll take them to get them&nbsp;fixed. Maybe the system is unusable at this point.</p>
<p style="text-align: justify;">So, your only solution so far is to have a member of the testing or dev team looking into the application and assess what's working and what's not. There you go, with days spent on&nbsp;a full regression test depending on the size of the app. Your development team needs to start digging into what went wrong, and by everything that you consider holy, you DO have a version control system to look at the changes one by one, right?</p>
<p style="text-align: justify;">TDD makes sure that this never happens. You know exactly which&nbsp;change broke the system. You know exactly what it broke, and you know exactly how long its going to take to get it fixed. As TDD proposes minimal changes, you could&nbsp;even have some analytical process that tells you the level of impact of the changes -- but you don't even need it: the tests already tell you what's wrong.</p>
<h2 style="text-align: justify;">An anecdote: mongo-faceted</h2>
<p style="text-align: justify;">Do you remember my side-project, mongo-faceted? If not, you can <a href="https://blog.alphasmanifesto.com/2015/01/03/faceted-searches-with-mongodb-and-mongoose/">read about it here</a>.</p>
<p style="text-align: justify;">I had to rewrite it so that one of the basic assumptions of the project was not hold true anymore: I relied on mongoose to provide me with the schema of the models and now I wanted to have it completely decoupled, with mongoose optional. I didn't know how much of a change that would involve, and I didn't know how it was going to work. I just had my goal.</p>
<p style="text-align: justify;">But&nbsp;I had tests!</p>
<p style="text-align: justify;">I just created some more tests into how I wanted the API to be called, which represented my goal. The rest was filling in the blanks (fixing the tests) and refactoring so that the code was cleaner (keeping the tests passing). It took me three hours to get it running.</p>
<p style="text-align: justify;">What could have been a major rewrite and a change of project assumptions in three hours. I'm going to invent a cocktail called TDD and drink it toasting to this.</p>
