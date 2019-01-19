---
layout: post
status: publish
published: true
title: 'Link del día: Arquitectura CSS'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 3297
wordpress_url: http://blog.alphasmanifesto.com/?p=3297
date: '2011-09-30 08:18:05 +0000'
date_gmt: '2011-09-30 13:18:05 +0000'
categories:
- Link del día
tags:
- CSS
- arquitectura
- design
- modular
- escalabilidad
comments:
- id: 8840
  author: CSS Dinámico | Alpha&#039;s Manifesto
  author_email: ''
  author_url: http://blog.alphasmanifesto.com/2012/04/03/css-dinamico/
  date: '2012-04-03 08:54:31 +0000'
  date_gmt: '2012-04-03 13:54:31 +0000'
  content: "[...] Por un lado, permitirán la inserción fácil
    de quienes no dominen CSS completamente. Está claro que significa que se
    pueden resolver cosas de una forma no tan prolija, pero los lenguajes tratan de
    facilitarnos las tareas a nosotros, no imponernos reglas que debemos seguir. Cuando
    existe esa diferenciación es cuando comienzan a surgir buenas prácticas.
    [...]"
---

La idea me parece fantástica, pero la forma en la que se desarrolló, no tanto. La idea era, <a href="http://smacss.com/book/">Scalable and Modular Architecture for CSS</a>, una organización del código CSS de una aplicación para que fuera dividido en forma modular. De esta forma, habría determinados estilos base, y otros estilos pertenecientes a módulos que especificarían cosas extra, o modificarían detalles (aunque no deberían) de los estilos base.

Ahora, los estilos base se subdividen, a su vez, en estilos que tienen que ver con el layout, y los que no se llaman "base". Por último, hay una cuarta clasificación que tiene que ver con estilos de estados, es decir, cuando algo está activado, cuando se encuentra deshabilitado, etc.

Si bien la idea está muy interesante, veo algunos puntos grises en cuanto se debe determinar qué estilo pertenece a qué. Hay reglas CSS particulares que van a ser seguramente pertenecientes a una de las anteriores categorías mientras otras no, pero podemos estar hablando de los mismos elementos en pantalla. Para poder lograrlo de forma precisa, debería tenerse demasiado cuidado y una gran cantidad de reglas que aplicarían a un determinado elemento. En ese sentido no se me hace demasiado natural, aparte de la necesidad de marcar de múltiples formas un mismo elemento (un id, varias clases).

Sin embargo, me parece un muy buen comienzo, y quisiera escuchar ideas, porque creo que esta arquitectura es una base muy poderosa para hacer de CSS complejo algo muy ordenado.

_Soy un zorrinito estilizado._
