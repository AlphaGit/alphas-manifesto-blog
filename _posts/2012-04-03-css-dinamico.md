---
layout: post
status: publish
published: true
title: CSS Dinámico
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 3757
wordpress_url: http://blog.alphasmanifesto.com/?p=3757
date: '2012-04-03 08:51:43 +0000'
date_gmt: '2012-04-03 13:51:43 +0000'
categories:
- Link del día
- Technology
tags:
- CSS
- buenas prácticas
- comunidad
- dinámico
- Less
- razones
- colores
comments:
- id: 8841
  author: andres
  author_email: notengo@notengo.com
  author_url: ''
  date: '2012-04-03 09:11:32 +0000'
  date_gmt: '2012-04-03 14:11:32 +0000'
  content: "> Por un lado, permitirán la inserción fácil de quienes
    no dominen CSS completamente. \r\n\r\nPero generan mas lenguajes, más cosas
    que aprender, en lugar de profundizar en un lenguaje común. Por ejemplo:
    tal vez LESS sea más cómodo e intuitivo para un programador, pero
    tal vez no lo es para un diseñador.\r\n\r\nRelacionado con el punto dos,
    creo que tal vez no las conocemos o no son intuitivas para nosotros, pero tengo
    entendido que el CSS puro y duro, por ejemplo, también se puede adaptar
    a distintos dispositivos.\r\n\r\nLo mismo, tal vez no de la forma en que estamos
    acostumbrados pero CSS permite reutilización. Al igual que en los puntos
    anteriores tal vez requiere que modifiquemos nuestra manera de pensar, para un
    programador acostumbrado a algoritmos SQL también requiere modificar la
    forma de pensar, no?\r\n\r\nHacks, ahí estoy de acuerdo, las diferencias
    entre navegadores son un problema importante, pero tienden a desaparecer,  ¿no?"
- id: 8844
  author: Alpha
  author_email: alpha@furries.com.ar
  author_url: http://www.alphasmanifesto.com.ar/
  date: '2012-04-04 18:36:23 +0000'
  date_gmt: '2012-04-04 23:36:23 +0000'
  content: |-
    <blockquote>Pero generan mas lenguajes, más cosas que aprender, en lugar de profundizar en un lenguaje común. Por ejemplo: tal vez LESS sea más cómodo e intuitivo para un programador, pero tal vez no lo es para un diseñador.</blockquote>

    Es verdad, pero al mismo tiempo se trata de resolver tareas que generalmente llevan tiempo de una forma más simple. Si está bien pensado no haría falta cambiar la forma del lenguaje, porque siendo backward-compatible se podrían desarrollar las mismas cosas de la misma forma que se hace hoy. Seguramente con nuevas características aparezcan nuevas capacidades y entonces sí habría que aprender cosas nuevas... pero es el precio del progreso.

    En el resto estoy todo de acuerdo, y sí, me preocupa profundamente la cantidad de tiempo invertido en hacer que las cosas funcionen en distintos navegadores. Tantos millones de dólares invertidos en workarounds y no en la solución en la raíz del problema.
---
Post procesamiento vs. preprocesamiento


Para los que conocemos y usamos [Less o sus variantes](https://blog.alphasmanifesto.com/2012/02/10/dotless/), nos alegraríamos mucho de saber que CSS pueda agregar capacidades similares. A pesar de que [gran parte de la comunidad esté en desacuerdo](http://www.css3.info/summary-of-the-two-current-css-constants-proposals/) (¡Gracias, AM!), yo creo que serían útiles, por varias razones. (Invito a discutir a quién piense distinto.)

- Por un lado, permitirán la inserción fácil de quienes no dominen CSS completamente. Está claro que significa que se pueden resolver cosas de una forma no tan prolija, pero los lenguajes tratan de facilitarnos las tareas a nosotros, no imponernos reglas que debemos seguir. Cuando existe esa diferenciación es cuando comienzan a surgir [buenas prácticas](https://blog.alphasmanifesto.com/2011/09/30/link-del-dia-arquitectura-css/).
- Por otro lado, permitirá la creación de frameworks más dinámicos, sin uso de JavaScript. Frameworks CSS que sean adaptables al uso de los usuarios, multi-navegador y apropiadamente utilizables. De la misma forma que [Bootstrap](http://twitter.github.com/bootstrap/) tiene variables globales que se pueden cambiar para ajustar su comportamiento, así serían más dinámicos y reutilizables.
- Por otro lado más: reutilización. Muchas veces los esquemas de colores se basan en un conjunto limitado de los mismos. Si los tamaños de fuentes ya admiten relaciones entre ellos,  ¿por qué no los colores, por qué no condicionales que devuelvan un valor según el valor padre? (Nuevamente, en favor de los CSSs consistentes cross-browsers.)
- Minimización de hacks. Por partida doble. En el primer aspecto, por todo lo que nombré. En el segundo aspecto, por la posibilidad de limitarlos a lo necesario y sólo reutilizarlos como referencia (lo que Less denomina _mixins_).

Todo esto venía a los links que me encontré, relativamente novedosos: [Calc() para CSS](http://updates.html5rocks.com/2012/03/CSS-layout-gets-smarter-with-calc), un operador que calcula valores en base a los argumentos que se le pasen. Creo que este pedacito de código lo paga todo:

```css
#foo {
    width: calc(50% - 100px);
}
```
```html
<div id="foo">Always 100 pixels less than half the available area</div>
```

Por otro lado, [Scoped Styles](http://updates.html5rocks.com/2012/03/A-New-Experimental-Feature-style-scoped), algo que sólo veo como utilidad al momento de permitir usuarios escribir su propio CSS (apropiado para SaaS en donde los usuarios tengan su propio espacio). No soy muy fanático de esta funcionalidad, pero reconozco que resuelve un problema existente.

_Soy un zorrinito dinámico._
