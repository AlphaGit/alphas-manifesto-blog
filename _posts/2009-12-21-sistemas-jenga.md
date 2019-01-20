---
layout: post
published: true
title: Sistemas Jenga
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 1711
wordpress_url: http://blog.alphasmanifesto.com.ar/?p=1711
date: '2009-12-21 19:20:09 +0000'
date_gmt: '2009-12-21 21:20:09 +0000'
categories:
- Projects
- Technology
tags:
- proyecto
- idea
- chistes
- mantenimiento
- riesgo
- arquitectura
- flexibilidad
- factibilidad
- requerimientos
- ciclo de vida
- bugs
- backward compatibility
---

Suelo decir muchas tonterías a modo de chiste, pero de tanto en tanto, alguna de ellas tiene un poco de verdad. Hoy, hablando de un sistema del que estoy encargado (entre otras personas) de mantener, pensé que estaba muy difícil su actualización, [y lo llamé un ](http://twitter.com/AlphaTwi/status/6895562175)_[Sistema Jenga](http://twitter.com/AlphaTwi/status/6895562175)_.  ¿Qué es un _sistema Jenga_? Es un sistema para el cual agregar una pieza hace que peligre toda la estructura de su programación.

![]({{ site.baseurl }}/assets/Jenga.gif){: .align-left}

Aquí participan varios conceptos que alguna vez he mencionado. Uno de ellos es, por supuesto, la arquitectura o la estructura con la cual se ha programado, diseñado y modelado el sistema en cuestión. Es obvio que una buena arquitectura, o una pensada en torno a futuros cambios, pueda ser lo suficientemente flexible como para aceptar futuros nuevos requerimientos sin necesidad de rediseños mayores o cambios drásticos en la programación anterior. Pero ese no es el concepto que más me interesa discutir hoy.

Otro de los conceptos es el hecho de _cuál es el propósito de una pieza de software_. Lo considero un punto incluso filosófico, porque está claro que no hay un sistema multipropósito, que realice todas las funciones que podamos llegar a necesitar, y creo que no debería haberlo tampoco, porque sería infactible que dicho sistema se adapte a todas las situaciones particulares que puedan surgir. Por tanto, el riesgo que tal hipotético sistema introduciría en nuestros procesos, sería catastrófico. No haría falta mencionar tampoco, que la programación/diseño/análisis de ese sistema se aproximaría a lo altamente infactible. Muchos sistemas operativos ya proveen de estas posibilidades gracias a la integración de muchas pequeñas herramientas, pero no es técnicamente parte del mismo sistema, a pesar de que pueden llegar a interactuar de forma muy íntima.

Entonces, a medida que pasa el tiempo, es muy factible que los requerimientos para un sistema se vayan modificando. Muchas veces los cambios son pequeños, pueden ser cuestiones de usabilidad o cuestiones de performance. Incluso puede que haya una modificación grande en el sistema, agregando nuevas funcionalidades y hasta quitando funcionalidades obsoletas, pero el objetivo o el propósito del sistema se mantiene, hace lo que siempre debió hacer.

** ¿Qué pasa, entonces, cuando cambia el enfoque de negocios y los requerimientos del sistema pasan a tener un propósito distinto del original?**

Yo creo (aunque es mi opinión personal) que en ese caso el sistema se vuelve obsoleto, y pierde su razón de ser. Es entonces en donde el mantenimiento de esos sistemas para acomodarse a los nuevos requerimientos puede ser algo dramático, porque se está intentando usar algo que ni siquiera estaba pensado de la forma que se necesita para algo que ni siquiera estaba pensado que se iba a necesitar. Casos tan drásticos son raros, pero son factibles de ocurrir. Y creánme, ocurren.

![]({{ site.baseurl }}/assets/Bathtub_curve.jpg){ :align-right}


Esto no es nada nuevo tampoco. Se sabe, y es algo conocido como "la curva de la tina de baño" (o su nombre en inglés "Bathtub curve") que el ciclo de vida de un sofware, o la utilidad que el mismo proporciona a sus propósitos es poco al principio, hasta que los usuarios logran sacar el máximo provecho de los sistemas, hasta que los demás sistemas lograron integrarse de forma correcta al mismo y hasta que los bugs iniciales hayan sido corregidos. En la etapa media es el ápice de la utilización de esos sistemas, pero pasado el tiempo, es cuando el sistema ya deja de satisfacer las necesidades del usuario.

Aquí surge la discusión de qué sucede con la curva en el final. Para productos comunes (por ejemplo, elementos mecánicos) el desgaste producido comienza a introducir nuevas fallas que de a poco vuelven al producto inusable. En el software, es fácil reacomodar la lógica del mismo y entonces, adaptándose a las nuevas necesidades, cabe la posibilidad de que se mantenga en su estado de mejor uso. Así, la curva finalizaría con una forma de sierra, en donde se observarían pequeños picos (dado que al usuario le deja de resultar útil el sistema) y tras dicho re-acomodamiento, una planicie.

Sin embargo, la manutención de un producto a través de la eternidad no es algo factible, y quizá no es deseable tampoco. Aquí es en donde la otra opinión se asoma al respecto, diciendo que la vida de un software también se desgasta proporcionalmente al tiempo que estuvo activo, y, personalmente, creo que tiene sentido.  Las necesidades a través del tiempo suelen cambiar muy drásticamente y, aunque una suma siempre haya sido una suma, las cosas tienden a simplificarse para el usuario y cuando un click antes hacía una suma, ahora debe realizar una estimación a futuro.

Y finalmente, otra cosa que quería mencionar al respecto, es la terrible necesidad del _backward compatibility_. Esto significa que a medida que vamos mejorando y agregando funcionalidades a nuestro sistema, necesitamos algunas veces tener compatibilidad con las versiones viejas de nuestro sistema. A veces es fácil, porque nuestro sistema puede ser una web application que no requiera de muchas entradas, y por tanto podemos cambiarlo todo sin necesidad de tener esa precaución.  ¿Qué pasa si en cambio Microsoft, al implementar su nuevo formato de archivos de Office 2007 hubiera hecho inútiles los archivos de Office 2003 hacia atrás?  ¿Qué pasa si en cambio cuando decidieron implementar IPv6 no hubieran tenido en cuenta que somos millones los que estamos actualmente usando IPv4 y que no podemos (o queremos) comprar nuevas placas de red en este momento?

Por eso, siempre es una cuestión a considerar, no hay ni blancos ni negros, pero siempre que un sistema debe mantener compatibilidad con sus versiones anteriores, se agrega complejidad, y de alguna forma es un requerimiento extra que nos impide avanzar con las modificaciones que quisiéramos hacer para avanzar con las nuevas funcionalidades del sistema.

Es entonces, en conclusión, en donde el mantenimiento de un sistema se vuelve algo tan pesado que quizá sería mucho más provechoso realizarlo de cero con las nuevas necesidades, y en donde la modificación del mismo lo hace peligrar cada vez más en su integridad, algo que a mí me gusta llamar _Sistemas Jenga_.

_Soy un zorrinito jenga._
