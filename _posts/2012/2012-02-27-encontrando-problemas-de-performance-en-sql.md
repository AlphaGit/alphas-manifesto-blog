---
layout: post
title: Encontrando problemas de performance en SQL
date: '2012-02-27 09:16:58 +0000'
date_gmt: '2012-02-27 14:16:58 +0000'
categories:
- Link del día
tags:
- performance
- bases de datos
- SQL
- preguntas
- respuestas
- SQL Server
- troubleshooting
- Stack Exchange
sub_title: Cuando la respuesta no es obvia
---

Otro de los foros de Stack Exchange que suelo leer es [Database Administrators](http://dba.stackexchange.com/questions/13523/sql-what-is-slowing-down-inserts-if-not-cpu-or-io), en donde, como imaginarán, las preguntas y respuestas rondan sobre bases de datos y tecnologías afines. Cada tanto me encuentro con alguna joyita útil y este fue uno de esos casos.

La pregunta trataba sobre alguien que tenía problemas de performance cuando no se trataba de el acceso a disco ni del consumo de CPU. Muy apropiadamente, la pregunta se llama [SQL: What is slowing down INSERTs if not CPU or IO?](http://dba.stackexchange.com/questions/13523/sql-what-is-slowing-down-inserts-if-not-cpu-or-io), y por supuesto, siendo un caso particular puede que no nos sea realmente útil la respuesta. Lo que quiero destacar de esta pregunta es el método de investigación que usaron y las herramientas con las que analizaron la performance interna del motor de base de datos. Puede ser muy revelador para nosotros trabajar con estas herramientas cuando la respuesta no es obvia y los planes de ejecución no son suficientes para detectar problemas de performance.

Soy un zorrinito performante.
