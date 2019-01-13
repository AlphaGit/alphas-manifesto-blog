---
layout: post
status: publish
published: true
title: CommonLibrary.NET
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 4209
wordpress_url: http://blog.alphasmanifesto.com/?p=4209
date: '2012-07-23 10:31:15 +0000'
date_gmt: '2012-07-23 15:31:15 +0000'
categories:
- Link del d&iacute;a
tags:
- ".NET"
- desarrollo
- best practices
- librer&iacute;a
- principios
- DRY
comments: []
---
<p style="text-align: justify;">En cierto punto en el camino de evoluci&oacute;n de una compa&ntilde;&iacute;a o un desarrollador, se encuentra como hecho el estar siempre re-haciendo las mismas partes, o reutilizando partes comunes que alguna vez ya se usaron para un proyecto anterior. Esto es muy com&uacute;n, y ciertamente no es algo malo. De hecho, es deseable, y en el &aacute;mbito recibe el nombre de&nbsp;<em><a href="http://en.wikipedia.org/wiki/Don't_repeat_yourself">DRY principle</a>.</em></p>
<p style="text-align: justify;"><!--more--></p>
<p style="text-align: justify;">Est&aacute; claro que muchas caracter&iacute;sticas internas de los sistemas ser&aacute;n comunes a todos ellos. Como tales, podemos mencionar la autenticaci&oacute;n, la generaci&oacute;n de logs, el tratado de errores, el manejo de cadenas, la encriptaci&oacute;n de datos, el tratado de archivos en distintos formatos, importaci&oacute;n y exportaci&oacute;n de objetos, validaci&oacute;n de objetos, etc&eacute;tera. Todas estas funcionalidades son parte de cada sistema que se construye en mayor o menor medida, y aunque pueden variar de uno a otro, sus interiores son realmente similares.</p>
<p style="text-align: justify;"><a href="http://commonlibrarynet.codeplex.com/">CommonLibrary.NET</a> es un proyecto con una serie de clases encargadas de muchos de estos problemas. Es un proyecto relativamente activo, con lo cual esperamos ver m&aacute;s adiciones y mejoras en un futuro no muy lejano. Copiando de su p&aacute;gina principal de Codeplex, este es el conjunto de caracter&iacute;sticas para el que lo podemos aprovechar:</p>

![](/assets/commonParts.png)

<ul style="text-align: justify;">
<li>Manejo de cuentas de usuario</li>
<li>Patr&oacute;n Active Record</li>
<li>Templates de aplicaci&oacute;n (entornos, logging, manejo de errores, configuraci&oacute;n y c&oacute;digos de salida)</li>
<li>Parser de argumentos</li>
<li>API de Autenticaci&oacute;n</li>
<li>Automatizaci&oacute;n de tareas a trav&eacute;s de XML</li>
<li>Benchmarking</li>
<li>Bootstrapping</li>
<li>Caching</li>
<li>CAPTCHAs</li>
<li>Servicio de categor&iacute;as y sub-categor&iacute;as</li>
<li>Generaci&oacute;n de c&oacute;digo</li>
<li>Collections (Multi-valor, bi-direccionales, ordenados, DictionarySet, etc.)</li>
<li>Configuraci&oacute;n por jerarqu&iacute;as desde bases de datos o archivos</li>
<li>Criptograf&iacute;a</li>
<li>Escritura y lectura de archivos CSV</li>
<li>Bases de datos (acceso simple ADO.NET)</li>
<li>Diagnostics</li>
<li>Entidades para persistencia</li>
<li>Representaci&oacute;n de entornos de ejecuci&oacute;n</li>
<li>Errores</li>
<li>Manejo de excepciones</li>
<li>Extensiones, manejo de plugins</li>
<li>Macros de extensi&oacute;n</li>
<li>Feeds (RSS, Atom, etc.)</li>
<li>Calendario con feriados</li>
<li>Importaci&oacute;n / exportaci&oacute;n</li>
<li>Generaci&oacute;n de reportes</li>
<li>IoC</li>
<li>Localizaci&oacute;n, manejo de direcciones</li>
<li>Logging</li>
<li>Mapas</li>
<li>Named SQL Queries</li>
<li>Notificaciones por email, basadas en templates</li>
<li>Paginaci&oacute;n de datos</li>
<li>Query de objetos</li>
<li>Procesador de colas</li>
<li>Patr&oacute;n repository</li>
<li>Scheduling de tareas</li>
<li>Scripting</li>
<li>Marcado ToDo dentro del c&oacute;digo</li>
<li>Validaci&oacute;n de objetos</li>
<li>Helpers web</li>
<li>Helpers XML</li>
</ul>
<p style="text-align: justify;">La <a href="http://commonlibrarynet.codeplex.com/wikipage?title=Examples">p&aacute;gina de ejemplos</a> tiene una buena cantidad de demostraciones que nos permitir&aacute; hacernos una mejor idea de cada caracter&iacute;stica, pero no hay nada como probarlo en c&oacute;digo propio.</p>
<p style="text-align: justify;">Sabemos que para muchas de estas caracter&iacute;sticas ya hay otros frameworks, quiz&aacute; m&aacute;s grandes y seguramente tambi&eacute;n gratis y open source. En muchos casos, se ha elegido una reimplementaci&oacute;n de ellos en esta librer&iacute;a para evitar grandes dependencias si es que solo necesitamos una peque&ntilde;a funcionalidad. Asumiendo que la situaci&oacute;n es esa, es una decisi&oacute;n muy sabia y acertada.</p>
<p style="text-align: justify;"><em>Soy un zorrinito reutilizado.</em></p>
