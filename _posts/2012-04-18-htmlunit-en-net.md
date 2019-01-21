---
layout: post
title: HtmlUnit en .NET
wordpress_url: http://blog.alphasmanifesto.com/?p=3796
date: '2012-04-18 08:00:53 +0000'
date_gmt: '2012-04-18 13:00:53 +0000'
categories:
- Link del día
tags:
- HTML
- ".NET"
- automatización
- artículo
- librería
- unit testing
- headless browser
sub_title: Unit testing para web frontends
---

Hay un artículo en particular de Steve Sanderson llamado [Using HtmlUnit on .NET Headless browser automation](http://blog.stevensanderson.com/2010/03/30/using-htmlunit-on-net-for-headless-browser-automation/) que indaga sobre los beneficios de utilizar esa librería para simular un browser completamente funcional que podemos utilizar para nuestro unit testing, y, por qué no, para automatizar tareas en un browser. La idea principal es poder ejecutar tareas como si de un browser se tratara, e inspeccionar los elementos de la página e interactuar con ellos.

Cabe destacar que [HtmlUnit](http://htmlunit.sourceforge.net/) en realidad está hecho para Java, pero puede portarse a .NET de la forma que Steve Anderson menciona. He leído [por ahí](http://stackoverflow.com/a/3280679/147507) que es un poco lento, pero creo que su API agrega la suficiente simpleza como para trabajar fácilmente por él.

_Soy un zorrinito automatizado._
