---
layout: post
title: 'Link del día: En defensa de los hacks CSS'
date: '2011-06-01 13:47:07 +0000'
date_gmt: '2011-06-01 15:47:07 +0000'
categories:
- Link del día
tags:
- HTML
- CSS
- design
- navegadores
- experiencia del usuario
- hacks
---

Para mi sorpresa, me encontré con un artículo de Mathias Bynens llamado [In defense of CSS hacks &ndash; introducing "safe CSS hacks"](http://mathiasbynens.be/notes/safe-css-hacks). él habla e introduce el concepto de los hacks CSS. Permítanme hablar un poco sobre su idea.

él menciona que los CSS hacks son básicamente comportamiento especial que podemos invocar en cada navegador, algo que a veces es totalmente deseado, y no tiene por qué ser un problema o una mala práctica, sino que puede ser usado para muchas cosas. El uso más común que se le ha dado hoy en día es hacer "tweaks" específicos para la forma de renderización de cada navegador/versión y entonces lograr una visión consistente a lo largo de todos los navegadores.

Sin embargo, decir que tenemos control sobre el estilo de cada navegador y/o versión no necesariamente quiere decir que lo utilicemos sólo para lograr una vista homogénea. De hecho, gracias a ellas podemos utilizar determinadas características que hacen la exploración en un determinado navegador más natural dentro de las capacidades del mismo.

Esto, combinado con sentencias condicionales, hace que podamos tener mucho control sobre lo que el navegador utiliza de nuestro código.

Los dejo con el último ejemplo que el artículo plantea:

```html
<!--[if lt IE 9]><html class="lte-ie8"><![endif]-->
<!--[if gt IE 8]><!--><html><!--<![endif]-->
```

```css
.foo {
  color: black;
}

.lte-ie8 .foo {
  color: green; /* IE8 and older */
  *color: blue; /* IE7 and older */
  _color: red; /* IE6 and older */
}
```

Personalmente no me encuentro de acuerdo con esta propuesta, pero veo que tiene sus fundamentos.  ¿Ideas?  ¿Críticas?

_Soy un zorrinito hackeado._
