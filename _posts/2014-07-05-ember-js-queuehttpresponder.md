---
layout: post
status: publish
published: true
title: 'Ember.js: queueHttpResponder'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5129
wordpress_url: http://blog.alphasmanifesto.com/?p=5129
date: '2014-07-05 18:50:06 +0000'
date_gmt: '2014-07-05 23:50:06 +0000'
categories:
- Projects
- Technology
tags:
- proyecto
- JavaScript
- unit testing
- data binding
- test
- EmberJS
- fakehr
- Ember helpers
- automated testing
comments: []
---
Solucionando incompatibilidad entre httpResponder + Ember 1.4.0+

<p style="text-align: justify;">Hace un tiempo encontr&eacute; una incompatibilidad bastante grande entre los sistemas de Ember.Testing y httpRespond, que imped&iacute;an a muchos&nbsp;programadores testear sus sistemas de forma autom&aacute;tica sin necesidad de un servidor de pruebas. M&aacute;s adelante explicar&eacute; qu&eacute; fue lo que gener&oacute; este problema, por qu&eacute; es un problema grave y el workaround que trabajamos con algunos colegas y algunos miembros del&nbsp;equipo de Ember.</p>
<p><!--more--></p>
<h2>&iquest;Qu&eacute; es Ember.Testing?</h2>
<p style="text-align: justify;">Ember.Testing es una parte del paquete de Ember que permite hacer testing automatizado sobre las aplicaciones. Este subpaquete&nbsp;ofrece varias utilidades que no permiten testear nuestra aplicaci&oacute;n, tanto por partes (unit testing) o con tests de acceptaci&oacute;n o de interacci&oacute;n de usuario.</p>
<p style="text-align: justify;">Por supuesto, simular interacci&oacute;n por parte del usuario no es algo simple, y para eso Ember.Testing nos provee una serie de&nbsp;<em>helpers</em>. Estos nos permitir&aacute;n llenar textos en campos, hacer click en distintos lugares, visitar partes de la aplicaci&oacute;n, verificar el estado actual de la pantalla, et cetera.</p>
<p style="text-align: justify;">Un test, por ejemplo, podr&iacute;a verse as&iacute;:</p>
<p><script src="https://gist.github.com/AlphaGit/2da8aeea06222df6bd93.js"></script></p>
<p style="text-align: justify;">M&aacute;s informaci&oacute;n sobre los helpers en <a href="http://emberjs.com/guides/testing/test-helpers/">la documentaci&oacute;n de Ember</a>.</p>
<h2>Helpers&nbsp;s&iacute;ncronos vs. helpers as&iacute;ncronos</h2>
<p style="text-align: justify;">Cabe destacar que los helpers se dividen en dos grandes categor&iacute;as: helpers s&iacute;ncronos o as&iacute;ncronos. Hay una buena raz&oacute;n para esta distinci&oacute;n: el&nbsp;<em>Ember run loop</em>. Cuando una aplicaci&oacute;n de Ember se est&aacute; ejecutando, existe un tiempo de inactividad peri&oacute;dico que le permite al usuario interactuar con la aplicaci&oacute;n, y tras eso, Ember verificar&aacute; si no hay cambios o eventos a los cuales debe responder. Este es el famoso run-loop de Ember, que se encargar&aacute; de actualizar propiedades computadas, bindings, disparar acciones, re-generar templates, etc.</p>
<p style="text-align: justify;">Como tales, los helpers de un test pueden funcionar una de dos maneras:</p>
<ul>
<li style="text-align: justify;"><strong>S&iacute;ncronos:</strong> No&nbsp;respetan el run-loop. Har&aacute;n lo que tengan que hacer de forma independiente de la aplicaci&oacute;n y devolver&aacute;n un resultado si es que fuera necesario. (Ejemplo: <code>find()</code>, busca un selector en el DOM y devuelve los resultados.)</li>
<li style="text-align: justify;"><strong>As&iacute;ncronos:</strong> Interactuando con la aplicaci&oacute;n: esperar&aacute;n a cierto momento y ejecutar&aacute;n sus acciones, permiti&eacute;ndole a la aplicaci&oacute;n reaccionar ante esos cambios. Como esto no se puede hacer en el mismo momento de ejecuci&oacute;n del test, generan una promesa y otros helpers as&iacute;ncronos encadenar&aacute;n sus acciones a la finalizaci&oacute;n de dicha promesa.</li>
</ul>
<h3>Necesitamos ir m&aacute;s profundo</h3>
<p style="text-align: justify;">En este punto mis m&aacute;s &aacute;vidos lectores se habr&aacute;n preguntado si esto es correcto, porque el run-loop de Ember se encuentra deshabilitado durante los tests. &iquest;C&oacute;mo es esto posible entonces?</p>
<p style="text-align: justify;">Ember.Testing posee su propio "run loop", que verifica lo siguiente antes de seguir ejecutando los tests luego de que cada helper haga su magia. Esto es tambi&eacute;n parte del helper de <code>wait()</code> que otros helpers llaman internamente: (<a href="https://github.com/emberjs/ember.js/blob/071b4bb6aad44100dc74ef8e1c79562e57038e7d/packages/ember-testing/lib/helpers.js#L145">referencia en el c&oacute;digo fuente</a>)</p>
<ol>
<li style="text-align: justify;">Verifica que no haya transiciones activas (pendientes de terminar)</li>
<li style="text-align: justify;">Verifica que no haya llamadas AJAX que falten ser resueltas</li>
<li style="text-align: justify;">Verifica que no haya timers esperando ser ejecutados (<code>Ember.run.scheduleOnce</code>, <code>Ember.run.later</code>, etc.)</li>
<li style="text-align: justify;">Verifica que la aplicaci&oacute;n no est&eacute; actualmente ejecutando un runLoop</li>
<li style="text-align: justify;">Verifica que todos los waiters registrados est&eacute;n resueltos</li>
</ol>
<p style="text-align: justify;">Si cualquiera de estas condiciones no se cumple, Ember.Testing simplemente esperar&aacute; 10 milisegundos m&aacute;s y volver&aacute; a evaluarlas. Si todas se cumplen, se ejecuta la resoluci&oacute;n de la promesa y el test sigue adelante.</p>
<h2>httpRespond</h2>
<p style="text-align: justify;"><a href="https://github.com/trek/ember-testing-httpRespond">ember-testing-httpRespond</a> es un paquete npm que nos permite reemplazar un servidor de respuestas AJAX por respuestas pre-definidas en JSON, de forma que no necesitemos implementar l&oacute;gica de servidor para cada test. Esto es muy bueno, porque simplifica parte de lo que estamos testeando, permiti&eacute;ndonos ajustar las respuestas que el servidor dar&iacute;a ante alguna situaci&oacute;n particular, y verificando que nuestra aplicaci&oacute;n de Ember se comporta de la forma que deber&iacute;a hacerlo en ese caso.</p>
<p style="text-align: justify;">Adem&aacute;s de ser m&aacute;s r&aacute;pido que un servidor real, permite amoldar los datos resueltos seg&uacute;n cada test particular. Esto es muy poderoso para el testing, y sin la necesidad de un backend, se puede tener m&aacute;s control sobre lo que cada test hace.</p>
<h2 style="text-align: justify;">El problema</h2>
<p style="text-align: justify;">Cuando Ember 1.4.0 fue publicado, uno de los arreglos que se encontraban en su c&oacute;digo era solucionar un problema interno que imped&iacute;a a la aplicaci&oacute;n se&ntilde;alar que una transici&oacute;n estaba incompleta, haciendo que el helper de <code>wait()</code> no esperara todo lo que realmente deb&iacute;a esperar en una transici&oacute;n de rutas (<a href="https://github.com/emberjs/ember.js/pull/4347">ember.js PR #4347</a>). Esto significaba que desde Ember 1.4.0, aquellos helpers o tests que ejecutaran <code>wait()</code>&nbsp;internamente deb&iacute;an esperar a que una transici&oacute;n (navegaci&oacute;n) a una determinada ruta terminara antes de poder seguir ejecutando (<a href="https://github.com/trek/ember-testing-httpRespond/issues/10">ember-testing-httpRespond, issue 10</a>).</p>
<p style="text-align: justify;">Dado que httpRespond utilizaba tests asincr&oacute;nicos para registrar sus respuestas, estas nunca llegaban a registrarse&nbsp;si la transici&oacute;n misma las estaba esperando&nbsp;(porque la llamada AJAX nunca se habr&iacute;a resuelto). Como una soluci&oacute;n a ese problema, httpRespond introdujo un nuevo helper llamado <code>visitAndRespond()</code> que pretend&iacute;a solventar el problema (<a href="https://github.com/trek/ember-testing-httpRespond/pull/13">ember-testing-httpRespond PR #13</a>). Esta no era la mejor soluci&oacute;n por una&nbsp;cantidad de razones:</p>
<ul style="text-align: justify;">
<li>Ya no se pod&iacute;a confiar que evaluaciones s&iacute;ncronas del tests estaban ocurriendo en la mitad de una transici&oacute;n (de hecho, s&oacute;lo se podr&iacute;an hacer verificaciones al final de una transici&oacute;n)</li>
<li>No permite responder a una transici&oacute;n que requiere m&uacute;ltiples respuestas AJAX para ser resueltas</li>
<li>No resuelve el mismo problema para cualquier otro helper distinto de&nbsp;<code>visit()</code> y que ejecute una transici&oacute;n (por ejemplo, un <code>click()</code> en un link)</li>
</ul>
<h2 style="text-align: justify;">La soluci&oacute;n (por ahora)</h2>
<p style="text-align: justify;">Al d&iacute;a de hoy nos encontramos a la espera de Ember 1.6.0 que cambiar&aacute; la forma en la que Ember permite la ejecuci&oacute;n del loop de testing, y permitir&aacute; acomodar ember-testing-httpRespond para solucionar esta situaci&oacute;n. Si bien estamos cerca de ello (Ember 1.6.0-beta est&aacute; ya disponible), tendremos que esperar un poco m&aacute;s para que todo est&eacute; listo y lo suficientemente maduro como para ser utilizado.</p>
<h3 style="text-align: justify;">queueHttpResponder</h3>
<p style="text-align: justify;">En el tiempo que eso pasa, tenemos una soluci&oacute;n alternativa, que, aunque no resuelve todos los problemas actuales, nos permit&eacute; utilizar&nbsp;esta aproximaci&oacute;n en conjunto con todos los helpers. Esta soluci&oacute;n funciona de forma independiente a los helpers o a los runLoops de Ember o de Ember.Testing, permitiendo m&aacute;s control sobre las respuestas de servidor en cualquier punto.</p>
<p style="text-align: justify;">Denomin&eacute; a esta soluci&oacute;n <strong>queueHttpResponder</strong>, que hace uso de fakehr de la misma forma que httpRespond lo hace, y cambia ligeramente la estrategia: en lugar de utilizar un helper as&iacute;ncrono para devolver respuestas, utilizamos un helper s&iacute;ncrono (o una funci&oacute;n) que las encolar&aacute; y permitir&aacute; en su propio loop responderlas para que los helpers de Ember puedan ejecutarse con normalidad, como si tuvi&eacute;ramos un servidor disponible.</p>
<p><script src="https://gist.github.com/AlphaGit/11225226.js"></script></p>
<p style="text-align: justify;">Nathan Palmer tom&oacute; esta soluci&oacute;n, agreg&oacute; unos ejemplos y convirti&oacute; las funciones en helpers que pueden utilizarse desde Ember.Testing:</p>
<p><script src="https://gist.github.com/nathanpalmer/11258730.js"></script></p>
<h3 style="text-align: justify;">Llev&aacute;ndolo m&aacute;s all&aacute;</h3>
<p style="text-align: justify;">En el proyecto en donde implement&eacute; estos cambios, agregu&eacute; tambi&eacute;n un helper llamado <code>queueDefaultResponses()</code>, que hac&iacute;a uso del helper <code>queueHttpResponse()</code> con todas las respuestas que la aplicaci&oacute;n necesita por defecto para comenzar su ejecuci&oacute;n, permitiendo a cada test simplemente registrar los cambios que necesita en su configuraci&oacute;n para probar tal o cual situaci&oacute;n.</p>
<p style="text-align: justify;">Espero que esto sea de utilidad para quien se encuentren en el mismo problema.</p>
