---

title: 'Link del día: Performance HTML5, CSS3 y DOM, Parte 2: Performance HTML5'
date: '2011-05-16 12:42:28 +0000'
date_gmt: '2011-05-16 14:42:28 +0000'
categories:
- Link del día
- Technology
tags:
- JavaScript
- performance
- desarrollo web
- HTML5
- animación
- CSS3
- experiencia del usuario
- artículo
---

Hay varias formas de aproximarse a la performance de una aplicación que está construida bajo los nuevos estándares e implementaciones de HTML5, CSS3, y, por supuesto, JavaScript. Como ya lo habíamos mencionado en la [parte 1 de este artículo]({{ site.baseUrl }}{% link _posts/2011/2011-05-09-link-del-dia-performance-html5-css3-y-dom-parte-1-intro.md %}), el tutorial de HTML5 Rocks llamado [Improving the performance of your HTML5 App](http://www.html5rocks.com/tutorials/speed/html5/) trata varios puntos que son importantes para lograr una buena performance y una aplicación sólida.

Repasémoslos rápidamente:

- Delegar animaciones al browser siempre que sea posible
  - Transformaciones y trancisiones con instrucciones CSS
  - Renderización "incentivada" a ser a través del GPU con `-webkit-transform: translateZ(0);`
  - Separación de threads de animación con `window.requestAnimationFrame`
- Profiling de JavaScript
  - Utilizar el DOM lo menos posible
  - Nombrar funciones anónimas para identificar dónde están los problemas más fácilmente
  - Refactorizar el código
  - Crear funciones definidas y autollamadas si hacer métodos más pequeños no se puede (de esa forma "nombramos" parte del código)
- Utilización del DOM
  - Lo menos posible (nuevamente)
  - Cachear elementos cuando tenga sentido
  - Hacer lecturas, luego modificaciones, luego escrituras para evitar reflows
  - No usar el DOM dentro de loops
- Inicialización tardía
  - Delegación de eventos en lugar de asociación de handlers

Y eso es, a muy grandes rasgos, este artículo. Realmente recomiendo que le den una leída a fondo si ustedes trabajan del lado de la web. Realmente no verán una página de la misma manera.

_Soy un zorrinito performante._
