---
layout: single
title: 'Pruebas con VS11: Día dos'
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
sub_title: async y await
---

Continuando con mi serie de posts e investigación sobre lo que VS11 ofrece ([Parte 1]({{ site.baseUrl }}{% link _posts/2012/2012-05-11-pruebas-con-vs11-dia-uno.md %})), quisiera tomar una aproximación separada. Si bien la exploración es interesante, es poco apropiada cuando uno quiere aprovechar el tiempo.

Es por eso que comencé con las referencias en MSDN sobre [qué hay de nuevo en VS11](http://msdn.microsoft.com/en-us/library/bb386063(v=vs.110).aspx), que seguiremos de a partes. Pero a la vez quiero cumplir con mi promesa, por lo cual, si comenzamos sobre qué hay de nuevo en el lenguaje C# (lo siento VB, lo siento C++, soy del bando de C#), nos encontramos con la excusa para cumplir lo prometido.

## Características nuevas de C#: await y async

Esto, bien sabemos, no es algo propio de VS11, sino de C# 5.0, que va de la mano con VS11 y .NET 4.5. Como [MSDN](http://msdn.microsoft.com/en-us/library/hh156499(v=vs.110).aspx) lo indica, una de las primeras características es la habilidad de construir fácilmente código asíncrono. _"We have to go deeper..."_

Cabe aclarar que ya existía la posibilidad de escribir código asíncrono. Los callbacks y el multithreading no es nada nuevo, aunque esto es ligeramente distinto, ya que simplifican un poco la idea y esconden el trabajo sucio. Sin duda se logrará que en el futuro mucha gente no sepa cómo funciona los métodos asíncronos por detrás pero esconder complejidad es un buen paso para permitir innovación.

Digamos que tenemos un programa que factoriza números grandes, porque logramos un trabajo de criptoanalista para el FBI. Nuestro método recibe un parámetro long y nos devuelve un `ISet<long>` con el conjunto de factores primos que conforman este número original. Dejando de lado la matemática, sabemos que este proceso toma un rato en ejecutarse y queremos que nuestro programa lo trate de forma asíncrona.  ¿Cómo se haría este trabajo de la forma tradicional?

Básicamente deberíamos definir un método que sirva de callback. El callback (también llamado continuación) es un método que el thread que trabaja en la tarea llama cuando termina para avisar que su trabajo terminó. De esta forma, podemos preparar nuestra tarea, enviarla a ejecutar, hacer otras cosas en el intermedio y ejecutar código extra cuando la tarea termina, como por ejemplo, trabajar con los resultados.

![]({{ site.baseurl }}/assets/asyncWithoutAsync.png)


(Ejemplo del código en Gist.GitHub: [Async without async](https://gist.github.com/2838443))

Esta aproximación tiene un problema muy claro: la complejidad. Estamos de acuerdo con que el código de FactorNumber debería estar separado en su propio método, pero la continuación de la llamada a FactorNumber y el resto de esa lógica son parte de una misma operación. El hecho de que estén separados en el código no es más que una obligación que debemos cumplir por las restricciones del framework para la instanciación de threads.

Las palabras clave async y await resuelven este problema.

<script src="https://gist.github.com/2839080.js?file=Async.cs"></script>

Aquí podemos notar que la estructura del código ha cambiado un poco para dar soporte a esta característica. Por un lado, tuvimos que aislar el código que interactuará con métodos asíncronos, ya que los mismos deben devolver un tipo Task. Esto es porque devuelven un identificador de la tarea que está corriendo en background. En nuestro caso en particular, este será StartWork(), pero no estamos haciendo uso de su Task.

StartWork, siendo asíncrono, se ejecutará a la vez del resto del código, ya que no será bloqueante. Por tanto, el próximo Console.WriteLine se ejecutará, muy seguramente, al mismo tiempo que el procesamiento de StartWork ocurre. Dicho procesamiento hace una llamada bloqueante a FactorNumber, es decir, espera a que FactorNumber termine (lo cual nos permitió convertir la llamada en síncrona) y una vez que tenemos el resultado, se escribirá en consola. No era realmente necesario convertir esta llamada en síncrona de esa forma, una simple llamada a FactorNumber hubiera sido suficiente, pero de esta forma demostré que si bien el sistema espera por su respuesta suspendiendo el thread actual, sigue siendo asíncrono internamente. Eso significa que está ejecutando toda la tarea de callback que vimos antes de forma interna, y ahora nuestro código se lee fácilmente de arriba a abajo.

Confieso que debo trabajar un poco más en esto para no ensuciar tanto el código, pero por ahora parecería que el uso de las keywords exige modificar los valores de retorno y por tanto las llamadas a esos métodos deben ejecutarse de forma distinta. Eso no me agrada, porque inclina un poco la complejidad innecesaria para usar esto, pero sigue siendo una ventaja sobre la solución original.
