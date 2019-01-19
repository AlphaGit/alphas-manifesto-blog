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
- estándares
- JSONP
- proxy
comments:
- id: 9097
  author: Configuración de ManagedFusion.Rewriter como proxy reverso | Alpha&#039;s
    Manifesto
  author_email: ''
  author_url: http://blog.alphasmanifesto.com/2013/10/28/configuracion-de-managedfusion-rewriter-como-proxy-reverso/
  date: '2013-10-28 21:44:26 +0000'
  date_gmt: '2013-10-29 02:44:26 +0000'
  content: "[&#8230;] mi post anterior de alternativas para superar la limitación
    de la Same Origin Policy, expliqué brevemente el por qué de mi preferencia
    por los reverse [&#8230;]"
---

![]({{ site.baseurl }}/assets/ProxyLove.png)

Desarrollando en localhost, same-origin policy & REST APIs


Hasta hace un tiempo estuve peleando con un problema particular, que en realidad es algo común. Desarrollando una aplicación en su entorno local, se encuentran con que tienen que interactuar con REST APIs de terceros, pero desde JavaScript no pueden llamadas directamente a este dominio porque el browser les impide hacer estas llamadas.  ¿Qué está pasando y cómo resolverlo?

<!--more-->

## Same-Origin Policy

La <a href="http://en.wikipedia.org/wiki/Same-origin_policy">_Same-Origin Policy_</a> (o "_Política del Mismo Origen_") es una restricción de seguridad que casi todos los navegadores modernos imponen, para que scripts siendo ejecutados en el dominio A no pueda acceder a información expuesta en el dominio B. Esto no es para proteger los datos del dominio B, sino para proteger la integridad del dominio A, que ahora puede estar insertando código JavaScript directamente desde un dominio que está fuera de su control.

Esto puede ser un problema particularmente en el escenario que he descripto: mientras nos encontramos desarrollando una aplicación web, trabajamos en él y lo ejecutamos en un servidor local, que seguramente será servido como `http://localhost`/. Este sitio utiliza llamadas AJAX (seguramente a través de `XMLHttpRequest`) que intenta comunicarse con `http://www.example.com/api/executeSomething`, y el navegador cancela la ejecución de ese request exactamente por la seguridad de la llamada.

El problema que se nos plantea es entonces:  ¿cómo podemos asegurar un entorno de desarrollo en donde, sin tener nuestra aplicación disponible desde el dominio de la API, nuestra apliczción pueda interactuar con ella?

## Soluciones

<a href="http://stackoverflow.com/questions/3076414/ways-to-circumvent-the-same-origin-policy">Esta pregunta en StackOverflow</a> resume muchas de las opciones, pero quiero cubrirlas y hablar un poco más sobre cada una de ellas.

Veámoslas por partes.

### Método document.domain

El método de `document.domain` es básicamente cambiar la propiedad sobre la cual se ejecutan las verificaciones de seguridad. Por supuesto, esta misma acción se encuentra limitada también y no es útil si estamos hablando de páginas que no pertenecen a la misma jerarquía de dominios. Básicamente, este método serviría si estuviéramos hablando de `http//example.com/api` y `http://app.example.com/`. Por supuesto, esto no aplicará dentro del contexto de localhost que habíamos planteado con anterioridad.

Además, requiere el uso de un iframe, que explicaré más adelante.

### Método CORS

Esta parece ser la solución definitiva al problema -- opuesta a otras que parecen querer "hackear" el problema, CORS estuvo específicamente diseñado para resolver este problema.

Específicamente, el navegador indicará cuál es el origen del pedido, el servidor responderá de forma acorde indicando qué dominios tienen el acceso permitido, y el navegador entonces mostrará una respuesta o sólo un error de seguridad.

Sin embargo, en mi opinión, esto tiene un par de problemas:

1. Debe ser implementado por el servidor, lo que quiere decir que cada dueño de APIs puede elegir de qué forma se puede trabajar con ellas y quiénes tienen permitidos el acceso. No resuelve nuestro problema hoy y ahora, pero se acerca.
1. Debe ser implementado por el cliente, y aparentemente <a href="http://caniuse.com/cors">ya es soportado por una gran variedad de navegadores</a>.
1. El browser implementa la seguridad y NO el servidor, ya que el servidor sólo se puede guiar en base a la información provista desde la cabecera Origin. El mayor problema con esto es que no es muy difícil de hackear, lo que significa que sólo necesitamos un pequeño editor HTTP como para poder hackear nuestro camino e impersonar a cualquier aplicación.

### Método window.postMessage

Este método, en pocas palabras, involucra llamar al sitio externo haciendo uso de un `iframe` con el mismo, y hacer uso de postMessage y los eventos de mensaje para pasarse los datos. Además de sentirse sucio y ser un poco complicado (tener un `iframe` como interfaz de comunicación, a través de un único evento), sigue teniendo varios de los problemas que habíamos mencionado antes:

1. Debe ser implementado por el servidor, quien debe exponer una fuente que podamos usar en el `iframe`
1. Tenemos que implementar la comunicación a través de los eventos de `postMessage`
- Posibles problemas de seguridad por los mensajes, si es que no cuidamos bien la forma en la que nuestro código recibe y envía mensajes.
1. ¡Es un `iframe`! Necesitamos tener dos ventanas con scopes separados exclusivamente para poder acceder a los datos de otro dominio, incluyendo todo lo que una nueva ventana incluye.

### Método JSONP

JSONP es, en pcoas palabras, no llamar a métodos GET sino utilizarlos como fuentes de scripts que se autogeneran en base a un parámetro que le pasamos, y en base a un parámetro de callback, ejecutan código nuestro con datos que vinieron del servidor.

Esto queda absolutamente descartado para POST, PUT y DELETE (y otros). Adiós interfaces RESTful.

Esto además tiene los mismos problemas de seguridad que se mencionaron para postMessage: básicamente estamos permitiendo que un dominio desconocido ejecute código nuestro.

Finalmente, de todas las opciones, JSONP es la que realmente se siente como un hack más que cualquier otra: fue una buena solución para muchos casos, pero no está pensada para aplicaciones complejas o requerimientos variantes.

Para casos en donde el servidor no implemente JSONP, se han inventado proxies que convierten pedidos a formato JSONP, como <a href="http://anyorigin.com/">AnyOrigin</a> o <a href="http://whateverorigin.org/">WhateverOrigin</a>.

Y, hablando de proxies...

### Método Reverse Proxy

Un reverse proxy sería, en nuestro propio servidor, montar un mecanismo que interactúe con el servicio de API y devuelva la respuesta como si fuera del nuestro (`http://localhost/`). Esta tarea puede ser no-trivial, dependiendo de la tecnología, para implementar correctamente el protocolo HTTP como proxy, pero existen alternativas que hacen esto muy simple. Una de ellas es, para servidores Apache, <a href="http://httpd.apache.org/docs/2.2/mod/mod_proxy.html">mod_proxy</a>, y para servidores .NET, <a href="https://github.com/managedfusion/managedfusion-rewriter">ManagedFusion.Rewriter</a>, y ciertamente no son las únicas dos alternativas.

Esta es mi solución favorita, porque soporta cualquier tipo de petición, es transparente para el cliente, es fácilmente configurable (una línea de configuración en el cliente para saber a dónde llamar, dos líneas de configuración para configurar el proxy), y no necesitamos permitir ejecución arbitraria de código, o las complicaciones de prohibirla.

---

Quisiera escuchar feedback de otra gente.  ¿Cómo suelen resolver este problema?  ¿Qué les ha servido mejor a ustedes?
