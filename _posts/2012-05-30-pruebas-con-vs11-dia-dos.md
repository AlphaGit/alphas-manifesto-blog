---
layout: post
status: publish
published: true
title: 'Pruebas con VS11: Día dos'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 3932
wordpress_url: http://blog.alphasmanifesto.com/?p=3932
date: '2012-05-30 16:37:08 +0000'
date_gmt: '2012-05-30 21:37:08 +0000'
categories:
- Projects
- Technology
tags:
- C#
- organización
- Visual Studio
- código
- complejidad
- ".NET 4.5"
- asíncrono
- síncrono
comments:
- id: 8908
  author: VS2012, día cuatro | Alpha&#039;s Manifesto
  author_email: ''
  author_url: http://blog.alphasmanifesto.com/2012/08/22/vs2012-dia-cuatro/
  date: '2012-08-22 16:52:15 +0000'
  date_gmt: '2012-08-22 21:52:15 +0000'
  content: "[...] Pruebas con VS11: Día dos [...]"
- id: 8957
  author: Carlos Osorio M
  author_email: caosmo@outlook.com
  author_url: ''
  date: '2013-03-06 08:45:37 +0000'
  date_gmt: '2013-03-06 13:45:37 +0000'
  content: Muy clara la expliación y el ejemplo preciso para lo que se necesitaba.
    Gracias!!
- id: 8989
  author: Brayan Alexander Gomez Cano
  author_email: converse2015@hotmail.com
  author_url: ''
  date: '2013-05-06 16:17:08 +0000'
  date_gmt: '2013-05-06 21:17:08 +0000'
  content: EXCELENTE DEFINICIóN YA ENTIENDO UN POCO DE QUE TRATA EL TEMA
- id: 8990
  author: andres arroyo mena
  author_email: andyferlucy@hotmail.com
  author_url: ''
  date: '2013-05-06 17:34:02 +0000'
  date_gmt: '2013-05-06 22:34:02 +0000'
  content: W8
- id: 8991
  author: Alpha
  author_email: alpha@furries.com.ar
  author_url: http://www.alphasmanifesto.com/
  date: '2013-05-08 17:26:00 +0000'
  date_gmt: '2013-05-08 22:26:00 +0000'
  content: Muchas gracias Brayan, me alegro que te haya sido de ayuda. =)
- id: 9022
  author: paula andrea
  author_email: paulavelasco_96@hotmail.com
  author_url: http://blog.alphasmanifesto.com/2012/05/30/pruebas-con-vs11-dia-dos/
  date: '2013-06-24 18:25:53 +0000'
  date_gmt: '2013-06-24 23:25:53 +0000'
  content: es muy interesante conocer nuevas características  c++
- id: 9086
  author: mauricio herrera galindo
  author_email: maurete25@hotmail.com
  author_url: ''
  date: '2013-10-19 21:01:40 +0000'
  date_gmt: '2013-10-20 02:01:40 +0000'
  content: Esta entendible el tema pero como dije en principio es la primera vez que
    estoy con el tema pero vamos bien entendiendo el tema cada vez que abanso en le
    tema
---
async y await


Continuando con mi serie de posts e investigación sobre lo que VS11 ofrece (<a href="https://blog.alphasmanifesto.com/2012/05/11/pruebas-con-vs11-dia-uno/">Parte 1</a>), quisiera tomar una aproximación separada. Si bien la exploración es interesante, es poco apropiada cuando uno quiere aprovechar el tiempo.

Es por eso que comencé con las referencias en MSDN sobre <a href="http://msdn.microsoft.com/en-us/library/bb386063(v=vs.110).aspx">qué hay de nuevo en VS11</a>, que seguiremos de a partes. Pero a la vez quiero cumplir con mi promesa, por lo cual, si comenzamos sobre qué hay de nuevo en el lenguaje C# (lo siento VB, lo siento C++, soy del bando de C#), nos encontramos con la excusa para cumplir lo prometido.

## Características nuevas de C#: await y async

Esto, bien sabemos, no es algo propio de VS11, sino de C# 5.0, que va de la mano con VS11 y .NET 4.5. Como <a href="http://msdn.microsoft.com/en-us/library/hh156499(v=vs.110).aspx">MSDN</a> lo indica, una de las primeras características es la habilidad de construir fácilmente código asíncrono. _"We have to go deeper..."_

Cabe aclarar que ya existía la posibilidad de escribir código asíncrono. Los callbacks y el multithreading no es nada nuevo, aunque esto es ligeramente distinto, ya que simplifican un poco la idea y esconden el trabajo sucio. Sin duda se logrará que en el futuro mucha gente no sepa cómo funciona los métodos asíncronos por detrás pero esconder complejidad es un buen paso para permitir innovación.

Digamos que tenemos un programa que factoriza números grandes, porque logramos un trabajo de criptoanalista para el FBI. Nuestro método recibe un parámetro long y nos devuelve un `ISet<long>` con el conjunto de factores primos que conforman este número original. Dejando de lado la matemática, sabemos que este proceso toma un rato en ejecutarse y queremos que nuestro programa lo trate de forma asíncrona.  ¿Cómo se haría este trabajo de la forma tradicional?

Básicamente deberíamos definir un método que sirva de callback. El callback (también llamado continuación) es un método que el thread que trabaja en la tarea llama cuando termina para avisar que su trabajo terminó. De esta forma, podemos preparar nuestra tarea, enviarla a ejecutar, hacer otras cosas en el intermedio y ejecutar código extra cuando la tarea termina, como por ejemplo, trabajar con los resultados.

![]({{ site.url }}/assets/asyncWithoutAsync.png)


(Ejemplo del código en Gist.GitHub: <a href="https://gist.github.com/2838443">Async without async</a>)

Esta aproximación tiene un problema muy claro: la complejidad. Estamos de acuerdo con que el código de FactorNumber debería estar separado en su propio método, pero la continuación de la llamada a FactorNumber y el resto de esa lógica son parte de una misma operación. El hecho de que estén separados en el código no es más que una obligación que debemos cumplir por las restricciones del framework para la instanciación de threads.

Las palabras clave async y await resuelven este problema.

<script src="https://gist.github.com/2839080.js?file=Async.cs"></script>

Aquí podemos notar que la estructura del código ha cambiado un poco para dar soporte a esta característica. Por un lado, tuvimos que aislar el código que interactuará con métodos asíncronos, ya que los mismos deben devolver un tipo Task. Esto es porque devuelven un identificador de la tarea que está corriendo en background. En nuestro caso en particular, este será StartWork(), pero no estamos haciendo uso de su Task.

StartWork, siendo asíncrono, se ejecutará a la vez del resto del código, ya que no será bloqueante. Por tanto, el próximo Console.WriteLine se ejecutará, muy seguramente, al mismo tiempo que el procesamiento de StartWork ocurre. Dicho procesamiento hace una llamada bloqueante a FactorNumber, es decir, espera a que FactorNumber termine (lo cual nos permitió convertir la llamada en síncrona) y una vez que tenemos el resultado, se escribirá en consola. No era realmente necesario convertir esta llamada en síncrona de esa forma, una simple llamada a FactorNumber hubiera sido suficiente, pero de esta forma demostré que si bien el sistema espera por su respuesta suspendiendo el thread actual, sigue siendo asíncrono internamente. Eso significa que está ejecutando toda la tarea de callback que vimos antes de forma interna, y ahora nuestro código se lee fácilmente de arriba a abajo.

Confieso que debo trabajar un poco más en esto para no ensuciar tanto el código, pero por ahora parecería que el uso de las keywords exige modificar los valores de retorno y por tanto las llamadas a esos métodos deben ejecutarse de forma distinta. Eso no me agrada, porque inclina un poco la complejidad innecesaria para usar esto, pero sigue siendo una ventaja sobre la solución original.
