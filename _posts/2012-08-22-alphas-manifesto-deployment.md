---
layout: post
status: publish
published: true
title: Alpha's Manifesto deployment
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 4347
wordpress_url: http://blog.alphasmanifesto.com/?p=4347
date: '2012-08-22 18:00:59 +0000'
date_gmt: '2012-08-22 23:00:59 +0000'
categories:
- Technology
tags:
- open source
- PHP
- free software
- WordPress
- GitHub
- git
- integraci&oacute;n
- bash
- theme
comments: []
---
Open source & automatic deployments

<p style="text-align: justify;">Aqu&iacute; hay dos noticias en realidad: Por un lado, <em>Alpha's Manifesto</em>, el theme de este blog, es ahora open source (work in progress) y por otro lado, logr&eacute; configurar deployments autom&aacute;ticos para cuando ocurran cambios en este theme.</p>
<p><!--more--></p>
<h2 style="text-align: justify;">Theme open source</h2>
<p style="text-align: justify;">No s&eacute; qu&eacute; tanto sea la compatibilidad de un theme de Wordpress con licencias open source, pero s&eacute; que las hay y me importa poco si no fueran del todo compatibles, porque este es mi c&oacute;digo y yo lo trabaj&eacute;. Como tal, libero el theme de Alpha's Manifesto en un formato open source y <a href="https://github.com/AlphaGit/alphasmanifesto">disponible en GitHub</a>. Cualquiera que lo encuentre ah&iacute; puede reusarlo a gusto, y los pull requests y modificaciones son bienvenidos. Ya tengo un <a href="https://github.com/AlphaGit/alphasmanifesto/issues?state=open">listado de issues</a> que tengo pendientes, y de a poco ir&eacute; trabajando, sin tiempos l&iacute;mites. Tambi&eacute;n est&aacute;n bienvenidos a trabajar en ellos si as&iacute; lo quisieran, y acepto nuevos requests tambi&eacute;n.</p>
<p style="text-align: justify;">No he decidido espec&iacute;ficamente qu&eacute; licencia de open source le dar&eacute;, pero el m&iacute;nimo permisivo ser&aacute; un <a href="http://freedomdefined.org/Licenses/CC-BY-SA">CC BY SA</a>, y como m&aacute;ximo ser&aacute; un <a href="http://sam.zoy.org/wtfpl/">Do What The Fuck You Want Public License</a>. Estoy seriamente considerando esta &uacute;ltima, pero realmente me gustar&iacute;a ver gente contribuyendo, aunque forzarlo me parece mala idea. Lo consultar&eacute; con la almohada y le dar&eacute; una licencia oficial en GitHub pronto.</p>
<p style="text-align: justify;">Debo tambi&eacute;n verificar que la licencia que yo elija no tenga conflictos con los componentes que estoy reusando. En este momento, como pueden ver en el <a href="https://github.com/AlphaGit/alphasmanifesto/blob/release/README.md">archivo de readme</a>, son jQuery, jqDock, 1140 CSS Grid, el reset de Eric Meyer y el servicio AddThis. La soluci&oacute;n f&aacute;cil ante los conflictos ser&aacute; simplemente sacar la referencia (as&iacute; que empresas, no presionen) y la soluci&oacute;n dif&iacute;cil ante los conflictos es una en la que no quiero participar.</p>
<p style="text-align: justify;">Acepto sugerencias.</p>
<h2 style="text-align: justify;">Automatic Deployments</h2>
<p style="text-align: justify;">Encontr&eacute; un post algo viejo, llamado <a href="http://shinyplasticbag.posterous.com/how-to-deploy-your-code-from-github-automatic">How to deploy your code from GitHub automatically</a>, que b&aacute;sicamente explica c&oacute;mo aprovechar el uso de <em>Service Hooks</em> para hacer una llamada que ejecutar&aacute; un script PHP en otro lado del mundo, trayendo la &uacute;ltima informaci&oacute;n de GitHub con un clon del repositorio, y a partir de ah&iacute;, haciendo cualquier otra cosa que tenga que hacer.</p>
<p style="text-align: justify;">En mi caso, le hice algunas variaciones. Por un lado, y por una cuesti&oacute;n de seguridad, mi archivo no se llama simplemente "<em>deploy.php</em>", sino que lo llam&eacute; deploy_<randomString>.php. Actualmente GitHub y mi web server son los &uacute;nicos dos que tienen la informaci&oacute;n del nombre y localizaci&oacute;n de ese archivo. De esa forma, GitHub puede secretamente llamar a ese script sin miedo a que alguien m&aacute;s est&eacute; generando trabajo extra en el server.</p>
<p style="text-align: justify;">Mi script hace b&aacute;sicamente las siguientes cosas:</p>
<ol style="text-align: justify;">
<li><strong>Hace un pull de una rama</strong> en particular, la rama que llam&eacute; <a href="https://github.com/AlphaGit/alphasmanifesto/tree/release">release</a>. Esta rama solo tendr&aacute; cambios que hayan sido probados e integrados con el resto del sistema. Estoy pensando en cambiar esto y hacer que master sea esa rama y que el trabajo ocurra en otras.</li>
<li><strong>Se guarda el output de este comando</strong><strong>y me lo env&iacute;a por email</strong> (para que yo pueda verificar que todo sali&oacute; bien).</li>
<li><strong>Copia los archivos a la carpeta destino</strong>. Puedo llegar a obviar este paso si el comando lo ejecuto en la misma carpeta en donde est&aacute; el theme, y realmente lo recomiendo, ya que hacer un pull en donde no haya cambios s&oacute;lo generar&aacute; la llamada al repositorio y podr&aacute; evitarse, sin mucha inteligencia, mover archivos que no hayan cambiado. Tambi&eacute;n se puede hacer uso de las funciones de archivado de bash, para evitar copiar archivos que no hayan cambiado, pero no s&eacute; c&oacute;mo funcione eso con Git.</li>
</ol>
<p style="text-align: justify;">Como otra precauci&oacute;n de seguridad, esta conexi&oacute;n s&oacute;lo est&aacute; configurada con la URL de acceso p&uacute;blico, de s&oacute;lo lectura, de GitHub. De esa forma, aunque alguien lograra acceso al servidor, no tendr&iacute;a credenciales necesarias para afectar el c&oacute;digo de este theme.</p>
