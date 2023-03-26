---
title: Métricas de code review
date: 2009-02-24 22:03:53 +0000
date_gmt: 2009-02-25 00:03:53 +0000
categories:
  - Projects
  - Technology
tags: []
description: >-
  Desarrollando técnicas para automatización de code reviews. Estandarización,
  arquitectura, code-coverage, estabilidad, flexibilidad, recursos, performance.
  Futuro útil.
---

<div>

En estos días me encuentro desarrollando técnicas para la automatización y estadarización de resultados de code reviews de los distintos proyectos que estén siendo implementados. La idea es poder tener una idea cuasi-numérica de qué tan bien o qué tan mal está desarrollada una aplicación.

Si bien no está decidido y apenas he comenzado con esa idea, estoy seguro que hay muchas cuestiones que sin duda serán ponderadas ahí. Entre ellas:

- **Estandarización:** qué tan bien se respeta el estándar propuesto para trabajar (nombres, capitalización, formas en que se conocen distintas clases)
- **Arquitectura:** qué tanto se respeta la arquitectura, sea cual sea la utilizada (decidido al comienzo del proyecto)
- **Code-coverage:** cuánto código se encuentra cubierto por pruebas de unidad (code-coverage percentage)
- **Estabilidad:** cuánto código se encuentra capturando errores que puedan generar y la forma en que los tratan
- **Flexibilidad:** cuánto funcionamiento de la aplicación se encuentra parametrizado y cuánto se encuentra cableado en el código o codificado según la lógica del negocio
- **Recursos:** cuántos recursos utiliza innecesariamente o aprovecha eficientemente el sistema
- **Performance:** de qué forma se realizan ciertas acciones que podrían mejorarse desde el punto de vista de la velocidad y la respuesta al usuario

Si bien no tengo mucha idea aún de la forma de evaluarlo, se me estaba ocurriendo basarme en sistemas de scoring estandarizados, como pueden ser el [CCWAPSS](http://ccwapss.blogspot.com/) para seguridad de aplicaciones web, en donde cada criterio a ser tenido en cuenta debe cumplir una serie de requisitos y es evaluado según una serie de preguntas simples que son fáciles de responder para el evaluador.

Incluso fantaseaba con llegar a un punto tal en donde esto pudiera automatizarse. Sé que muchas de las cuestiones serán altamente imposible de programar (o al menos, altamente difíciles de llevar a código), pero cuestiones como la forma en que se respeta la arquitectura, la estandarización y el code-coverage son fácilmente codificables para cualquier sistema que con algún u otro medio pueda reconocer el código y tracear dependencias y relaciones.

En fin, es un proyecto que apenas está empezando, y no dudo que pueda tener un futuro muy útil.

_Soy un zorrinito review._

