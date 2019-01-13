---
layout: post
status: publish
published: true
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
- separaci&oacute;n de responsabilidades
- "$scope"
comments:
- id: 9728
  author: Matias
  author_email: nexusmdq@yahoo.com.ar
  author_url: http://matias.beckerle.com.ar
  date: '2014-04-30 07:46:07 +0000'
  date_gmt: '2014-04-30 12:46:07 +0000'
  content: Gracias por compartirlo, muy buen post!
---

![](/assets/scopeSoupMin.png)

<p style="text-align: justify;">Muchos desarrolladores de AngularJS dependen de $scope para la implementaci&oacute;n y testing de la l&oacute;gica de sus controladores. Esto genera problemas de performance y de dise&ntilde;o, pero gracias a una serie de art&iacute;culos y una prueba de concepto, he puesto en pr&aacute;ctica en <a href="http://what-now.heroku.com">what-now</a> lo que podr&iacute;a ser la soluci&oacute;n.</p>
<p><!--more--></p>
<h2>Sopa de dollar-scope, hey!</h2>
<p><em><span style="color: #000000;">♪&nbsp;</span>what a very good soup&nbsp;<span style="color: #000000;">♫</span></em></p>
<p style="text-align: justify;">Hace algunas semanas mi colega <a href="http://mravinale.wordpress.com/">Mariano Ravinale</a> me comparti&oacute; un muy buen art&iacute;culo sobre AngularJS que planteaba la existencia de "$scope soup". Esta&nbsp;<em>sopa de $scope</em> era b&aacute;sicamente una consecuencia de la forma en la que los tutoriales y documentaci&oacute;n de AngularJS est&aacute;n afrontados, pero no la forma correcta en la que se puede construir el sistema.</p>
<p style="text-align: justify;">Cuando empezamos a trabajar en AngularJS, aprendemos sobre la variable $scope, la forma en la que se puede usar para compartir datos entre un controller y un template. A la vez, tambi&eacute;n se puede inyectar esta misma dependencia en los tests, y compartiendo ese estado entre los tests y el c&oacute;digo real es f&aacute;cil para nosotros verificar el estado interno y unit-testear los m&eacute;todos que implementamos.</p>
<p style="text-align: justify;">Esto lleva, sin embargo, a que muchos programadores hagan uso y abuso de este servicio de <code>$scope</code>, creando, por un lado, una cantidad de dependencias terriblemente compleja entre variables de la misma, y por otro lado, un problema de performance para su aplicaci&oacute;n en Angular (ya que todo lo que depende del <code>$scope</code> ser&aacute; verificado en la fase de digest).</p>
<p style="text-align: justify;">El art&iacute;culo original, <a href="http://www.technofattie.com/2014/03/21/five-guidelines-for-avoiding-scope-soup-in-angular.html">5 guidelines for avoiding scope soup in Angular</a>, la primer&iacute;sima sugerencia que se da es de separar los m&eacute;todos que son parte de los controllers de los m&eacute;todos y propiedades que est&aacute;n expuestos en $scope. Es poca la explicaci&oacute;n que se da al respecto, pero creo que vale la pena extenderla aqu&iacute;.</p>
<h2>Controladores como clases auto-contenidas</h2>
<p style="text-align: justify;">Algo que est&aacute; escondido a plena vista es que los controladores en AngularJS son funciones, a las cuales se les inyectan dependencias en su constructor. Es, en alguna forma, exactamente equivalente a declarar una funci&oacute;n que sirve como nuestra clase e inyectar las dependencias en sus par&aacute;metros para constructor.</p>
<p><script src="https://gist.github.com/AlphaGit/09af98de7ac11cf7a1fe.js"></script></p>
<p>Y esto nos acerca un poco m&aacute;s al concepto real de las clases en JavaScript: de la misma forma que Angular nos permite inyectar objetos falsos al momento de hacer tests, tambi&eacute;n deber&iacute;a poder ocurrir eso en la aplicaci&oacute;n real, y por tanto, <strong>los objetos inyectados son solamente para el uso necesario</strong>, no para el desarrollo principal de la l&oacute;gica de nuestro controlador.</p>
<p>La diferencia es sutil pero muy importante: podemos comenzar a utilizar $scope solamenta para el prop&oacute;sito que fue construido: compartir datos, en un &aacute;mbito particular (controller / template, controller / directiva, directiva / directiva). El resto de la l&oacute;gica debe ser propia del controlador, y no depender del $scope.</p>
<h2>&iquest;Y c&oacute;mo hacemos unit testing sin $scope?</h2>
<p>Muy bien: hicimos los cambios, quitamos el uso de <code>$scope</code> siempre que no era necesario comopartir datos. Los tests ahora no pasan. Las casas se queman. La gente grita en desesperaci&oacute;n. Todos se preguntan: &iquest;c&oacute;mo testeamos, ahora que el estado del controlador no se encuentra en <code>$scope</code>?</p>
<p>Lo primero a recordar es que al momento de testear no queremos inspeccionar cada variable y cada absoluto y diminuto aspecto interno de nuestro controller: esto har&iacute;a que nuestros tests sean TAN dependientes del dise&ntilde;o actual, que es imposible hacer cambios sin tener que reescribir los tests.</p>
<p>Lo que s&iacute; tendremos disponible ser&aacute;n las funciones que el controlador exponga, junto con el uso que se haga de las dependencias inyectadas. Si usamos <code>$scope</code> para mantener una lista, siempre podemos verificar que la lista est&eacute; presente con los valores deseados. No porque queramos validar una variable, sino porque es el contrato que se est&aacute; compartiendo con el template o la directiva.</p>
<p><script src="https://gist.github.com/AlphaGit/57cf51d23e246bd01226.js"></script></p>
<h2>Tres &aacute;reas separadas: privada, p&uacute;blica y contractual</h2>
<p style="text-align: justify;">Esta nueva aproximaci&oacute;n nos permite definir &aacute;reas de separaci&oacute;n muy claras en los controllers. Por un lado, es f&aacute;cil definir una serie de funciones privadas que solamente ser&aacute;n accesibles por el controlador, en donde ni siquiera el testing podr&aacute; acceder. Y tiene sentido: un controlador no quiere exponer toda su complejidad interior, siempre y cuando sus &nbsp;unidades de trabajo hagan lo que tengan que hacer. Y aqu&iacute; es en donde el testing debe enfocarse: en que la l&oacute;gica funcione como se debe, no en que las variables tengan determinados valores tras determinadas llamadas.</p>
<p style="text-align: justify;">El &aacute;rea p&uacute;blica de un controlador ser&aacute; la funcionalidad que este controlador ofrece. Aunque no est&aacute; reforzado por ninguna caracter&iacute;stica de la sintaxis, yo pienso que deber&iacute;a ser esta la &uacute;nica parte de un controlador a la cual un <code>$scope</code> deber&iacute;a acceder, o a la cual deber&iacute;an acceder resultados de otros servicios o controladores. Esto se testea haciendo las llamadas correspondientes y verificando los resultados. La l&oacute;gica interna deber&iacute;a quedar aislada en el &aacute;rea privada.</p>
<p style="text-align: justify;">El &aacute;rea contractual es la que interact&uacute;a con otros servicios, incluyendo $scope. Aqu&iacute; es donde s&iacute; deberemos verificar que las variables tengan un determinado nombre (porque son las que se utilizan como contrato), que tengan cierto valor luego de ciertos eventos, que las llamadas a las APIs se hagan con los par&aacute;metros apropiados. Esto se testear&aacute; inyectando esp&iacute;as de Jasmine, o mockeando los servicios y asegur&aacute;ndonos que las llamadas ocurran correctamente.</p>
<h2>Un ejemplo pr&aacute;ctico</h2>
<p style="text-align: justify;">Porque un ejemplo de cuatro l&iacute;neas no iba a alcanzar.</p>
<p style="text-align: justify;">Puse esto en pr&aacute;ctica y lo refin&eacute; hasta que pude llegar a estas conclusiones y realmente qued&eacute; satisfecho con el resultado. En what-now reescrib&iacute; la forma en la que trabajaba el <a href="https://github.com/AlphaGit/what-now/blob/768abafb44c1a525e16a034f22b2b851c796f5a3/app/scripts/controllers/main.js">main controller</a>, y la forma en la que trabajaban <a href="https://github.com/AlphaGit/what-now/blob/768abafb44c1a525e16a034f22b2b851c796f5a3/test/spec/controllers/main.js">los tests de ese main controller</a>, acorde a las pr&aacute;cticas descriptas aqu&iacute;.</p>
<p style="text-align: justify;">Quisiera escuchar feedback y opiniones de c&oacute;mo puede mejorarse, o si creen que esta aproximaci&oacute;n es equivocada y por qu&eacute;.</p>
