---
layout: post
status: publish
published: true
title: 'Link del día: El castor ocupado'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 2004
wordpress_url: http://blog.alphasmanifesto.com.ar/?p=2004
date: '2010-04-05 12:20:14 +0000'
date_gmt: '2010-04-05 14:20:14 +0000'
categories:
- Link del día
tags:
- simulación
- Youtube
- teoría de la información
- algoritmo
comments:
- id: 6054
  author: leandro
  author_email: papaeze@hotmail.es
  author_url: ''
  date: '2010-05-04 20:40:56 +0000'
  date_gmt: '2010-05-04 22:40:56 +0000'
  content: hola necesitaria saber como se espesifican las propiedades de los algoritmos
    para programar las maquinas de turing
- id: 6059
  author: Alpha
  author_email: alpha@furries.com.ar
  author_url: http://www.alphasmanifesto.com.ar/
  date: '2010-05-04 22:43:30 +0000'
  date_gmt: '2010-05-05 00:43:30 +0000'
  content: |-
    Hola Leandro.
    No sé exactamente a qué tipo de propiedades de algoritmos te refieras, pero si te refieres a qué tipo de notación se utiliza para escribir algoritmos de máquinas de Turing, se suelen usar varias notaciones distintas, e incluso he visto algunas que no son nada comunes pero sirven.

    Hay una en particular (cuyo nombre no recuerdo ahora) que se formaba con líneas, símbolos (cuando se escribía en la cinta o se leía de ella) y R para mover a derecha, y L para mover a izquierda. Las líneas indicaban según qué símbolo había en la cinta, qué era lo que debía hacerse a continuación.

    Si es eso lo que buscas, puedo buscar cuál era el nombre de esa notación.

    Saludos!
---

Para quién no lo sabe, una Máquina de Turing es una máquina conceptual que consta de una "cabeza" sobre una "cinta" que puede moverse a izquierda o derecha, y leer o escribir. Se supone que con esas cuatro operaciones básicas, la máquina conceptual de Turing es capaz de realizar cualquier algoritmo computable existente. Sí, desde sumar dos números hasta calcular los dígitos de &pi;. Desde revertir una cadena de texto hasta ser un servidor web (aunque lo veo como poco eficiente para eso). Para diagramar los algoritmos que ejecutan, se utilizan _estados_ sobre los pasos que están ejecutando, y lo que se puede leer o escribir trata de un _alfabeto_ en particular (es decir, algún conjunto de símbolos que se le llama _alfabeto_ de esa máquina).

Lejos de ser una metáfora a la publicidades de pasta dental, el [Castor Ocupado](http://en.wikipedia.org/wiki/Busy_beaver) es un algoritmo para máquinas de Turing que, dada una cantidad de estados y una cantidad de elementos de alfabeto, debe correr tanto tiempo como sea posible para luego detenerse.  ¿Qué significa esto en términos de computabilidad? Significa que debe de ser, bajo una cantidad limitada de condiciones, el algoritmo más largo no-infinito, lo cual, de alguna forma es un desafío para encontrar aquello que tome más tiempo de computación y no sea interminable.

 ¿La razón? No es pura búsqueda por el buscar como muchos pueden suponer (y como muchos lo buscan, por simple diversión), sino que detrás de esto existe la teoría de la computación, en cuanto a qué algoritmos son computables (por ejemplo, parece que los que se encuentran sí, pero el algoritmo para encontrarlos no), qué orden de computación tienen, y seguramente también se relaciona con el tipo de problemas que son computables y no computables, pero dejaré eso para el futuro.

Hubo alguien más, Peteris Krumins, que le encontró una veta artística. Por un lado, hay un video en Youtube de [una máquina de Turing (construida) corriendo el castor ocupado](http://www.youtube.com/watch?v=2PjU6DJyBpw), y por otro lado, Peteris mismo hizo un programita que va dejando un archivo con el estado de la cinta a medida que la máquina va ejecutando, y de ahí, generar una imagen en donde se vea gráficamente. En su blog, en el artículo del [Problema del Castor Ocupado](http://www.catonmat.net/blog/busy-beaver/),  habla de los algoritmos y los resultados que obtuvo ejecutándolos. Curiosas las imágenes, e impresionante la imagen de 5 estados y2 símbolos, para verla completa hace falta una bueeeeeeeena pantalla.

_Soy un zorrinito ocupado._
