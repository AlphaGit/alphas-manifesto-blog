---
layout: post
status: publish
published: true
title: 'Link del d&iacute;a: Optimizaci&oacute;n web vs. desarrollo prolijo'
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
- Link del d&iacute;a
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

    Por un lado, s&iacute;, quise decir que es correcto usar brackground: url(image.jpg); como la forma corta, pero que no est&aacute; entre las prioridades del desarrollador darse cuenta si lo est&aacute; escribiendo corto, largo, si el valor que pone es el default o el default por herencia. Un par de palabras m&aacute;s en el texto para estar seguro no son tanto problema.

    Por otro lado, y referente a la optimizaci&oacute;n de CSS: S&iacute;, ten&eacute;s raz&oacute;n, y ese es un punto que omit&iacute;, el tiempo de renderizaci&oacute;n. A&uacute;n as&iacute;, creo que el tama&ntilde;o est&aacute; relacionado. Incluso a pesar del cach&eacute; del lado del servidor (no tengamos en cuenta el del cliente, ya que podr&iacute;amos pensar en el caso de la primera visita), el tiempo de transferencia de poder ser reducido es mejor todav&iacute;a, y soy de los enfermitos que piensan que cada byte cuenta. S&eacute; que no se gana demasiado, pero la meta es llegar a un punto en donde la experiencia del usuario sea el presionar enter en una barra de direcciones y tener una p&aacute;gina web instant&aacute;neamente cargada. Creo que quien logre eso a pesar de las distinciones de velocidad y localizaci&oacute;n podr&aacute; tener a su favor un punto muy grande en cuanto a capacidad de optimizaci&oacute;n.

    Saludos!
- id: 7905
  author: 'Link del d&iacute;a: Performance HTML5, CSS3 y DOM, Parte 1: Intro | Alpha''s
    Manifesto'
  author_email: ''
  author_url: http://blog.alphasmanifesto.com/2011/05/09/link-del-dia-performance-html5-css3-y-dom-parte-1-intro/
  date: '2011-05-09 13:16:49 +0000'
  date_gmt: '2011-05-09 15:16:49 +0000'
  content: "[...] de los sitios puede ahorrar muchos problemas en la performance.
    As&iacute; como alguna vez hablamos de mod_pagespeed, Paul menciona otras alternativas.
    Herramientas relacionadas: HTML5 BoilerPlate (librer&iacute;a de [...]"
---
<p style="text-align: justify;">Hace tiempo ya estaba comentando con un colega sobre la enorme cantidad de medidas que pueden tomarse para mejorar la performance de una aplicaci&oacute;n web. Existen miles de factores involucrados, entre los cuales hay muchas configuraciones y tweaks que pueden hacerse al servidor, pero muchos otros tienen que ver con el c&oacute;digo en s&iacute; mismo. S&iacute; se&ntilde;ores, estamos hablando de HTML, CSS y JS.</p>
<p style="text-align: justify;">El problema en este punto es que un HTML m&iacute;nimo puede no ser el HTML que nuestro generador de contenidos genera. Puede que el CSS sea automatizado tambi&eacute;n, o que nuestro dise&ntilde;ador o desarrollador HTML no est&eacute; pensando en hacer las cosas de la forma "m&aacute;s m&iacute;nima posible", sino realmente trabajando en hacer que algo se vea bien y est&eacute; bien codificado. No est&aacute; entre sus prioridades escribir</p>
<p>[css light="true"]<br />
background: url("image.jpg") repeat top left scroll;<br />
[/css]</p>
<p style="text-align: justify;">en lugar de</p>
<p>[css light="true"]<br />
background: url(image.jpg);<br />
[/css]</p>
<p style="text-align: justify;">Ambos son equivalentes, pero la segunda es m&aacute;s corta y por tanto m&aacute;s eficiente. Pero nuestro desarrollador debe realmente preocuparse porque el desarrollo sea correcto, que la visualizaci&oacute;n sea consistente y que sea acorde entre navegadores.</p>
<p style="text-align: justify;">Ni hablar de JavaScript, en donde la cantidad de optimizaciones, minimizaciones y mejoras puede ser realmente importante. Alguno quiere trabajar sobre JavaScrpt minimizado? Sin duda: no.</p>
<p style="text-align: justify;">La alternativa a la que llegamos era la de tener dos versiones de la aplicaci&oacute;n. La de desarrollo con c&oacute;digo normal y la de producci&oacute;n. Una vez que desde la de desarrollo se hicieran pruebas y quisiera hacerse un release, solo ten&iacute;amos que correr una serie de herramientas que nos permitieran tener una versi&oacute;n minimizada y optimizada del c&oacute;digo, bajo el riesgo de que algo se rompiera en el proceso.</p>
<p style="text-align: justify;">Pero ahora Google acaba de publicar un m&oacute;dulo que han desarrollado para Apache 2.2, llamado <a href="http://googlewebmastercentral.blogspot.com/2010/11/make-your-websites-run-faster.html">mod_pagespeed</a>, el cual hace optimizaciones y cache en el momento de los pedidos, para optimizar los sitios web sin tener que modificar los archivos reales. Por supuesto, es altamente configurable, y podemos ver la gran cantidad de <a href="http://www.modpagespeed.com/">mejoras que puede realizar</a> en el poco tiempo que tiene.</p>
<p style="text-align: justify;">Google nos cuenta que ya est&aacute; trabajando con GoDaddy para que todos sus clientes puedan utilizarlo, y con Cotendo para que est&eacute; disponible en su CDN tambi&eacute;n. Si ustedes no tienen la suerte de estar entre ellos, pueden bajarlo por cuenta propia desde la p&aacute;gina del <a href="http://code.google.com/speed/page-speed/download.html">proyecto de PageSpeed</a>, e instalarlo en sus propios servidores.</p>
<p style="text-align: justify;"><em>Soy un zorrinito acelerado.</em></p>
