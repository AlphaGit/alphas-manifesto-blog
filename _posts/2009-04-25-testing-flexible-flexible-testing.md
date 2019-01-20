---
layout: post
title: Testing Flexible | Flexible Testing
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 1195
wordpress_url: http://blog.alphasmanifesto.com.ar/?p=1195
date: '2009-04-25 19:06:11 +0000'
date_gmt: '2009-04-25 21:06:11 +0000'
categories:
- Projects
tags: []
---

**English:**

These days I've been working on developing a testing process which would be adaptable to companies having a large testing cicle (including the whole life-cycle for testing it implies) as well as companies having just a couples of days they can use for testing and few resources available. On such variability, it was necesary to generate a testing model which would be adaptable and partitionable acording to particular necesities, or according to what can be planned in the project.

For cases where the testing is a planed part of the whole development cycle, testing itself may begin from the requirement specification and may even follow the whole development life-cycle at the same time. This is the famous [V-model](http://en.wikipedia.org/wiki/V_model) of testing life-cycles, but this model presents a great deficiency, and it is the same dependency between all of its internal stages. This model adjusts perfectly to developments with waterfall life-cycles and, it is even adaptable to other well-defined life-cycles. But what happens when these life-cycles do not have well-defined stages? Or, even worse, when this stages are sometimes mixed-up?

Of course, this situation is not desirable at all for a project, but, when it is found, it would be desirable that our testing model does not fall with it, but should allow us to be used also to give more quality &ndash; i.e., the purpose of it.

Our approach to this task was defining several different types of testing, which would vary from the requirements they had (documents on which to be based on, resources needed according to project size, time invested, knowledge level required for resources, etc.), and for each of these levels of testing, different variants which would allow us to evaluate a certain aspect of a system. This way, we achieved having testing processes which could be improvised by the developers themselves leaving useful documentation for future developments, as well as it could be also used for being planned and start being analyzed by a testing team from the very beggining of the development proces.

Of course, we belive that as more testing, best quality can be achieved, but this is not always posible, and this is a fact we should take into account, as deying it is condemn ourselves to failure.

Unfortunately, I'm not allowed to go into details on about the different types of testing we've defined &ndash; as they are our company's property &ndash; but these types of testing had been designed with a formal structure and style, so that they can be also used to be outsourced to other testing companies, or that, needed the case, we could be testing another's company code.

_I'm an adaptable little skunk._

