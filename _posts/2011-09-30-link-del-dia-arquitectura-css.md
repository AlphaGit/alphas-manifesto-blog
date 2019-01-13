---
layout: post
status: publish
published: true
title: 'Link del d&iacute;a: Arquitectura CSS'
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
- Link del d&iacute;a
tags:
- CSS
- arquitectura
- design
- modular
- escalabilidad
comments:
- id: 8840
  author: CSS Din&aacute;mico | Alpha&#039;s Manifesto
  author_email: ''
  author_url: http://blog.alphasmanifesto.com/2012/04/03/css-dinamico/
  date: '2012-04-03 08:54:31 +0000'
  date_gmt: '2012-04-03 13:54:31 +0000'
  content: "[...] Por un lado, permitir&aacute;n la inserci&oacute;n f&aacute;cil
    de quienes no dominen CSS completamente. Est&aacute; claro que significa que se
    pueden resolver cosas de una forma no tan prolija, pero los lenguajes tratan de
    facilitarnos las tareas a nosotros, no imponernos reglas que debemos seguir. Cuando
    existe esa diferenciaci&oacute;n es cuando comienzan a surgir buenas pr&aacute;cticas.
    [...]"
---
<p style="text-align: justify;">La idea me parece fant&aacute;stica, pero la forma en la que se desarroll&oacute;, no tanto. La idea era, <a href="http://smacss.com/book/">Scalable and Modular Architecture for CSS</a>, una organizaci&oacute;n del c&oacute;digo CSS de una aplicaci&oacute;n para que fuera dividido en forma modular. De esta forma, habr&iacute;a determinados estilos base, y otros estilos pertenecientes a m&oacute;dulos que especificar&iacute;an cosas extra, o modificar&iacute;an detalles (aunque no deber&iacute;an) de los estilos base.</p>
<p style="text-align: justify;">Ahora, los estilos base se subdividen, a su vez, en estilos que tienen que ver con el layout, y los que no se llaman "base". Por &uacute;ltimo, hay una cuarta clasificaci&oacute;n que tiene que ver con estilos de estados, es decir, cuando algo est&aacute; activado, cuando se encuentra deshabilitado, etc.</p>
<p style="text-align: justify;">Si bien la idea est&aacute; muy interesante, veo algunos puntos grises en cuanto se debe determinar qu&eacute; estilo pertenece a qu&eacute;. Hay reglas CSS particulares que van a ser seguramente pertenecientes a una de las anteriores categor&iacute;as mientras otras no, pero podemos estar hablando de los mismos elementos en pantalla. Para poder lograrlo de forma precisa, deber&iacute;a tenerse demasiado cuidado y una gran cantidad de reglas que aplicar&iacute;an a un determinado elemento. En ese sentido no se me hace demasiado natural, aparte de la necesidad de marcar de m&uacute;ltiples formas un mismo elemento (un id, varias clases).</p>
<p style="text-align: justify;">Sin embargo, me parece un muy buen comienzo, y quisiera escuchar ideas, porque creo que esta arquitectura es una base muy poderosa para hacer de CSS complejo algo muy ordenado.</p>
<p style="text-align: justify;"><em>Soy un zorrinito estilizado.</em></p>
