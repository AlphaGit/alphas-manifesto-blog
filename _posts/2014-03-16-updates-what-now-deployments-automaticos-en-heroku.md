---
layout: post
status: publish
published: true
title: 'Updates what-now: deployments automáticos en Heroku'
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
- automatización
- instalación
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
La travesía y el resultado final


Desde hace un tiempo estoy intentando lograr que mi aplicación what-now se instale automáticamente en Heroku ante cambios realizado en su código. Este artículo cuenta sobre la travesía de descubrir por qué no me resultó tan simple como uno esperaría, y cómo terminó el proceso final en una manera que me resultó aceptable. Creo que es un buen resultado para reutilizar en otros proyectos, y tanto mejor que algunas recomendaciones que he visto por ahí.

<!--more-->

## Travis - Heroku: La travesía

### **24 de Febrero 2014**

Configuré la integración de mi repositorio de git con Heroku para que se actualice automáticamente sobre la rama de release. Los archivos de configuración de Travis CI son realmente muy simples y realmente están bien documentados, da gusto trabajar con algo así. El caso de heroku no es tan así, ya que es un poco distinto la forma en la que trabaja por dentro. Ellos idearon sus propios conceptos de stacks y dynos, que no es nada del otro mundo pero me tomó un rato hasta acostumbrarme.

Seguimos juntando estándares, esta vez con el `Procfile` que determina la forma en la que se va a ejecutar la aplicación, y que me sorprende que una aplicación que se detecta que es de node (como lo indica heroku en sus documentos) y que se detecta que es una aplicación web (como lo indica heroku en sus documentos) no levante un servidor web de Node. Hay que hacerlo a mano.

Tras hacerlo como lo dicen en esta guía ([Deploying a Yeoman/Angular app to Heroku](http://www.sitepoint.com/deploying-yeomanangular-app-heroku/)), me entero que uno de los pasos requeridos para poder usar los recursos minimizados es quitar de `.gitignore` el directorio `/dist`. Esto me parece una pésima práctica, y en búsqueda de evitarla, recurrí a yeoman generator-heroku.

Lo instalé y comenzando a correrlo me preguntó si quería un repositorio git independiente para el directorio `dist`. Esto me produjo demasiada extrañeza e indagué sobre lo que el código hace. Logré encontrarlo sin mucho problema, y lo que encontré fue [lo siguiente](https://github.com/passy/generator-heroku/blob/master/app/index.js#L88): si mi respuesta hubiera sido "sí", yeoman heroku generaba un repositorio git independiente para el directorio de distribución, commiteaba todos sus contenidos y generaba la aplicación de heroku directamente desde este repositorio y no desde el directorio principal. Esta parece una solución interesante, pero tiene la desventaja de requerir las herramientas de heroku en la máquina en donde se ejecutan, lo que quiere decir que será difícil integrar en Heroku. Aún así, parece ser la opción interesante.

Si mi respuesta fuera "no", yeoman heroku se encarga de quitar `/dist` de mi `.gitignore`. ¡No! ¡Eso no resuelve mi problema!  ¿Imaginan a cada commit, cada pull request, lleno de archivos compilados y minimizados?  ¿Imaginan repositorios desincronizados en donde el código fuente no se corresponda con la versión minimizada sólo porque alguien olvidó correr `grunt:build` (y claro, porque nadie puede comparar a simple vista que esos archivos no hayan cambiado). Terrible.

### 2 de Marzo de 2014

Pensar que eso era todo lo que había que hacer para que el sistema funcionara era un caso optimista, pero la realidad fue distinta. Al momento de ejecutar todo el deploy en Heroku, el sistema fallaba con un error en donde no encontraba uno de los servicios que yo había implementado. Muy correctamente, revisando los archivos que eran traídos al cliente, ya minificados, mi servicio efectivamente no existía. Comparando la salida de `grunt build:dist` con el archivo de scripts.js que el servidor devolvía, me di cuenta que un módulo entero estaba faltando.

Después de pelear un tiempo más con esto logré evitar ese problema, pero no solucionarlo. Mi solución fue absolutamente quitar el módulo d3 y convertirlo en parte del módulo de whatNowApp. No estoy exactamente seguro de cómo eso solucionó el problema, pero deduzco que debe tener que ver con la tarea de `grunt ngmin`, que se encarga de minimizar el archivo de la forma apropiada para Angular, de forma que luego la tarea de `uglify` no destruya referencias necesarias.

### 3 de Marzo de 2014

Tras mis cambios anteriores no todo se encontraba solucionado: el `d3Service` ahora no formaba parte del archivo "uglyficado". Descarté que tenga que ver con módulos haciendo todo parte del mismo módulo. Descarté que fueran las versiones de los paquetes instalados en Travis y en mi máquina local forzando todo a una misma versión.

Finalmente el problema tenia que ver con un pequeño problema: mayúsculas. Mi archivo `d3Service` se llamaba en realidad `d3service` (mayúscula en "s"), y, por supuesto, a mi entorno Windows no le importaba. La referencia en el archivo index.html estaba referenciando a d3Service.js, con lo cual una vez que renombré el archivo y lo agregué al repositorio con el nombre correcto, los procesos de deployment comenzaron a funcionar.

El siguiente desafio era quitar mi "hack" de tener a Travis modificando manualmente los archivos de configuración de git que le permitía ejecutar grunt build y agregar los archivos resultantes al repositorio para luego commitearlos y enviarlos como resultado de deployment. Todo esto era bastante _hacky_, así que reemplacé la estrategia de deployment de git por la de Anvil, que a la vez me gustaba más porque me evitaba recibir un correo de Heroku diciendo a cada deploy que se había agregado una clave de acceso SSH a mi cuenta.

Intenté lo más posible hacer que el proceso de deployment y compilación ocurriera en Heroku, pero esto me obligaba a instalar dependencias de desarrollo ahí, aparte que los permisos de Heroku no son del todo igual a un entorno Linux cualquiera. Decidí no perder tanto el tiempo ya que la mitad del proceso aún así tenía que hacerlo en Travis y terminar el proceso ahí de todos modos.

## El resultado

Finalmente logré que todo funcionara de la forma esperada, pero no todo quedó totalmente "limpio". Aún así, creo que llegué a una solución mejor que la de incluir "dist" en nuestro repositorio. Voy a explicar la forma en la que funciona el deploy, y espero comentarios y sugerencias de formas en la que podría mejorarse.

El resultado final de los cambios que hacen esto posible, como ejemplo para otros proyectos, [puede verse en el pull request de Heroku deployment](https://github.com/AlphaGit/what-now/pull/15/files).

![]({{ site.baseurl }}/assets/What-now-Heroku-deployment.png)


### GitHub: push to master

El primer paso es hacer un push de los cambios a la rama `master` del repositorio en GitHub. Así esto sea con un push directo a la rama o desde un pull request es irrelevante. Los pull requests y los commits separados también disparan builds de Travis, pero estos no están configurados para hacer deployments, aunque muy bien podría hacerse. En mi caso particular, elijo que solamente los cambios a `master` hagan un deploy completo a mi entorno de Heroku, para asegurarme que solo los cambios estables y probados sean aquellos que son enviados.

### Travis: npm install

Cuando el build se dispara, Travis tomará la última versión del código e instalará las dependencias del sistema para poder probarlo. Para esto reemplacé en el archivo `.travis.yml` la sección `install` para ejecutar los siguientes comandos:

```console
npm install --no-optional --loglevel warn
```

Este es un `npm install` común y corriente que instalará las dependencias del proyecto. El primer parámetro hace que npm no instale las dependencias optionales de los paquetes, quizá acelerando un poco el proceso de descarga (ya que, claro está, menos dependencias deben bajarse e instalarse). Hasta ahora no me ha dado ningún problema pero no descarto que pueda ocurrir. En teoría no debería serlo, ya que las dependencias opcionales no deberían ser "requeridas" para que el paquete funcione (de ahí su nombre de opcionales).

El segundo parámetro configura a npm para mostrar mensajes sólo de tipo warning o error, para minimizar la cantidad de cosas que se guardan en los logs de Travis. También hace más simple seguirlos, pero es posible que hubiera que cambiarlos si por alguna razón extraña tuvieramos que ver qué ocurre en su descarga.

```console
npm install -g bower grunt-cli --no-optional --loglevel warn
```

Este es otro comando `npm install`, pero instalará los paquetes `grunt-cli` (grunt) y `bower` de forma global. Similarmente, no queremos dependencias opcionales y queremos mantener la salida de los comandos solamente a advertencias y errores.

```console
bower install --quiet
```

Finalmente, le pedimos a bower que instale las dependencias de front-end de nuestro proyecto. La opción `--quiet` también mantiene la salida a un mínimo.

### Travis: npm test

Travis automáticamente correrá el comando `npm test`, que resultará en `grunt test` siendo ejecutado, que compilará el proyecto y correrá karma contra nuestros tests. De fallar los tests, en este punto Travis reporta el error y no se continúa con la ejecución del deployment.

### Travis: before_deployment

Una vez que los tests pasaron, Travis comenzará el proceso para hacer el deployment de nuestro proyecto. Ya que es necesario preparar el proyecto y dejarlo de una forma lista para que Heroku pueda instalarlo, pasamos a instalar las dependencias necesarias para construir el proyecto en su estado listo para producción, agregarlo al repositorio (para que Heroku lo detecte) y enviarlo.

```console
gem install sass compass --no-document --no-verbose
```

Ya que nuestro proyecto depende de compass y de sass para construir los archivos CSS, instalamos esas gemas que son necesarias. Las opciones de --no-document y --no-verbose, como antes, están pensadas para mantener la instalación a lo mínimo necesario y lo mismo con la salida de consola.

```console
grunt build
```

Grunt construirá nuestro proyecto. La opción por defecto es la salida a producción, pero si no fuera el caso, siempre podemos agregar el target y nuestro comando final sería `grunt build:dist`. El resultado de nuestra aplicación ya lista para el deploy estaría en la carpeta dist.

```console
yes | ruby prepare_git.rb
```

Para poder incluir esa carpeta en nuestro repositorio, deberemos agregar la carpeta y hacer un commit, pero esto no puede ocurrir si git no está configurado en Travis para tener la información del usuario actual. Para eso el archivo de ruby prepare_git modificará el archivo .gitconfig local para agregar un usuario ficticio de Travis.

```console
git add -f dist
```

Ahora sí podemos agregar nuestra carpeta dist con el flag de `--force` o `-f` para que, sin importar si se encuentra en .gitignore o no (spoiler: sí lo está), sea agregado al index de todos modos.

```console
git commit -q -m "Deployment"
```

Finalmente, podemos hacer el commit de nuestro agregado de la carpeta, y ya lo tenemos en el reposiorio que Heroku tomará para hacer su deploy.

### Travis: deploy

El deploy de Travis es bastante simple y puede configurarse siguiendo [la documentación que ellos proveen para Heroku](http://docs.travis-ci.com/user/deployment/heroku/): sólo tenemos que aclarar cuál es nuestra aplicación, nuestra clave de API, el proveedor (heroku), la rama de la cual hacer deploy, la estrategia (anvil) y quizá algún que otro comando a ejecutar luego de instalar la aplicación.

### Heroku: npm install

Mientras Anvil está preparando nuestro deployment, ejecutará `npm install --production`, lo que traerá las dependencias de nuestro proyecto, pero solo las que son necesarias para correrlo. Finalmente todo el proyecto pasará a Heroku.

### Heroku: Procfile

Por úlimo, Heroku utilizará nuestras definiciones en Procfile para identificar qué procesos correr. En nuestro caso, utilizamos un archivo `server.js` que levantará express y servirá los archivos de la carpeta `dist`.

## Conclusión

No sólo descubrí una buena forma de lograr estos deployments, sino que además ya tengo feedback instantáneo de los estados de los builds y los pull requests, los deployments automatizados, ¡y la aplicación online! Se puede ver en [http://what-now.heroku.com](http://what-now.herokuapp.com/).
