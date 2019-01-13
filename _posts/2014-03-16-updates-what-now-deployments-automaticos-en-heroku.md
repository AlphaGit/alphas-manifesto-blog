---
layout: post
status: publish
published: true
title: 'Updates what-now: deployments autom&aacute;ticos en Heroku'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5043
wordpress_url: http://blog.alphasmanifesto.com/?p=5043
date: '2014-03-16 15:49:22 +0000'
date_gmt: '2014-03-16 20:49:22 +0000'
categories:
- Projects
- Technology
tags:
- proyecto
- automatizaci&oacute;n
- instalaci&oacute;n
- git
- deployment
- NodeJS
- grunt
- bower
- npm
- Travis CI
- Heroku
- node
- test
- what-now
comments: []
---
<p style="text-align: justify;">Desde hace un tiempo estoy intentando lograr que mi aplicaci&oacute;n what-now se instale autom&aacute;ticamente en Heroku ante cambios realizado en su c&oacute;digo. Este art&iacute;culo cuenta sobre la traves&iacute;a de descubrir por qu&eacute; no me result&oacute; tan simple como uno esperar&iacute;a, y c&oacute;mo termin&oacute; el proceso final en una manera que me result&oacute; aceptable. Creo que es un buen resultado para reutilizar en otros proyectos, y tanto mejor que algunas recomendaciones que he visto por ah&iacute;.</p>
<p><!--more--></p>
<h2>Travis - Heroku: La traves&iacute;a</h2>
<h3><strong>24 de Febrero 2014</strong></h3>
<p style="text-align: justify;">Configur&eacute; la integraci&oacute;n de mi repositorio de git con Heroku para que se actualice autom&aacute;ticamente sobre la rama de release. Los archivos de configuraci&oacute;n de Travis CI son realmente muy simples y realmente est&aacute;n bien documentados, da gusto trabajar con algo as&iacute;. El caso de heroku no es tan as&iacute;, ya que es un poco distinto la forma en la que trabaja por dentro. Ellos idearon sus propios conceptos de stacks y dynos, que no es nada del otro mundo pero me tom&oacute; un rato hasta acostumbrarme.</p>
<p style="text-align: justify;">Seguimos juntando est&aacute;ndares, esta vez con el <code>Procfile</code> que determina la forma en la que se va a ejecutar la aplicaci&oacute;n, y que me sorprende que una aplicaci&oacute;n que se detecta que es de node (como lo indica heroku en sus documentos) y que se detecta que es una aplicaci&oacute;n web (como lo indica heroku en sus documentos) no levante un servidor web de Node. Hay que hacerlo a mano.</p>
<p style="text-align: justify;">Tras hacerlo como lo dicen en esta gu&iacute;a (<a href="http://www.sitepoint.com/deploying-yeomanangular-app-heroku/">Deploying a Yeoman/Angular app to Heroku</a>), me entero que uno de los pasos requeridos para poder usar los recursos minimizados es quitar de <code>.gitignore</code> el directorio <code>/dist</code>. Esto me parece una p&eacute;sima pr&aacute;ctica, y en b&uacute;squeda de evitarla, recurr&iacute; a yeoman generator-heroku.</p>
<p style="text-align: justify;">Lo instal&eacute; y comenzando a correrlo me pregunt&oacute; si quer&iacute;a un repositorio git independiente para el directorio <code>dist</code>. Esto me produjo demasiada extra&ntilde;eza e indagu&eacute; sobre lo que el c&oacute;digo hace. Logr&eacute; encontrarlo sin mucho problema, y lo que encontr&eacute; fue <a href="https://github.com/passy/generator-heroku/blob/master/app/index.js#L88">lo siguiente</a>: si mi respuesta hubiera sido "s&iacute;", yeoman heroku generaba un repositorio git independiente para el directorio de distribuci&oacute;n, commiteaba todos sus contenidos y generaba la aplicaci&oacute;n de heroku directamente desde este repositorio y no desde el directorio principal. Esta parece una soluci&oacute;n interesante, pero tiene la desventaja de requerir las herramientas de heroku en la m&aacute;quina en donde se ejecutan, lo que quiere decir que ser&aacute; dif&iacute;cil integrar en Heroku. A&uacute;n as&iacute;, parece ser la opci&oacute;n interesante.</p>
<p style="text-align: justify;">Si mi respuesta fuera "no", yeoman heroku se encarga de quitar <code>/dist</code> de mi <code>.gitignore</code>. &iexcl;No! &iexcl;Eso no resuelve mi problema! &iquest;Imaginan a cada commit, cada pull request, lleno de archivos compilados y minimizados? &iquest;Imaginan repositorios desincronizados en donde el c&oacute;digo fuente no se corresponda con la versi&oacute;n minimizada s&oacute;lo porque alguien olvid&oacute; correr <code>grunt:build</code> (y claro, porque nadie puede comparar a simple vista que esos archivos no hayan cambiado). Terrible.</p>
<h3>2 de Marzo de 2014</h3>
<p style="text-align: justify;">Pensar que eso era todo lo que hab&iacute;a que hacer para que el sistema funcionara era un caso optimista, pero la realidad fue distinta. Al momento de ejecutar todo el deploy en Heroku, el sistema fallaba con un error en donde no encontraba uno de los servicios que yo hab&iacute;a implementado. Muy correctamente, revisando los archivos que eran tra&iacute;dos al cliente, ya minificados, mi servicio efectivamente no exist&iacute;a. Comparando la salida de <code>grunt build:dist</code> con el archivo de scripts.js que el servidor devolv&iacute;a, me di cuenta que un m&oacute;dulo entero estaba faltando.</p>
<p style="text-align: justify;">Despu&eacute;s de pelear un tiempo m&aacute;s con esto logr&eacute; evitar ese problema, pero no solucionarlo. Mi soluci&oacute;n fue absolutamente quitar el m&oacute;dulo d3 y convertirlo en parte del m&oacute;dulo de whatNowApp. No estoy exactamente seguro de c&oacute;mo eso solucion&oacute; el problema, pero deduzco que debe tener que ver con la tarea de <code>grunt ngmin</code>, que se encarga de minimizar el archivo de la forma apropiada para Angular, de forma que luego la tarea de <code>uglify</code> no destruya referencias necesarias.</p>
<h3>3 de Marzo de 2014</h3>
<p style="text-align: justify;">Tras mis cambios anteriores no todo se encontraba solucionado: el <code>d3Service</code> ahora no formaba parte del archivo "uglyficado". Descart&eacute; que tenga que ver con m&oacute;dulos haciendo todo parte del mismo m&oacute;dulo. Descart&eacute; que fueran las versiones de los paquetes instalados en Travis y en mi m&aacute;quina local forzando todo a una misma versi&oacute;n.</p>
<p style="text-align: justify;">Finalmente el problema tenia que ver con un peque&ntilde;o problema: may&uacute;sculas. Mi archivo <code>d3Service</code> se llamaba en realidad <code>d3service</code> (may&uacute;scula en "s"), y, por supuesto, a mi entorno Windows no le importaba. La referencia en el archivo index.html estaba referenciando a d3Service.js, con lo cual una vez que renombr&eacute; el archivo y lo agregu&eacute; al repositorio con el nombre correcto, los procesos de deployment comenzaron a funcionar.</p>
<p style="text-align: justify;">El siguiente desafio era quitar mi "hack" de tener a Travis modificando manualmente los archivos de configuraci&oacute;n de git que le permit&iacute;a ejecutar grunt build y agregar los archivos resultantes al repositorio para luego commitearlos y enviarlos como resultado de deployment. Todo esto era bastante <em>hacky</em>, as&iacute; que reemplac&eacute; la estrategia de deployment de git por la de Anvil, que a la vez me gustaba m&aacute;s porque me evitaba recibir un correo de Heroku diciendo a cada deploy que se hab&iacute;a agregado una clave de acceso SSH a mi cuenta.</p>
<p style="text-align: justify;">Intent&eacute; lo m&aacute;s posible hacer que el proceso de deployment y compilaci&oacute;n ocurriera en Heroku, pero esto me obligaba a instalar dependencias de desarrollo ah&iacute;, aparte que los permisos de Heroku no son del todo igual a un entorno Linux cualquiera. Decid&iacute; no perder tanto el tiempo ya que la mitad del proceso a&uacute;n as&iacute; ten&iacute;a que hacerlo en Travis y terminar el proceso ah&iacute; de todos modos.</p>
<h2>El resultado</h2>
<p style="text-align: justify;">Finalmente logr&eacute; que todo funcionara de la forma esperada, pero no todo qued&oacute; totalmente "limpio". A&uacute;n as&iacute;, creo que llegu&eacute; a una soluci&oacute;n mejor que la de incluir "dist" en nuestro repositorio. Voy a explicar la forma en la que funciona el deploy, y espero comentarios y sugerencias de formas en la que podr&iacute;a mejorarse.</p>
<p style="text-align: justify;">El resultado final de los cambios que hacen esto posible, como ejemplo para otros proyectos, <a href="https://github.com/AlphaGit/what-now/pull/15/files">puede verse en el pull request de Heroku deployment</a>.</p>

![](/assets/What-now-Heroku-deployment.png)

<h3>GitHub: push to master</h3>
<p style="text-align: justify;">El primer paso es hacer un push de los cambios a la rama <code>master</code> del repositorio en GitHub. As&iacute; esto sea con un push directo a la rama o desde un pull request es irrelevante. Los pull requests y los commits separados tambi&eacute;n disparan builds de Travis, pero estos no est&aacute;n configurados para hacer deployments, aunque muy bien podr&iacute;a hacerse. En mi caso particular, elijo que solamente los cambios a <code>master</code> hagan un deploy completo a mi entorno de Heroku, para asegurarme que solo los cambios estables y probados sean aquellos que son enviados.</p>
<h3>Travis: npm install</h3>
<p style="text-align: justify;">Cuando el build se dispara, Travis tomar&aacute; la &uacute;ltima versi&oacute;n del c&oacute;digo e instalar&aacute; las dependencias del sistema para poder probarlo. Para esto reemplac&eacute; en el archivo <code>.travis.yml</code> la secci&oacute;n <code>install</code> para ejecutar los siguientes comandos:</p>
<p><code>npm install --no-optional --loglevel warn</code></p>
<p style="text-align: justify;">Este es un <code>npm install</code> com&uacute;n y corriente que instalar&aacute; las dependencias del proyecto. El primer par&aacute;metro hace que npm no instale las dependencias optionales de los paquetes, quiz&aacute; acelerando un poco el proceso de descarga (ya que, claro est&aacute;, menos dependencias deben bajarse e instalarse). Hasta ahora no me ha dado ning&uacute;n problema pero no descarto que pueda ocurrir. En teor&iacute;a no deber&iacute;a serlo, ya que las dependencias opcionales no deber&iacute;an ser "requeridas" para que el paquete funcione (de ah&iacute; su nombre de opcionales).</p>
<p style="text-align: justify;">El segundo par&aacute;metro configura a npm para mostrar mensajes s&oacute;lo de tipo warning o error, para minimizar la cantidad de cosas que se guardan en los logs de Travis. Tambi&eacute;n hace m&aacute;s simple seguirlos, pero es posible que hubiera que cambiarlos si por alguna raz&oacute;n extra&ntilde;a tuvieramos que ver qu&eacute; ocurre en su descarga.</p>
<p><code>npm install -g bower grunt-cli --no-optional --loglevel warn</code></p>
<p style="text-align: justify;">Este es otro comando <code>npm install</code>, pero instalar&aacute; los paquetes <code>grunt-cli</code> (grunt) y <code>bower</code> de forma global. Similarmente, no queremos dependencias opcionales y queremos mantener la salida de los comandos solamente a advertencias y errores.</p>
<p><code>bower install --quiet</code></p>
<p style="text-align: justify;">Finalmente, le pedimos a bower que instale las dependencias de front-end de nuestro proyecto. La opci&oacute;n <code>--quiet</code> tambi&eacute;n mantiene la salida a un m&iacute;nimo.</p>
<h3>Travis: npm test</h3>
<p style="text-align: justify;">Travis autom&aacute;ticamente correr&aacute; el comando <code>npm test</code>, que resultar&aacute; en <code>grunt test</code> siendo ejecutado, que compilar&aacute; el proyecto y correr&aacute; karma contra nuestros tests. De fallar los tests, en este punto Travis reporta el error y no se contin&uacute;a con la ejecuci&oacute;n del deployment.</p>
<h3>Travis: before_deployment</h3>
<p style="text-align: justify;">Una vez que los tests pasaron, Travis comenzar&aacute; el proceso para hacer el deployment de nuestro proyecto. Ya que es necesario preparar el proyecto y dejarlo de una forma lista para que Heroku pueda instalarlo, pasamos a instalar las dependencias necesarias para construir el proyecto en su estado listo para producci&oacute;n, agregarlo al repositorio (para que Heroku lo detecte) y enviarlo.</p>
<p><code>gem install sass compass --no-document --no-verbose</code></p>
<p style="text-align: justify;">Ya que nuestro proyecto depende de compass y de sass para construir los archivos CSS, instalamos esas gemas que son necesarias. Las opciones de --no-document y --no-verbose, como antes, est&aacute;n pensadas para mantener la instalaci&oacute;n a lo m&iacute;nimo necesario y lo mismo con la salida de consola.</p>
<p><code>grunt build</code></p>
<p style="text-align: justify;">Grunt construir&aacute; nuestro proyecto. La opci&oacute;n por defecto es la salida a producci&oacute;n, pero si no fuera el caso, siempre podemos agregar el target y nuestro comando final ser&iacute;a <code>grunt build:dist</code>. El resultado de nuestra aplicaci&oacute;n ya lista para el deploy estar&iacute;a en la carpeta dist.</p>
<p><code>yes | ruby prepare_git.rb</code></p>
<p style="text-align: justify;">Para poder incluir esa carpeta en nuestro repositorio, deberemos agregar la carpeta y hacer un commit, pero esto no puede ocurrir si git no est&aacute; configurado en Travis para tener la informaci&oacute;n del usuario actual. Para eso el archivo de ruby prepare_git modificar&aacute; el archivo .gitconfig local para agregar un usuario ficticio de Travis.</p>
<p><code>git add -f dist</code></p>
<p style="text-align: justify;">Ahora s&iacute; podemos agregar nuestra carpeta dist con el flag de <code>--force</code> o <code>-f</code> para que, sin importar si se encuentra en .gitignore o no (spoiler: s&iacute; lo est&aacute;), sea agregado al index de todos modos.</p>
<p><code>git commit -q -m "Deployment"</code></p>
<p style="text-align: justify;">Finalmente, podemos hacer el commit de nuestro agregado de la carpeta, y ya lo tenemos en el reposiorio que Heroku tomar&aacute; para hacer su deploy.</p>
<h3>Travis: deploy</h3>
<p style="text-align: justify;">El deploy de Travis es bastante simple y puede configurarse siguiendo <a href="http://docs.travis-ci.com/user/deployment/heroku/">la documentaci&oacute;n que ellos proveen para Heroku</a>: s&oacute;lo tenemos que aclarar cu&aacute;l es nuestra aplicaci&oacute;n, nuestra clave de API, el proveedor (heroku), la rama de la cual hacer deploy, la estrategia (anvil) y quiz&aacute; alg&uacute;n que otro comando a ejecutar luego de instalar la aplicaci&oacute;n.</p>
<h3>Heroku: npm install</h3>
<p style="text-align: justify;">Mientras Anvil est&aacute; preparando nuestro deployment, ejecutar&aacute; <code>npm install --production</code>, lo que traer&aacute; las dependencias de nuestro proyecto, pero solo las que son necesarias para correrlo. Finalmente todo el proyecto pasar&aacute; a Heroku.</p>
<h3>Heroku: Procfile</h3>
<p style="text-align: justify;">Por &uacute;limo, Heroku utilizar&aacute; nuestras definiciones en Procfile para identificar qu&eacute; procesos correr. En nuestro caso, utilizamos un archivo <code>server.js</code> que levantar&aacute; express y servir&aacute; los archivos de la carpeta <code>dist</code>.</p>
<h2 style="text-align: justify;">Conclusi&oacute;n</h2>
<p style="text-align: justify;">No s&oacute;lo descubr&iacute; una buena forma de lograr estos deployments, sino que adem&aacute;s ya tengo feedback instant&aacute;neo de los estados de los builds y los pull requests, los deployments automatizados, &iexcl;y la aplicaci&oacute;n online! Se puede ver en <a href="http://what-now.herokuapp.com/">http://what-now.heroku.com</a>.</p>
