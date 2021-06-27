---
layout: single
title: CSS Dinámico
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
sub_title: Post procesamiento vs. preprocesamiento
---

Para los que conocemos y usamos [Less o sus variantes]({{ site.baseUrl }}{% link _posts/2012/2012-02-10-dotless.md %}), nos alegraríamos mucho de saber que CSS pueda agregar capacidades similares. A pesar de que [gran parte de la comunidad esté en desacuerdo](http://www.css3.info/summary-of-the-two-current-css-constants-proposals/) (¡Gracias, AM!), yo creo que serían útiles, por varias razones. (Invito a discutir a quién piense distinto.)

- Por un lado, permitirán la inserción fácil de quienes no dominen CSS completamente. Está claro que significa que se pueden resolver cosas de una forma no tan prolija, pero los lenguajes tratan de facilitarnos las tareas a nosotros, no imponernos reglas que debemos seguir. Cuando existe esa diferenciación es cuando comienzan a surgir [buenas prácticas]({{ site.baseUrl }}{% link _posts/2011/2011-09-30-link-del-dia-arquitectura-css.md %}).
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
