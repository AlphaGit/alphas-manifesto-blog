---
layout: post
status: publish
published: true
title: 'Link del d&iacute;a: Cryptico.js'
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
- Link del d&iacute;a
tags:
- JavaScript
- seguridad
- librer&iacute;a
- encriptaci&oacute;n
- RSA
comments: []
---
<p style="text-align: justify;">Ya alguna vez hab&iacute;a mencionado una librer&iacute;a JavaScript para encriptar datos (<a href="https://blog.alphasmanifesto.com/2009/09/30/link-del-dia-jcryption/">jCryption</a>), pero nunca est&aacute; de m&aacute;s considerar otras alternativas. En este caso se trata de <a href="http://cryptico.wwwtyro.net/">cryptico.js</a>. El proyecto tambi&eacute;n es de Open Source y nos permite usar AES y RSA (o eso le&iacute;, pero la <a href="http://code.google.com/p/cryptico/">documentaci&oacute;n</a> s&oacute;lo menciona RSA), y con una serie de m&eacute;todos muy simples, nos permite operar con cadenas que queramos utilizar para transmitir de forma segura.</p>
<p style="text-align: justify;">Lo curioso es que podemos generar claves especificando el tama&ntilde;o de la misma, pudiendo ir desde una clave de 512 bits hasta 8192... pedazo de clave.</p>
<p style="text-align: justify;">Este tipo de encriptaci&oacute;n, por el hecho requerir una clave "insegura" para generar la clave RSA, no es inseguro de por s&iacute;. Recordemos que estamos hablando de encriptaci&oacute;n asim&eacute;trica, de forma que por m&aacute;s que se tenga la clave generada, no hay inseguridad, puesto que es la otra clave (la que se queda con nosotros, la privada) la que se usar&aacute; para desencriptar los datos.</p>
<p style="text-align: justify;"><em>Soy un zorrinito encriptado.</em></p>
