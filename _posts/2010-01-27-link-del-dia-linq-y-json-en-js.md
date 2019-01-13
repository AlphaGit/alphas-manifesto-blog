---
layout: post
status: publish
published: true
title: 'Link del d&iacute;a: LINQ y JSON en JS'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 1807
wordpress_url: http://blog.alphasmanifesto.com.ar/?p=1807
date: '2010-01-27 17:31:20 +0000'
date_gmt: '2010-01-27 19:31:20 +0000'
categories:
- Link del d&iacute;a
tags:
- internet
- proyecto
- JavaScript
- C#
- desarrollo web
- Microsoft
- LINQ
- JSON
comments: []
---
<p style="text-align: justify;">Aquellos que trabajamos en C# y hemos jugueteado un poco con el lenguaje de LINQ sabemos lo interesante que es poder f&aacute;cilmente trabajar con datos. Hacer una b&uacute;squeda por alg&uacute;n campo de un array antes pod&iacute;a ser algo tan trabajoso como recorrer uno por uno, poner en una lista nueva los que cumpl&iacute;an con este criterio, luego utilizar la nueva lista y volver a filtrar si es que lo necesitamos. Ni hablar de trabajar con dos o m&aacute;s listas al mismo tiempo. Sin embargo, LINQ nos permiti&oacute; realizar trabajos como ese en c&oacute;digos de una l&iacute;nea como lista.Where(condicion).Select(campo).</p>
<p style="text-align: justify;">LINQ se jacta de ser transparente y poder ser aplicado a cualquier fuente de datos, y ac&aacute; hubo gente que quizo llevar eso m&aacute;s all&aacute;, para hacerlo trabajable de la misma forma en JavaScript, para la programaci&oacute;n de cualquier aplicaci&oacute;n web, y el manejo de datos listas de JSON. A esto llamaron <a href="http://www.hugoware.net/Projects/jLinq">jLinq</a>, un trabajo de Hugo Bonacci, que en <a href="http://www.hugoware.net/">su web</a> publica varios de sus proyectos e ideas.</p>
<p style="text-align: justify;">La verdad es que no s&eacute; qu&eacute; performance tendr&aacute;, pero si queremos simplificar un poco el procesamiento de datos de nuesto JavaScript (especialmente si mostramos cosas como tablas, listas o mucha informaci&oacute;n que se pueda ordenar, filtrar, etc.), esta parece ser una buena aproximaci&oacute;n.</p>
<p style="text-align: justify;"><em>Soy un zorrinito mezcla-lenguajes.</em></p>
