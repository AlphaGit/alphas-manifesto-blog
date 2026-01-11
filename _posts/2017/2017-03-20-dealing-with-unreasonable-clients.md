---
excerpt_separator: <!--more-->
title: Dealing with "unreasonable" clients
date: 2017-03-20 20:26:33 +0000
date_gmt: 2017-03-21 01:26:33 +0000
categories:
  - Development
  - Thoughts
tags:
  - management
  - project management
  - commented
  - technical debt
  - customer
  - client
  - money
subtitle: Customer management
description: >-
  Communicate with customers, understand problem, compromise, explain needs,
  challenge assumptions, consider impacts, trust technical expertise, decide
  when to walk away, don't treat customers as enemies.
---


![]({{ site.baseurl }}/assets/alpha/StickFigure.png)

One of the forums from the StackExchange family which I usually visit is the Workplace one. It deals with office / team behavior, ethics and professionalism. The questions are incredibly interesting -- most of the time, I'm not entirely sure what I should do in situations like that -- and the answers are amazingly well crafted and thought.

And there is a particular one which caught my attention lately: [Manager requesting task which I believe is unnecessary](http://workplace.stackexchange.com/q/58509/25611). And I found it interesting because we hear that a lot in the software world: "why is my customer / manager / leader asking for that if it's not really necessary / a priority / important?"

Well, there are several aspects to consider. Let's go in this world of absurd requirements together.

<!--more-->

(Note: in the rest of the article I'll use "clients" or "customers" for simplicity, but this applies to everyone in a leadership or decision-making position.)

## 1. "The client doesn't know what they want"

While this may be true sometimes, **it is a dangerous and condescending view to have**. We are not better suited to make business decisions because we are closer to technology. In fact, in most business scenarios, we are _less_ suited to do that exactly because we're not close enough to the business.

Regardless of how technical inept your customer may be, they do know what problem they have and they have ideas on how to solve it. Yes, sometimes they offer "solutions" that are not really solutions, but that is a benefit, since it will give you a glimpse into their way of thinking and how they will approach the problem. You get to learn what disadvantages they're willing to accept for a solution to their problem, and what aspects of the software can be compromised for special attention to others.

Let the customer help you understand the problem. Let the customer know how you think you'll solve the problem and get their blessing on it.

A good communication at this point will help you make better decisions and suggestions in the future, for this and other customers. Your goal is to get to a point where they'll just answer "you got it perfectly -- approved!".

### 1.1. "...but they're wasting my time with non-important stuff!"

I've been there too -- but in a business world, priorities look much different. Sometimes a stupid color redesign will buy more time and funds to finish that refactor you said you needed. Remember that companies, without money, do not run, no matter how noble their goal is.

Be communicative, and explain your concerns, but remember that the customer has the final goal and they should be the ones deciding what the path to it should be. That's a business strategy after all! Feel free to weigh in, but don't distrust them because you don't agree with them.

## 2. "The customer does not understand how software is done"

"...because they won't pay what we need" / "...because they expect it to be done very quick"

They don't need to. And sometimes, they don't even want to. It's our job to do that, not theirs.

Part of our job is also communicating what our needs are so that they can be satisfied. Maybe we need more testing time? Maybe we need a bigger team? Maybe that thing just cannot be done on budget. You know why: put the numbers down, go face to face with them and explain why. You should be able to do this without getting in technicalities.

There are tricky questions that are hard to answer if you're not prepared. So, be ready to justify what you're going to ask for.

## 3. "What they're asking for is wrong..."

Technically or ethically?

### 3.1. "... technically"

That's fine. There's always a compromising middle ground. Even if you believe there's no, explain why. But avoid technicalities. Software is always done to achieve a goal: phrase your concern how this will prevent reaching that goal.

Some of these challenges are not obvious.

As an example: How will developing a standard on naming help a CMS from working? Well, it won't. But this CMS software will need maintenance. Somebody will ask for new features. And the developers doing so may be us or may be somebody else. It may even be someone new -- at any point, inconsistencies will prevent them from quickly picking up on how the software is built, and that's time and money lost. Even worse, what if because of that there are mistakes created? If they get caught on time, they need to be fixed, and there goes more time and money. If they are not caught on time... well, best case scenario, there's an angry customer, worst case scenario, it may affect someone's life. Let's develop a standard to be consistent -- it's only going to take us X hours and after that we're done.

At the end of the day, we're all pushing on the same direction, just from different aspects. The customer wants a business problem solved, you want software built properly to solve that problem.

### 3.2. "... ethically"

1. Challenge yourself. How are you so sure that the customer is ethically wrong in their request? Is it a personal bias? Is it a matter of law? Is it a societal norm? Think what you may answer if they said "no, you're the one that's wrong!" -- what's your rebuttal to that? Can you prove that you're right, or is it just a strong belief you have? (And if it is, are you willing to give up your job for it?)
1. Find out who is affected by these and what the impacts are. Maybe this is a privacy concern and you're being asked to violate someone's boundaries. Maybe this is a legal concern and you're being asked to commit fraud of some kind. Maybe it's something you just don't feel aligned with. Still, you should put what the impact of this will be in words.
1. Talk with your customer, calmly. Do they know of these issues? Approach it from an understanding side -- they may be unaware that what they're requesting is not ok. Explain what you found. Also, give alternatives!
1. Be prepared to turn your back on them. You will find people that are just ruthless or really unreasonable. Ready yourself to turn down a business opportunity if you are not emotionally or mentally prepared to deal with one of them.

## 4. "But they won't listen!"

This is another beast entirely.

Is it a trust problem? Have you proven yourself worth of their trust? "But I'm the technical expert!" is a rubbish excuse -- there are tons of technical experts, but very few that will correctly understand the problem that is indeed being solved. Those are the ones that will give good suggestions that align with the current situation.

Are you explaining yourself correctly? Are you being too technical or detailed for what they can understand? You must keep the conversations at the technical level with you both feel comfortable with. You should feel confident that the customer has understood the main difference between the options provided and has chosen with the right knowledge, even if you would have chosen differently. Note that this is not "dumb it down", but rather "level it correctly". You may get a customer that doesn't trust you entirely because you haven't been technical enough.

### 4.1. "But still, I feel uncomfortable"

"They're micro-managing me", "They are blindly unethical", "They won't trust technical advice no matter what I do"...

Yup, that's a thing that can still happen. I know it first hand, it's awful.

At this point, you will have to ask yourself: "Is this a customer I want to provide services to?" You will need to decide if this person is worth your time in exchange for your money. Remember that you're not only giving away your time and your skills, but your mental health, your work/life balance, and several other things that we usually complain about. If this is a loss for you, do the right thing that a business man would do: cut your losses.

## 5. "Why did you write all this?" / Conclusion

It's very common for technical people to become blinded by their own role. Sometimes, when we're building software, we find it hard to accept that there are other points of view on "what's important" or "what's best". And the problems above are very common, up to the point where sometimes teams will work for a customer treating them as the enemy.

That is an awful point of view to have, and leads <del>to the dark side</del> to a sense of _customers_ = _enemies_. They're still people, and they have been kind enough to have you as their team. Make an effort to understand the necessities behind the ask, you may find a plot-twist that explains everything.
