---
title: Alpha's Manifesto deployment
date: 2012-08-22 18:00:59 +0000
date_gmt: 2012-08-22 23:00:59 +0000
categories:
  - Projects
  - Tools
tags:
  - open source
  - PHP
  - free software
  - WordPress
  - GitHub
  - git
  - integración
  - bash
  - theme
subtitle: Open source & automatic deployments
description: Open source theme released, automatic deployments with security measures.
---


Aquí hay dos noticias en realidad: Por un lado, _Alpha's Manifesto_, el theme de este blog, es ahora open source (work in progress) y por otro lado, logré configurar deployments automáticos para cuando ocurran cambios en este theme.

<!--more-->

## Theme open source

No sé qué tanto sea la compatibilidad de un theme de Wordpress con licencias open source, pero sé que las hay y me importa poco si no fueran del todo compatibles, porque este es mi código y yo lo trabajé. Como tal, libero el theme de Alpha's Manifesto en un formato open source y [disponible en GitHub](https://github.com/AlphaGit/alphasmanifesto). Cualquiera que lo encuentre ahí puede reusarlo a gusto, y los pull requests y modificaciones son bienvenidos. Ya tengo un [listado de issues](https://github.com/AlphaGit/alphasmanifesto/issues?state=open) que tengo pendientes, y de a poco iré trabajando, sin tiempos límites. También están bienvenidos a trabajar en ellos si así lo quisieran, y acepto nuevos requests también.

No he decidido específicamente qué licencia de open source le daré, pero el mínimo permisivo será un [CC BY SA](http://freedomdefined.org/Licenses/CC-BY-SA), y como máximo será un [Do What The Fuck You Want Public License](http://sam.zoy.org/wtfpl/). Estoy seriamente considerando esta última, pero realmente me gustaría ver gente contribuyendo, aunque forzarlo me parece mala idea. Lo consultaré con la almohada y le daré una licencia oficial en GitHub pronto.

Debo también verificar que la licencia que yo elija no tenga conflictos con los componentes que estoy reusando. En este momento, como pueden ver en el [archivo de readme](https://github.com/AlphaGit/alphasmanifesto/blob/release/README.md), son jQuery, jqDock, 1140 CSS Grid, el reset de Eric Meyer y el servicio AddThis. La solución fácil ante los conflictos será simplemente sacar la referencia (así que empresas, no presionen) y la solución difícil ante los conflictos es una en la que no quiero participar.

Acepto sugerencias.

## Automatic Deployments

Encontré un post algo viejo, llamado [How to deploy your code from GitHub automatically](http://shinyplasticbag.posterous.com/how-to-deploy-your-code-from-github-automatic), que básicamente explica cómo aprovechar el uso de _Service Hooks_ para hacer una llamada que ejecutará un script PHP en otro lado del mundo, trayendo la última información de GitHub con un clon del repositorio, y a partir de ahí, haciendo cualquier otra cosa que tenga que hacer.

En mi caso, le hice algunas variaciones. Por un lado, y por una cuestión de seguridad, mi archivo no se llama simplemente "_deploy.php_", sino que lo llamé deploy_<randomString>.php. Actualmente GitHub y mi web server son los únicos dos que tienen la información del nombre y localización de ese archivo. De esa forma, GitHub puede secretamente llamar a ese script sin miedo a que alguien más esté generando trabajo extra en el server.

Mi script hace básicamente las siguientes cosas:

1. **Hace un pull de una rama** en particular, la rama que llamé [release](https://github.com/AlphaGit/alphasmanifesto/tree/release). Esta rama solo tendrá cambios que hayan sido probados e integrados con el resto del sistema. Estoy pensando en cambiar esto y hacer que master sea esa rama y que el trabajo ocurra en otras.
1. **Se guarda el output de este comando****y me lo envía por email** (para que yo pueda verificar que todo salió bien).
1. **Copia los archivos a la carpeta destino**. Puedo llegar a obviar este paso si el comando lo ejecuto en la misma carpeta en donde está el theme, y realmente lo recomiendo, ya que hacer un pull en donde no haya cambios sólo generará la llamada al repositorio y podrá evitarse, sin mucha inteligencia, mover archivos que no hayan cambiado. También se puede hacer uso de las funciones de archivado de bash, para evitar copiar archivos que no hayan cambiado, pero no sé cómo funcione eso con Git.

Como otra precaución de seguridad, esta conexión sólo está configurada con la URL de acceso público, de sólo lectura, de GitHub. De esa forma, aunque alguien lograra acceso al servidor, no tendría credenciales necesarias para afectar el código de este theme.
