---
layout: post
published: true
title: PrivateSky
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 3772
wordpress_url: http://blog.alphasmanifesto.com/?p=3772
date: '2012-04-10 09:27:34 +0000'
date_gmt: '2012-04-10 14:27:34 +0000'
categories:
- Link del día
tags:
- privacidad
- web application
- seguridad
- gobierno
- criptografía
- legal
- claves
---
Accesible para uno, secreto para todos


[PrivateSky](http://privatesky.me/) no es ni el primer ni el último intento de un servicio de seguridad en la nube. Lo que los distingue es que, según dicen, ni ellos mismos tienen acceso a los datos que nosotros guardamos, y que ni al momento de que el gobierno les requiera los datos, ellos los darían. (O eso dice su CEO.)

Alguien en IT Security preguntó: [ ¿Cómo puede PrivateSky no tener acceso a nuestros datos?](http://security.stackexchange.com/questions/13226/how-can-privatesky-not-see-your-data), y [la respuesta más extensa](http://security.stackexchange.com/a/13289/4395) la brinda, con lujo de detalles y tecnicismos, Brian Spector, el CEO de CertiVox. Debo admitir que no estuve al nivel de entenderla completamente, pero me queda claro cuál fue la estrategia general, y sé que en este tipo de cosas no se le puede mentir a la comunidad, al menos no en ese foro en particular.

En general, lo que ellos intentan es hacer un sistema de encriptación basado en identidad, en donde algo del lado del cliente siempre permita decriptar, algo que ellos en ningún momento reciben como clave completa, y en donde la forma de alterar esto generaría la destrucción de las demás partes de la clave. Esto significa, que sólo el usuario en acuerdo con el sistema puede cambiar la clave a otro valor, y que cualquier intento de hacerlo fuera de esa identidad básicamente perdería las claves que se pueden usar para decriptar los datos.

Por ahí preguntaron también cómo harían para evitar pedidos legales de información. Ellos se basado en un vacío legal que les permitiría entregar los datos encriptados, y defenderse diciendo que no tienen forma de decriptarlos, dejando la información segura de forma total. (Esto es, claro, excepto que la entidad gubernamental tenga los métodos apropiados para quebrar la encriptación, cosa por la que se apuesta que no ocurra.)

A pesar de lo transparente que se busca ser en esto, Brian Spector ha sido bastante cerrado en cuanto a la información de seguridad que dejó ver del sitio web.

Aún así, parece una aproximación muy novedosa.

_Soy un zorrinito privado._
