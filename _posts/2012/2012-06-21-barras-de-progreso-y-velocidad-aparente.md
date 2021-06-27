---
layout: single
title: Barras de progreso y velocidad aparente
date: '2012-06-21 07:42:51 +0000'
date_gmt: '2012-06-21 12:42:51 +0000'
categories:
- Technology
tags:
- design
- animación
- interfaz
- user experience
- experiencia de usuario
- UX
- progreso
- barra de progreso
- indicador de progreso
sub_title: La gran diferencia del detalle
---

## Indicando progreso

Hemos visto como a través de los años las interfaces de los sistemas operativos y las distintas aplicaciones (también las web) han evolucionado y cambiado radicalmente su aspecto visual. Muchos más colores, formas redondeadas, animaciones y feedback que nos indica qué está pasando a cada momento.

Uno de los elementos que más cambio ha tenido son los indicadores de progreso. Desde las líneas que giraban simulando un progreso, usando los caracteres -, /, | y \ en una consola, hasta el uso de caracteres Unicode con barritas que se iban llenando, hasta las hermosas interfaces de hoy de colores y animaciones.

Cabe aclarar que los indicadores de progreso vienen en dos sabores. Uno de ellos es el indicador de progreso indeterminado, el cual indica que hay un progreso ocurriendo de fondo en nuestra aplicación, pero sin indicar qué tan cerca estamos de terminar esa operación. Muchos de estos hemos visto en Youtube y distintas páginas que hacen uso de ajax. [Wikimedia tiene una linda galería de estos](http://commons.wikimedia.org/wiki/Category:Throbbers), pero para ejemplo, aquí tienen uno:

![]({{ site.baseurl }}/assets/loader.gif)


El otro tipo de indicador es la barra de progreso propiamente dicha. Esta barra es el concepto básico que indica un límite en donde el trabajo ha sido terminado y nuestra posición respecto de completar esa tarea. [Una búsqueda en Google Images](https://www.google.com/search?q=progress+bar&amp;sugexp=chrome,mod%3D11&amp;um=1&amp;ie=UTF-8&amp;hl=en&amp;tbm=isch&amp;source=og&amp;sa=N&amp;tab=wi&amp;authuser=0&amp;ei=KRDjT7fBCOuu2AWmlazqCw&amp;biw=1920&amp;bih=979&amp;sei=LBDjT62ZJIO42wWm8NTcCw) devuelve muchas, muchas imágenes para saber de qué estamos hablando, y mejor aún, [PrettyLoaded](http://prettyloaded.com/) es un sitio (Flash) con una galería continua de pre-loaders que reutilizan este concepto con distintas formas.

![]({{ site.baseurl }}/assets/progressbar.gif)

## Jugando con la mente

Ahora, asumiendo que una tarea siempre tarda el mismo tiempo, el indicador de progreso puede hacer una diferencia en la velocidad aparente que como usuarios percibimos, y podría ser bien la diferencia entre cancelar una descarga que signifique una compra o esperar unos pocos segundos más. Esta velocidad percibida es también llamada velocidad aparente, y si bien está relacionada a la velocidad real, hay otros factores que pueden hacerla aparentemente mayor o menor.

La velocidad aparente se encuentra afectada por muchos factores, como bien publicó Anthony, de UXMovement, en el artículo llamado [How to Make Progress Bars Feel Faster to Users](http://uxmovement.com/buttons/how-to-make-progress-bars-feel-faster-to-users/). A diferencia de muchos artículos que se encuentran en la internet, este está respaldado por estudios de la gente de Carnegie Mellon University, de los Laboratorios de Investigación de AT&amp;T, y de la Universidad de New York. (Los links están al final del mismo.)

Las características que mencionan aquí son las siguientes:

### Animación en sentido contrario

Una característica de las nuevas interfaces ha sido la capacidad de entrelazar imágenes en estos mismos indicadores. Muchas veces es una forma de demostrar que la aplicación sigue funcionando aunque la barra de progreso mantenga su posición, de la misma forma que el caracter que giraba nos indicaba también que el programa seguía funcionando. Sin embargo, el tipo de animación también puede tener un efecto sobre la velocidad aparente del progreso general.

Y lo que han descubierto es que cuando esta animación se mueve en sentido contrario a la dirección de progreso de la barra, la sensación de velocidad es mayor.

### Utilizar pulsaciones frecuentes

Los indicadores de progreso (tanto barras como indeterminados) pueden hacer uso de pulsaciones como parte de la animación. Esto es más común en las barras de progreso, en donde todo el color de la barra es cambiado por un momento y vuelve a su estado normal, repitiendo esta acción cada tanto tiempo, dando la sensación de una pulsación.

Los estudios demostraron que mientras más frecuentes son estas pulsaciones, mayor es la velocidad aparente. Por supuesto, puede que no resulte agradable al ojo del usuario si es demasiado frecuente. Un truco extra también mencionado es que a medida que nuestra barra está avanzando, la frecuencia de las pulsaciones puede ir aumentando, también generando la sensación de un aumento en velocidad, incluso aunque realmente no sea tal.

### Acelerar el progreso

Supongamos por un momento que el progreso de nuestra tarea es fijo, y que cada tantas unidades de tiempo, siempre tendremos tantas otras unidades de avance en nuestro progreso. Mantener esa monotonía de avance es, si bien realista, no la mejor opción para dar la sensación de progreso. Según mencionan los estudios, incrementar la velocidad del progreso hacia el final genera una sensación de menor tiempo insumido en la tarea en general, incluso aunque los tiempos suma sean los mismos.

Recuerdo haber leído que entre Windows Vista y Windows 7, este había sido uno de los cambios de interfaz en el momento de copia de archivos, a pesar que la estrategia de copia de archivos no había cambiado, y la diferencia era notable. Desafortunadamente, no logro encontrar el artículo en donde originalmente leí eso.

### Evitar pausas al final

La pausa final, que ocurre muy comunmente si se está haciendo un procesamiento al final de la tarea, arruina la sensación completa de velocidad que el proceso había ganado. Por supuesto, seguramente estemos en un punto en donde el usuario ya no decide cancelar la acción, pero con ella hemos logrado arruinar la sensación de un proceso rápido que el usuario sentía. Esta puede ser la diferencia entre volver a usar nuestro sistema o no en un futuro, así que cuidado.

---

Los estudios originales son:

- [Faster Progress Bars: Manipulating Perceived Duration with Visual Augmentations](http://www.chrisharrison.net/projects/progressbars2/ProgressBarsHarrison.pdf)
- [Rethinking the Progress Bar](http://www.scribd.com/lmjabreu/d/2226848-Rethinking-The-Progress-Bar)

_Soy un zorrinito con progreso._
