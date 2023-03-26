---

title: 'Link del día: Arquitectura CSS'
date: '2011-09-30 08:18:05 +0000'
date_gmt: '2011-09-30 13:18:05 +0000'
categories:
- Link del día
tags:
- CSS
- arquitectura
- design
- modular
- escalabilidad
---

La idea me parece fantástica, pero la forma en la que se desarrolló, no tanto. La idea era, [Scalable and Modular Architecture for CSS](http://smacss.com/book/), una organización del código CSS de una aplicación para que fuera dividido en forma modular. De esta forma, habría determinados estilos base, y otros estilos pertenecientes a módulos que especificarían cosas extra, o modificarían detalles (aunque no deberían) de los estilos base.

Ahora, los estilos base se subdividen, a su vez, en estilos que tienen que ver con el layout, y los que no se llaman "base". Por último, hay una cuarta clasificación que tiene que ver con estilos de estados, es decir, cuando algo está activado, cuando se encuentra deshabilitado, etc.

Si bien la idea está muy interesante, veo algunos puntos grises en cuanto se debe determinar qué estilo pertenece a qué. Hay reglas CSS particulares que van a ser seguramente pertenecientes a una de las anteriores categorías mientras otras no, pero podemos estar hablando de los mismos elementos en pantalla. Para poder lograrlo de forma precisa, debería tenerse demasiado cuidado y una gran cantidad de reglas que aplicarían a un determinado elemento. En ese sentido no se me hace demasiado natural, aparte de la necesidad de marcar de múltiples formas un mismo elemento (un id, varias clases).

Sin embargo, me parece un muy buen comienzo, y quisiera escuchar ideas, porque creo que esta arquitectura es una base muy poderosa para hacer de CSS complejo algo muy ordenado.

_Soy un zorrinito estilizado._
