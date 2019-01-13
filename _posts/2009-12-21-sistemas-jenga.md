---
layout: post
status: publish
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
comments: []
---
<p style="text-align: justify;">Suelo decir muchas tonter&iacute;as a modo de chiste, pero de tanto en tanto, alguna de ellas tiene un poco de verdad. Hoy, hablando de un sistema del que estoy encargado (entre otras personas) de mantener, pens&eacute; que estaba muy dif&iacute;cil su actualizaci&oacute;n, <a href="http://twitter.com/AlphaTwi/status/6895562175">y lo llam&eacute; un </a><em><a href="http://twitter.com/AlphaTwi/status/6895562175">Sistema Jenga</a></em>. &iquest;Qu&eacute; es un <em>sistema Jenga</em>? Es un sistema para el cual agregar una pieza hace que peligre toda la estructura de su programaci&oacute;n.</p>

![](/assets/Jenga.gif){: .align-left}

<p style="text-align: justify;">Aqu&iacute; participan varios conceptos que alguna vez he mencionado. Uno de ellos es, por supuesto, la arquitectura o la estructura con la cual se ha programado, dise&ntilde;ado y modelado el sistema en cuesti&oacute;n. Es obvio que una buena arquitectura, o una pensada en torno a futuros cambios, pueda ser lo suficientemente flexible como para aceptar futuros nuevos requerimientos sin necesidad de redise&ntilde;os mayores o cambios dr&aacute;sticos en la programaci&oacute;n anterior. Pero ese no es el concepto que m&aacute;s me interesa discutir hoy.</p>
<p style="text-align: justify;">Otro de los conceptos es el hecho de <em>cu&aacute;l es el prop&oacute;sito de una pieza de software</em>. Lo considero un punto incluso filos&oacute;fico, porque est&aacute; claro que no hay un sistema multiprop&oacute;sito, que realice todas las funciones que podamos llegar a necesitar, y creo que no deber&iacute;a haberlo tampoco, porque ser&iacute;a infactible que dicho sistema se adapte a todas las situaciones particulares que puedan surgir. Por tanto, el riesgo que tal hipot&eacute;tico sistema introducir&iacute;a en nuestros procesos, ser&iacute;a catastr&oacute;fico. No har&iacute;a falta mencionar tampoco, que la programaci&oacute;n/dise&ntilde;o/an&aacute;lisis de ese sistema se aproximar&iacute;a a lo altamente infactible. Muchos sistemas operativos ya proveen de estas posibilidades gracias a la integraci&oacute;n de muchas peque&ntilde;as herramientas, pero no es t&eacute;cnicamente parte del mismo sistema, a pesar de que pueden llegar a interactuar de forma muy &iacute;ntima.</p>
<p style="text-align: justify;">Entonces, a medida que pasa el tiempo, es muy factible que los requerimientos para un sistema se vayan modificando. Muchas veces los cambios son peque&ntilde;os, pueden ser cuestiones de usabilidad o cuestiones de performance. Incluso puede que haya una modificaci&oacute;n grande en el sistema, agregando nuevas funcionalidades y hasta quitando funcionalidades obsoletas, pero el objetivo o el prop&oacute;sito del sistema se mantiene, hace lo que siempre debi&oacute; hacer.</p>
<p style="text-align: justify;"><strong>&iquest;Qu&eacute; pasa, entonces, cuando cambia el enfoque de negocios y los requerimientos del sistema pasan a tener un prop&oacute;sito distinto del original?</strong></p>
<p style="text-align: justify;">Yo creo (aunque es mi opini&oacute;n personal) que en ese caso el sistema se vuelve obsoleto, y pierde su raz&oacute;n de ser. Es entonces en donde el mantenimiento de esos sistemas para acomodarse a los nuevos requerimientos puede ser algo dram&aacute;tico, porque se est&aacute; intentando usar algo que ni siquiera estaba pensado de la forma que se necesita para algo que ni siquiera estaba pensado que se iba a necesitar. Casos tan dr&aacute;sticos son raros, pero son factibles de ocurrir. Y cre&aacute;nme, ocurren.</p>

![](/assets/Bathtub_curve.jpg){ :align-right}

<p style="text-align: justify;">Esto no es nada nuevo tampoco. Se sabe, y es algo conocido como "la curva de la tina de ba&ntilde;o" (o su nombre en ingl&eacute;s "Bathtub curve") que el ciclo de vida de un sofware, o la utilidad que el mismo proporciona a sus prop&oacute;sitos es poco al principio, hasta que los usuarios logran sacar el m&aacute;ximo provecho de los sistemas, hasta que los dem&aacute;s sistemas lograron integrarse de forma correcta al mismo y hasta que los bugs iniciales hayan sido corregidos. En la etapa media es el &aacute;pice de la utilizaci&oacute;n de esos sistemas, pero pasado el tiempo, es cuando el sistema ya deja de satisfacer las necesidades del usuario.</p>
<p style="text-align: justify;">Aqu&iacute; surge la discusi&oacute;n de qu&eacute; sucede con la curva en el final. Para productos comunes (por ejemplo, elementos mec&aacute;nicos) el desgaste producido comienza a introducir nuevas fallas que de a poco vuelven al producto inusable. En el software, es f&aacute;cil reacomodar la l&oacute;gica del mismo y entonces, adapt&aacute;ndose a las nuevas necesidades, cabe la posibilidad de que se mantenga en su estado de mejor uso. As&iacute;, la curva finalizar&iacute;a con una forma de sierra, en donde se observar&iacute;an peque&ntilde;os picos (dado que al usuario le deja de resultar &uacute;til el sistema) y tras dicho re-acomodamiento, una planicie.</p>
<p style="text-align: justify;">Sin embargo, la manutenci&oacute;n de un producto a trav&eacute;s de la eternidad no es algo factible, y quiz&aacute; no es deseable tampoco. Aqu&iacute; es en donde la otra opini&oacute;n se asoma al respecto, diciendo que la vida de un software tambi&eacute;n se desgasta proporcionalmente al tiempo que estuvo activo, y, personalmente, creo que tiene sentido. &nbsp;Las necesidades a trav&eacute;s del tiempo suelen cambiar muy dr&aacute;sticamente y, aunque una suma siempre haya sido una suma, las cosas tienden a simplificarse para el usuario y cuando un click antes hac&iacute;a una suma, ahora debe realizar una estimaci&oacute;n a futuro.</p>
<p style="text-align: justify;">Y finalmente, otra cosa que quer&iacute;a mencionar al respecto, es la terrible necesidad del <em>backward compatibility</em>. Esto significa que a medida que vamos mejorando y agregando funcionalidades a nuestro sistema, necesitamos algunas veces tener compatibilidad con las versiones viejas de nuestro sistema. A veces es f&aacute;cil, porque nuestro sistema puede ser una web application que no requiera de muchas entradas, y por tanto podemos cambiarlo todo sin necesidad de tener esa precauci&oacute;n. &iquest;Qu&eacute; pasa si en cambio Microsoft, al implementar su nuevo formato de archivos de Office 2007 hubiera hecho in&uacute;tiles los archivos de Office 2003 hacia atr&aacute;s? &iquest;Qu&eacute; pasa si en cambio cuando decidieron implementar IPv6 no hubieran tenido en cuenta que somos millones los que estamos actualmente usando IPv4 y que no podemos (o queremos) comprar nuevas placas de red en este momento?</p>
<p style="text-align: justify;">Por eso, siempre es una cuesti&oacute;n a considerar, no hay ni blancos ni negros, pero siempre que un sistema debe mantener compatibilidad con sus versiones anteriores, se agrega complejidad, y de alguna forma es un requerimiento extra que nos impide avanzar con las modificaciones que quisi&eacute;ramos hacer para avanzar con las nuevas funcionalidades del sistema.</p>
<p style="text-align: justify;">Es entonces, en conclusi&oacute;n, en donde el mantenimiento de un sistema se vuelve algo tan pesado que quiz&aacute; ser&iacute;a mucho m&aacute;s provechoso realizarlo de cero con las nuevas necesidades, y en donde la modificaci&oacute;n del mismo lo hace peligrar cada vez m&aacute;s en su integridad, algo que a m&iacute; me gusta llamar <em>Sistemas Jenga</em>.</p>
<p style="text-align: justify;"><em>Soy un zorrinito jenga.</em></p>
