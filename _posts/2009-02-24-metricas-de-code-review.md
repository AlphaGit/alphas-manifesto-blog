---
layout: post
status: publish
published: true
title: M&eacute;tricas de code review
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 1018
wordpress_url: http://blog.alphasmanifesto.com.ar/?p=1018
date: '2009-02-24 22:03:53 +0000'
date_gmt: '2009-02-25 00:03:53 +0000'
categories:
- Projects
- Technology
tags: []
comments: []
---
<div>
<p style="text-align: justify;">En estos d&iacute;as me encuentro desarrollando t&eacute;cnicas para la automatizaci&oacute;n y estadarizaci&oacute;n de resultados de code reviews de los distintos proyectos que est&eacute;n siendo implementados. La idea es poder tener una idea cuasi-num&eacute;rica de qu&eacute; tan bien o qu&eacute; tan mal est&aacute; desarrollada una aplicaci&oacute;n.</p>
<p style="text-align: justify;">Si bien no est&aacute; decidido y apenas he comenzado con esa idea, estoy seguro que hay muchas cuestiones que sin duda ser&aacute;n ponderadas ah&iacute;. Entre ellas:</p>
<ul>
<li><strong>Estandarizaci&oacute;n:</strong>&nbsp;qu&eacute; tan bien se respeta el est&aacute;ndar propuesto para trabajar (nombres, capitalizaci&oacute;n, formas en que se conocen distintas clases)</li>
<li><strong>Arquitectura:</strong>&nbsp;qu&eacute; tanto se respeta la arquitectura, sea cual sea la utilizada (decidido al comienzo del proyecto)</li>
<li><strong>Code-coverage:</strong>&nbsp;cu&aacute;nto c&oacute;digo se encuentra cubierto por pruebas de unidad (code-coverage percentage)</li>
<li><strong>Estabilidad:</strong>&nbsp;cu&aacute;nto c&oacute;digo se encuentra capturando errores que puedan generar y la forma en que los tratan</li>
<li><strong>Flexibilidad:</strong>&nbsp;cu&aacute;nto funcionamiento de la aplicaci&oacute;n se encuentra parametrizado y cu&aacute;nto se encuentra cableado en el c&oacute;digo o codificado seg&uacute;n la l&oacute;gica del negocio</li>
<li><strong>Recursos:</strong>&nbsp;cu&aacute;ntos recursos utiliza innecesariamente o aprovecha eficientemente el sistema</li>
<li><strong>Performance:</strong>&nbsp;de qu&eacute; forma se realizan ciertas acciones que podr&iacute;an mejorarse desde el punto de vista de la velocidad y la respuesta al usuario</li>
</ul>
<p style="text-align: justify;">Si bien no tengo mucha idea a&uacute;n de la forma de evaluarlo, se me estaba ocurriendo basarme en sistemas de scoring estandarizados, como pueden ser el&nbsp;<a href="http://ccwapss.blogspot.com/">CCWAPSS</a>&nbsp;para seguridad de aplicaciones web, en donde cada criterio a ser tenido en cuenta debe cumplir una serie de requisitos y es evaluado seg&uacute;n una serie de preguntas simples que son f&aacute;ciles de responder para el evaluador.</p>
<p style="text-align: justify;">Incluso fantaseaba con llegar a un punto tal en donde esto pudiera automatizarse. S&eacute; que muchas de las cuestiones ser&aacute;n altamente imposible de programar (o al menos, altamente dif&iacute;ciles de llevar a c&oacute;digo), pero cuestiones como la forma en que se respeta la arquitectura, la estandarizaci&oacute;n y el code-coverage son f&aacute;cilmente codificables para cualquier sistema que con alg&uacute;n u otro medio pueda reconocer el c&oacute;digo y tracear dependencias y relaciones.</p>
<p style="text-align: justify;">En fin, es un proyecto que apenas est&aacute; empezando, y no dudo que pueda tener un futuro muy &uacute;til.</p>
<p style="text-align: justify;"><em>Soy un zorrinito review.</em></p>
</div>
