---
layout: post
status: publish
published: true
title: Failed experiments and what I've learned from them
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5658
wordpress_url: https://blog.alphasmanifesto.com/?p=5658
date: '2017-03-26 21:54:14 +0000'
date_gmt: '2017-03-27 02:54:14 +0000'
categories:
- Projects
- Technology
tags:
- testing
- design
- modular
- TDD
- troubleshooting
- software development
- methodologies
- development
- strong typed languages
- data structures
comments: []
---
<p style="text-align: justify;">In a preparation for a post that I'm going to write, I've prepared some code examples, and of course, making sure they work correctly. I spent nearly all of last week trying to find out what was wrong with my code, and when I did it, it was something really stupid. I don't consider myself very stupid, so why did this happen? Let's reflect a bit.</p>
<p><!--more--></p>
<h2>What was the problem?</h2>
<p style="text-align: justify;">(This will help give context to the rest of the post.) At some point in a data-processing routine I had, I accidentally was passing around <code>values[1]</code>&nbsp;instead of <code>values[index][1]</code>. So, instead of passing a value, I was passing the same row of data over and over.</p>
<h2>Test your crap</h2>
<p style="text-align: justify;">If I wasn't convincing enough with my <a href="https://blog.alphasmanifesto.com/2015/03/30/how-tdd-pays-off/">How TDD pays off</a> post, here's another reason to test your stuff: you may make the smallest of mistakes and just not realize it until it's too late. Why didn't I test myself, being such a huge proponent? Well, I was going to do a quick-and-dirty work, maybe just 5-10 lines of code, that turned into 100 or 200 for debugging purposes. And I didn't want to spend any time on tests that wouldn't even see the light of day.</p>
<p style="text-align: justify;">And here I am, one week later, wishing I did because I wouldn't have wasted a week troubleshooting a very minor indexing operation.</p>
<p style="text-align: justify;"><strong>Testing saves time. Testing prevents headaches. Testing saves kittens.</strong></p>
<h2>Avoid unfit&nbsp;data structures</h2>
<p style="text-align: justify;">Unless there's a need for it, avoid difficult, complicated or weird data structures. <strong>If they don't feel right, they're probably not right.</strong> In this case, I was using an array of arrays, which is not really strange, but why did I really need that? An array of arrays is pretty much a bunch of values&nbsp;thrown together in a bag, isn't it meant to have any data structure?</p>
<p style="text-align: justify;">Yes. I should have created objects, which are awfully easy to do. Maybe <code>values.map(v => { x: v[0], y: v[1] })</code>&nbsp;would have done it for me. I got lazy because I was using Google Charts and it requires you to <a href="https://developers.google.com/chart/interactive/docs/basic_preparing_data">pass the data to it in an array of arrays</a>, so I thought I might as well treat everything with the same data structure. It felt like a good idea at the time, and I can still see value in that decision, but in hindsight, it wasn't that beneficial.</p>
<p style="text-align: justify;">You see, when you make a design choice for communicating data through your system, you may be leaking implementation details in the structure of that data. My data were an ordered pair of <code>(x, y)</code>&nbsp;values, so an array of arrays may have felt right, but it feels very weird to get a <code>y</code>&nbsp;value by using an index <code>1</code>.</p>
<p style="text-align: justify;">If had I decided to go with the meaningful objects through my code, not only this mistake wouldn't have happened, but it would be much more readable. And even better, assuming that I still had made the mistake, it would be contained only in the Google Chart module code that requires the array of arrays.</p>
<p style="text-align: justify;"><strong>Preventing mistakes from propagating is good system design.</strong></p>
<h2>Pick a platform / language that helps you</h2>
<p style="text-align: justify;">Some may ask: passing <code>values[index][1]</code>&nbsp;will give you a number, but <code>values[1]</code>&nbsp;will give you an array. How could I not figure it out sooner this was returning a completely wrong data structure? I mean, they look pretty different when you print them, and you cannot work on a row, right?</p>
<p style="text-align: justify;">Well, in JavaScript, you can.</p>
<p style="text-align: justify;">If you try to operate mathematically with an array, it will just work fine. You'll get <code>NaN</code>&nbsp;as a result, but as it turns out, <code>NaN</code>&nbsp;(Not a Number) happens to be a special type of number. (<code>typeof(NaN) === "number"</code>). This means that you can keep operating and propagating your error but you will not get an exception. You will not get values for those numbers, but your result will be <code>NaN</code>&nbsp;and it will be a value just like any other.</p>
<p style="text-align: justify;">Strong-typed languages will generally prevent this kind of situation by throwing a big in-your-face exception or not even allowing the code to compile. "You multiplied an integer with an array? Dude, get out of my sight.", an angry compiler musters, somewhere.</p>
<p style="text-align: justify;">I knew about this and I still wanted to use JavaScript for other reasons, like easiness of development, visualization and being able to put something online that works without much infrastructure. I still think it was the right decision, but it didn't help in this case.</p>
<h3 style="text-align: justify;">Do strong type languages help?</h3>
<p style="text-align: justify;">Some time ago, we debated this matter with some colleagues, inspired by this tweet from Uncle Bob:</p>
<p>https://twitter.com/unclebobmartin/status/820668328956071936</p>
<p style="text-align: justify;">The conversation had multiple branches but the gist&nbsp;relevant to this topic is that static type checking is a help for the developers to make fewer mistakes. Uncle Bob suggests he can get the same feedback with tests and in the same amount of time. That being said, he was challenging (in a good way and with good reasons) the usefulness of static type checking, since sometimes it will force conversions and types that are only meant to satisfy a compiler.</p>
<p style="text-align: justify;">I recommend&nbsp;reading some of those Twitter discussions, they contain good points of view from both sides about how much compiler type requirements help vs. tests and the fragility / adaptability of tests.</p>
<h2>Modularize</h2>
<p style="text-align: justify;">Finally, as I was working in this quick-and-dirty PoC, I didn't modularize my code. This meant as well that the interfaces and data passage between different pieces was really loose in definition, tightly coupled. Or, closer to reality, those boundaries didn't even exist. This also meant that the errors were able to propagate back and forth without me noticing, and most of the calculations&nbsp;were just going wrong and making no sense.</p>
<p style="text-align: justify;">Modularizing helps avoid interconnections that allows errors to pass through, and it also helps when chasing a problem, since the developer&nbsp;can focus on a particular module at a time.</p>
<p style="text-align: justify;">Assuming the problem was still there, and that I had no tests, it would have been easy for me to start writing the tests for a module, but since the code wasn't modularized, it was a time-expensive option for me. So I didn't take it and started chasing problems here and there, spending this whole week of worthless effort.</p>
<h2>Conclusion</h2>
<p>Do things right and they'll be done quick.</p>
