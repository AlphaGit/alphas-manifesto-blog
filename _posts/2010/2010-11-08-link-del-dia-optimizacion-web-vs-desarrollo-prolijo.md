---
layout: post
title: 'Link del día: Optimización web vs. desarrollo prolijo'
date: '2010-11-08 11:23:28 +0000'
date_gmt: '2010-11-08 13:23:28 +0000'
categories:
- Link del día
- Technology
tags:
- JavaScript
- HTML
- performance
- CSS
- desarrollo web
---

Hace tiempo ya estaba comentando con un colega sobre la enorme cantidad de medidas que pueden tomarse para mejorar la performance de una aplicación web. Existen miles de factores involucrados, entre los cuales hay muchas configuraciones y tweaks que pueden hacerse al servidor, pero muchos otros tienen que ver con el código en sí mismo. Sí señores, estamos hablando de HTML, CSS y JS.

El problema en este punto es que un HTML mínimo puede no ser el HTML que nuestro generador de contenidos genera. Puede que el CSS sea automatizado también, o que nuestro diseñador o desarrollador HTML no esté pensando en hacer las cosas de la forma "más mínima posible", sino realmente trabajando en hacer que algo se vea bien y esté bien codificado. No está entre sus prioridades escribir

```css
background: url("image.jpg") repeat top left scroll;
```

en lugar de

```css
background: url(image.jpg);
```

Ambos son equivalentes, pero la segunda es más corta y por tanto más eficiente. Pero nuestro desarrollador debe realmente preocuparse porque el desarrollo sea correcto, que la visualización sea consistente y que sea acorde entre navegadores.

Ni hablar de JavaScript, en donde la cantidad de optimizaciones, minimizaciones y mejoras puede ser realmente importante. Alguno quiere trabajar sobre JavaScrpt minimizado? Sin duda: no.

La alternativa a la que llegamos era la de tener dos versiones de la aplicación. La de desarrollo con código normal y la de producción. Una vez que desde la de desarrollo se hicieran pruebas y quisiera hacerse un release, solo teníamos que correr una serie de herramientas que nos permitieran tener una versión minimizada y optimizada del código, bajo el riesgo de que algo se rompiera en el proceso.

Pero ahora Google acaba de publicar un módulo que han desarrollado para Apache 2.2, llamado [mod_pagespeed](http://googlewebmastercentral.blogspot.com/2010/11/make-your-websites-run-faster.html), el cual hace optimizaciones y cache en el momento de los pedidos, para optimizar los sitios web sin tener que modificar los archivos reales. Por supuesto, es altamente configurable, y podemos ver la gran cantidad de [mejoras que puede realizar](http://www.modpagespeed.com/) en el poco tiempo que tiene.

Google nos cuenta que ya está trabajando con GoDaddy para que todos sus clientes puedan utilizarlo, y con Cotendo para que esté disponible en su CDN también. Si ustedes no tienen la suerte de estar entre ellos, pueden bajarlo por cuenta propia desde la página del [proyecto de PageSpeed](http://code.google.com/speed/page-speed/download.html), e instalarlo en sus propios servidores.

_Soy un zorrinito acelerado._
