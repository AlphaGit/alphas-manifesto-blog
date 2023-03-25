---
excerpt_separator: <!--more-->
title: Real privacy does not exist
subtitle: Why the illusion of privacy is only an illusion
categories:
  - Thoughts
tags:
  - Privacy
  - Security
header:
  image: assets/cookies.webp
  image_description: Inspecting cookies
description: >-


  Desc: Debate about privacy from the wrong angle: Companies don't care about
  data points; they care about how to sell products. Explore how companies
  breach user privacy, how users can protect themselves, and why it's an uphill
  battle.
---


There was a particular gag I came across in a Youtube video. One where, from the point of view of a long-term future, an advance human race made fun of us for having expectations of privacy in our lives.

I brushed it away as a single joke at first, but it stuck with me. I think they might be right.

<!--more-->

The joke itself wasn't really funny. In this video, they did not go further on why the expectation of privacy was flawed. If I were to guess, it was part of a running joke of how in a dystopian future, the human race achieved technological progress despite the efforts for data protection. Another one of those "corporations are the future" jokes. At that moment, I brushed the joke away.

## Advertising

A few days later, I came back to one of the projects I'm working on, and I work with not one, not two, but _five_ companies for which the core business relies on somehow _breaching_ user's privacy. Mind you, it's all entirely legal. After all, advertising businesses are all about personalizing the right offer to the right user, whether they want it or not.

![it's true but he shouldn't say it]({{ site.baseurl }}/assets/memes/its-true-but-he-shouldnt-say-it.jpg)

However, this debate about privacy is usually seen from the wrong angle. The problem is not so much about companies "knowing" about you. Advertising companies don't really care how are you called, where do you live, how old you are and how much do you make. They care about what those datapoints mean for their business, and how to sell stuff to you.

As an excercise, let's look at those datapoints from the lense of "I only care about money". This, in the data science world, means looking for a "data product" (i.e. deciding what we can use datapoints for, in leiu of a particular purpose).

- **How are you called?** --> Are you of a particular ethnicity? Do you celebrate particular holidays? Can we sell you thematic stuff related to it? Are there products that you'll never buy because of traditional reasons?
- **Where do you live?** --> Are there companies, retail stores, entertainment near you that you're more likely to consume? Is the location you live in very leaning towards certain ideologies? What language is spoken there? What's the infrastructure in those places, and what equipment will you need to buy to live in there? (Appliances? Services? Transport?)
- **How old are you?** --> What will your interests be? What is something likely you'll be looking for? Are you a child mostly interested in getting through school? A teenager interested in music? A grown up dealing with loans?
- **How much do you make?** --> How much can you afford, what is your economic class, and what do others hold in that regards as a display of status?

### Big advertising with shared IDs

As you could imagine, no-one who respects privacy will agree to give companies this level of detail about their lives. It just feels unsafe. (And it is!) So these companies, instead, rely on multiple data points that they can somehow correlate.

In the web, the most common example we all know about is cookies. Those tracking cookies that giants like Google will use in almost every website. Websites use Google's systems because they're giants, and they're giants because every website uses them. So, their cookie tells them where have you been. Not only the website but the specific URL, which might include specifics like product information.

Now, we don't like cookies anymore, and while most keep using them, the same approach works in multiple other platforms. IDFA, IDFV (Apple) and GAID (Google) is pretty much the same concept. Your app requests an identifier that says nothing about you, expect that your app is using them. A giant ad company can get that one, and will find that they got the same ID from Candy Crush and Fruit Ninja. They will deduce that you're a casual gamer, and is ready to start serving the right ads.

## Correlations

But let's say there's nothing tracking you. You are a privacy-concious user, you use DuckDuckGo for your browsing, you disable cookies and javascript whenever you can. You use SSL only for your websites.

You can *still* be tracked by information that you do not fully control. DNS requests? Will let us know if you're visiting Facebook, or Instagram, or using Whatsapp.

Or your IP address will leak out, as long as we have access to the server logs of several companies, we can see that your IP 123.123.123.123 happened to visit facebook.com and instagram.com 20 minutes later.

You use proxies or Tor browser? Fine, we won't get your real IP address, but we still know there's someone that visits facebook.com and instagram.com 20 minutes later, every day at 6 pm. And they happen to log in with the same sequence of usernames. Let's hope that Facebook and Instagram do not share their data. (Uh-oh.)

This all sounds too far-fetching, but it is not. Maybe of the big companies working on advertising really do have access to this information, and more. Furthermore, the information that _they_ collect is _not_ private and it's _not_ your information at all. It's _their_ information about _your_ usage of _their_ services, and that makes it fair play.

Besides, it's not like standards, good practices or even the law will prevent someone from just selling data, breaching it accidentally or plainly putting it out there. It has happened before, and it will happen again. Equifax, I'm looking at you.

## "Nothing to hide"

I will not be one of those arguing that "if you've done nothing wrong, you've got nothing to hide". I know it doesn't work like that, because privacy is not a problem until the information is in the wrong hands, and wrong hands will always exist. Companies, governments, authoritarian regimes, social mobs or plain trolls can misuse that power.

In an "ideal" world, privacy would not be needed. But we don't live in an ideal world, so we _do_ need it.

However, I suspect it might be a losing battle that we're fighting. Real privacy and anonimity comes with a lot of drawbacks that many of us are not willing to accept realistically. Targeted ads are useful, recommended posts are cozy, our information bubble is a nice place to stay in.

## What should we do?

From the point of view of users of the internet, the usual advice you've heard still applies. Be mindful of the information you share. Educate yourself on scams and technological tools so that you are safe with the tools that you're using. If Microsoft Edge bugs you about setting up your privacy settings, don't just skip it but actually do it. The more you know, the better prepared you'll be.

From the point of view of information-gatherers (companies, data scientists, governments or even individuals), the question is not whether about you "can", but whether you "should". Profits, control and consistency will always lead you in the direction of "aggregate all user data, get to know your user as much as you can". Your goal as an ethical person is to draw a line in the sand and claim "this is enough". Spread the word on your thoughts too, because as you get fired from one place for not working on the next Skynet, someone might be hired to go along with it. Your goal is to reduce those chances.

Still, I personally think this is an uphill battle. All the mechanisms that would _guarantee_ privacy in the past don't currently exist, and as our tools for communication and networking become better and better, those walls keep disappearing. It's not necesarilly bad, it's just dangerous.