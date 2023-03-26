---
title: Doppler Reports
date: 2010-08-01 05:02:44 +0000
date_gmt: 2010-08-01 07:02:44 +0000
categories:
  - Projects
  - Technology
tags:
  - proyecto
  - performance
  - cloud computing
  - arquitectura
  - design
  - seguridad
  - marketing
  - computación distribuída
  - Doppler
  - email
  - modular
  - tiempo real
  - reporte
description: >-
  Doppler Reports launched - email marketing tool with real-time data,
  distributed architecture, security, modular design.
---


## Hello to you all

I'm really glad to announce that since some time ago, I had the opportunity to work along with the Doppler team for a new project, something that since that time was evolving, called [Doppler Reports](http://www.fromdoppler.com/Website/source/English/feat_reports.aspx). This project finally became active and working publicly on July 27<sup>th</sup>. Let me tell you a little more about it.

## What is Doppler anyway?

![Doppler]({{ site.baseurl }}/assets/Doppler.png){ :align-left}

For those that are not aware of it, [Doppler](http://www.fromdoppler.com) is a online **email-marketing tool**. It's really complex, but explaining it just at a glance, you can use it to create email content online (template-based or editing it yourself online), and sending it massively to one or many of your pre-entered mailing lists. However, there is much more to it, and one of the big powers enclosed in such a tool is the ability to analyze the customer's reaction to your mail campaigns. When you have ten, maybe twenty, fifty, or even a hundred customers, this is something you could easily do with lists. You check for your contacts, you see who opened the email you sent, you see who click on which link, and that's all the information you need to go on.

## Reports?

Things have changed a lot in the business since [that morning in 2005](http://blog.fromdoppler.com/feliz-cumpleanos-doppler). What happens when you've got a thousand contacts. A million? No, I'm not exagerating. That's part of our _everyday_ work, maintaining a tool that daily sends _millions_ of emails. How do we get results and present them to the users? The obvious answer is: reports.

Summarizing reports will give you the information youneed without having to scan for each of your contacts (because, of course, the system does it for you). And as technologies evolve, and as customer behavior evolves, and as marketing evolves, our tools needs to evolve too.

That's where the Doppler Team saw the necessity of creating a new brand report application, in order to fulfill a lot of requests that our customers had from the previous version of our reporting tool. But this one would have to be thought for **millions** of emails, **thousands** of users, **real time** information and at the same time **elegant** and **data-rich** reports.

Then we entered the scene. I had the chance to work closely along with [Juan Fazzini](http://ar.linkedin.com/in/juanfazzini) to design an architecture that would scale as Doppler would get bigger with all future features that it will get. So, in a Friday afternoon, a big white board, a notebook as recorder to keep track of everything we said (you know, documentation is important), we started brainstorming and dreaming about what Doppler reports would work like.

## How is the architecture designed?

### **1. Distributed architecture**

![Distributed architecture]({{ site.baseurl }}/assets/ModularAndDistributed.png){ :align-right}

Every part of Doppler will work as a separated module, that can have many instances working at the same time. There is a special module which will take care of connecting all of the others between them, but these interconnection modules may work independently as well.

This means that we now have more catastrophic-error tolerance. If one server fails down, the other instance of the module will keep on working, and users will notice nothing, but maybe some little delay on the application.

This also means that if we have too much load, because of intensive use, we can just create new module instances and the interconnection modules load balancing will automatically take care of the load.

### **2. Security on each call**

![Keys and lock]({{ site.baseurl }}/assets/Keys.png)

Having this modules out on the wild is no little thing for security. So, security had to be strong as possible, and we developed a communication protocol that would allow each module to check if the caller is in fact an authorized application and that it is ok to return data to it. If everything goes right, then the call is made and the results are returned. If something goes wrong, as like if you provided an incorrect token, you would never know what happened. This is not transparent at all for the end developer (and we know that), but **it is as secure as it gets** to prevent hackers.

This means that even when modules are out in the internet (not right now, but maybe someday), not anyone can access them. Even if they knew where they are and how to call it, it would just do nothing until clients provide an authorized token.

This also means that the keys that allow access to this module can be generated and in the future, the API for certain Doppler modules would be available for everyone (or just some users) to use. _Do you imagine creating an application for your business that would automatically work with the data Doppler generated for you?_

### **3. Real time reports**

More than an architectural decision, this was a challenge. You already know that we are handling tones of data. How to load it quickly, how to achieve a high performance? For that, we decided to make some internal objects proxy-like, so that you would only get the information you request.

This means that you can now enter the **dashboard** screen summary report for one of your campaigns, and you would see (_beware... long list coming_):

![]({{ site.baseurl }}/assets/Time.png)

- Name of the campaign
- Subject for the campaign
- Campaign type
- Amount of mailing lists that received that campaign
- How many unique subscribers received
- When was the campaign sent
- Total openings by hour
- Total clicks by hour
- How many mails where opened (total)
- How many mails haven't been opened yet
- How many mails have soft-bounced
- How many mails have hard-bounced
- Last open date
- Unique clicks
- Unique opens
- Last click date
- Each of the links
- For each of the links, how many subscribers clicked on them
- For each country in the world, how many openings happened in that country

_*breathes for air*_ Do you know how much time takes to Doppler Reports gather and show all that information? Less than 5 seconds. Let me emphasize that: **Less. Than. Five. Seconds. **That's what takes me to read the first three lines of the page. Maybe four, maybe five. But before I finished doing that, all the page is completely loaded and working. And I have to say, mine is not a premium connection.

Of course, we also use caching. This adds another layer of interaction until we get to the data, but our caching framework provides us with the ability of habing the data ready for the user right away. Campaign data does not change very often unless you have just sent it, so for most of the cases, **you will be able to check your campaign data as quick as any webpage** would load up.

### **4. Modular design**

![]({{ site.baseurl }}/assets/Puzzle.png)


I mentioned before that Doppler had started to become more complex, and is now being designed with a modular approach. In this way, modules work independently and at the same time, they rely responsibilities on the module that really knows how to solve a certain problem, or to treat certain data. Having a modular design is terribly important for future changes. It allows our team to parallelize work, it allows our team (and application) to grow.

This has great consequences. On the users side, new features will be available sooner. **New features, new improvements. Harder, faster, better, stronger.** (As Daft Punk suggests we build our software.)

## That impresses me, may I use it?

Of course, this new features are available to all users that have a Doppler account. If you don't have one, you can even create one free and try the product for yourself: <a href="http://www.FromDoppler.com/" target="_blank">http://www.FromDoppler.com/</a>

## Before you go...

...I just want to say that I consider a personal achievement having been part of all of this.  We tried to do something radical, and we have a radical product today. I think that all of the <a href="http://www.fromdoppler.com/Website/source/English/company.aspx" target="_blank">Doppler Team</a> is very proud of what they have today, and I sure am too.

Oh, and this post has made its way into the [GetCS blog](http://getcs.com/en/2010/07/doppler-reports/). Make sure to check it out.
