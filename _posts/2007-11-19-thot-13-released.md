---
layout: post
title: Thot 1.3 Released
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 163
wordpress_url: http://zorri2.wordpress.com/2007/11/19/thot-13-released/
date: '2007-11-19 15:42:00 +0000'
date_gmt: '2007-11-19 15:42:00 +0000'
categories:
- Projects
tags: []
---

Cambié la técnica de escalado de las fuentes.

Radicalmente.

Esto tiene una gran ventaja, que es la generación de conjuntos de datos mucho más homogéneos, y por tanto, una facilidad mucho mayor para las redes neuronales de aprender bajo dichos datos. A la vez, me deshice del problema del Font Padding, que es espacio extra que una fuente utiliza para generar una cadena en pantalla. (Gracias Graphics.MeasureString! No fuiste muy útil pero sí performante).

Sin embargo, con ello viene una gran desventaja, que es el tiempo extra de procesamiento (y claro! lo proceso todo a mano), pero por suerte arreglé el bug de la barra de progreso y algunos detalles más de la aplicación y el deploy.

Download de Thot, [aquí](http://alphagma.googlepages.com).

_Soy un zorrinito cambiante._
