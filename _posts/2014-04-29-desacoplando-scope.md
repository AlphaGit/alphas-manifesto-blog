---
layout: post
title: Desacoplando $scope
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5077
wordpress_url: http://blog.alphasmanifesto.com/?p=5077
date: '2014-04-29 23:36:42 +0000'
date_gmt: '2014-04-30 04:36:42 +0000'
categories:
- Projects
- Technology
tags:
- design
- unit testing
- AngularJS
- controllers
- desacoplamiento
- separación de responsabilidades
- "$scope"
---

![]({{ site.baseurl }}/assets/scopeSoupMin.png)

Tomando la sopa por el mango de la cuchara


Muchos desarrolladores de AngularJS dependen de $scope para la implementación y testing de la lógica de sus controladores. Esto genera problemas de performance y de diseño, pero gracias a una serie de artículos y una prueba de concepto, he puesto en práctica en [what-now](http://what-now.heroku.com) lo que podría ser la solución.

<!--more-->

## Sopa de dollar-scope, hey!

_♪ what a very good soup ♫_

Hace algunas semanas mi colega [Mariano Ravinale](http://mravinale.wordpress.com/) me compartió un muy buen artículo sobre AngularJS que planteaba la existencia de "$scope soup". Esta _sopa de $scope_ era básicamente una consecuencia de la forma en la que los tutoriales y documentación de AngularJS están afrontados, pero no la forma correcta en la que se puede construir el sistema.

Cuando empezamos a trabajar en AngularJS, aprendemos sobre la variable $scope, la forma en la que se puede usar para compartir datos entre un controller y un template. A la vez, también se puede inyectar esta misma dependencia en los tests, y compartiendo ese estado entre los tests y el código real es fácil para nosotros verificar el estado interno y unit-testear los métodos que implementamos.

Esto lleva, sin embargo, a que muchos programadores hagan uso y abuso de este servicio de `$scope`, creando, por un lado, una cantidad de dependencias terriblemente compleja entre variables de la misma, y por otro lado, un problema de performance para su aplicación en Angular (ya que todo lo que depende del `$scope` será verificado en la fase de digest).

El artículo original, [5 guidelines for avoiding scope soup in Angular](http://www.technofattie.com/2014/03/21/five-guidelines-for-avoiding-scope-soup-in-angular.html), la primerísima sugerencia que se da es de separar los métodos que son parte de los controllers de los métodos y propiedades que están expuestos en $scope. Es poca la explicación que se da al respecto, pero creo que vale la pena extenderla aquí.

## Controladores como clases auto-contenidas

Algo que está escondido a plena vista es que los controladores en AngularJS son funciones, a las cuales se les inyectan dependencias en su constructor. Es, en alguna forma, exactamente equivalente a declarar una función que sirve como nuestra clase e inyectar las dependencias en sus parámetros para constructor.

<script src="https://gist.github.com/AlphaGit/09af98de7ac11cf7a1fe.js"></script>

Y esto nos acerca un poco más al concepto real de las clases en JavaScript: de la misma forma que Angular nos permite inyectar objetos falsos al momento de hacer tests, también debería poder ocurrir eso en la aplicación real, y por tanto, **los objetos inyectados son solamente para el uso necesario**, no para el desarrollo principal de la lógica de nuestro controlador.

La diferencia es sutil pero muy importante: podemos comenzar a utilizar $scope solamenta para el propósito que fue construido: compartir datos, en un ámbito particular (controller / template, controller / directiva, directiva / directiva). El resto de la lógica debe ser propia del controlador, y no depender del $scope.

##  ¿Y cómo hacemos unit testing sin $scope?

Muy bien: hicimos los cambios, quitamos el uso de `$scope` siempre que no era necesario comopartir datos. Los tests ahora no pasan. Las casas se queman. La gente grita en desesperación. Todos se preguntan:  ¿cómo testeamos, ahora que el estado del controlador no se encuentra en `$scope`?

Lo primero a recordar es que al momento de testear no queremos inspeccionar cada variable y cada absoluto y diminuto aspecto interno de nuestro controller: esto haría que nuestros tests sean TAN dependientes del diseño actual, que es imposible hacer cambios sin tener que reescribir los tests.

Lo que sí tendremos disponible serán las funciones que el controlador exponga, junto con el uso que se haga de las dependencias inyectadas. Si usamos `$scope` para mantener una lista, siempre podemos verificar que la lista esté presente con los valores deseados. No porque queramos validar una variable, sino porque es el contrato que se está compartiendo con el template o la directiva.

<script src="https://gist.github.com/AlphaGit/57cf51d23e246bd01226.js"></script>

## Tres áreas separadas: privada, pública y contractual

Esta nueva aproximación nos permite definir áreas de separación muy claras en los controllers. Por un lado, es fácil definir una serie de funciones privadas que solamente serán accesibles por el controlador, en donde ni siquiera el testing podrá acceder. Y tiene sentido: un controlador no quiere exponer toda su complejidad interior, siempre y cuando sus  unidades de trabajo hagan lo que tengan que hacer. Y aquí es en donde el testing debe enfocarse: en que la lógica funcione como se debe, no en que las variables tengan determinados valores tras determinadas llamadas.

El área pública de un controlador será la funcionalidad que este controlador ofrece. Aunque no está reforzado por ninguna característica de la sintaxis, yo pienso que debería ser esta la única parte de un controlador a la cual un `$scope` debería acceder, o a la cual deberían acceder resultados de otros servicios o controladores. Esto se testea haciendo las llamadas correspondientes y verificando los resultados. La lógica interna debería quedar aislada en el área privada.

El área contractual es la que interactúa con otros servicios, incluyendo $scope. Aquí es donde sí deberemos verificar que las variables tengan un determinado nombre (porque son las que se utilizan como contrato), que tengan cierto valor luego de ciertos eventos, que las llamadas a las APIs se hagan con los parámetros apropiados. Esto se testeará inyectando espías de Jasmine, o mockeando los servicios y asegurándonos que las llamadas ocurran correctamente.

## Un ejemplo práctico

Porque un ejemplo de cuatro líneas no iba a alcanzar.

Puse esto en práctica y lo refiné hasta que pude llegar a estas conclusiones y realmente quedé satisfecho con el resultado. En what-now reescribí la forma en la que trabajaba el [main controller](https://github.com/AlphaGit/what-now/blob/768abafb44c1a525e16a034f22b2b851c796f5a3/app/scripts/controllers/main.js), y la forma en la que trabajaban [los tests de ese main controller](https://github.com/AlphaGit/what-now/blob/768abafb44c1a525e16a034f22b2b851c796f5a3/test/spec/controllers/main.js), acorde a las prácticas descriptas aquí.

Quisiera escuchar feedback y opiniones de cómo puede mejorarse, o si creen que esta aproximación es equivocada y por qué.
