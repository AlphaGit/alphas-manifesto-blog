---
layout: post
published: true
title: 'Link del día: Cryptico.js'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 3287
wordpress_url: http://blog.alphasmanifesto.com/?p=3287
date: '2011-09-27 10:11:39 +0000'
date_gmt: '2011-09-27 15:11:39 +0000'
categories:
- Link del día
tags:
- JavaScript
- seguridad
- librería
- encriptación
- RSA
---

Ya alguna vez había mencionado una librería JavaScript para encriptar datos (_jCryption_), pero nunca está de más considerar otras alternativas. En este caso se trata de [cryptico.js](http://cryptico.wwwtyro.net/). El proyecto también es de Open Source y nos permite usar AES y RSA (o eso leí, pero la [documentación](http://code.google.com/p/cryptico/) sólo menciona RSA), y con una serie de métodos muy simples, nos permite operar con cadenas que queramos utilizar para transmitir de forma segura.

Lo curioso es que podemos generar claves especificando el tamaño de la misma, pudiendo ir desde una clave de 512 bits hasta 8192... pedazo de clave.

Este tipo de encriptación, por el hecho requerir una clave "insegura" para generar la clave RSA, no es inseguro de por sí. Recordemos que estamos hablando de encriptación asimétrica, de forma que por más que se tenga la clave generada, no hay inseguridad, puesto que es la otra clave (la que se queda con nosotros, la privada) la que se usará para desencriptar los datos.

_Soy un zorrinito encriptado._
