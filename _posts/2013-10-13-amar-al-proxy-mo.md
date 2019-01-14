---
layout: post
status: publish
published: true
title: Amar al proxy-mo
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 4968
wordpress_url: http://blog.alphasmanifesto.com/?p=4968
date: '2013-10-13 18:01:45 +0000'
date_gmt: '2013-10-13 23:01:45 +0000'
categories:
- Projects
- Technology
tags:
- JavaScript
- desarrollo web
- JSON
- open source
- seguridad
- REST
- API
- web
- est&aacute;ndares
- JSONP
- proxy
comments:
- id: 9097
  author: Configuraci&oacute;n de ManagedFusion.Rewriter como proxy reverso | Alpha&#039;s
    Manifesto
  author_email: ''
  author_url: http://blog.alphasmanifesto.com/2013/10/28/configuracion-de-managedfusion-rewriter-como-proxy-reverso/
  date: '2013-10-28 21:44:26 +0000'
  date_gmt: '2013-10-29 02:44:26 +0000'
  content: "[&#8230;] mi post anterior de alternativas para superar la limitaci&oacute;n
    de la Same Origin Policy, expliqu&eacute; brevemente el por qu&eacute; de mi preferencia
    por los reverse [&#8230;]"
---

![](/assets/ProxyLove.png)

Desarrollando en localhost, same-origin policy & REST APIs

<p style="text-align: justify;">Hasta hace un tiempo estuve peleando con un problema particular, que en realidad es algo com&uacute;n. Desarrollando una aplicaci&oacute;n en su entorno local, se encuentran con que tienen que interactuar con REST APIs de terceros, pero desde JavaScript no pueden llamadas directamente a este dominio porque el browser les impide hacer estas llamadas. &iquest;Qu&eacute; est&aacute; pasando y c&oacute;mo resolverlo?</p>
<p style="text-align: justify;"><!--more--></p>
<h2 style="text-align: justify;">Same-Origin Policy</h2>
<p style="text-align: justify;">La <a href="http://en.wikipedia.org/wiki/Same-origin_policy"><em>Same-Origin Policy</em></a> (o "<em>Pol&iacute;tica del Mismo Origen</em>") es una restricci&oacute;n de seguridad que casi todos los navegadores modernos imponen, para que scripts siendo ejecutados en el dominio A no pueda acceder a informaci&oacute;n expuesta en el dominio B. Esto no es para proteger los datos del dominio B, sino para proteger la integridad del dominio A, que ahora puede estar insertando c&oacute;digo JavaScript directamente desde un dominio que est&aacute; fuera de su control.</p>
<p style="text-align: justify;">Esto puede ser un problema particularmente en el escenario que he descripto: mientras nos encontramos desarrollando una aplicaci&oacute;n web, trabajamos en &eacute;l y lo ejecutamos en un servidor local, que seguramente ser&aacute; servido como <code>http://localhost</code>/. Este sitio utiliza llamadas AJAX (seguramente a trav&eacute;s de <code>XMLHttpRequest</code>) que intenta comunicarse con <code>http://www.example.com/api/executeSomething</code>, y el navegador cancela la ejecuci&oacute;n de ese request exactamente por la seguridad de la llamada.</p>
<p style="text-align: justify;">El problema que se nos plantea es entonces: &iquest;c&oacute;mo podemos asegurar un entorno de desarrollo en donde, sin tener nuestra aplicaci&oacute;n disponible desde el dominio de la API, nuestra apliczci&oacute;n pueda interactuar con ella?</p>
<h2 style="text-align: justify;">Soluciones</h2>
<p style="text-align: justify;"><a href="http://stackoverflow.com/questions/3076414/ways-to-circumvent-the-same-origin-policy">Esta pregunta en StackOverflow</a> resume muchas de las opciones, pero quiero cubrirlas y hablar un poco m&aacute;s sobre cada una de ellas.</p>
<p style="text-align: justify;">Ve&aacute;moslas por partes.</p>
<h3 style="text-align: justify;">M&eacute;todo document.domain</h3>
<p style="text-align: justify;">El m&eacute;todo de <code>document.domain</code> es b&aacute;sicamente cambiar la propiedad sobre la cual se ejecutan las verificaciones de seguridad. Por supuesto, esta misma acci&oacute;n se encuentra limitada tambi&eacute;n y no es &uacute;til si estamos hablando de p&aacute;ginas que no pertenecen a la misma jerarqu&iacute;a de dominios. B&aacute;sicamente, este m&eacute;todo servir&iacute;a si estuvi&eacute;ramos hablando de <code>http//example.com/api</code> y <code>http://app.example.com/</code>. Por supuesto, esto no aplicar&aacute; dentro del contexto de localhost que hab&iacute;amos planteado con anterioridad.</p>
<p style="text-align: justify;">Adem&aacute;s, requiere el uso de un iframe, que explicar&eacute; m&aacute;s adelante.</p>
<h3 style="text-align: justify;">M&eacute;todo CORS</h3>
<p style="text-align: justify;">Esta parece ser la soluci&oacute;n definitiva al problema -- opuesta a otras que parecen querer "hackear" el problema, CORS estuvo espec&iacute;ficamente dise&ntilde;ado para resolver este problema.</p>
<p style="text-align: justify;">Espec&iacute;ficamente, el navegador indicar&aacute; cu&aacute;l es el origen del pedido, el servidor responder&aacute; de forma acorde indicando qu&eacute; dominios tienen el acceso permitido, y el navegador entonces mostrar&aacute; una respuesta o s&oacute;lo un error de seguridad.</p>
<p style="text-align: justify;">Sin embargo, en mi opini&oacute;n, esto tiene un par de problemas:</p>
<ol style="text-align: justify;">
<li>Debe ser implementado por el servidor, lo que quiere decir que cada due&ntilde;o de APIs puede elegir de qu&eacute; forma se puede trabajar con ellas y qui&eacute;nes tienen permitidos el acceso. No resuelve nuestro problema hoy y ahora, pero se acerca.</li>
<li>Debe ser implementado por el cliente, y aparentemente <a href="http://caniuse.com/cors">ya es soportado por una gran variedad de navegadores</a>.</li>
<li>El browser implementa la seguridad y NO el servidor, ya que el servidor s&oacute;lo se puede guiar en base a la informaci&oacute;n provista desde la cabecera Origin. El mayor problema con esto es que no es muy dif&iacute;cil de hackear, lo que significa que s&oacute;lo necesitamos un peque&ntilde;o editor HTTP como para poder hackear nuestro camino e impersonar a cualquier aplicaci&oacute;n.</li>
</ol>
<h3 style="text-align: justify;">M&eacute;todo window.postMessage</h3>
<p style="text-align: justify;">Este m&eacute;todo, en pocas palabras, involucra llamar al sitio externo haciendo uso de un <code>iframe</code> con el mismo, y hacer uso de postMessage y los eventos de mensaje para pasarse los datos. Adem&aacute;s de sentirse sucio y ser un poco complicado (tener un <code>iframe</code> como interfaz de comunicaci&oacute;n, a trav&eacute;s de un &uacute;nico evento), sigue teniendo varios de los problemas que hab&iacute;amos mencionado antes:</p>
<ol style="text-align: justify;">
<li>Debe ser implementado por el servidor, quien debe exponer una fuente que podamos usar en el <code>iframe</code></li>
<li>Tenemos que implementar la comunicaci&oacute;n a trav&eacute;s de los eventos de <code>postMessage</code></li>
<li>Posibles problemas de seguridad por los mensajes, si es que no cuidamos bien la forma en la que nuestro c&oacute;digo recibe y env&iacute;a mensajes.</li>
<li>&iexcl;Es un <code>iframe</code>! Necesitamos tener dos ventanas con scopes separados exclusivamente para poder acceder a los datos de otro dominio, incluyendo todo lo que una nueva ventana incluye.</li>
</ol>
<h3 style="text-align: justify;">M&eacute;todo JSONP</h3>
<p style="text-align: justify;">JSONP es, en pcoas palabras, no llamar a m&eacute;todos GET sino utilizarlos como fuentes de scripts que se autogeneran en base a un par&aacute;metro que le pasamos, y en base a un par&aacute;metro de callback, ejecutan c&oacute;digo nuestro con datos que vinieron del servidor.</p>
<p style="text-align: justify;">Esto queda absolutamente descartado para POST, PUT y DELETE (y otros). Adi&oacute;s interfaces RESTful.</p>
<p style="text-align: justify;">Esto adem&aacute;s tiene los mismos problemas de seguridad que se mencionaron para postMessage: b&aacute;sicamente estamos permitiendo que un dominio desconocido ejecute c&oacute;digo nuestro.</p>
<p style="text-align: justify;">Finalmente, de todas las opciones, JSONP es la que realmente se siente como un hack m&aacute;s que cualquier otra: fue una buena soluci&oacute;n para muchos casos, pero no est&aacute; pensada para aplicaciones complejas o requerimientos variantes.</p>
<p style="text-align: justify;">Para casos en donde el servidor no implemente JSONP, se han inventado proxies que convierten pedidos a formato JSONP, como <a href="http://anyorigin.com/">AnyOrigin</a> o <a href="http://whateverorigin.org/">WhateverOrigin</a>.</p>
<p style="text-align: justify;">Y, hablando de proxies...</p>
<h3 style="text-align: justify;">M&eacute;todo Reverse Proxy</h3>
<p style="text-align: justify;">Un reverse proxy ser&iacute;a, en nuestro propio servidor, montar un mecanismo que interact&uacute;e con el servicio de API y devuelva la respuesta como si fuera del nuestro (<code>http://localhost/</code>). Esta tarea puede ser no-trivial, dependiendo de la tecnolog&iacute;a, para implementar correctamente el protocolo HTTP como proxy, pero existen alternativas que hacen esto muy simple. Una de ellas es, para servidores Apache, <a href="http://httpd.apache.org/docs/2.2/mod/mod_proxy.html">mod_proxy</a>, y para servidores .NET, <a href="https://github.com/managedfusion/managedfusion-rewriter">ManagedFusion.Rewriter</a>, y ciertamente no son las &uacute;nicas dos alternativas.</p>
<p style="text-align: justify;">Esta es mi soluci&oacute;n favorita, porque soporta cualquier tipo de petici&oacute;n, es transparente para el cliente, es f&aacute;cilmente configurable (una l&iacute;nea de configuraci&oacute;n en el cliente para saber a d&oacute;nde llamar, dos l&iacute;neas de configuraci&oacute;n para configurar el proxy), y no necesitamos permitir ejecuci&oacute;n arbitraria de c&oacute;digo, o las complicaciones de prohibirla.</p>
<hr />
<p style="text-align: justify;">Quisiera escuchar feedback de otra gente. &iquest;C&oacute;mo suelen resolver este problema? &iquest;Qu&eacute; les ha servido mejor a ustedes?</p>
