---


title: 'Presentando: What now?'
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
subtitle: A todo-list with a twist

---


Como excusa para probar d3.js, yeoman, travis, heroku, y con el propósito de hacer algo interesante, me propuse el desarrollo de _what-now_, un listado de tareas para hacer (típico to-do list) pero con un desafío extra: mostrar las tareas dependientes de otras y mostrar el camino crítico para la resolución del "proyecto".

Explicaré aquí mis investigaciones hasta el momento, mi progreso, el plan para más adelante y lo que he encontrado.

<!--more-->

## _What now_, el producto

La idae de what-now es un listado de tareas como cualquier otro, que permitirá al usuario ver la relación de dependencia de todas las tareas, y poder ejecutar aquellas que bloqueen a las demás de la forma más eficiente. Creo que hay uno o dos productos en el mercado que hoy permiten eso, pero en lugar de investigar al respecto decidí hacer el mío propio, como entrenamiento de ciertas tecnologías (de las que hablaré más adelante).

Hoy es muy básico lo que está disponible:

- **Funcional:**
  - Se pueden agregar tareas
  - Se pueden quitar tareas
  - Las tareas pueden ser dependientes de otras
  - Se graficarán a las tareas como puntos, con "niveles" según si tengan dependencias con las demás
- **No-funcional:**
  - Se puede ver el código en GitHub ([https://github.com/AlphaGit/what-now](https://github.com/AlphaGit/what-now))
  - Se puede ver el estado del build con integración continua en Travis ([https://travis-ci.org/AlphaGit/what-now](https://travis-ci.org/AlphaGit/what-now))
- Las dependencias están integradas a npm y bower, con lo que se pueden resolver de forma simple.

### ¿Por qué hablaría de esto si está tan crudo?

Quiero exprimentar hacerme responsable del progreso reportándolo públicamente. Imagino que eso me puede presionar un poco más para darle un seguimiento activo al proyecto, y eso es algo que me gustaría ver ocurrir. No tengo fechas límites, y por supuesto que alguna otra actividad que requiera mi atención puede tener más prioridad sin aviso previo. De todos modos, quiero pensar en esta bitácora como una forma de hacerme responsable frente al mundo del progreso de este proyecto, aunque sea sólo por diversión.

### El futuro del proyecto (roadmap)

Mis intenciones sobre lo que este sistema debe poder hacer están registrados en el seguimiento de issues de GitHub ([https://github.com/AlphaGit/what-now/issues?state=open](https://github.com/AlphaGit/what-now/issues?state=open)). Si tienen ideas y quieren que las considere, adelante, propónganlas. Mientras más detalle puedan proveer, mejor, y por supuesto, acepto pull requests. Más adelante documentaré en el proyecto cuáles son los pasos para obtener una copia funcional, y también qué cosas deben tener en cuenta para poder participar y proveerme código.

Funcionalmente, el proyecto tiene las siguientes intenciones:

- [[#1](https://github.com/AlphaGit/what-now/issues/1)] Poder editar las tareas
- [[#2](https://github.com/AlphaGit/what-now/issues/2)] Resltar una tarea particular en la tabla de tareas cuando esta sea señalada en el gráfico de dependencias
- [[#3](https://github.com/AlphaGit/what-now/issues/3)] Resaltar una tarea particular en el gráfico de dependencias cuando esta sea señalada en el listado de tareas
- [[#4](https://github.com/AlphaGit/what-now/issues/4)] Mostrar el gráfico de dependencias (d'oh)
- [[#5](https://github.com/AlphaGit/what-now/issues/5)] Identificar y mostrar de forma particular el camino crítico para la ejecución de las tareas
- [[#7](https://github.com/AlphaGit/what-now/issues/7)] Tener un auto-deployment automático a un sitio público de heroku
- [[#8](https://github.com/AlphaGit/what-now/issues/8)] Tener estilos bonitos (diseñadores gráficos y maquetadores, ¡acepto voluntarios!)
- [[#10](https://github.com/AlphaGit/what-now/issues/10)] Guardar sus contenidos en localstorage del navegador

Espero pronto poder estar publicando el progreso actual y algún detalle sobre la implementación interna de estas características.

##  Tecnologías involucradas

Como ya mencioné, parte de esto es un experimento para estar más cercano a ciertas tecnologías, poder probar qué tal se da su uso y a la vez aprender sobre ellas. Aquí está mi experiencia hasta ahora:

### Yeoman, angular-generator

Este proyecto permite la auto-generación de aplicaciones de AngularJS, ahorrando muchos pasos de su configuración inicial y ya proveyendo una estructura inicial, funcional, sobre la que podemos construir.

Esto es, al menos, en teoría. En realidad el proyecto aún está en desarrollo y si bien está un 90% ahí, le faltan algunos pasos para ser totalmente desatendido y funcional. El primer problema que me encontré fue que la aplicación que Yeoman generaba estaba configurada para una versión de AngularJS más antigua, con lo que ngRoute no estaba incluido como un módulo separado, haciendo que la aplicación en sí no funcionara.

El segundo problema es que la generación de CSS requiere SASS y Compass. Esto lo aclaran, pero la documentación de cómo configurarlo es poca, llevando a la situación frustrante de que es necesario instalar Ruby, la gema de compass, y recién luego poder utilizar nuestro servidor.

La configuración de karma test-runner, jshint y grunt son apropiadas para un comienzo y se deben ajustar según las necesidades de cada proyecto. Esto es esperado, pero creo que era importante mencionarlo de todos modos.

### d3

Mi conocimiento de d3 es todavía muy limitado, pero siguiendo [las guías publicadas en ng-newsletter](http://www.ng-newsletter.com/posts/d3-on-angular.html) logré hacer una integración de esta librería al mundo de Angular. El problema con esto es que ninguna solución es realmente limpia. Verán: d3 requiere de un elemento global para ser utilizado sobre el DOM directamente, cuando la filosofía de Angular es hacer esto modular y tener ciertos sub-módulos particulares que se encarguen de esto, en un rango del DOM particular, abstrayendo esa lógica de la lógica de la aplicación. Estos sub-módulos son los que se llaman directivas, y son utilizados en alguna porción de la aplicación cuando la manipulación del DOM es necesaria -- pero para cualquier otro caso, es alentado a que el programador no haga esto.

D3, por el otro lado, es TODO sobre la modificación y generación de elementos de DOM. Como esto requiere el uso de variables globales del navegador, podemos imaginar que va a ser difícil "contenerlo" en AngularJS sin que rompamos la estructura que las aplicaciones de Angular requieren. Pero como sabrán, esto no es algo propio de D3, sino cualquier otra librería que requiera interacciones globales (jQuery, por ejemplo).

La solución es abstraer el uso de d3 detrás de un servicio, y sólo hacer uso del servicio cuando es necesario, específicamente dentro de la directiva. Esto permite testear la directiva haciendo inyecciones sobre el servicio, pero no cuenta con que la complejidad de la librería puede ser demasiado como para inyectar en el servicio sin usar la librería real. Además, es otra forma de _patear la mugre debajo de la alfombra_, porque al fin y al cabo, no importa en donde se lo referencia, d3 seguirá siendo una referencia global.

En el futuro hablaré más sobre lo que d3 propone y cómo lo hace, pero por lo que estoy viendo por ahora, me resulta una propuesta muy interesante.

### Travis-CI

Ya había utilizado Travis en un proyecto anterior, en [ng-pattern-restrict]({{ site.baseUrl }}{% link _posts/2014/2014-02-17-ng-pattern-restrict.md %}), pero gracias a la ayuda de Yeoman, esta vez fue mucho más fácil lograr la integración y tenerlo andando. Desafortunadamente no fue automático, y tuve que hacer un par de ajustes para lograr que los tests pudieran correr, nuevamente relacionados con Ruby y SASS.

En el futuro, usaré Travis para el auto-deployment en heroku, lo que será ir un paso más allá de lo que he hecho con él en el pasado. Veremos cómo resulta eso.

Por el momento, tengo la banderita verde de que mis tests pasan correctamente. Yay!

## Eso es todo

Por ahora no hay nada más que contar. Estoy totalmente abierto a que me contacten por ideas, sugerencias, desacuerdos y correcciones. Espero, nuevamente, poder dedicar un tiempo apropiado a esto y reportar el progreso.
