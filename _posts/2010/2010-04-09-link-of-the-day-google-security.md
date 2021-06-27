---
layout: single
title: 'Link of the day: Google Security'
date: '2010-04-09 11:59:47 +0000'
date_gmt: '2010-04-09 13:59:47 +0000'
categories:
- Link del día
- Technology
tags:
- Google
- JavaScript
- performance
- C#
- open source
- seguridad
- SQL
- XML
- Shell
---

Well... sort of. It's not anything new these days, but a while ago, Google published it's own security testing tool for website security testing, called [Skipfish](http://code.google.com/p/skipfish/). Of course, this is not the first tool that Google releases for this purposes, as many related are already out there (like [ratproxy](http://code.google.com/p/ratproxy/), the [Browser Security Handbook](http://code.google.com/p/browsersec/wiki/Main), and so on...). However, the new thing today is skipfish.

Skipfish is an active website scanner that will test the web applications for XSS, SQL Injection, Shell injection, XML Injection (that one's new for me), SSL, insecure cookies, correct MIME headers, server errors, invalid links... etc. The complete list is enormous, and one of the main things is that this tool is being developed on C for high performance. It claims to be able to run with 2000 requests per second on remote servers (of course, if the servers answers in time).

I haven't had the chance yet to give it a try but I probably will these days. These are the kind of reports that you may see from it, see a [skipfish screenshot](http://skipfish.googlecode.com/files/skipfish-screen.png).

This all came from [Google's Online Security Blog](http://googleonlinesecurity.blogspot.com/). It is worth a reading, updates are not too much common nor too much big, so you can keep easily up to date with your favorite RSS reader.

_I'm a secure little skunk._
