---
layout: post
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
---

Gracias a [@Analton](https://twitter.com/Analton) llegué a un artículo llamado [Never user $_GET again](http://www.phparch.com/2010/07/08/never-use-_get-again/), que habla de cómo ya no deberíamos utilizar más las archi-conocidas variables globales de GET y POST al programar en PHP. No sólo eso, sino que explicando los conceptos de validación y sanitización nos deja como paso siguiente ir al manual de PHP, y explorar una sección que quizá muchos ya no tengamos del todo frescas.

Esta sección es la de [Filtering](http://www.php.net/manual/en/book.filter.php), en donde nos vemos introducidos a distintas funciones que ya efectúan validaciones de determinados tipos de entrada en particular, y nos permiten filtrar el resto de lo ingresado para obtener valores correctos, o al menos, lo suficientemente corregidos como para que no dañen nuestro código.

_" ¿Desde cuando está eso ahí?"_, algunos preguntarán. Desde PHP 5.2, de forma que ya tiene un ratito ahí, no sé como a muchos se nos pasó de largo. Aprovechen a reaprenderlo y será más fácil programar la entrada de datos!

_Soy un zorrinito preprocesado._
