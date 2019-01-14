---
layout: post
status: publish
published: true
title: Barras de progreso y velocidad aparente
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 3992
wordpress_url: http://blog.alphasmanifesto.com/?p=3992
date: '2012-06-21 07:42:51 +0000'
date_gmt: '2012-06-21 12:42:51 +0000'
categories:
- Technology
tags:
- design
- animaci&oacute;n
- interfaz
- user experience
- experiencia de usuario
- UX
- progreso
- barra de progreso
- indicador de progreso
comments: []
---
La gran diferencia del detalle

<h2>Indicando progreso</h2>
<p style="text-align: justify;">Hemos visto como a trav&eacute;s de los a&ntilde;os las interfaces de los sistemas operativos y las distintas aplicaciones (tambi&eacute;n las web) han evolucionado y cambiado radicalmente su aspecto visual. Muchos m&aacute;s colores, formas redondeadas, animaciones y feedback que nos indica qu&eacute; est&aacute; pasando a cada momento.</p>
<p style="text-align: justify;">Uno de los elementos que m&aacute;s cambio ha tenido son los indicadores de progreso. Desde las l&iacute;neas que giraban simulando un progreso, usando los caracteres -, /, | y \ en una consola, hasta el uso de caracteres Unicode con barritas que se iban llenando, hasta las hermosas interfaces de hoy de colores y animaciones.</p>
<p style="text-align: justify;">Cabe aclarar que los indicadores de progreso vienen en dos sabores. Uno de ellos es el indicador de progreso indeterminado, el cual indica que hay un progreso ocurriendo de fondo en nuestra aplicaci&oacute;n, pero sin indicar qu&eacute; tan cerca estamos de terminar esa operaci&oacute;n. Muchos de estos hemos visto en Youtube y distintas p&aacute;ginas que hacen uso de ajax. <a href="http://commons.wikimedia.org/wiki/Category:Throbbers">Wikimedia tiene una linda galer&iacute;a de estos</a>, pero para ejemplo, aqu&iacute; tienen uno:</p>

![](/assets/loader.gif)

<p style="text-align: justify;">El otro tipo de indicador es la barra de progreso propiamente dicha. Esta barra es el concepto b&aacute;sico que indica un l&iacute;mite en donde el trabajo ha sido terminado y nuestra posici&oacute;n respecto de completar esa tarea. <a href="https://www.google.com/search?q=progress+bar&amp;sugexp=chrome,mod%3D11&amp;um=1&amp;ie=UTF-8&amp;hl=en&amp;tbm=isch&amp;source=og&amp;sa=N&amp;tab=wi&amp;authuser=0&amp;ei=KRDjT7fBCOuu2AWmlazqCw&amp;biw=1920&amp;bih=979&amp;sei=LBDjT62ZJIO42wWm8NTcCw">Una b&uacute;squeda en Google Images</a>&nbsp;devuelve muchas, muchas im&aacute;genes para saber de qu&eacute; estamos hablando, y mejor a&uacute;n, <a href="http://prettyloaded.com/">PrettyLoaded</a> es un sitio (Flash) con una galer&iacute;a continua de pre-loaders que reutilizan este concepto con distintas formas.</p>

![](/assets/progressbar.gif)

<h2>Jugando con la mente</h2>
<p style="text-align: justify;">Ahora, asumiendo que una tarea siempre tarda el mismo tiempo, el indicador de progreso puede hacer una diferencia en la velocidad aparente que como usuarios percibimos, y podr&iacute;a ser bien la diferencia entre cancelar una descarga que signifique una compra o esperar unos pocos segundos m&aacute;s. Esta velocidad percibida es tambi&eacute;n llamada velocidad aparente, y si bien est&aacute; relacionada a la velocidad real, hay otros factores que pueden hacerla aparentemente mayor o menor.</p>
<p style="text-align: justify;">La velocidad aparente se encuentra afectada por muchos factores, como bien public&oacute; Anthony, de UXMovement, en el art&iacute;culo llamado <a href="http://uxmovement.com/buttons/how-to-make-progress-bars-feel-faster-to-users/">How to Make Progress Bars Feel Faster to Users</a>. A diferencia de muchos art&iacute;culos que se encuentran en la internet, este est&aacute; respaldado por estudios de la gente de Carnegie Mellon University, de los Laboratorios de Investigaci&oacute;n de AT&amp;T, y de la Universidad de New York. (Los links est&aacute;n al final del mismo.)</p>
<p style="text-align: justify;">Las caracter&iacute;sticas que mencionan aqu&iacute; son las siguientes:</p>
<h3 style="text-align: justify;">Animaci&oacute;n en sentido contrario</h3>
<p style="text-align: justify;">Una caracter&iacute;stica de las nuevas interfaces ha sido la capacidad de entrelazar im&aacute;genes en estos mismos indicadores. Muchas veces es una forma de demostrar que la aplicaci&oacute;n sigue funcionando aunque la barra de progreso mantenga su posici&oacute;n, de la misma forma que el caracter que giraba nos indicaba tambi&eacute;n que el programa segu&iacute;a funcionando. Sin embargo, el tipo de animaci&oacute;n tambi&eacute;n puede tener un efecto sobre la velocidad aparente del progreso general.</p>
<p style="text-align: justify;">Y lo que han descubierto es que cuando esta animaci&oacute;n se mueve en sentido contrario a la direcci&oacute;n de progreso de la barra, la sensaci&oacute;n de velocidad es mayor.</p>
<h3 style="text-align: justify;">Utilizar pulsaciones frecuentes</h3>
<p style="text-align: justify;">Los indicadores de progreso (tanto barras como indeterminados) pueden hacer uso de pulsaciones como parte de la animaci&oacute;n. Esto es m&aacute;s com&uacute;n en las barras de progreso, en donde todo el color de la barra es cambiado por un momento y vuelve a su estado normal, repitiendo esta acci&oacute;n cada tanto tiempo, dando la sensaci&oacute;n de una pulsaci&oacute;n.</p>
<p style="text-align: justify;">Los estudios demostraron que mientras m&aacute;s frecuentes son estas pulsaciones, mayor es la velocidad aparente. Por supuesto, puede que no resulte agradable al ojo del usuario si es demasiado frecuente. Un truco extra tambi&eacute;n mencionado es que a medida que nuestra barra est&aacute; avanzando, la frecuencia de las pulsaciones puede ir aumentando, tambi&eacute;n generando la sensaci&oacute;n de un aumento en velocidad, incluso aunque realmente no sea tal.</p>
<h3 style="text-align: justify;">Acelerar el progreso</h3>
<p style="text-align: justify;">Supongamos por un momento que el progreso de nuestra tarea es fijo, y que cada tantas unidades de tiempo, siempre tendremos tantas otras unidades de avance en nuestro progreso. Mantener esa monoton&iacute;a de avance es, si bien realista, no la mejor opci&oacute;n para dar la sensaci&oacute;n de progreso. Seg&uacute;n mencionan los estudios, incrementar la velocidad del progreso hacia el final genera una sensaci&oacute;n de menor tiempo insumido en la tarea en general, incluso aunque los tiempos suma sean los mismos.</p>
<p style="text-align: justify;">Recuerdo haber le&iacute;do que entre Windows Vista y Windows 7, este hab&iacute;a sido uno de los cambios de interfaz en el momento de copia de archivos, a pesar que la estrategia de copia de archivos no hab&iacute;a cambiado, y la diferencia era notable. Desafortunadamente, no logro encontrar el art&iacute;culo en donde originalmente le&iacute; eso.</p>
<h3 style="text-align: justify;">Evitar pausas al final</h3>
<p style="text-align: justify;">La pausa final, que ocurre muy comunmente si se est&aacute; haciendo un procesamiento al final de la tarea, arruina la sensaci&oacute;n completa de velocidad que el proceso hab&iacute;a ganado. Por supuesto, seguramente estemos en un punto en donde el usuario ya no decide cancelar la acci&oacute;n, pero con ella hemos logrado arruinar la sensaci&oacute;n de un proceso r&aacute;pido que el usuario sent&iacute;a. Esta puede ser la diferencia entre volver a usar nuestro sistema o no en un futuro, as&iacute; que cuidado.</p>
<hr style="width: 75%;" width="75%" />
<p style="text-align: justify;">Los estudios originales son:</p>
<ul style="text-align: justify;">
<li><a href="http://www.chrisharrison.net/projects/progressbars2/ProgressBarsHarrison.pdf">Faster Progress Bars: Manipulating Perceived Duration with Visual Augmentations</a></li>
<li><a href="http://www.scribd.com/lmjabreu/d/2226848-Rethinking-The-Progress-Bar">Rethinking the Progress Bar</a></li>
</ul>
<p style="text-align: justify;"><em>Soy un zorrinito con progreso.</em></p>
