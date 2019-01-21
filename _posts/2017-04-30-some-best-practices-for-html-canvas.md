---
layout: post
excerpt_separator: <!--more-->
title: Some best practices for HTML Canvas
author:
  name: Colin Cieloha
  links:
    - title: LinkedIn
      url: https://www.linkedin.com/in/colin-cieloha-7a01ab55
      icon: fab fa-linkedin
    - title: Twitter
      url: https://twitter.com/ColinCieloha
      icon: fab fa-twitter
    - title: Skilled.co
      url: https://skilled.co/
      icon: fab fab-link
date: '2017-04-30 13:57:05 +0000'
date_gmt: '2017-04-30 18:57:05 +0000'
categories:
- Technology
tags:
- HTML
- performance
- best practices
- Canvas
- web development
sub_title: by Colin Cieloha from Skilled.co
---

This is a guest post submitted by Colin Cieloha, who is an American author and content marketer at [Skilled.co](https://skilled.co/). He writes about everything that will draw his attention with a focus on the mobile and e-commerce space. When he is not writing he is spending his time traveling the globe and snowboarding. You can follow him on his Twitter at [@ColinCieloha](https://twitter.com/ColinCieloha) or on [Linkedin](https://www.linkedin.com/in/colin-cieloha-7a01ab55).

His post focuses on performance tips regarding the use of HTML Canvas, and general best practices. Thanks Colin for this content!

---

So you&rsquo;ve started using your canvas cheat sheet to acclimatize yourself to all the various uses of the canvas element. In the beginning you were working on some simple 2D drawings and objects, but now you&rsquo;re looking to become proficient with the canvas element and see what it is capable of.

Finding a set of best practices for the canvas element isn&rsquo;t always easy, since the element has been evolving for some time, and will continue to evolve. But there are a few great habits that have emerged which will help you achieve a higher level of efficiency with the element than you already have.

<!--more-->

As developers we all get stuck in our habits and run into performance walls, which is why it is advised to always take a bit of time to do some research and learn how to optimize your use of canvas. It should be noted that many of these techniques can be used in all computer graphics environments.

One of the most asked questions about canvas is whether it is better to have one element or many elements. The answer we&rsquo;ve come to is **by having multiple objects you end up more efficient** because you don&rsquo;t have to constantly redraw large resource-expensive elements like the background element as often as you will the smaller moving ones. An additional &ldquo;hack&rdquo; you can use here is to render the background a little slower than the foreground. Human perception places more emphasis on the foreground, so the demand for the background to be as sharp is less.

Similar to this concept is when you&rsquo;re re-drawing the same &ldquo;main character&rdquo;, or primitive, across multiple frames. You can derive huge benefits from **pre-rendering certain portions of the animation off-screen and then animating it on-screen**. To make sure that this operation doesn&rsquo;t become expensive, ensure the pre-rendered canvas fits snugly on the background canvas element, otherwise the performance gains will be cancelled out by the costs of copying one large canvas onto another.

Use of **the `shadowBlur` method can look flashy, but is often considered too demanding** upon resources and is best left out so as to reap the performance gains instead. This can be carried on to several other methods that seem useful, but are not worth the effort and demands upon your processing speed.

Another great performance boost comes from **measuring the incremental differences between redraws and then using that to render less** than more. The temptation is occasionally to clear the whole screen before redrawing, when the actual best practice would be to account for the individual differences between the previous screen and clear only those differences before redrawing.

We previously stated that you want to avoid clearing the screen as much as possible, but if you absolutely must do it, there are a few different ways to go about it. You can either use the `clearRect` method or you can **use the `canvasWidth = canvasWidth` trick**. Most people don&rsquo;t realize the latter route is much faster. It&rsquo;s a little-known technique within the canvas community that can be used to deliver quick results. Just make sure it is still operational before you use it, as it is a less fundamental method within canvas and may be subject to change at any time.

Through all of this testing and improvement, you&rsquo;ll want a tool to **verify the code still works**. This is why the JSPerf tool was invented. It was designed to help developers build their own performance tests for HTML code, so the testing process could become more streamlined and not take up so much time. JSPerf runs each approach as many times as possible in a set period of time and then gives it a score based on the statistical results from all the iterations.

**A final best practice that you should be doing in your code anyways is indenting it**. Not only is it helpful to yourself when you&rsquo;re going through your code later on and editing or debugging it, but it is the polite thing to do in case anyone else is going to have to examine that code in the near future.

To help beginners through to experts, the team at [Skilled.co](https://skilled.co/) have created an [HTML Canvas cheat sheet](https://skilled.co/html-canvas/) so that you don't have to remember all of the different API methods, to help you get the most out of the canvas element.
