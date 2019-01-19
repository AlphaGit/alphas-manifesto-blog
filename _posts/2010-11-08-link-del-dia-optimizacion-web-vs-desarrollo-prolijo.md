---
layout: post
status: publish
published: true
title: 'Link del día: Optimización web vs. desarrollo prolijo'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 2636
wordpress_url: http://blog.alphasmanifesto.com/?p=2636
date: '2010-11-08 11:23:28 +0000'
date_gmt: '2010-11-08 13:23:28 +0000'
categories:
- Link del día
- Technology
tags:
- JavaScript
- HTML
- performance
- CSS
- desarrollo web
comments:
- id: 6850
  author: Martin Alterisio
  author_email: malterisio777@gmail.com
  author_url: ''
  date: '2010-11-09 10:20:26 +0000'
  date_gmt: '2010-11-09 12:20:26 +0000'
  content: "OJO! Es correcto usar:\r\n\r\nbackground: url(image.jpg);\r\n\r\nla especificacion
    indica que el resto de definiciones son opcionales y defaultean al valor inicial.\r\n\r\nDe
    todas maneras, la optimizacion de CSS pasa mas por los selectores que por las
    definiciones de estilo. Las hojas de estilo quedan mucho tiempo en cache, los
    beneficios de minimizar la hoja de estilo no son tantos como optimizar los selectores
    (el render se hace mas rapido)."
- id: 6851
  author: Alpha
  author_email: alpha@furries.com.ar
  author_url: http://www.alphasmanifesto.com.ar/
  date: '2010-11-09 10:47:03 +0000'
  date_gmt: '2010-11-09 12:47:03 +0000'
  content: |-
    Allo! Gracias por el comentario, te contesto en varias partes:

    Por un lado, sí, quise decir que es correcto usar brackground: url(image.jpg); como la forma corta, pero que no está entre las prioridades del desarrollador darse cuenta si lo está escribiendo corto, largo, si el valor que pone es el default o el default por herencia. Un par de palabras más en el texto para estar seguro no son tanto problema.

    Por otro lado, y referente a la optimización de CSS: Sí, tenés razón, y ese es un punto que omití, el tiempo de renderización. Aún así, creo que el tamaño está relacionado. Incluso a pesar del caché del lado del servidor (no tengamos en cuenta el del cliente, ya que podríamos pensar en el caso de la primera visita), el tiempo de transferencia de poder ser reducido es mejor todavía, y soy de los enfermitos que piensan que cada byte cuenta. Sé que no se gana demasiado, pero la meta es llegar a un punto en donde la experiencia del usuario sea el presionar enter en una barra de direcciones y tener una página web instantáneamente cargada. Creo que quien logre eso a pesar de las distinciones de velocidad y localización podrá tener a su favor un punto muy grande en cuanto a capacidad de optimización.

    Saludos!
- id: 7905
  author: 'Link del día: Performance HTML5, CSS3 y DOM, Parte 1: Intro | Alpha''s
    Manifesto'
  author_email: ''
  author_url: http://blog.alphasmanifesto.com/2011/05/09/link-del-dia-performance-html5-css3-y-dom-parte-1-intro/
  date: '2011-05-09 13:16:49 +0000'
  date_gmt: '2011-05-09 15:16:49 +0000'
  content: "[...] de los sitios puede ahorrar muchos problemas en la performance.
    Así como alguna vez hablamos de mod_pagespeed, Paul menciona otras alternativas.
    Herramientas relacionadas: HTML5 BoilerPlate (librería de [...]"
---

Hace tiempo ya estaba comentando con un colega sobre la enorme cantidad de medidas que pueden tomarse para mejorar la performance de una aplicación web. Existen miles de factores involucrados, entre los cuales hay muchas configuraciones y tweaks que pueden hacerse al servidor, pero muchos otros tienen que ver con el código en sí mismo. Sí señores, estamos hablando de HTML, CSS y JS.

El problema en este punto es que un HTML mínimo puede no ser el HTML que nuestro generador de contenidos genera. Puede que el CSS sea automatizado también, o que nuestro diseñador o desarrollador HTML no esté pensando en hacer las cosas de la forma "más mínima posible", sino realmente trabajando en hacer que algo se vea bien y esté bien codificado. No está entre sus prioridades escribir

```css
background: url("image.jpg") repeat top left scroll;
```

en lugar de

```css
background: url(image.jpg);
```

Ambos son equivalentes, pero la segunda es más corta y por tanto más eficiente. Pero nuestro desarrollador debe realmente preocuparse porque el desarrollo sea correcto, que la visualización sea consistente y que sea acorde entre navegadores.

Ni hablar de JavaScript, en donde la cantidad de optimizaciones, minimizaciones y mejoras puede ser realmente importante. Alguno quiere trabajar sobre JavaScrpt minimizado? Sin duda: no.

La alternativa a la que llegamos era la de tener dos versiones de la aplicación. La de desarrollo con código normal y la de producción. Una vez que desde la de desarrollo se hicieran pruebas y quisiera hacerse un release, solo teníamos que correr una serie de herramientas que nos permitieran tener una versión minimizada y optimizada del código, bajo el riesgo de que algo se rompiera en el proceso.

Pero ahora Google acaba de publicar un módulo que han desarrollado para Apache 2.2, llamado [mod_pagespeed](http://googlewebmastercentral.blogspot.com/2010/11/make-your-websites-run-faster.html), el cual hace optimizaciones y cache en el momento de los pedidos, para optimizar los sitios web sin tener que modificar los archivos reales. Por supuesto, es altamente configurable, y podemos ver la gran cantidad de [mejoras que puede realizar](http://www.modpagespeed.com/) en el poco tiempo que tiene.

Google nos cuenta que ya está trabajando con GoDaddy para que todos sus clientes puedan utilizarlo, y con Cotendo para que esté disponible en su CDN también. Si ustedes no tienen la suerte de estar entre ellos, pueden bajarlo por cuenta propia desde la página del [proyecto de PageSpeed](http://code.google.com/speed/page-speed/download.html), e instalarlo en sus propios servidores.

_Soy un zorrinito acelerado._
