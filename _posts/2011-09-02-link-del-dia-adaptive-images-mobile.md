---
layout: post
published: true
title: 'Link del día: Adaptive Images (mobile)'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 3242
wordpress_url: http://blog.alphasmanifesto.com/?p=3242
date: '2011-09-02 09:52:16 +0000'
date_gmt: '2011-09-02 14:52:16 +0000'
categories:
- Link del día
tags:
- Imágenes
- PHP
- navegadores
- librería
- cookies
- pantalla
---

Nuevamente de la gente de [CSS Tricks](http://css-tricks.com/13982-adaptive-images/) me llega un dato de una librería muy útil. En este caso es [Adaptive Images](http://adaptive-images.com/), es una librería en PHP que nos permite servir imágenes con el tamaño justo dependiendo del tipo de cliente. No sólo se hace la diferenciación del tipo de cliente, sino del tamaño de la pantalla real.

Cómo es que funciona? Básicamente al momento de cargar la página un javascript se ejecuta antes de que ejecute el cuerpo. Este javascript carga una cookie en nuestro navegador con esa información de tamaño de pantalla, y cuando nuestro navegador procede a buscar las imágenes, ese cookie viaja también y el servidor puede devolver una imagen del tamaño justo.

Por supuesto que posee varias opciones de configuración para servir imágenes de la mejor forma para nuestra necesidad, y por supuesto, podemos servir una imagen de baja resolución si la ventana del navegador tenía poco espacio y luego se amplió. Pero hay workarounds para todo, de forma que sigue siendo una herramienta útil.

_Soy un zorrinito adaptativo._
