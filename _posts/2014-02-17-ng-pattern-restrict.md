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
  content: "¡Gracias!"
- id: 9136
  author: 'Presentando: What now? | Alpha&#039;s Manifesto'
  author_email: ''
  author_url: http://blog.alphasmanifesto.com/2014/02/23/presentando-what-now/
  date: '2014-02-23 19:25:55 +0000'
  date_gmt: '2014-02-24 00:25:55 +0000'
  content: "[&#8230;] había utilizado Travis en un proyecto anterior, en ng-pattern-restrict,
    pero gracias a la ayuda de Yeoman, esta vez fue mucho más fácil
    lograr la integración y tenerlo [&#8230;]"
- id: 28265
  author: Ayla
  author_email: aylalinda@hotmail.es
  author_url: ''
  date: '2016-02-16 09:39:06 +0000'
  date_gmt: '2016-02-16 15:39:06 +0000'
  content: "Hola Alpha,\r\n\r\nMencionas que se puede desactivar el debug por consola
    de forma opcional.  ¿Cómo lo consigo? Analizando el código
    parece que se puede conseguir si se declara una variable global DEBUG, pero eso
    me parece un poco feo de hacer.\r\n\r\nGracias,\r\nUn saludo."
- id: 28303
  author: Alpha
  author_email: alphagma@gmail.com
  author_url: http://www.alphasmanifesto.com/
  date: '2016-02-17 06:37:58 +0000'
  date_gmt: '2016-02-17 12:37:58 +0000'
  content: "Hola Ayla!\r\n\r\nEl uso de DEBUG es una opción. En mi caso, fue
    la única manera en la que yo pude hacer una \"compilación condicional\".
    Notarás que en la versión minificada, ya no se encuentran las instrucciones
    de debug. Mi objetivo no era solo dejar de llamarlas, pero literalmente quitarlas
    del código. Por eso necesité una variable global.\r\n\r\nSin embargo,
    para sólo evitar las llamadas, notarás que el código usa
    $log, que proviene de $logProvider de Angular (<a href=\"https://docs.angularjs.org/api/ng/service/$log\"
    rel=\"nofollow\">link</a>). Esto te da varias opciones alternativas:\r\n\r\n1.
    Puedes registrar/inyectar un $log noop. Básicamente, con que implemente
    las llamadas a \"warn\", \"log\", \"debug\", etc, sería suficiente. Esas
    llamadas pueden tener la lógica condicional que tu aplicación utilice.
    Mejor aún, podrías registrar el servicio por cada componente y apagar
    solamente el logging de ng-pattern-restrict, pero es toda lógica que deberías
    implementar tú.\r\n\r\n2. Puedes activar o desactivar $logProvider.debugEnabled.\r\n\r\n3.
    Puedes usar la variable global de DEBUG como mencionaste antes.\r\n\r\n¡Saludos!"
- id: 28304
  author: Ayla
  author_email: aylalinda@hotmail.es
  author_url: ''
  date: '2016-02-17 08:13:56 +0000'
  date_gmt: '2016-02-17 14:13:56 +0000'
  content: Perfectamente explicado. ¡Muchas gracias, Alpha!
- id: 30274
  author: Andree
  author_email: andree.x@linuxpias.org
  author_url: ''
  date: '2016-04-18 14:15:05 +0000'
  date_gmt: '2016-04-18 19:15:05 +0000'
  content: Buenas estoy usando ng-pattern-restrict y me a funcionado bien, pero quisiera
    saber como usarlo en un input de tipo email y cual seria la expresión regular
    correcta para ello.
- id: 30307
  author: Alpha
  author_email: alphagma@gmail.com
  author_url: http://www.alphasmanifesto.com/
  date: '2016-04-19 07:07:57 +0000'
  date_gmt: '2016-04-19 12:07:57 +0000'
  content: "Hola Andree, la forma de utilizarlo sería así:\r\n\r\n<pre>\r\n<input
    type=\"email\" ng-model=\"emailField\" ng-pattern-restrict=\"[A-Za-z0-9\\-_+]*@?[A-Za-z0-9\\-_+]*\\.?[A-Za-z]{0,
    10}\" />\r\n</pre>\r\n\r\n(Puede que esa regex no sea del todo correcta, acabo
    de improvisarla.)\r\n\r\nSin embargo, hay un par de cosas que deberías
    saber:\r\n\r\n1. Los campos de email tienen su propio tipo de validación.
    Si esa validación no pasa correctamente, los eventos no serán llevados
    a nuestras directivas de Angular. Eso significa que puede que ng-pattern-restrict
    no funcione del todo bien. Usalo con cuidado.\r\n2. La validación de un
    email es mucho más complejo que la expresión simplista que escribí
    más arriba. Un regex para emails se ve <a href=\"http://www.ex-parrot.com/pdw/Mail-RFC822-Address.html\"
    rel=\"nofollow\">medianamente así</a>. (Y de hecho, debe estar desactualizado
    porque esta página existía antes de los nuevos TLDs.)\r\n\r\nEspero
    que esto haya sido de utilidad."
---

![]({{ site.baseurl }}/assets/ng-pattern-restrict.png)

Limitando la entrada del usuario según una RegEx, AngularJS style


En una situación en particular, necesité limitar los valores que un usuario puede ingresar en un campo HTML, para evitar que pudieran ingresarse valores incorrectos. Si bien esto no es recomendable desde el punto de vista del UX, eso es lo que yo necesitaba (requerimiento). Pensé en desarrollar un componente genérico que hiciera esto por mí, y así nació _ng-pattern-restrict_, para AngularJS.

Aquí tendrán más información de cómo utilizarlo, cómo funciona y en dónde obtenerlo.

<!--more-->

## Introducción

_ng-pattern-restrict_ es un módulo y directiva de AngularJS que se puede utilizar en cualquier proyecto. Se utiliza como atributo en etiquetas HTML y si todo está correcto, no permitirá que el usuario ingrese valores que no concuerdan con  una expresión regular configurable para el campo.

## Características

- **Funciona independientemente del tipo del input:** text, date, number, password (aunque no sé por qué lo utilizarían aquí).
- **Debug por consola opcional:** activable o desactivable en tiempo real.
- **Mantiene el cursor en la posición correcta:** si un caracter es incorrectamente entrado, se mantendrá el cursor en la posición adecuada.
- **Escucha cambios en la expresión regular:** puede actualizarse el criterio de forma dinámica.
- **Simple de integrar en una aplicación AngularJS**
- **Puede leer su expresión regular desde pattern** en caso que se quiera hacer fallback a la validación HTML5
- **Open source y gratuito**

## Dónde obtenerlo y cómo utilizarlo

- Sitio oficial: [http://alphagit.github.io/ng-pattern-restrict/](http://alphagit.github.io/ng-pattern-restrict/)
- Releases: [https://github.com/AlphaGit/ng-pattern-restrict/releases](https://github.com/AlphaGit/ng-pattern-restrict/releases)
- Código fuente: [https://github.com/AlphaGit/ng-pattern-restrict](https://github.com/AlphaGit/ng-pattern-restrict)
- Reporte de bugs: [https://github.com/AlphaGit/ng-pattern-restrict/issues](https://github.com/AlphaGit/ng-pattern-restrict/issues)

### Para utilizarlo:

En JavaScript:

```js
angular.module("myApp", ["ngPatternRestrict"]);
```

En HTML:

```html
<input name="twoDecimals" type="text" ng-pattern-restrict="^\d+(\.\d{0,2})?$" />
```

Recuerden al momento de elegir la expresión regular que el usuario debe tipear los caracteres uno a uno, por lo que la expresión debe validar contra los valores parciales hasta que el usuario llega a su valor final. Si lo que ustedes desean es verificar el valor final, consideren utilizar el atributo `pattern`.

## Internamente

ng-pattern-restrict es una directiva de AngularJS que a cada cambio del input en donde se lo active verificará el nuevo valor ingresado. Si este nuevo valor ingresado conforma con la expresión regular pasada, ese valor será almacenado. Si la expresión regular no conforma con el nuevo valor ingresado (ya sea por teclado o por mouse), se revertirá al último valor válido. Cuando esto último ocurre, también se reestablece la posición del cursor para generar la sensación al usuario de que su entrada no fue aceptada.

### El caso de `input type=number`

Existe un caso particular con los elementos `input type=number`, ya que cuando se ingresa un valor no numérico (por ejemplo, "A"), el navegador permitirá que esto ocurra y no permitirá al código acceder al valor ingresado por el usuario. No se trata de un bug, sino que [esto es comportamiento estándar de HTML5](http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#number-state-(type=number)). Esto significa que ng-pattern-restrict no tiene forma de identificar si el valor ingresado. En este caso, el valor simplemente se asume como incorrecto y se procede de la forma descripta anteriormente. Si este no es el comportamiento que ustedes esperarían, consideren cambiar input type=number por otro tipo que permita tipos no-numéricos.

## Disclaimer: Porque no es tan buena idea

Este es un disclaimer como profesional de software: limitar la entrada del usuario impidiendo al usuario hacer su entrada no es una buena idea. Este componente está desarrollado bajo la premisa de que eso es necesario (lo cual fue mi caso en una situación particular), pero definitivamente esta no es la mejor de las experiencias del usuario. Si desean validar lo que el usuario ingresa, consideren seriamente dar un mensaje de validación en lugar de simplemente no permitir al usuario ingresar valores inválidos. Después de todo, el usuario está ingresando su valor por alguna razón: simplemente limitarlo no le hace saber por qué está mal lo que hizo, y peor aún, puede generar confusión si es que el usuario ve que "nada ocurre".

Dicho esto, queda en ustedes el criterio de dónde utilizar esto y dónde no.
