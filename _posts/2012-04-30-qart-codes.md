---
layout: post
title: QArt Codes
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 3849
wordpress_url: http://blog.alphasmanifesto.com/?p=3849
date: '2012-04-30 09:27:56 +0000'
date_gmt: '2012-04-30 14:27:56 +0000'
categories:
- Link del día
tags:
- Facebook
- Imágenes
- marketing
- artículo
- estándar
- QR Code
- formato
- corrección de errores
---
Imágenes en QR Codes


Russ Cox publicó hace no mucho un artículo sobre lo que él denomina [QArt Codes](http://research.swtch.com/qart), que son QR Codes con una imagen en ellos.

él comienza contando sobre una anécdota de varias empresas que para marketing generaron QR codes que tenían logos o imágenes en ellos. Sin embargo, estos QR codes eran incorrectos y sólo funcionaban porque hacían uso de la capacidad de corrección de errores. él se propuso entonces hacer un sistema que pudiera incluir una imagen en un QR code con un formato totalmente correcto. En dicho artículo, nos explica cómo es el funcionamiento y formato de los QR codes y cómo esto se puede utilizar para la inclusión de una imagen.

El sistema resultado de dicha investigación se llama [QR](http://research.swtch.com/qr/draw) y su código está disponible en [Google Code](http://code.google.com/p/rsc/source/browse/qr).

Cabe destacar que el análisis no es extensivo de todo lo que un QR Code debe incluir. Por mencionar algo extra, en [un post de Google Plus](https://plus.google.com/116810148281701144465/posts/BCJf9CHEqBP) él nos cuenta que debe incluir ciertos píxeles de margen para que todos los lectores puedan identificarlo (cosa que [Facebook no tuvo en cuenta](http://www.geekosystem.com/facebook-roof-qr-code/) a la hora de pintar un QR code en su techo, pero [Phillips &amp; Company sí](http://www.brandchannel.com/home/post/QR-Marketing-Google-Maps.aspx)).

_Soy un zorrinito cuadrado._
