---
layout: post
status: publish
published: true
title: 'Link del día: Minify'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 3055
wordpress_url: http://blog.alphasmanifesto.com/?p=3055
date: '2011-06-20 11:36:47 +0000'
date_gmt: '2011-06-20 13:36:47 +0000'
categories:
- Link del día
tags:
- JavaScript
- performance
- CSS
- desarrollo web
- PHP
- librería
comments:
- id: 8690
  author: 'Link del día: Combres, optimización ASP.NET | Alpha&#039;s
    Manifesto'
  author_email: ''
  author_url: http://blog.alphasmanifesto.com/2011/09/19/link-del-dia-combres-optimizacion-asp-net/
  date: '2011-09-19 10:49:54 +0000'
  date_gmt: '2011-09-19 15:49:54 +0000'
  content: "[...] llamado Combres 2.0, una librería para optimización
    de sitios ASP.NET. Recuerdan el caso de Minify para PHP o mod_pagespeed para Apache,
    este es el turno de [...]"
---

Tratando de retomar la periodicidad de los links del día, hoy quiero hablar de Minify. <a href="http://code.google.com/p/minify/">Minify</a> es una librería PHP de código abierto autocontenida que podemos utilizar para minimizar, unificar, cachear y definir nombres propios para recursos que queremos utilizar y mejorar la performance de nuestro sitio.

La librería no sólo soporta el trabajo con CSS, JS y HTML, minimizándolo completamente, sino que además puede ser utilizado para minimizar recursos bajo un solo nombre, y mejor aún, también es extensible para que podamos servir cualquier tipo de contenido de cualquier otra fuente. De hecho, lo probé cacheando y sirviendo recursos desde un sitio propio cuando los recursos en realidad son leídos de un lugar ajeno. Las ventajas de eso son el poder servir todo el JavaScript/CSS junto incluso aunque no nos pertenezcan, y ahorramos pedidos, y evitamos que el cliente deba acceder a múltiples dominios.

Y lo mejor, ni siquiera tenemos que andar haciendo referencia a los nombres de los archivos (aunque es la forma más fácil), ya que podemos definir grupos con nombres y utilizarlos. Eso nos brinda la ventaja de poder jugar mucho con eso y con el dinamismo de nuestra aplicación.

Pero en fin, lo interesante es la forma en la que minimiza, y lo simple que es de usar. ¡Dénle un intento!

_Soy un zorrinito minimizado._
