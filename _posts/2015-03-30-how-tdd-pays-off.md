---
layout: post
excerpt_separator: <!--more-->
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
---

![]({{ site.baseurl }}/assets/Semaforo1.png)

**Software engineers, amirite?** They keep blabbing about this fancy-pantsy weird wibbly-wobbly stuff nobody understands and they just want to keep things complicated. They want to _test_ things even before they are done and _then_ develop the app. Are they insane? And it even takes more time, so it's a waste of money.

Well, my little _friend-that-does-not-adhere-to-software-methodologies_, they are right on what they do. And **it does pay off**. Let me tell you why.

(In here also: an update on the mongo-faceted project.)

<!--more-->

## Test-Driven Development: what's its value?

TDD, as its best known, is a very counter-intuitive process where you first decide what and how you want to test your system and code those tests, and later on build the system. You probably have heard of it already, but there's something else to discuss: why it matters. What you'll hear about it, of course, is that you'll have automated tests. Yes, you can run these whenever you want. Yes, you'll pick up regressions easier. But there's something more meaningful than that.

TDD accounts for the human limitation of our mental capacity.

When we develop and design a system, its really hard to keep all important concerns in mind. We usually work from the top-down, where we have an idea of the goal we need to accomplish, and then we get into the details. Your request may have been to get a billing system working to send invoices to your clients, but we will spend some time looking at the exact headers that the HTTP request needs to send to be authorized. There's no way around it: details are part of the job. Maybe a little more than we want them to. The devil is on the details, and we need to be on top of _everything_, being details or wide-system goals.

We can't. We just can't. At some point we will forget that we needed to update a configuration file when moving to another environment. We will forget that after we finished with the release we needed to update the regex to consider new TLD domains, and make sure that _everything_ worked as expected. (Did you say "everything" again? Take a cookie.)

That's where TDD comes to the rescue: we don't need to remember because the tests will remember for us. They are our method of remembering, of keeping the details.

### But why do it before coding?

Great question, my _friend-that-interacts-with-me-in-the-form-of-titles_.

TDD is about covering your bases, but as any developer has experienced sometime, if you remember a new concern when you were almost done with the rest, you may have to rewrite _everything_ from scratch. Having all of these beforehand really help into making sure nothing gets lost along the way. When you think you finished a feature, no other feature should be undone, and if tests say otherwise, you just detected a problem in your line of thought before getting to the end.

Of course, if you were to code _all_ the tests for your system and start with an empty codebase, you'll just have that: hundreds of tests screaming at you because they're all failing. And that can be overwhelming and distracting, which we don't want. This is why TDD introduces these changes one by one. You test, it fails, you fix, you repeat. Nowhere along those lines you should be breaking more than the test you're trying to fix right now.

This allows for the programmer to experiment new approaches only after they have focused into the feature that needs to be done. They can re-write without fear of losing those details, because he/she knows that other features were working before, validated by tests. The only missing task is to rewrite how that logic is done to accommodate for the new feature. This is the refactor process of TDD.

### And how does it save time?

Of course. Time. Time is money. And irreplaceable. Drifting away. You don't want to spend it wrongly, do you?

Imagine the following scenario: you have none, or maybe just a few tests. Your developers introduce a new feature and when they check, the new feature seems to be working fine. But something else broke, they are not sure why, because they didn't intend for that to happen. They say some more things may be broken, but are not sure. And since they don't know why, they don't know how much it'll take them to get them fixed. Maybe the system is unusable at this point.

So, your only solution so far is to have a member of the testing or dev team looking into the application and assess what's working and what's not. There you go, with days spent on a full regression test depending on the size of the app. Your development team needs to start digging into what went wrong, and by everything that you consider holy, you DO have a version control system to look at the changes one by one, right?

TDD makes sure that this never happens. You know exactly which change broke the system. You know exactly what it broke, and you know exactly how long its going to take to get it fixed. As TDD proposes minimal changes, you could even have some analytical process that tells you the level of impact of the changes -- but you don't even need it: the tests already tell you what's wrong.

## An anecdote: mongo-faceted

Do you remember my side-project, mongo-faceted? If not, you can [read about it here]({{ site.baseUrl }}{% link _posts/2015-01-03-faceted-searches-with-mongodb-and-mongoose.md %}).

I had to rewrite it so that one of the basic assumptions of the project was not hold true anymore: I relied on mongoose to provide me with the schema of the models and now I wanted to have it completely decoupled, with mongoose optional. I didn't know how much of a change that would involve, and I didn't know how it was going to work. I just had my goal.

But I had tests!

I just created some more tests into how I wanted the API to be called, which represented my goal. The rest was filling in the blanks (fixing the tests) and refactoring so that the code was cleaner (keeping the tests passing). It took me three hours to get it running.

What could have been a major rewrite and a change of project assumptions in three hours. I'm going to invent a cocktail called TDD and drink it toasting to this.
