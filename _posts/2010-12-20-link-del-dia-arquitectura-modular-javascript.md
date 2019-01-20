---
layout: post
published: true
title: 'Link del día: Arquitectura Modular JavaScript'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 2729
wordpress_url: http://blog.alphasmanifesto.com/?p=2729
date: '2010-12-20 12:00:10 +0000'
date_gmt: '2010-12-20 14:00:10 +0000'
categories:
- Link del día
tags:
- JavaScript
- Twitter
- desarrollo web
- arquitectura
- design
- presentación
- modular
---

Gracias a JH me llega esta interesantísima presentación sobre un ámbito algo descuidado por lo general del desarrollo web: la parte programática de la interfaz. En esta presentación llamada [Scalable JavaScript Application Architecture](http://www.slideshare.net/nzakas/scalable-javascript-application-architecture), [Nicholas Zakas](http://www.nczonline.net/) nos presenta una arquitectura modular extensible, en donde cada módulo independiente solamente conoce el sandbox en el cual interactúa, aislado de todos los demás módulos, y sin  siquiera conocer cómo es la aplicación web en la que está funcionando.

Parecería que esto no aplica en entornos en donde los distintos módulos tienen que reaccionar frente a acciones realizadas en otros módulos, pero bajo el ejemplo de Twitter, se nos explica cómo es que los módulos pueden registrarse para afrontar cambios cuando sea necesario, de una forma bastante desacoplada.

Tengan en cuenta que el señor Zakas es ingenierio de frontend de Yahoo!, con lo cual, estamos hablando de alguien que tiene a su cargo una página con mucha funcionalidad y mucho trabajo de performance y desarrollo. Por supuesto, tampoco dejen de ver el resto de [sus presentaciones](http://www.slideshare.net/nzakas), igual de interesantes.

_Soy un zorrinito javascript._
