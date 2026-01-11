---
title: Pro ASP.NET MVC3 Framework
date: 2012-02-04 19:19:31 +0000
date_gmt: 2012-02-05 00:19:31 +0000
categories:
  - Books
  - Development
tags:
  - JavaScript
  - Microsoft
  - jQuery
  - AJAX
  - review
  - MVC
  - TDD
  - ASP.NET
  - ASP.NET MVC 3
  - DDD
  - book
  - AOP
description: Libro sobre MVC3, buena aproximación para principiantes, 4 zorrinitos.
---


Acabo de terminar de leer [Pro ASP.NET MVC3 Framework](http://www.apress.com/9781430234043), un libro de Apress, escrito por Adam Freeman y Steven Sanderson. En pocas palabras, el libro es muy bueno, no exageradamente detallado pero buena aproximación para quiénes quieran ganar un nivel principiante/intermedio en la plataforma. Determinadas características han quedado afuera, y por supuesto, detalles de la implementación del framework también. Eso habría sido material para una buena cantidad de otros libros. Este en particular está muy orientado al ejemplo práctico, y es ideal para afianzar teoría con pequeños snippets de código que la hacen práctica. Cubre algunos aspectos relacionados a esto para darle un buen contexto y es una buena opción por su precio, pero no es suficiente para el que quiera entrar demasiado profundo en los interiores de la plataforma.

El libro se divide en tres grandes partes. La primera parte, llamada _Introduciendo ASP.NET MVC 3_, es una explicación muy a vuelo de pájaro de qué es [MVC](http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller), cómo es la aproximación de Microsoft a él y unos ejemplos básicos para demostrar la organización de una aplicación MVC. Se habla un poco de inyección de dependencia, haciendo uso de [Ninject](http://ninject.org/), pero su aplicación es de lo más básica y no justamente asociada a las buenas prácticas, aunque como primer paso, es bueno. Habla de [DDD](http://en.wikipedia.org/wiki/Domain-driven_design) y de [TDD](http://en.wikipedia.org/wiki/Test-driven_development), ayudado de [Moq](http://code.google.com/p/moq/), desde un punto de vista tan superficial que no hacen impacto en el resto del contenido, pero siguen estando ahí.

La segunda parte del libro, _ASP.NET MVC3 en Detalle_, comienza a hablar del sistema de ruteo, de cómo se enlazan a él los controladores y las acciones, el uso de filtros (casi tocando [AOP](http://en.wikipedia.org/wiki/Aspect-oriented_programming) para controladores, pero no mencionándolo), uso de controladores propios, autorización, generación de un engine propio de vistas, uso de helpers, vistas parciales, acciones hijas, templates de modelos, binding de modelos, validación, AJAX, y el uso de jQuery. En estos últimos dos puntos debo hacer una aclaración: la forma en la que se implementa AJAX es todavía muy Microsoft-oriented, del estilo de hacer una receta y que todo funcione de forma mágica. Se queda muy corto para customizaciones y aplicaciones reales con lógica de cliente compleja, pero recordemos que este libro es sobre ASP.NET MVC, no sobre JavaScript. Aún así, es un buen comienzo para profundizar en otro libro.

La tercera y última parte, _Entregando Projectos ASP.NET MVC 3 Exitosos_, cubre varios puntos extras no exactamente de a la plataforma pero relacionados. Uno de ellos es la seguridad. Se le dedica un capítulo entero a determinados tipos de ataque y forma de evitarlos. Como los otros temas tangenciales, no es una guía definitiva, pero un buen punto para comenzar. Otro capítulo está dedicado a la autenticación y la autorización, sin mucho detalle y sin mucho ejemplo esta vez, pero pasos básicos que nos permiten conocer varias opciones distintas para las distintas situaciones que debamos afrontar. El último capítulo de esta parte se enfoca en el deployment y la generación de paquetes de instalación. Nuevamente, no contiene mucho detalle.

El libro en general es bueno como introducción y bueno como ejercicio de aprendizaje. Es detallado en el comienzo y light al final, con lo cual sus 836 páginas en realidad son un resumen de mucho más que podría cubrirse. Es un balance apropiado, con lo cual recomiendo su lectura. Le otorgo unos 4 zorrinitos.
