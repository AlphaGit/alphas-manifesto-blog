---
title: How NOT to publicize your AI practices
subtitle: Based on a true story
categories:
  - Security
  - AI
tags:
  - Security
  - AI
  - Compliance
  - Policies
header:
  image: assets/alpha/angry.webp
  image_description: Angry Alpha
description: >-
  Do not mislead your audience, particularly in security.
excerpt_separator: <!--more-->
---

I got so mad about this that I had to write a blog post. Consider this an edu-rant.

<!--more-->

## Context

Part of the work I'm doing is writing security policies and procedures for AI tools utilization, so that the data is safe, the people are not impacted negatively when something goes wrong, the outputs are not biased, etc.

This led me to investigate the AI tools that we're currently using. Some of them are well-known and integrated into existing famous platforms. Some others, not so much. Some of them, are startups that are just gaining their space in the market.

Because the maturity of these companies is different, I expect the quality of their documentation to be different.

But then...

## Disclosures

I will not disclose what company this is, and following the rule of [Hanlon's Razor](https://en.wikipedia.org/wiki/Hanlon%27s_razor), I don't think this is done out of deceptiveness, but rather out of ignorance.

Also, I am not a lawyer, your mileage may vary, when in doubt talk to your doctor, etc.

## The Problem

Most companies will showcase their new AI product and have a section dedicated to the "security" of their product. I'm looking to see if customer data is used when training, if privacy agreements are in place, if the data is encrypted, etc.

This company has none of them, aside from the features that their product has. Eventually, I got to some documentation that sent me to their security page.

They claim they are GDPR compliant. Good! They also claim that their employees never access customer data. Perfect!

Then I see this (paraphrased for anonymity):

### Infrastructure & Architecture

> We use AWS to store your data. AWS is certified on ISO 27001, PCI DSS, SOC 1, and SOC 2.

And that's about it as compliances go. This is borderline misleading -- the fact that your data centers have been certified does not make your application certified. It's the difference between a necessary condition vs. a sufficient condition. Your data centers being certified are necessary for you to be compliant, but it's not sufficient.

**How to fix this:** Display which certifications or compliances you've got. It's okay to show if you're working towards some of them (it helps even if you don't have it, and you don't mislead readers into thinking you do).

> Our platform is built in NodeJS.

If you're going to boast about security, it's not a good idea to show me that everything's done in a language that doesn't even know about type safety. Sure, NodeJS can be safe, but it doesn't put you in a better position than any other option.

What's worse, knowing this already gives me ideas about how to start planning an attack (if I were to) because I know what vulnerabilities are common in NodeJS and the popular libraries.

**How to fix this:** Don't mention the language. It's irrelevant. If you want to boast about the technology stack, boast about the security measures you've taken. Tell me how the code is audited. Tell me how you isolate yourself from dependency attacks. Tell me how you handle security patches.

(To be fair, the company did have some of this on their page. It wasn't all bad. But it also had typos. One for one, I guess.)

> We use industry-standard MySQL.

"Industry standard" sounds impressive but it means "what everyone else uses". Also, as long as your system works I don't care what flavour of SQL you're using.

**How to fix this:** Don't mention the database. It's irrelevant. Explain how your data is encrypted, how things are backed up, and who has access to them. Tell me how data is anonymized.

### Coding security

> We follow OWASP guidelines.

Sure, that's nice, but ... do you really? At least, I know you don't force 2FA so that's automatically one I can think of that you don't follow. But what does "following" mean? Does it mean that you considered it? Does it mean that you read the guidelines and you said "Yes, this is a good idea"?

**How to fix this:** Be specific. Show which big measures have been taken to protect the data. Encryption at rest? In transit? How do you handle data deletion requests? How do you handle data breaches? Do you have a bug bounty program? Do you have a security team? Do you have a CISO? Have you been audited or undergone a security assessment? Pen-testing? Show it!

### AI

> (...)

No mention of the models? If your product is AI-based, I want to know how the models are trained. Are they trained on customer data? Of course, I don't need to know what your secret sauce is, but using my data for constructing your models might lead to secrets leaking. This is fairly important.

I had to dive in into their privacy policy document, which, being GDPR-compliant should say which data is used and for what purposes.

> We might use your data to provide and maintain our services.

I will not criticize this because I know how it needs to be written in legalese, but it basically says "We use it". It tells me nothing about security. The security section then says the same things I mentioned before but written more formally and without further detail.

They do show what data is collected (which is good), and that only certain people can access it (also good), and that's about it (not so good).

**How to fix this:** Be specific. Show how the data is anonymized. Show how the data is encrypted. Show which parts of the data are used for training models, and which ones are not. Show how the data is backed up. Show how the data is accessed. Show how the data is audited. Show how the data is handled in case of a breach. Tell me if your customer data is used for model training. Tell me if models are separated from production data. Tell me if different customers get access to the same models.

## A good example

Check out [Notion's AI Security Practices](https://www.notion.so/help/notion-ai-security-practices) page.

They cover:

- What the extent of their AI-powered feature does.
- Who are their sub-processors.
- How the feature works (so you know how your data is being used and exactly how it benefits you).
- How the data is stored.
- How it relates to the existing permissions system.
- Explicitly say that they don't use your data for training their models and that they prohibit their subprocessors from doing so.
- How they separate production from development-level data.
- How are retention and deletion policies.
- Compliance and certifications, present and future.
- Legal considerations.

Just top-tier stuff.

Also, why do I like this example? They did it on a single page. No need to build a full trust-center site, with multiple articles, and long sections. Just clear and to the point. Good work, Notion. You know how to write.