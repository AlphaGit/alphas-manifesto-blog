---
layout: post
status: publish
published: true
title: ng-pattern-restrict
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5022
wordpress_url: http://blog.alphasmanifesto.com/?p=5022
date: '2014-02-17 21:12:11 +0000'
date_gmt: '2014-02-18 02:12:11 +0000'
categories:
- Projects
- Technology
tags:
- proyecto
- JavaScript
- HTML
- open source
- UX
- AngularJS
comments:
- id: 9134
  author: pitchblackink
  author_email: nexusmdq@yahoo.com.ar
  author_url: ''
  date: '2014-02-18 19:12:34 +0000'
  date_gmt: '2014-02-19 00:12:34 +0000'
  content: crack!
- id: 9135
  author: Alpha
  author_email: alpha@furries.com.ar
  author_url: http://www.alphasmanifesto.com/
  date: '2014-02-23 18:05:21 +0000'
  date_gmt: '2014-02-23 23:05:21 +0000'
  content: "&iexcl;Gracias!"
- id: 9136
  author: 'Presentando: What now? | Alpha&#039;s Manifesto'
  author_email: ''
  author_url: http://blog.alphasmanifesto.com/2014/02/23/presentando-what-now/
  date: '2014-02-23 19:25:55 +0000'
  date_gmt: '2014-02-24 00:25:55 +0000'
  content: "[&#8230;] hab&iacute;a utilizado Travis en un proyecto anterior, en ng-pattern-restrict,
    pero gracias a la ayuda de Yeoman, esta vez fue mucho m&aacute;s f&aacute;cil
    lograr la integraci&oacute;n y tenerlo [&#8230;]"
- id: 28265
  author: Ayla
  author_email: aylalinda@hotmail.es
  author_url: ''
  date: '2016-02-16 09:39:06 +0000'
  date_gmt: '2016-02-16 15:39:06 +0000'
  content: "Hola Alpha,\r\n\r\nMencionas que se puede desactivar el debug por consola
    de forma opcional. &iquest;C&oacute;mo lo consigo? Analizando el c&oacute;digo
    parece que se puede conseguir si se declara una variable global DEBUG, pero eso
    me parece un poco feo de hacer.\r\n\r\nGracias,\r\nUn saludo."
- id: 28303
  author: Alpha
  author_email: alphagma@gmail.com
  author_url: http://www.alphasmanifesto.com/
  date: '2016-02-17 06:37:58 +0000'
  date_gmt: '2016-02-17 12:37:58 +0000'
  content: "Hola Ayla!\r\n\r\nEl uso de DEBUG es una opci&oacute;n. En mi caso, fue
    la &uacute;nica manera en la que yo pude hacer una \"compilaci&oacute;n condicional\".
    Notar&aacute;s que en la versi&oacute;n minificada, ya no se encuentran las instrucciones
    de debug. Mi objetivo no era solo dejar de llamarlas, pero literalmente quitarlas
    del c&oacute;digo. Por eso necesit&eacute; una variable global.\r\n\r\nSin embargo,
    para s&oacute;lo evitar las llamadas, notar&aacute;s que el c&oacute;digo usa
    $log, que proviene de $logProvider de Angular (<a href=\"https://docs.angularjs.org/api/ng/service/$log\"
    rel=\"nofollow\">link</a>). Esto te da varias opciones alternativas:\r\n\r\n1.
    Puedes registrar/inyectar un $log noop. B&aacute;sicamente, con que implemente
    las llamadas a \"warn\", \"log\", \"debug\", etc, ser&iacute;a suficiente. Esas
    llamadas pueden tener la l&oacute;gica condicional que tu aplicaci&oacute;n utilice.
    Mejor a&uacute;n, podr&iacute;as registrar el servicio por cada componente y apagar
    solamente el logging de ng-pattern-restrict, pero es toda l&oacute;gica que deber&iacute;as
    implementar t&uacute;.\r\n\r\n2. Puedes activar o desactivar $logProvider.debugEnabled.\r\n\r\n3.
    Puedes usar la variable global de DEBUG como mencionaste antes.\r\n\r\n&iexcl;Saludos!"
- id: 28304
  author: Ayla
  author_email: aylalinda@hotmail.es
  author_url: ''
  date: '2016-02-17 08:13:56 +0000'
  date_gmt: '2016-02-17 14:13:56 +0000'
  content: Perfectamente explicado. &iexcl;Muchas gracias, Alpha!
- id: 30274
  author: Andree
  author_email: andree.x@linuxpias.org
  author_url: ''
  date: '2016-04-18 14:15:05 +0000'
  date_gmt: '2016-04-18 19:15:05 +0000'
  content: Buenas estoy usando ng-pattern-restrict y me a funcionado bien, pero quisiera
    saber como usarlo en un input de tipo email y cual seria la expresi&oacute;n regular
    correcta para ello.
- id: 30307
  author: Alpha
  author_email: alphagma@gmail.com
  author_url: http://www.alphasmanifesto.com/
  date: '2016-04-19 07:07:57 +0000'
  date_gmt: '2016-04-19 12:07:57 +0000'
  content: "Hola Andree, la forma de utilizarlo ser&iacute;a as&iacute;:\r\n\r\n<pre>\r\n<input
    type=\"email\" ng-model=\"emailField\" ng-pattern-restrict=\"[A-Za-z0-9\\-_+]*@?[A-Za-z0-9\\-_+]*\\.?[A-Za-z]{0,
    10}\" />\r\n</pre>\r\n\r\n(Puede que esa regex no sea del todo correcta, acabo
    de improvisarla.)\r\n\r\nSin embargo, hay un par de cosas que deber&iacute;as
    saber:\r\n\r\n1. Los campos de email tienen su propio tipo de validaci&oacute;n.
    Si esa validaci&oacute;n no pasa correctamente, los eventos no ser&aacute;n llevados
    a nuestras directivas de Angular. Eso significa que puede que ng-pattern-restrict
    no funcione del todo bien. Usalo con cuidado.\r\n2. La validaci&oacute;n de un
    email es mucho m&aacute;s complejo que la expresi&oacute;n simplista que escrib&iacute;
    m&aacute;s arriba. Un regex para emails se ve <a href=\"http://www.ex-parrot.com/pdw/Mail-RFC822-Address.html\"
    rel=\"nofollow\">medianamente as&iacute;</a>. (Y de hecho, debe estar desactualizado
    porque esta p&aacute;gina exist&iacute;a antes de los nuevos TLDs.)\r\n\r\nEspero
    que esto haya sido de utilidad."
---

![](/assets/ng-pattern-restrict.png)

Limitando la entrada del usuario según una RegEx, AngularJS style

<p style="text-align: justify;">En una situaci&oacute;n en particular, necesit&eacute; limitar los valores que un usuario puede ingresar en un campo HTML, para evitar que pudieran ingresarse valores incorrectos. Si bien esto no es recomendable desde el punto de vista del UX, eso es lo que yo necesitaba (requerimiento). Pens&eacute; en desarrollar un componente gen&eacute;rico que hiciera esto por m&iacute;, y as&iacute; naci&oacute; <em>ng-pattern-restrict</em>, para AngularJS.</p>
<p style="text-align: justify;">Aqu&iacute; tendr&aacute;n m&aacute;s informaci&oacute;n de c&oacute;mo utilizarlo, c&oacute;mo funciona y en d&oacute;nde obtenerlo.</p>
<p style="text-align: justify;"><!--more--></p>
<h2>Introducci&oacute;n</h2>
<p style="text-align: justify;"><em>ng-pattern-restrict</em> es un m&oacute;dulo y directiva de AngularJS que se puede utilizar en cualquier proyecto. Se utiliza como atributo en etiquetas HTML y si todo est&aacute; correcto, no permitir&aacute; que el usuario ingrese valores que no concuerdan con &nbsp;una expresi&oacute;n regular configurable para el campo.</p>
<h2>Caracter&iacute;sticas</h2>
<ul>
<li style="text-align: justify;"><strong>Funciona independientemente del tipo del input:</strong> text, date, number, password (aunque no s&eacute; por qu&eacute; lo utilizar&iacute;an aqu&iacute;).</li>
<li style="text-align: justify;"><strong>Debug por consola opcional:</strong> activable o desactivable en tiempo real.</li>
<li style="text-align: justify;"><strong>Mantiene el cursor en la posici&oacute;n correcta:</strong>&nbsp;si un caracter es incorrectamente entrado, se mantendr&aacute; el cursor en la posici&oacute;n adecuada.</li>
<li style="text-align: justify;"><strong>Escucha cambios en la expresi&oacute;n regular:</strong> puede actualizarse el criterio de forma din&aacute;mica.</li>
<li style="text-align: justify;"><strong>Simple de integrar en una aplicaci&oacute;n AngularJS</strong></li>
<li style="text-align: justify;"><strong>Puede leer su expresi&oacute;n regular desde pattern</strong> en caso que se quiera hacer fallback a la validaci&oacute;n HTML5</li>
<li style="text-align: justify;"><strong>Open source y gratuito</strong></li>
</ul>
<h2>D&oacute;nde obtenerlo y c&oacute;mo utilizarlo</h2>
<ul>
<li style="text-align: justify;">Sitio oficial:&nbsp;<a href="http://alphagit.github.io/ng-pattern-restrict/">http://alphagit.github.io/ng-pattern-restrict/</a></li>
<li style="text-align: justify;">Releases:&nbsp;<a href="https://github.com/AlphaGit/ng-pattern-restrict/releases">https://github.com/AlphaGit/ng-pattern-restrict/releases</a></li>
<li style="text-align: justify;">C&oacute;digo fuente:&nbsp;<a href="https://github.com/AlphaGit/ng-pattern-restrict">https://github.com/AlphaGit/ng-pattern-restrict</a></li>
<li style="text-align: justify;">Reporte de bugs:&nbsp;<a href="https://github.com/AlphaGit/ng-pattern-restrict/issues">https://github.com/AlphaGit/ng-pattern-restrict/issues</a></li>
</ul>
<h3>Para utilizarlo:</h3>
<p style="text-align: justify;">En JavaScript:</p>
<p><code>angular.module("myApp", ["ngPatternRestrict"]);</code></p>
<p style="text-align: justify;">En HTML:</p>
<p><code><input name="twoDecimals" type="text" ng-pattern-restrict="^\d+(\.\d{0,2})?$" /></code></p>
<p style="text-align: justify;">Recuerden al momento de elegir la expresi&oacute;n regular que el usuario debe tipear los caracteres uno a uno, por lo que la expresi&oacute;n debe validar contra los valores parciales hasta que el usuario llega a su valor final. Si lo que ustedes desean es verificar el valor final, consideren utilizar el atributo <code>pattern</code>.</p>
<h2>Internamente</h2>
<p style="text-align: justify;">ng-pattern-restrict es una directiva de AngularJS que a cada cambio del input en donde se lo active verificar&aacute; el nuevo valor ingresado. Si este nuevo valor ingresado conforma con la expresi&oacute;n regular pasada, ese valor ser&aacute; almacenado. Si la expresi&oacute;n regular no conforma con el nuevo valor ingresado (ya sea por teclado o por mouse), se revertir&aacute; al &uacute;ltimo valor v&aacute;lido. Cuando esto &uacute;ltimo ocurre, tambi&eacute;n se reestablece la posici&oacute;n del cursor para generar la sensaci&oacute;n al usuario de que su entrada no fue aceptada.</p>
<h3 style="text-align: justify;">El caso de <code>input type=number</code></h3>
<p style="text-align: justify;">Existe un caso particular con los elementos <code>input type=number</code>, ya que cuando se ingresa un valor no num&eacute;rico (por ejemplo, "A"), el navegador permitir&aacute; que esto ocurra y no permitir&aacute; al c&oacute;digo acceder al valor ingresado por el usuario. No se trata de un bug, sino que <a href="http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#number-state-(type=number)">esto es comportamiento est&aacute;ndar de HTML5</a>. Esto significa que ng-pattern-restrict no tiene forma de identificar si el valor ingresado. En este caso, el valor simplemente se asume como incorrecto y se procede de la forma descripta anteriormente. Si este no es el comportamiento que ustedes esperar&iacute;an, consideren cambiar input type=number por otro tipo que permita tipos no-num&eacute;ricos.</p>
<h2>Disclaimer: Porque no es tan buena idea</h2>
<p style="text-align: justify;">Este es un disclaimer como profesional de software: limitar la entrada del usuario impidiendo al usuario hacer su entrada no es una buena idea. Este componente est&aacute; desarrollado bajo la premisa de que eso es necesario (lo cual fue mi caso en una situaci&oacute;n particular), pero definitivamente esta no es la mejor de las experiencias del usuario. Si desean validar lo que el usuario ingresa, consideren seriamente dar un mensaje de validaci&oacute;n en lugar de simplemente no permitir al usuario ingresar valores inv&aacute;lidos. Despu&eacute;s de todo, el usuario est&aacute; ingresando su valor por alguna raz&oacute;n: simplemente limitarlo no le hace saber por qu&eacute; est&aacute; mal lo que hizo, y peor a&uacute;n, puede generar confusi&oacute;n si es que el usuario ve que "nada ocurre".</p>
<p style="text-align: justify;">Dicho esto, queda en ustedes el criterio de d&oacute;nde utilizar esto y d&oacute;nde no.</p>
