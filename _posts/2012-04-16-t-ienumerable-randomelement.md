---
layout: post
title: T IEnumerable.RandomElement()
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 3781
wordpress_url: http://blog.alphasmanifesto.com/?p=3781
date: '2012-04-16 09:56:01 +0000'
date_gmt: '2012-04-16 14:56:01 +0000'
categories:
- Technology
tags:
- datos
- testing
- C#
- snippet
- unit testing
- objeto
sub_title: Seleccionar un elemento cualquiera de un conjunto
---

Otro de mis pequeños snippets, este es útil para unit testing.

Cuando tienen un repositorio de datos que en realidad es mockup, y algún objeto tiene que estar pre-populado, podrían querer que los tests sean independientes de los datos. Y con esto me refiero a ser independiente de los valores que esos objetos tienen. Para esos casos, utilizar un objeto al azar de un conjunto de objetos sería una buena aproximación. No es tan determinista, pero eso es algo deseable, e incluso más cerca a probar la aplicación real.

Para obtener un objeto al azar, este pequeño snippet ayuda:

<script src="https://gist.github.com/2399155.js?file=RandomElement.cs"></script>
