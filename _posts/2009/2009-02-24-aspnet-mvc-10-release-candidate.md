---
title: ASP.NET MVC 1.0 Release Candidate
date: 2009-02-24 00:19:26 +0000
date_gmt: 2009-02-24 02:19:26 +0000
categories:
  - Technology
tags: []
description: >-
  Microsoft publicación gratuita, siguiendo indicaciones, instalación indolora,
  organizado, respeta estructura MVC, buena manutención, flexibilidad limitada,
  intuitivo, performance aún por demostrar, release candidate.
---

<div>

Hoy anduve probando esta publicación de Microsoft que pueden descargarse gratuitamente desde [aquí](http://go.microsoft.com/fwlink/?LinkID=141184&amp;clcid=0x409), disponible para VS 2008. Estaba siguiendo las indicaciones que mostraban más que nada las nuevas features, que leí en [Scott's Blog](http://weblogs.asp.net/scottgu/archive/2009/01/27/asp-net-mvc-1-0-release-candidate-now-available.aspx), pero imagino de todos modos que el [sitio oficial de ASP.NET MVC](http://www.asp.net/mvc/) estará lleno de tutoriales y explicaciones al respecto.

La instalación es totalmente indolora, tan natural como el típico "Acepto, siguiente, siguiente" y el instalador se encarga de todo por nosotros. Fuera de eso, la integración a VS 2008 se hace a través de un nuevo project template, en este caso, el ASP.NET MVC Web Application, que ya incorpora cierta estructura que incluye una definición de Master Pages. También se encuentra muy organizado el proyecto, separando obviamente Views, Controllers y Models, pero incluyendo además una sección en donde organizar la estructura de nuestro sitio web, como puede ser la sección de Scripts, Content, o (de forma opcional) Code Templates, que nos permiten extender y modificar el comportamiento por defecto para la generación de muchos elementos.

Con algunas primeras pruebas y experimentaciones, pude ver que realmente es muy ordenada la forma en que está pensado para trabajar, y que en muchos aspectos respeta la esctructura de MVC, incluso en muchos aspectos no permitiéndonos saltar el esquema de trabajo para que todo se haga - por decirlo de alguna forma - de la manera que debe hacerse. Esto, si bien quita un poco de flexibilidad, garantiza una buena manutención del código.

Me gustaría poder opinar en términos de performance, pero el haber efectuado pequeñas pruebas no me da mucha evidencia de algo que marque realmente una diferencia. Personalmente no noté mucha distancia en tiempos de lo que tardaría un sitio diseñado con algún otro patrón, pero sí entiendo que existe mucho procesamiento de fondo que está siendo hecho, excepto que para algunos casos se esté cacheando mucho de la solución en sí.

Más allá de eso, es altamente reconocible el trabajo que han hecho para que el programador pueda llevar a cabo el proyecto con código muy entendible, y, lo más interesante, con muchos templates que le hacen el trabajo muy rápido y dinámico. De esta forma, el programador puede concentrarse por "enlazar las partes", y programar tanto la lógica como la forma que debe verse y tratarse los datos, más que en pelear con las bases de datos, con cuestiones de diseño de objetos y demás cuestiones que no hacen a la funcionalidad final.

En fin, me parece una buena aproximación, aunque por alguna razón se siente que no está totalmente orientado a eso todavía, puesto que muchas de las features no funcionaron o se encuentran algo defectuosas todavía... pero recordemos que nos encontramos en una release candidate y no en una versión final.

_Soy un zorrinito MVC._

