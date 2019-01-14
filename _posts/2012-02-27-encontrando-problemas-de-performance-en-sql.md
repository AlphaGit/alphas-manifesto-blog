---
layout: post
status: publish
published: true
title: Encontrando problemas de performance en SQL
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 3658
wordpress_url: http://blog.alphasmanifesto.com/?p=3658
date: '2012-02-27 09:16:58 +0000'
date_gmt: '2012-02-27 14:16:58 +0000'
categories:
- Link del d&iacute;a
tags:
- performance
- bases de datos
- SQL
- preguntas
- respuestas
- SQL Server
- troubleshooting
- Stack Exchange
comments: []
---
Cuando la respuesta no es obvia

<p style="text-align: justify;">Otro de los foros de Stack Exchange que suelo leer es <a href="http://dba.stackexchange.com/questions/13523/sql-what-is-slowing-down-inserts-if-not-cpu-or-io">Database Administrators</a>, en donde, como imaginar&aacute;n, las preguntas y respuestas rondan sobre bases de datos y tecnolog&iacute;as afines. Cada tanto me encuentro con alguna joyita &uacute;til y este fue uno de esos casos.</p>
<p style="text-align: justify;">La pregunta trataba sobre alguien que ten&iacute;a problemas de performance cuando no se trataba de el acceso a disco ni del consumo de CPU. Muy apropiadamente, la pregunta se llama <a href="http://dba.stackexchange.com/questions/13523/sql-what-is-slowing-down-inserts-if-not-cpu-or-io">SQL: What is slowing down INSERTs if not CPU or IO?</a>, y por supuesto, siendo un caso particular puede que no nos sea realmente &uacute;til la respuesta. Lo que quiero destacar de esta pregunta es el m&eacute;todo de investigaci&oacute;n que usaron y las herramientas con las que analizaron la performance interna del motor de base de datos. Puede ser muy revelador para nosotros trabajar con estas herramientas cuando la respuesta no es obvia y los planes de ejecuci&oacute;n no son suficientes para detectar problemas de performance.</p>
<p style="text-align: justify;">Soy un zorrinito performante.</p>
