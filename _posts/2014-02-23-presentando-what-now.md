---
layout: post
status: publish
published: true
title: 'Presentando: What now?'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5039
wordpress_url: http://blog.alphasmanifesto.com/?p=5039
date: '2014-02-23 19:25:39 +0000'
date_gmt: '2014-02-24 00:25:39 +0000'
categories:
- Projects
- Technology
tags:
- proyecto
- open source
- Ruby
- DOM
- GitHub
- AngularJS
- D3
- yeoman
- karma test-runner
- jshint
- grunt
- bower
- npm
- SASS
- Travis CI
- what-now
comments: []
---
<p style="text-align: justify;">Como excusa para probar d3.js, yeoman, travis, heroku, y con el prop&oacute;sito de hacer algo interesante, me propuse el desarrollo de <em>what-now</em>, un listado de tareas para hacer (t&iacute;pico to-do list) pero con un desaf&iacute;o extra: mostrar las tareas dependientes de otras y mostrar el camino cr&iacute;tico para la resoluci&oacute;n del "proyecto".</p>
<p style="text-align: justify;">Explicar&eacute; aqu&iacute; mis investigaciones hasta el momento, mi progreso, el plan para m&aacute;s adelante y lo que he encontrado.</p>
<p style="text-align: justify;"><!--more--></p>
<h2 style="text-align: justify;"><em>What now</em>, el producto</h2>
<p style="text-align: justify;">La idae de what-now es un listado de tareas como cualquier otro, que permitir&aacute; al usuario ver la relaci&oacute;n de dependencia de todas las tareas, y poder ejecutar aquellas que bloqueen a las dem&aacute;s de la forma m&aacute;s eficiente. Creo que hay uno o dos productos en el mercado que hoy permiten eso, pero en lugar de investigar al respecto decid&iacute; hacer el m&iacute;o propio, como entrenamiento de ciertas tecnolog&iacute;as (de las que hablar&eacute; m&aacute;s adelante).</p>
<p style="text-align: justify;">Hoy es muy b&aacute;sico lo que est&aacute; disponible:</p>
<ul style="text-align: justify;">
<li><strong>Funcional:</strong>
<ul>
<li>Se pueden agregar tareas</li>
<li>Se pueden quitar tareas</li>
<li>Las tareas pueden ser dependientes de otras</li>
<li>Se graficar&aacute;n a las tareas como puntos, con "niveles" seg&uacute;n si tengan dependencias con las dem&aacute;s</li>
</ul>
</li>
<li><strong>No-funcional:</strong>
<ul>
<li>Se puede ver el c&oacute;digo en GitHub (<a href="https://github.com/AlphaGit/what-now">https://github.com/AlphaGit/what-now</a>)</li>
<li>Se puede ver el estado del build con integraci&oacute;n continua en Travis (<a href="https://travis-ci.org/AlphaGit/what-now">https://travis-ci.org/AlphaGit/what-now</a>)</li>
<li>Las dependencias est&aacute;n integradas a npm y bower, con lo que se pueden resolver de forma simple.</li>
</ul>
</li>
</ul>
<h3 style="text-align: justify;">&iquest;Por qu&eacute; hablar&iacute;a de esto si est&aacute; tan crudo?</h3>
<p style="text-align: justify;">Quiero exprimentar hacerme responsable del progreso report&aacute;ndolo p&uacute;blicamente. Imagino que eso me puede presionar un poco m&aacute;s para darle un seguimiento activo al proyecto, y eso es algo que me gustar&iacute;a ver ocurrir. No tengo fechas l&iacute;mites, y por supuesto que alguna otra actividad que requiera mi atenci&oacute;n puede tener m&aacute;s prioridad sin aviso previo. De todos modos, quiero pensar en esta bit&aacute;cora como una forma de hacerme responsable frente al mundo del progreso de este proyecto, aunque sea s&oacute;lo por diversi&oacute;n.</p>
<h3 style="text-align: justify;">El futuro del proyecto (roadmap)</h3>
<p style="text-align: justify;">Mis intenciones sobre lo que este sistema debe poder hacer est&aacute;n registrados en el seguimiento de issues de GitHub (<a href="https://github.com/AlphaGit/what-now/issues?state=open">https://github.com/AlphaGit/what-now/issues?state=open</a>). Si tienen ideas y quieren que las considere, adelante, prop&oacute;nganlas. Mientras m&aacute;s detalle puedan proveer, mejor, y por supuesto, acepto pull requests. M&aacute;s adelante documentar&eacute; en el proyecto cu&aacute;les son los pasos para obtener una copia funcional, y tambi&eacute;n qu&eacute; cosas deben tener en cuenta para poder participar y proveerme c&oacute;digo.</p>
<p style="text-align: justify;">Funcionalmente, el proyecto tiene las siguientes intenciones:</p>
<ul style="text-align: justify;">
<li>[<a href="https://github.com/AlphaGit/what-now/issues/1">#1</a>] Poder editar las tareas</li>
<li>[<a href="https://github.com/AlphaGit/what-now/issues/2">#2</a>] Resltar una tarea particular en la tabla de tareas cuando esta sea se&ntilde;alada en el gr&aacute;fico de dependencias</li>
<li>[<a href="https://github.com/AlphaGit/what-now/issues/3">#3</a>] Resaltar una tarea particular en el gr&aacute;fico de dependencias cuando esta sea se&ntilde;alada en el listado de tareas</li>
<li>[<a href="https://github.com/AlphaGit/what-now/issues/4">#4</a>] Mostrar el gr&aacute;fico de dependencias (d'oh)</li>
<li>[<a href="https://github.com/AlphaGit/what-now/issues/5">#5</a>] Identificar y mostrar de forma particular el camino cr&iacute;tico para la ejecuci&oacute;n de las tareas</li>
<li>[<a href="https://github.com/AlphaGit/what-now/issues/7">#7</a>] Tener un auto-deployment autom&aacute;tico a un sitio p&uacute;blico de heroku</li>
<li>[<a href="https://github.com/AlphaGit/what-now/issues/8">#8</a>] Tener estilos bonitos (dise&ntilde;adores gr&aacute;ficos y maquetadores, &iexcl;acepto voluntarios!)</li>
<li>[<a href="https://github.com/AlphaGit/what-now/issues/10">#10</a>] Guardar sus contenidos en localstorage del navegador</li>
</ul>
<p style="text-align: justify;">Espero pronto poder estar publicando el progreso actual y alg&uacute;n detalle sobre la implementaci&oacute;n interna de estas caracter&iacute;sticas.</p>
<h2 style="text-align: justify;">&nbsp;Tecnolog&iacute;as involucradas</h2>
<p style="text-align: justify;">Como ya mencion&eacute;, parte de esto es un experimento para estar m&aacute;s cercano a ciertas tecnolog&iacute;as, poder probar qu&eacute; tal se da su uso y a la vez aprender sobre ellas. Aqu&iacute; est&aacute; mi experiencia hasta ahora:</p>
<h3 style="text-align: justify;">Yeoman, angular-generator</h3>
<p style="text-align: justify;">Este proyecto permite la auto-generaci&oacute;n de aplicaciones de AngularJS, ahorrando muchos pasos de su configuraci&oacute;n inicial y ya proveyendo una estructura inicial, funcional, sobre la que podemos construir.</p>
<p style="text-align: justify;">Esto es, al menos, en teor&iacute;a. En realidad el proyecto a&uacute;n est&aacute; en desarrollo y si bien est&aacute; un 90% ah&iacute;, le faltan algunos pasos para ser totalmente desatendido y funcional. El primer problema que me encontr&eacute; fue que la aplicaci&oacute;n que Yeoman generaba estaba configurada para una versi&oacute;n de AngularJS m&aacute;s antigua, con lo que ngRoute no estaba incluido como un m&oacute;dulo separado, haciendo que la aplicaci&oacute;n en s&iacute; no funcionara.</p>
<p style="text-align: justify;">El segundo problema es que la generaci&oacute;n de CSS requiere SASS y Compass. Esto lo aclaran, pero la documentaci&oacute;n de c&oacute;mo configurarlo es poca, llevando a la situaci&oacute;n frustrante de que es necesario instalar Ruby, la gema de compass, y reci&eacute;n luego poder utilizar nuestro servidor.</p>
<p style="text-align: justify;">La configuraci&oacute;n de karma test-runner, jshint y grunt son apropiadas para un comienzo y se deben ajustar seg&uacute;n las necesidades de cada proyecto. Esto es esperado, pero creo que era importante mencionarlo de todos modos.</p>
<h3 style="text-align: justify;">d3</h3>
<p style="text-align: justify;">Mi conocimiento de d3 es todav&iacute;a muy limitado, pero siguiendo <a href="http://www.ng-newsletter.com/posts/d3-on-angular.html">las gu&iacute;as publicadas en ng-newsletter</a> logr&eacute; hacer una integraci&oacute;n de esta librer&iacute;a al mundo de Angular. El problema con esto es que ninguna soluci&oacute;n es realmente limpia. Ver&aacute;n: d3 requiere de un elemento global para ser utilizado sobre el DOM directamente, cuando la filosof&iacute;a de Angular es hacer esto modular y tener ciertos sub-m&oacute;dulos particulares que se encarguen de esto, en un rango del DOM particular, abstrayendo esa l&oacute;gica de la l&oacute;gica de la aplicaci&oacute;n. Estos sub-m&oacute;dulos son los que se llaman directivas, y son utilizados en alguna porci&oacute;n de la aplicaci&oacute;n cuando la manipulaci&oacute;n del DOM es necesaria -- pero para cualquier otro caso, es alentado a que el programador no haga esto.</p>
<p style="text-align: justify;">D3, por el otro lado, es TODO sobre la modificaci&oacute;n y generaci&oacute;n de elementos de DOM. Como esto requiere el uso de variables globales del navegador, podemos imaginar que va a ser dif&iacute;cil "contenerlo" en AngularJS sin que rompamos la estructura que las aplicaciones de Angular requieren. Pero como sabr&aacute;n, esto no es algo propio de D3, sino cualquier otra librer&iacute;a que requiera interacciones globales (jQuery, por ejemplo).</p>
<p style="text-align: justify;">La soluci&oacute;n es abstraer el uso de d3 detr&aacute;s de un servicio, y s&oacute;lo hacer uso del servicio cuando es necesario, espec&iacute;ficamente dentro de la directiva. Esto permite testear la directiva haciendo inyecciones sobre el servicio, pero no cuenta con que la complejidad de la librer&iacute;a puede ser demasiado como para inyectar en el servicio sin usar la librer&iacute;a real. Adem&aacute;s, es otra forma de&nbsp;<em>patear la mugre debajo de la alfombra</em>, porque al fin y al cabo, no importa en donde se lo referencia, d3 seguir&aacute; siendo una referencia global.</p>
<p style="text-align: justify;">En el futuro hablar&eacute; m&aacute;s sobre lo que d3 propone y c&oacute;mo lo hace, pero por lo que estoy viendo por ahora, me resulta una propuesta muy interesante.</p>
<h3 style="text-align: justify;">Travis-CI</h3>
<p style="text-align: justify;">Ya hab&iacute;a utilizado Travis en un proyecto anterior, en <a href="https://blog.alphasmanifesto.com/2014/02/17/ng-pattern-restrict/">ng-pattern-restrict</a>, pero gracias a la ayuda de Yeoman, esta vez fue mucho m&aacute;s f&aacute;cil lograr la integraci&oacute;n y tenerlo andando. Desafortunadamente no fue autom&aacute;tico, y tuve que hacer un par de ajustes para lograr que los tests pudieran correr, nuevamente relacionados con Ruby y SASS.</p>
<p style="text-align: justify;">En el futuro, usar&eacute; Travis para el auto-deployment en heroku, lo que ser&aacute; ir un paso m&aacute;s all&aacute; de lo que he hecho con &eacute;l en el pasado. Veremos c&oacute;mo resulta eso.</p>
<p style="text-align: justify;">Por el momento, tengo la banderita verde de que mis tests pasan correctamente. Yay!</p>
<h2 style="text-align: justify;">Eso es todo</h2>
<p style="text-align: justify;">Por ahora no hay nada m&aacute;s que contar. Estoy totalmente abierto a que me contacten por ideas, sugerencias, desacuerdos y correcciones. Espero, nuevamente, poder dedicar un tiempo apropiado a esto y reportar el progreso.</p>
