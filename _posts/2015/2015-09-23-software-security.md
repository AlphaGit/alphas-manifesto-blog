---
excerpt_separator: <!--more-->
title: Software Security
date: '2015-09-23 07:08:27 +0000'
date_gmt: '2015-09-23 12:08:27 +0000'
categories:
- Technology
tags:
- coursera
- course
- MOOC
- development
- security
- buffer overflow
- string format attack
- static analysis
- introduction
subtitle: MOOC by the University of Maryland

---

![]({{ site.baseurl }}/assets/candado.png)

Yes, I continue to go on courses. Now I just finished the [Software Security](https://www.coursera.org/course/softwaresec) course, from the University of Maryland.

As usual, let me give you a quick review of what it was about, what you need to get into it and what you can get out of it as well.

<!--more-->

This course was about general Software Security. It started off with a very good theoretical introduction to security and how to measure and detect it, and then we dug deep into one of the most common things that you hear about when talking about vulnerabilities: buffer overflows, string format attacks, arbitrary code execution, etc. The greatest part about it is that it was not only wonderfully explained, but also we got to see the evolution of protection methods and the evolution of the attacks against them. Finally, with hands-on labs we got to "hack" systems of our own, which was an amazing feeling. I felt like a real hacker!

The course does require some basic knowledge about C and pointer arithmetic. However, I am in no way an expert on these and I was able to go through all of the excessive without problem. I did double-check my numbers, though, so if you're completely new to this, you probably want to reinforce those concepts.

We then jumped to the network world and web-world, talking about SQL Injections, MiTM attacks, and the last part about network security was a little sped-up for my taste, but I knew there was no possible way to cover all frameworks, vulnerabilities and attack vectors in there. It is just so vast. However, introductions to it did not miss any of the good parts and it did not loose it's wide-angle view at any point.

Finally, the course introduced security as part of the software engineering process, interleaving itself in different parts of it. Abuse case definition, threat model definition, penetration testing, static analysis, architectural risk analysis... so much that can be done even before your software is done. And at last, we played a little bit with static analysis and different methods, even getting to have a software mutate with symbolic execution right before our very eyes and discover hidden bugs in a program. Amazing.

My only complain so far is that it took longer than expected to receive the certificates (I just received them, but the course actually finished on August). However, this has no impact in the quality of the course itself and I still recommend it fully.

If you're interested in it, you can [visit the Software Security course](https://www.coursera.org/course/softwaresec), which happens to be part of a much larger [Cybersecurity specialization](https://www.coursera.org/specialization/cybersecurity/7).
