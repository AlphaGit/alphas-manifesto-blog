---
layout: post
status: publish
published: true
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
comments: []
---
<p style="text-align: justify;">Otro de mis peque&ntilde;os snippets, este es &uacute;til para unit testing.</p>
<p style="text-align: justify;">Cuando tienen un repositorio de datos que en realidad es mockup, y alg&uacute;n objeto tiene que estar pre-populado, podr&iacute;an querer que los tests sean independientes de los datos. Y con esto me refiero a ser independiente de los valores que esos objetos tienen. Para esos casos, utilizar un objeto al azar de un conjunto de objetos ser&iacute;a una buena aproximaci&oacute;n. No es tan determinista, pero eso es algo deseable, e incluso m&aacute;s cerca a probar la aplicaci&oacute;n real.</p>
<p style="text-align: justify;">Para obtener un objeto al azar, este peque&ntilde;o snippet ayuda:</p>
<p><script src="https://gist.github.com/2399155.js?file=RandomElement.cs"></script></p>
