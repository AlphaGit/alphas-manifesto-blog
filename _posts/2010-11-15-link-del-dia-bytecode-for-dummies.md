---
layout: post
published: true
title: 'Link del día: Bytecode for Dummies'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 2654
wordpress_url: http://blog.alphasmanifesto.com/?p=2654
date: '2010-11-15 17:20:51 +0000'
date_gmt: '2010-11-15 19:20:51 +0000'
categories:
- Link del día
tags:
- máquina virtual
- ".NET"
- Java
- desarrollo
- bytecode
- compilador
- plataforma
---

Para aquellos que desarrollamos sobre lo que se llaman plataformas (como por ejemplo .NET o Java), sabemos que el código que nosotros escribimos no se compila a lenguaje de máquina realmente, sino que se compila en algún lenguaje intermedio que luego es interpretado para una mejor ejecución en la máquina apropiada sobre la que esté corriendo la plataforma.

El punto que muchos dejamos de lado es saber interpretar ese lenguaje intermedio. Este lenguaje muchas veces puede proveernos información muy válida sobre problemas de performance que puede sufrir nuestra aplicación, usos de memoria no liberados, o incluso de la forma en la que se realizan llamadas al sistema operativo.

Charles Nutter realizó una presentación llamada [JVM Bytecode for Dummies (and for the rest of you all)](http://www.slideshare.net/CharlesNutter/redev-2010-jvm-bytecode-for-dummies) que explica detalladamente cómo podemos iniciarnos en este mundo. él se enfocó en el bytecode de la máquina virtual de Java, pero esto es aplicable a otras máquinas virtuales y a otras plataformas también. Puede que al principio nos maree un poco con ejemplos algo complejos, pero luego la teoría va tomando color hasta ser bastante tangible y podemos entender cómo el bytecode realmente refleja nuestro código. Mejor aún, podemos directamente programar con bytecode y aprovecharnos de eso mismo.

_Soy un zorrinito interpretado._
