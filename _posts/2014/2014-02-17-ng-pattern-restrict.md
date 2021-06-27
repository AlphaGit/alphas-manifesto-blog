---

title: ng-pattern-restrict
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
sub_title: Limitando la entrada del usuario según una RegEx, AngularJS style
---

![]({{ site.baseurl }}/assets/ng-pattern-restrict.png)

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
