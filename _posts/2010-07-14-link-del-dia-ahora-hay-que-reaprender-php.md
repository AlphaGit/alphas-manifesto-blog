---
layout: post
status: publish
published: true
title: 'Link del día: Ahora hay que reaprender PHP'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 2218
wordpress_url: http://blog.alphasmanifesto.com/?p=2218
date: '2010-07-14 10:03:50 +0000'
date_gmt: '2010-07-14 12:03:50 +0000'
categories:
- Link del día
tags:
- datos
- desarrollo web
- seguridad
- PHP
- desarrollo
- programming
comments:
- id: 6726
  author: Lisandro
  author_email: none@a.com
  author_url: http://none.com
  date: '2010-07-14 13:10:45 +0000'
  date_gmt: '2010-07-14 15:10:45 +0000'
  content: Mmmm no se si me gusta...
- id: 6727
  author: Sein
  author_email: seinoxygen@hotmail.com
  author_url: ''
  date: '2010-07-14 13:35:29 +0000'
  date_gmt: '2010-07-14 15:35:29 +0000'
  content: Interesante artilugio la verdad, creo que es muyt pasado por alto ya que
    hoy en dia nadie se ponne a ver la documentacion de $_post o $_get donde aparece
    informacion acerca de esto por ser algo basico...
- id: 6728
  author: Alpha
  author_email: alpha@furries.com.ar
  author_url: http://www.alphasmanifesto.com.ar/
  date: '2010-07-16 09:16:07 +0000'
  date_gmt: '2010-07-16 11:16:07 +0000'
  content: "@Lisandro: Por? Sospechás que puede no estar bien implementado
    o algo así?\r\n\r\n@Sein: Sí, lo mismo pienso yo. Lo bueno de conocer
    estas cosas es que se pueden usar soluciones comunes y no andar reinventando la
    rueda."
---

Gracias a [@Analton](https://twitter.com/Analton) llegué a un artículo llamado [Never user $_GET again](http://www.phparch.com/2010/07/08/never-use-_get-again/), que habla de cómo ya no deberíamos utilizar más las archi-conocidas variables globales de GET y POST al programar en PHP. No sólo eso, sino que explicando los conceptos de validación y sanitización nos deja como paso siguiente ir al manual de PHP, y explorar una sección que quizá muchos ya no tengamos del todo frescas.

Esta sección es la de [Filtering](http://www.php.net/manual/en/book.filter.php), en donde nos vemos introducidos a distintas funciones que ya efectúan validaciones de determinados tipos de entrada en particular, y nos permiten filtrar el resto de lo ingresado para obtener valores correctos, o al menos, lo suficientemente corregidos como para que no dañen nuestro código.

_" ¿Desde cuando está eso ahí?"_, algunos preguntarán. Desde PHP 5.2, de forma que ya tiene un ratito ahí, no sé como a muchos se nos pasó de largo. Aprovechen a reaprenderlo y será más fácil programar la entrada de datos!

_Soy un zorrinito preprocesado._
