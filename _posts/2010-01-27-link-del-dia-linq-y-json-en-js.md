---
layout: post
status: publish
published: true
title: 'Link del día: LINQ y JSON en JS'
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
- Link del día
tags:
- internet
- proyecto
- JavaScript
- C#
- desarrollo web
- Microsoft
- LINQ
- JSON
---

Aquellos que trabajamos en C# y hemos jugueteado un poco con el lenguaje de LINQ sabemos lo interesante que es poder fácilmente trabajar con datos. Hacer una búsqueda por algún campo de un array antes podía ser algo tan trabajoso como recorrer uno por uno, poner en una lista nueva los que cumplían con este criterio, luego utilizar la nueva lista y volver a filtrar si es que lo necesitamos. Ni hablar de trabajar con dos o más listas al mismo tiempo. Sin embargo, LINQ nos permitió realizar trabajos como ese en códigos de una línea como lista.Where(condicion).Select(campo).

LINQ se jacta de ser transparente y poder ser aplicado a cualquier fuente de datos, y acá hubo gente que quizo llevar eso más allá, para hacerlo trabajable de la misma forma en JavaScript, para la programación de cualquier aplicación web, y el manejo de datos listas de JSON. A esto llamaron [jLinq](http://www.hugoware.net/Projects/jLinq), un trabajo de Hugo Bonacci, que en [su web](http://www.hugoware.net/) publica varios de sus proyectos e ideas.

La verdad es que no sé qué performance tendrá, pero si queremos simplificar un poco el procesamiento de datos de nuesto JavaScript (especialmente si mostramos cosas como tablas, listas o mucha información que se pueda ordenar, filtrar, etc.), esta parece ser una buena aproximación.

_Soy un zorrinito mezcla-lenguajes._
