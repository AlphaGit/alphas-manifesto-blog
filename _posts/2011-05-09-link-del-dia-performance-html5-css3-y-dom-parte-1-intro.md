---
layout: post
status: publish
published: true
title: 'Link del d&iacute;a: Performance HTML5, CSS3 y DOM, Parte 1: Intro'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 2960
wordpress_url: http://blog.alphasmanifesto.com/?p=2960
date: '2011-05-09 13:16:35 +0000'
date_gmt: '2011-05-09 15:16:35 +0000'
categories:
- Link del d&iacute;a
- Technology
tags:
- JavaScript
- HTML
- Youtube
- Google Chrome
- CSS
- desarrollo web
- HTML5
- desarrollo m&oacute;vil
- CSS3
- herramientas
comments:
- id: 7957
  author: 'Link del d&iacute;a: Performance HTML5, CSS3 y DOM, Parte 2: Performance
    HTML5 | Alpha''s Manifesto'
  author_email: ''
  author_url: http://blog.alphasmanifesto.com/2011/05/16/link-del-dia-performance-html5-css3-y-dom-parte-2-performance-html5/
  date: '2011-05-16 12:42:36 +0000'
  date_gmt: '2011-05-16 14:42:36 +0000'
  content: "[...] implementaciones de HTML5, CSS3, y, por supuesto, JavaScript. Como
    ya lo hab&iacute;amos mencionado en la parte 1 de este art&iacute;culo, el tutorial
    de HTML5 Rocks llamado Improving the performance of your HTML5 App trata varios
    puntos [...]"
- id: 9120
  author: html5 developers
  author_email: PaszkiewiczWyckoff8229@googlemail.com
  author_url: http://www.html5webdeveloper.cominuitcss-development.html
  date: '2013-12-11 06:40:28 +0000'
  date_gmt: '2013-12-11 11:40:28 +0000'
  content: Quite excellent submit. I recently stumbled upon your site and also needed
    to express that We've genuinely liked checking your web site threads. Naturally
    We're following with your feed exactly what wanting you write once more soon!
---
<p style="text-align: justify;">Acabo de ver dos videos de Paul Irish, del grupo de Google Chrome. Uno de ellos era <a href="http://www.youtube.com/watch?v=nOEw9iiopwI">Google Chrome Developer Tools: 12 Tricks to Develop Quicker</a>. Aqu&iacute; b&aacute;sicamente nos da una explicaci&oacute;n de los Chrome Developer Tools con algunos trucos que no son tan sabidos. Interesante y &uacute;til.</p>
<p style="text-align: justify;">[youtube]nOEw9iiopwI[/youtube]</p>
<p style="text-align: justify;">Sin embargo, el video que m&aacute;s interesante me result&oacute; es uno de media hora llamado <a href="http://www.youtube.com/watch?v=q_O9_C2ZjoA">HTML5, CSS3 and DOM Performance</a>.</p>
<p style="text-align: justify;">[youtube]q_O9_C2ZjoA[/youtube]</p>
<p style="text-align: justify;">Este video es terriblemente informativo sobre varias tem&aacute;ticas. Quiero en el futuro poder dedicarle un poco m&aacute;s de tiempo a cada una, pero mientras tanto, dejenm&eacute; hacer un resumen de las cosas que se tratan en el video:</p>
<ul style="text-align: justify;">
<li><strong>Reflows</strong>: primero se habla de este concepto, relacionado a las operaciones de repintado que un navegador debe realizar. Nos cuenta el caso de Chrome y de Safari (WebKit) y de ciertas operaciones y trucos para evitar. Nos muestra c&oacute;mo efectivamente podemos monitorear y mejorar esa performance.<br />
Herramientas relacionadas: <a href="http://peter.sh/experiments/chromium-command-line-switches/">Comandos ocultos de Chrome</a>.</li>
<li><strong>Animaciones CSS con aceleraci&oacute;n por hardware</strong>: Mucho del trabajo de repintado puede hacerse de forma tal que el navegador termine deleg&aacute;ndolo al GPU de mando en la m&aacute;quina cliente. Esto trae experiencias muy distintas, y puede forzarse con pocos truquitos, que en este momento son b&aacute;sicamente hacks. Incluso podemos ver el efecto en ciertos dispositivos m&oacute;viles.<br />
Herramientas relacionadas: <a href="http://www.html5rocks.com/tutorials/speed/html5/">Improving the performance of your HTML5 App</a> (art&iacute;culo), <a href="http://isotope.metafizzy.co/demos/elements-complete.html">Elements Complete</a> (demostraci&oacute;n)</li>
<li><strong>Animaci&oacute;n y web workers</strong>: Mucho del trabajo que nuestro javascript hace no tiene por qu&eacute; estar en el thread principal de pintado de la p&aacute;gina, esto lleva a las p&aacute;ginas frizadas y funcionando lento. Para eso podemos delegar nuestra ejecuci&oacute;n a web workers, que tienen una buena performance y es amigable con la bater&iacute;a.<br />
Herramientas relacionadas: &nbsp;<a href="http://webglsamples.googlecode.com/hg/field/field.html">WebGL Field</a> (demo)</li>
<li><strong>Benchmarking</strong>: relacionado a todo lo anterior, necesitamos de una forma objetiva y poderosa de poder probar qu&eacute; elementos son mejores. El ejemplo que Paul menciona es: realmente es m&aacute;s performante usar el === en lugar del == en JavaScript? Ahora tenemos la forma de probarlo f&aacute;cilmente.<br />
Herramientas relacionadas: <a href="http://jsperf.com/">jsPerf</a> (herramienta de test cases para benchmarking), <a href="http://www.browserscope.org/">BrowserScope</a> (versi&oacute;n colectiva de pruebas en browsers), <a href="http://benchmarkjs.com/">Benchmark.js</a> (librer&iacute;a JavaScript para benchmarking y testing).</li>
<li><strong>Build scripts</strong>: la posibilidad de automatizar el generado de los sitios puede ahorrar muchos problemas en la performance. As&iacute; como alguna vez hablamos de <a href="https://blog.alphasmanifesto.com/2010/11/08/link-del-dia-optimizacion-web-vs-desarrollo-prolijo/">mod_pagespeed</a>, Paul menciona otras alternativas.<br />
Herramientas relacionadas: <a href="http://html5boilerplate.com/">HTML5 BoilerPlate</a> (librer&iacute;a de startup para generar aplicaciones bajo buenas pr&aacute;cticas).</li>
</ul>
<p style="text-align: justify;">Espero poder ahondar en cada uno de estos en el futuro. Est&eacute;n atentos!</p>
<p style="text-align: justify;"><em>Soy un zorrinito performante.</em></p>
