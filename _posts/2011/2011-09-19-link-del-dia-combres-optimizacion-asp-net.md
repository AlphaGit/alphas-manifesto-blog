---
title: 'Link del día: Combres, optimización ASP.NET'
date: 2011-09-19 10:48:45 +0000
date_gmt: 2011-09-19 15:48:45 +0000
categories:
  - Link del día
tags:
  - HTML
  - performance
  - librería
  - optimización
  - ASP.NET
description: >-
  JH compartió librería ASP.NET para optimización, reduce HTTP requests, sitio
  CodeProject muestra usos, pronto usarlo.
---


Justo ayer, rondando la medianoche, JH me envió por email un link a este proyecto llamado [Combres 2.0](http://www.codeproject.com/KB/aspnet/combres2.aspx), una librería para optimización de sitios ASP.NET. Recuerdan el caso de [Minify]({{ site.baseUrl }}{% link _posts/2011/2011-06-20-link-del-dia-minify.md %}) para PHP o [mod_pagespeed]({{ site.baseUrl }}{% link _posts/2010/2010-11-08-link-del-dia-optimizacion-web-vs-desarrollo-prolijo.md %}) para Apache, este es el turno de ASP.NET.

Esta librería nos permite incluir recursos haciendo uso de ella, de forma que al momento de generar los links también se hacen referentes a una dirección que esta librería manejará, y se encarga del cacheo, compresión y minimizado de los documentos. La reducción de HTTP requests es, por lejos, una de las ganancias más útiles y menos costosas de lograr que nos ofrece.

En el sitio de CodeProject (en donde se encuentra alojado) se pueden ver varias de las aplicaciones y usos que tiene. Veré si prontamente puedo comenzar a utilizarla.

_Soy un zorrinito optimizado._
