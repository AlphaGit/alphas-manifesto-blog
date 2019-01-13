---
layout: post
status: publish
published: true
title: 'Link del d&iacute;a: Performance HTML5, CSS3 y DOM, Parte 2: Performance HTML5'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 2988
wordpress_url: http://blog.alphasmanifesto.com/?p=2988
date: '2011-05-16 12:42:28 +0000'
date_gmt: '2011-05-16 14:42:28 +0000'
categories:
- Link del d&iacute;a
- Technology
tags:
- JavaScript
- performance
- desarrollo web
- HTML5
- animaci&oacute;n
- CSS3
- experiencia del usuario
- art&iacute;culo
comments: []
---
<p style="text-align: justify;">Hay varias formas de aproximarse a la performance de una aplicaci&oacute;n que est&aacute; construida bajo los nuevos est&aacute;ndares e implementaciones de HTML5, CSS3, y, por supuesto, JavaScript. Como ya lo hab&iacute;amos mencionado en la <a href="https://blog.alphasmanifesto.com/2011/05/09/link-del-dia-performance-html5-css3-y-dom-parte-1-intro/">parte 1 de este art&iacute;culo</a>, el tutorial de HTML5 Rocks llamado <a href="http://www.html5rocks.com/tutorials/speed/html5/">Improving the performance of your HTML5 App</a> trata varios puntos que son importantes para lograr una buena performance y una aplicaci&oacute;n s&oacute;lida.</p>
<p style="text-align: justify;">Repas&eacute;moslos r&aacute;pidamente:</p>
<ul style="text-align: justify;">
<li>Delegar animaciones al browser siempre que sea posible
<ul>
<li>Transformaciones y trancisiones con instrucciones CSS</li>
<li>Renderizaci&oacute;n "incentivada" a ser a trav&eacute;s del GPU con [code lang="css"]-webkit-transform: translateZ(0);[/code]</li>
<li>Separaci&oacute;n de threads de animaci&oacute;n con [code lang="javascript"]window.requestAnimationFrame[/code]</li>
</ul>
</li>
<li>Profiling de JavaScript
<ul>
<li>Utilizar el DOM lo menos posible</li>
<li>Nombrar funciones an&oacute;nimas para identificar d&oacute;nde est&aacute;n los problemas m&aacute;s f&aacute;cilmente</li>
<li>Refactorizar el c&oacute;digo</li>
<li>Crear funciones definidas y autollamadas si hacer m&eacute;todos m&aacute;s peque&ntilde;os no se puede (de esa forma "nombramos" parte del c&oacute;digo)</li>
</ul>
</li>
<li>Utilizaci&oacute;n del DOM
<ul>
<li>Lo menos posible (nuevamente)</li>
<li>Cachear elementos cuando tenga sentido</li>
<li>Hacer lecturas, luego modificaciones, luego escrituras para evitar reflows</li>
<li>No usar el DOM dentro de loops</li>
</ul>
</li>
<li>Inicializaci&oacute;n tard&iacute;a
<ul>
<li>Delegaci&oacute;n de eventos en lugar de asociaci&oacute;n de handlers</li>
</ul>
</li>
</ul>
<p style="text-align: justify;">Y eso es, a muy grandes rasgos, este art&iacute;culo. Realmente recomiendo que le den una le&iacute;da a fondo si ustedes trabajan del lado de la web. Realmente no ver&aacute;n una p&aacute;gina de la misma manera.</p>
<p style="text-align: justify;"><em>Soy un zorrinito performante.</em></p>
