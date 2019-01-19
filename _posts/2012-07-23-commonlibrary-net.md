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
- Link del día
tags:
- ".NET"
- desarrollo
- best practices
- librería
- principios
- DRY
comments: []
---
Don't repeat yourself


En cierto punto en el camino de evolución de una compañía o un desarrollador, se encuentra como hecho el estar siempre re-haciendo las mismas partes, o reutilizando partes comunes que alguna vez ya se usaron para un proyecto anterior. Esto es muy común, y ciertamente no es algo malo. De hecho, es deseable, y en el ámbito recibe el nombre de _<a href="http://en.wikipedia.org/wiki/Don't_repeat_yourself">DRY principle</a>._

<!--more-->

Está claro que muchas características internas de los sistemas serán comunes a todos ellos. Como tales, podemos mencionar la autenticación, la generación de logs, el tratado de errores, el manejo de cadenas, la encriptación de datos, el tratado de archivos en distintos formatos, importación y exportación de objetos, validación de objetos, etcétera. Todas estas funcionalidades son parte de cada sistema que se construye en mayor o menor medida, y aunque pueden variar de uno a otro, sus interiores son realmente similares.

<a href="http://commonlibrarynet.codeplex.com/">CommonLibrary.NET</a> es un proyecto con una serie de clases encargadas de muchos de estos problemas. Es un proyecto relativamente activo, con lo cual esperamos ver más adiciones y mejoras en un futuro no muy lejano. Copiando de su página principal de Codeplex, este es el conjunto de características para el que lo podemos aprovechar:

![]({{ site.baseurl }}/assets/commonParts.png)

- Manejo de cuentas de usuario
- Patrón Active Record
- Templates de aplicación (entornos, logging, manejo de errores, configuración y códigos de salida)
- Parser de argumentos
- API de Autenticación
- Automatización de tareas a través de XML
- Benchmarking
- Bootstrapping
- Caching
- CAPTCHAs
- Servicio de categorías y sub-categorías
- Generación de código
- Collections (Multi-valor, bi-direccionales, ordenados, DictionarySet, etc.)
- Configuración por jerarquías desde bases de datos o archivos
- Criptografía
- Escritura y lectura de archivos CSV
- Bases de datos (acceso simple ADO.NET)
- Diagnostics
- Entidades para persistencia
- Representación de entornos de ejecución
- Errores
- Manejo de excepciones
- Extensiones, manejo de plugins
- Macros de extensión
- Feeds (RSS, Atom, etc.)
- Calendario con feriados
- Importación / exportación
- Generación de reportes
- IoC
- Localización, manejo de direcciones
- Logging
- Mapas
- Named SQL Queries
- Notificaciones por email, basadas en templates
- Paginación de datos
- Query de objetos
- Procesador de colas
- Patrón repository
- Scheduling de tareas
- Scripting
- Marcado ToDo dentro del código
- Validación de objetos
- Helpers web
- Helpers XML

La <a href="http://commonlibrarynet.codeplex.com/wikipage?title=Examples">página de ejemplos</a> tiene una buena cantidad de demostraciones que nos permitirá hacernos una mejor idea de cada característica, pero no hay nada como probarlo en código propio.

Sabemos que para muchas de estas características ya hay otros frameworks, quizá más grandes y seguramente también gratis y open source. En muchos casos, se ha elegido una reimplementación de ellos en esta librería para evitar grandes dependencias si es que solo necesitamos una pequeña funcionalidad. Asumiendo que la situación es esa, es una decisión muy sabia y acertada.

_Soy un zorrinito reutilizado._
