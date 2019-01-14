---
layout: post
status: publish
published: true
title: 'Pruebas con VS11: D&iacute;a dos'
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
- organizaci&oacute;n
- Visual Studio
- c&oacute;digo
- complejidad
- ".NET 4.5"
- as&iacute;ncrono
- s&iacute;ncrono
comments:
- id: 8908
  author: VS2012, d&iacute;a cuatro | Alpha&#039;s Manifesto
  author_email: ''
  author_url: http://blog.alphasmanifesto.com/2012/08/22/vs2012-dia-cuatro/
  date: '2012-08-22 16:52:15 +0000'
  date_gmt: '2012-08-22 21:52:15 +0000'
  content: "[...] Pruebas con VS11: D&iacute;a dos [...]"
- id: 8957
  author: Carlos Osorio M
  author_email: caosmo@outlook.com
  author_url: ''
  date: '2013-03-06 08:45:37 +0000'
  date_gmt: '2013-03-06 13:45:37 +0000'
  content: Muy clara la expliaci&oacute;n y el ejemplo preciso para lo que se necesitaba.
    Gracias!!
- id: 8989
  author: Brayan Alexander Gomez Cano
  author_email: converse2015@hotmail.com
  author_url: ''
  date: '2013-05-06 16:17:08 +0000'
  date_gmt: '2013-05-06 21:17:08 +0000'
  content: EXCELENTE DEFINICI&Oacute;N YA ENTIENDO UN POCO DE QUE TRATA EL TEMA
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
  content: es muy interesante conocer nuevas caracter&iacute;sticas  c++
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

<p style="text-align: justify;">Continuando con mi serie de posts e investigaci&oacute;n sobre lo que VS11 ofrece (<a href="https://blog.alphasmanifesto.com/2012/05/11/pruebas-con-vs11-dia-uno/">Parte 1</a>), quisiera tomar una aproximaci&oacute;n separada. Si bien la exploraci&oacute;n es interesante, es poco apropiada cuando uno quiere aprovechar el tiempo.</p>
<p style="text-align: justify;">Es por eso que comenc&eacute; con las referencias en MSDN sobre <a href="http://msdn.microsoft.com/en-us/library/bb386063(v=vs.110).aspx">qu&eacute; hay de nuevo en VS11</a>, que seguiremos de a partes. Pero a la vez quiero cumplir con mi promesa, por lo cual, si comenzamos sobre qu&eacute; hay de nuevo en el lenguaje C# (lo siento VB, lo siento C++, soy del bando de C#), nos encontramos con la excusa para cumplir lo prometido.</p>
<h2 style="text-align: justify;">Caracter&iacute;sticas nuevas de C#: await y async</h2>
<p style="text-align: justify;">Esto, bien sabemos, no es algo propio de VS11, sino de C# 5.0, que va de la mano con VS11 y .NET 4.5. Como <a href="http://msdn.microsoft.com/en-us/library/hh156499(v=vs.110).aspx">MSDN</a> lo indica, una de las primeras caracter&iacute;sticas es la habilidad de construir f&aacute;cilmente c&oacute;digo as&iacute;ncrono. <em>"We have to go deeper..."</em></p>
<p style="text-align: justify;">Cabe aclarar que ya exist&iacute;a la posibilidad de escribir c&oacute;digo as&iacute;ncrono. Los callbacks y el multithreading no es nada nuevo, aunque esto es ligeramente distinto, ya que simplifican un poco la idea y esconden el trabajo sucio. Sin duda se lograr&aacute; que en el futuro mucha gente no sepa c&oacute;mo funciona los m&eacute;todos as&iacute;ncronos por detr&aacute;s pero esconder complejidad es un buen paso para permitir innovaci&oacute;n.</p>
<p style="text-align: justify;">Digamos que tenemos un programa que factoriza n&uacute;meros grandes, porque logramos un trabajo de criptoanalista para el FBI. Nuestro m&eacute;todo recibe un par&aacute;metro long y nos devuelve un ISet<long> con el conjunto de factores primos que conforman este n&uacute;mero original. Dejando de lado la matem&aacute;tica, sabemos que este proceso toma un rato en ejecutarse y queremos que nuestro programa lo trate de forma as&iacute;ncrona. &iquest;C&oacute;mo se har&iacute;a este trabajo de la forma tradicional?</p>
<p style="text-align: justify;">B&aacute;sicamente deber&iacute;amos definir un m&eacute;todo que sirva de callback. El callback (tambi&eacute;n llamado continuaci&oacute;n) es un m&eacute;todo que el thread que trabaja en la tarea llama cuando termina para avisar que su trabajo termin&oacute;. De esta forma, podemos preparar nuestra tarea, enviarla a ejecutar, hacer otras cosas en el intermedio y ejecutar c&oacute;digo extra cuando la tarea termina, como por ejemplo, trabajar con los resultados.</p>

![](/assets/asyncWithoutAsync.png)

<p style="text-align: justify;">(Ejemplo del c&oacute;digo en Gist.GitHub: <a href="https://gist.github.com/2838443">Async without async</a>)</p>
<p style="text-align: justify;">Esta aproximaci&oacute;n tiene un problema muy claro: la complejidad. Estamos de acuerdo con que el c&oacute;digo de FactorNumber deber&iacute;a estar separado en su propio m&eacute;todo, pero la continuaci&oacute;n de la llamada a FactorNumber y el resto de esa l&oacute;gica son parte de una misma operaci&oacute;n. El hecho de que est&eacute;n separados en el c&oacute;digo no es m&aacute;s que una obligaci&oacute;n que debemos cumplir por las restricciones del framework para la instanciaci&oacute;n de threads.</p>
<p style="text-align: justify;">Las palabras clave async y await resuelven este problema.</p>
<p><script src="https://gist.github.com/2839080.js?file=Async.cs"></script></p>
<p style="text-align: justify;">Aqu&iacute; podemos notar que la estructura del c&oacute;digo ha cambiado un poco para dar soporte a esta caracter&iacute;stica. Por un lado, tuvimos que aislar el c&oacute;digo que interactuar&aacute; con m&eacute;todos as&iacute;ncronos, ya que los mismos deben devolver un tipo Task. Esto es porque devuelven un identificador de la tarea que est&aacute; corriendo en background. En nuestro caso en particular, este ser&aacute; StartWork(), pero no estamos haciendo uso de su Task.</p>
<p style="text-align: justify;">StartWork, siendo as&iacute;ncrono, se ejecutar&aacute; a la vez del resto del c&oacute;digo, ya que no ser&aacute; bloqueante. Por tanto, el pr&oacute;ximo Console.WriteLine se ejecutar&aacute;, muy seguramente, al mismo tiempo que el procesamiento de StartWork ocurre. Dicho procesamiento hace una llamada bloqueante a FactorNumber, es decir, espera a que FactorNumber termine (lo cual nos permiti&oacute; convertir la llamada en s&iacute;ncrona) y una vez que tenemos el resultado, se escribir&aacute; en consola. No era realmente necesario convertir esta llamada en s&iacute;ncrona de esa forma, una simple llamada a FactorNumber hubiera sido suficiente, pero de esta forma demostr&eacute; que si bien el sistema espera por su respuesta suspendiendo el thread actual, sigue siendo as&iacute;ncrono internamente. Eso significa que est&aacute; ejecutando toda la tarea de callback que vimos antes de forma interna, y ahora nuestro c&oacute;digo se lee f&aacute;cilmente de arriba a abajo.</p>
<p style="text-align: justify;">Confieso que debo trabajar un poco m&aacute;s en esto para no ensuciar tanto el c&oacute;digo, pero por ahora parecer&iacute;a que el uso de las keywords exige modificar los valores de retorno y por tanto las llamadas a esos m&eacute;todos deben ejecutarse de forma distinta. Eso no me agrada, porque inclina un poco la complejidad innecesaria para usar esto, pero sigue siendo una ventaja sobre la soluci&oacute;n original.</p>
