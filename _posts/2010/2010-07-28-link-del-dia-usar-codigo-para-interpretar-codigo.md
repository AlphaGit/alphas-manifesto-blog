---
layout: single
title: 'Link del día: Usar código para interpretar código'
date: '2010-07-28 10:18:41 +0000'
date_gmt: '2010-07-28 12:18:41 +0000'
categories:
- Link del día
- Technology
tags: []
---

El título no es novedoso de por sí, todos sabemos que los intérpretes o compiladores de código se escriben también con algún tipo de código. A veces, y eso es lo que puede ser nuevo para nosotros, es en el mismo código. Por ejemplo, el famoso compilador de [GCC](http://gcc.gnu.org/) está escrito en C.

Pero lo que quería mostrarles hoy es una característica de .NET no tan conocida, o al menos no tan utilizada, y se trata de la compilación de código on-the-fly, basado en el ejemplo muy bien explicado que pueden ver en el artículo de Rick Strahl, llamado [Executing Dynamic Code in .NET](http://www.west-wind.com/presentations/dynamicCode/DynamicCode.htm). Dicha presentación explica (con buenos ejemplos y detalles) cómo sólo con una entrada de texto podemos generar las clases y métodos que serían representados por ese código. No sólo eso, sino formas alternativas de compilarlo, separándolo o no de nuestro dominio de aplicación, y cómo se pueden utilizar clases de scripting para ello.

Yo en realidad encontré eso mientras buscaba otra cosa, estaba buscando algo equivalente al famoso [ClassLoader de Java](http://tutorials.jenkov.com/java-reflection/dynamic-class-loading-reloading.html). No sólo encontré un buen ejemplo, simple y claro llamado [C# - Dynamic Class Loading](http://www.michael-clarke-blog.com/2008/04/05/c-dynamic-class-loading/), sino que encontré un muy buen artículo para aquellos que comenzaron en C# desde Java: [C# From a Java Developer's Perspective](http://www.25hoursaday.com/CsharpVsJava.html). Este es el famoso "C# vs Java" que muchas veces se menciona.

_Soy un zorrinito dinámico._
