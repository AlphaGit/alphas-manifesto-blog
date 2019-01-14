---
layout: post
status: publish
published: true
title: CSS Din&aacute;mico
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 3757
wordpress_url: http://blog.alphasmanifesto.com/?p=3757
date: '2012-04-03 08:51:43 +0000'
date_gmt: '2012-04-03 13:51:43 +0000'
categories:
- Link del d&iacute;a
- Technology
tags:
- CSS
- buenas pr&aacute;cticas
- comunidad
- din&aacute;mico
- Less
- razones
- colores
comments:
- id: 8841
  author: andres
  author_email: notengo@notengo.com
  author_url: ''
  date: '2012-04-03 09:11:32 +0000'
  date_gmt: '2012-04-03 14:11:32 +0000'
  content: "> Por un lado, permitir&aacute;n la inserci&oacute;n f&aacute;cil de quienes
    no dominen CSS completamente. \r\n\r\nPero generan mas lenguajes, m&aacute;s cosas
    que aprender, en lugar de profundizar en un lenguaje com&uacute;n. Por ejemplo:
    tal vez LESS sea m&aacute;s c&oacute;modo e intuitivo para un programador, pero
    tal vez no lo es para un dise&ntilde;ador.\r\n\r\nRelacionado con el punto dos,
    creo que tal vez no las conocemos o no son intuitivas para nosotros, pero tengo
    entendido que el CSS puro y duro, por ejemplo, tambi&eacute;n se puede adaptar
    a distintos dispositivos.\r\n\r\nLo mismo, tal vez no de la forma en que estamos
    acostumbrados pero CSS permite reutilizaci&oacute;n. Al igual que en los puntos
    anteriores tal vez requiere que modifiquemos nuestra manera de pensar, para un
    programador acostumbrado a algoritmos SQL tambi&eacute;n requiere modificar la
    forma de pensar, no?\r\n\r\nHacks, ah&iacute; estoy de acuerdo, las diferencias
    entre navegadores son un problema importante, pero tienden a desaparecer, &iquest;no?"
- id: 8844
  author: Alpha
  author_email: alpha@furries.com.ar
  author_url: http://www.alphasmanifesto.com.ar/
  date: '2012-04-04 18:36:23 +0000'
  date_gmt: '2012-04-04 23:36:23 +0000'
  content: |-
    <blockquote>Pero generan mas lenguajes, m&aacute;s cosas que aprender, en lugar de profundizar en un lenguaje com&uacute;n. Por ejemplo: tal vez LESS sea m&aacute;s c&oacute;modo e intuitivo para un programador, pero tal vez no lo es para un dise&ntilde;ador.</blockquote>

    Es verdad, pero al mismo tiempo se trata de resolver tareas que generalmente llevan tiempo de una forma m&aacute;s simple. Si est&aacute; bien pensado no har&iacute;a falta cambiar la forma del lenguaje, porque siendo backward-compatible se podr&iacute;an desarrollar las mismas cosas de la misma forma que se hace hoy. Seguramente con nuevas caracter&iacute;sticas aparezcan nuevas capacidades y entonces s&iacute; habr&iacute;a que aprender cosas nuevas... pero es el precio del progreso.

    En el resto estoy todo de acuerdo, y s&iacute;, me preocupa profundamente la cantidad de tiempo invertido en hacer que las cosas funcionen en distintos navegadores. Tantos millones de d&oacute;lares invertidos en workarounds y no en la soluci&oacute;n en la ra&iacute;z del problema.
---
Post procesamiento vs. preprocesamiento

<p style="text-align: justify;">Para los que conocemos y usamos <a href="https://blog.alphasmanifesto.com/2012/02/10/dotless/">Less o sus variantes</a>, nos alegrar&iacute;amos mucho de saber que CSS pueda agregar capacidades similares. A pesar de que <a href="http://www.css3.info/summary-of-the-two-current-css-constants-proposals/">gran parte de la comunidad est&eacute; en desacuerdo</a>&nbsp;(&iexcl;Gracias, AM!), yo creo que ser&iacute;an &uacute;tiles, por varias razones. (Invito a discutir a qui&eacute;n piense distinto.)</p>
<ul style="text-align: justify;">
<li>Por un lado, permitir&aacute;n la inserci&oacute;n f&aacute;cil de quienes no dominen CSS completamente. Est&aacute; claro que significa que se pueden resolver cosas de una forma no tan prolija, pero los lenguajes tratan de facilitarnos las tareas a nosotros, no imponernos reglas que debemos seguir. Cuando existe esa diferenciaci&oacute;n es cuando comienzan a surgir <a href="https://blog.alphasmanifesto.com/2011/09/30/link-del-dia-arquitectura-css/">buenas pr&aacute;cticas</a>.</li>
<li>Por otro lado, permitir&aacute; la creaci&oacute;n de frameworks m&aacute;s din&aacute;micos, sin uso de JavaScript. Frameworks CSS que sean adaptables al uso de los usuarios, multi-navegador y apropiadamente utilizables. De la misma forma que <a href="http://twitter.github.com/bootstrap/">Bootstrap</a> tiene variables globales que se pueden cambiar para ajustar su comportamiento, as&iacute; ser&iacute;an m&aacute;s din&aacute;micos y reutilizables.</li>
<li>Por otro lado m&aacute;s: reutilizaci&oacute;n. Muchas veces los esquemas de colores se basan en un conjunto limitado de los mismos. Si los tama&ntilde;os de fuentes ya admiten relaciones entre ellos, &iquest;por qu&eacute; no los colores, por qu&eacute; no condicionales que devuelvan un valor seg&uacute;n el valor padre? (Nuevamente, en favor de los CSSs consistentes cross-browsers.)</li>
<li>Minimizaci&oacute;n de hacks. Por partida doble. En el primer aspecto, por todo lo que nombr&eacute;. En el segundo aspecto, por la posibilidad de limitarlos a lo necesario y s&oacute;lo reutilizarlos como referencia (lo que Less denomina <em>mixins</em>).</li>
</ul>
<p style="text-align: justify;">Todo esto ven&iacute;a a los links que me encontr&eacute;, relativamente novedosos:&nbsp;<a href="http://updates.html5rocks.com/2012/03/CSS-layout-gets-smarter-with-calc">Calc() para CSS</a>, un operador que calcula valores en base a los argumentos que se le pasen. Creo que este pedacito de c&oacute;digo lo paga todo:</p>
<p>[sourcecode language="css"]<br />
#foo {<br />
    width: calc(50% - 100px);<br />
}</p>
<div id=&rdquo;foo&rdquo;>Always 100 pixels less than half the available area</div>
<p>[/sourcecode]</p>
<p style="text-align: justify;">Por otro lado, <a href="http://updates.html5rocks.com/2012/03/A-New-Experimental-Feature-style-scoped">Scoped Styles</a>, algo que s&oacute;lo veo como utilidad al momento de permitir usuarios escribir su propio CSS (apropiado para SaaS en donde los usuarios tengan su propio espacio). No soy muy fan&aacute;tico de esta funcionalidad, pero reconozco que resuelve un problema existente.</p>
<p style="text-align: justify;"><em>Soy un zorrinito din&aacute;mico.</em></p>
