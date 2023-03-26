---
title: 'Link del día: Performance HTML5, CSS3 y DOM, Parte 1: Intro'
date: 2011-05-09 13:16:35 +0000
date_gmt: 2011-05-09 15:16:35 +0000
categories:
  - Link del día
  - Technology
tags:
  - JavaScript
  - HTML
  - Youtube
  - Google Chrome
  - CSS
  - desarrollo web
  - HTML5
  - desarrollo móvil
  - CSS3
  - herramientas
description: >-
  Paul Irish videos explore HTML5, CSS3, DOM performance optimization, reflows,
  hardware acceleration, web workers, benchmarking, build scripts.
---


Acabo de ver dos videos de Paul Irish, del grupo de Google Chrome. Uno de ellos era [Google Chrome Developer Tools: 12 Tricks to Develop Quicker](http://www.youtube.com/watch?v=nOEw9iiopwI). Aquí básicamente nos da una explicación de los Chrome Developer Tools con algunos trucos que no son tan sabidos. Interesante y útil.

<iframe width="560" height="315" src="https://www.youtube.com/embed/nOEw9iiopwI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"> </iframe>

Sin embargo, el video que más interesante me resultó es uno de media hora llamado [HTML5, CSS3 and DOM Performance](http://www.youtube.com/watch?v=q_O9_C2ZjoA).

<iframe width="560" height="315" src="https://www.youtube.com/embed/q_O9_C2ZjoA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"> </iframe>

Este video es terriblemente informativo sobre varias temáticas. Quiero en el futuro poder dedicarle un poco más de tiempo a cada una, pero mientras tanto, dejenmé hacer un resumen de las cosas que se tratan en el video:

- **Reflows**: primero se habla de este concepto, relacionado a las operaciones de repintado que un navegador debe realizar. Nos cuenta el caso de Chrome y de Safari (WebKit) y de ciertas operaciones y trucos para evitar. Nos muestra cómo efectivamente podemos monitorear y mejorar esa performance.<br />
Herramientas relacionadas: [Comandos ocultos de Chrome](http://peter.sh/experiments/chromium-command-line-switches/).
- **Animaciones CSS con aceleración por hardware**: Mucho del trabajo de repintado puede hacerse de forma tal que el navegador termine delegándolo al GPU de mando en la máquina cliente. Esto trae experiencias muy distintas, y puede forzarse con pocos truquitos, que en este momento son básicamente hacks. Incluso podemos ver el efecto en ciertos dispositivos móviles.<br />
Herramientas relacionadas: [Improving the performance of your HTML5 App](http://www.html5rocks.com/tutorials/speed/html5/) (artículo), [Elements Complete](http://isotope.metafizzy.co/demos/elements-complete.html) (demostración)
- **Animación y web workers**: Mucho del trabajo que nuestro javascript hace no tiene por qué estar en el thread principal de pintado de la página, esto lleva a las páginas frizadas y funcionando lento. Para eso podemos delegar nuestra ejecución a web workers, que tienen una buena performance y es amigable con la batería.<br />
Herramientas relacionadas:  [WebGL Field](http://webglsamples.googlecode.com/hg/field/field.html) (demo)
- **Benchmarking**: relacionado a todo lo anterior, necesitamos de una forma objetiva y poderosa de poder probar qué elementos son mejores. El ejemplo que Paul menciona es: realmente es más performante usar el === en lugar del == en JavaScript? Ahora tenemos la forma de probarlo fácilmente.<br />
Herramientas relacionadas: [jsPerf](http://jsperf.com/) (herramienta de test cases para benchmarking), [BrowserScope](http://www.browserscope.org/) (versión colectiva de pruebas en browsers), [Benchmark.js](http://benchmarkjs.com/) (librería JavaScript para benchmarking y testing).
- **Build scripts**: la posibilidad de automatizar el generado de los sitios puede ahorrar muchos problemas en la performance. Así como alguna vez hablamos de [mod_pagespeed]({{ site.baseUrl }}{% link _posts/2010/2010-11-08-link-del-dia-optimizacion-web-vs-desarrollo-prolijo.md %}), Paul menciona otras alternativas.<br />
Herramientas relacionadas: [HTML5 BoilerPlate](http://html5boilerplate.com/) (librería de startup para generar aplicaciones bajo buenas prácticas).

Espero poder ahondar en cada uno de estos en el futuro. Estén atentos!

_Soy un zorrinito performante._
