---
layout: post
status: publish
published: true
title: Condiciones OR en REST
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 4780
wordpress_url: http://blog.alphasmanifesto.com/?p=4780
date: '2013-08-08 17:42:13 +0000'
date_gmt: '2013-08-08 22:42:13 +0000'
categories:
- Projects
- Technology
tags:
- JSON
- REST
- HTTP
- est&aacute;ndares
- notaci&oacute;n posfijo
- notaci&oacute;n polaca inversa
- precedencia
- operaciones
- sintaxis
- GET
comments: []
---

![](/assets/ToRestOrNotToRest.jpg)

<p style="text-align: justify;">Es muy com&uacute;n que en la especificaci&oacute;n de condiciones a llamadas GET REST, la inclusi&oacute;n de diferentes par&aacute;metros indique una relaci&oacute;n AND entre ambas condiciones.</p>
<p style="text-align: justify;">Por ejemplo:</p>
<pre>GET /clients?lastName=Smith&amp;firstName=John</pre>
<p style="text-align: justify;">En una llamada as&iacute;, est&aacute; claro que los recursos que queremos obtener son aquellos que cumplen a la vez con ambas condiciones: tener lastName Smith y tener firstName John.</p>
<p style="text-align: justify;">Ahora, qu&eacute; pasar&iacute;a si quisi&eacute;ramos hacer una b&uacute;squeda de recursos en donde nuestro criterio no sea de necesaria inclusi&oacute;n de ambos par&aacute;metros. Por ejemplo, qu&eacute; tal si quisi&eacute;ramos que nuestros clientes cumplieran con cualquiera de esas dos condiciones? El problema no es la implementaci&oacute;n, sino de qu&eacute; forma podemos mantener la sintaxis de la llamada lo suficientemente limpia como para que tenga un sentido sem&aacute;ntico. Cito (secci&oacute;n 3.4): "<em>El componente de query contiene datos no-jer&aacute;rquicos que, junto con los datos en el componente de path (secci&oacute;n 3.3), sirve para identificar un recurso dentro del &aacute;mbito del esquema del URI y autoridad de nomenclatura (si la hubiera).</em>"</p>
<p style="text-align: justify;">Quisiera escuchar opiniones al respecto, pero continuemos.</p>
<p style="text-align: justify;"><!--more--></p>
<h2>Expresar la sintaxis dependiendo del orden (no recomendado)</h2>
<p style="text-align: justify;">Esta aproximaci&oacute;n nos permite, dependiendo solamente en el orden en que se presentan los par&aacute;metros, generar &aacute;rboles de condiciones muy ricos en contenido. Cabe destacar que la aproximaci&oacute;n es algo compleja, pero tiene la belleza de expresarse correctamente en la URL, sin necesidad de otra estructura que simplemente la asociaci&oacute;n par&aacute;metro-valor que el protocolo HTTP propone.</p>
<p style="text-align: justify;">Sin embargo, si hablamos de est&aacute;ndares y verificamos el <a href="http://tools.ietf.org/html/rfc3986">RFC 3986</a>, estamos par&aacute;ndonos sobre una l&iacute;nea gris. El est&aacute;ndar sobre URLs no dice demasiado sobre la sem&aacute;ntica del <em>query string</em>, pero menciona que est&aacute; destinado a&nbsp;<em>informaci&oacute;n no-jer&aacute;rquica</em>, aunque el documento se encuentra en ese punto discutiendo la sintaxis y la naturaleza de su formato, m&aacute;s que su contenido aceptable.</p>
<h3>Operadores como par&aacute;metros</h3>
<p style="text-align: justify;">Una posible aproximaci&oacute;n requiere que dependamos del orden en el que se reciben los par&aacute;metros, algo que no siempre es recomendable, y definitivamente no es una buena pr&aacute;ctica. Pero suponiendo que podamos hacerlo, nuestra aproximaci&oacute;n se hace muy simple:</p>
<pre>GET /clients?lastName=Smith&amp;operator=OR&amp;firstName=John&amp;operator=AND&amp;age=25</pre>
<p style="text-align: justify;">Como vemos, depender del orden nos permite definir qu&eacute; operadores queremos aplicar de izquierda a derecha. Por supuesto, podemos generar la cantidad de par&aacute;metros o hacer el request tan complejo como sea necesario para expresar nuestro deseo. Sin embargo, no es dif&iacute;cil que esto se vuelva complejo, puesto que en esta manera debemos ser muy expl&iacute;citos en aquello que queremos identificar.</p>
<p style="text-align: justify;">En nuestro ejemplo anterior, estamos verificando:</p>
<ul>
<li style="text-align: justify;"><span style="line-height: 13px;">Que el cliente se apellide Smith</span></li>
<li style="text-align: justify;">O que el cliente se llame John</li>
<li style="text-align: justify;">Y que su edad sea 25</li>
</ul>
<h3>Operadores de precedencia</h3>
<p style="text-align: justify;">&iquest;La edad debe ser 25 junto con cualquiera de ambas opciones, o solo si se cumple la segunda? Esto se presta a interpretaci&oacute;n, y s&oacute;lo reglas de precedencia lo resolver&iacute;an. Otra forma es aplicar operadores de precedencia (&iquest;par&eacute;ntesis?) y podemos extender m&aacute;s a&uacute;n la l&oacute;gica de indicaci&oacute;n de operadores para valores de comparaci&oacute;n.</p>
<pre>GET /clients?operator=STARTPRECEDENCE&amp;field=lastName&amp;operator=EQUALS&amp;value=Smith&amp;operator=OR&amp;field=firstName&amp;operator=EQUALS&amp;value=John&amp;operator=ENDPRECENDE&amp;operator=AND&amp;field=age&amp;operator=GREATERTHAN&amp;value=25</pre>
<p style="text-align: justify;">Nuestra nueva consulta entonces se puede traducir a:</p>
<pre>(lastName = Smith OR firstName = John) AND age > 25</pre>
<h3>Notaci&oacute;n polaca inversa: evitando operadores de precedencia</h3>
<p style="text-align: justify;">Muchos no est&aacute;n familiarizados con la <a href="http://es.wikipedia.org/wiki/Notaci%C3%B3n_polaca_inversa">Notaci&oacute;n Polaca Inversa</a>&nbsp;(tambi&eacute;n llamada notaci&oacute;n posfija), pero aplicada correctamente puede ser una herramienta muy poderosa. En nuestro caso, es particularmente &uacute;til porque asumiendo una sintaxis correcta y el orden de los par&aacute;metros podemos evitar usar operadores de precedencia. Y esto es algo que quisi&eacute;ramos hacer, porque ya tenemos necesidad de aplicar esos dos supuestos por la forma en la que estamos recibiendo nuestra sintaxis.</p>
<p style="text-align: justify;">La notaci&oacute;n posfijo se trata de cambiar el orden de los operandos y los operadores para que el procesamiento se haga de izquierda a derecha, de forma que la precedencia est&aacute; indicada por el orden y por los resultados intermedios, independientemente de los s&iacute;mbolos que vengan a continuaci&oacute;n. Otra de las ventajas que esto significa es que se simplifica enormemente la implementaci&oacute;n de parseo e incluso puede ejecutarse <em>on the fly</em>.</p>
<p style="text-align: justify;">Por ejemplo, para calcular</p>
<pre>1 + (4 + 3) * 2</pre>
<p style="text-align: justify;">Debemos identificar la precedencia, aplicarla primero, reemplazar el resultado parcial en nuestro &aacute;rbol de ejecuci&oacute;n y luego repetir. En nuestro ejemplo, esto ser&iacute;a:</p>
<pre>1 + (4 + 3) * 2
1 + (7) * 2
1 + 7 * 2
1 + 14
15</pre>
<p style="text-align: justify;">La misma operaci&oacute;n expresada en notaci&oacute;n posfijo puede ejecutarse de izquierda a derecha, ignorando lo que contin&uacute;e a la derecha de la expresi&oacute;n.</p>
<pre>4 3 + 2 * 1 +
7 2 * 1 +
14 1 +
15</pre>
<p style="text-align: justify;">Noten c&oacute;mo no hace falta par&eacute;ntesis, porque los primeros dos elementos siempre ser&aacute;n los que se ejecutar&aacute;n.</p>
<p style="text-align: justify;">Volviendo a nuestro ejemplo de pedidos GET,</p>
<pre>(lastName = Smith OR firstName = John) AND age > 25</pre>
<p style="text-align: justify;">podr&iacute;amos expresarlo en notaci&oacute;n posfija como:</p>
<pre>lastName "Smith" EQUALS firstName "John" EQUALS OR age "25" GREATER AND</pre>
<p style="text-align: justify;">En esa cadena, podemos diferenciar nombres de campos por valores literales con el uso de comillas, pero volviendo al uso anterior de par&aacute;metros de campo, podr&iacute;amos re-escribir esta condici&oacute;n de la siguiente forma:</p>
<pre>lastName FIELD Smith VALUE EQUALS firstName FIELD John VALUE EQUALS OR age FIELD 25 VALUE GREATER AND</pre>
<p style="text-align: justify;">Con lo que nuestra llamada GET se reducir&iacute;a a:</p>
<pre>GET /clients?field=lastName&amp;value=Smith&amp;operator=EQUALS&amp;field=firstName&amp;value=John&amp;operator=EQUALS&amp;operator=OR&amp;field=age&amp;value=25&amp;operator=GREATER&amp;operator=AND</pre>
<p style="text-align: justify;">Notar&aacute;n c&oacute;mo vali&eacute;ndonos m&aacute;s en el orden podemos ahorrar espacio sin utilizar los operadores de precedencia.</p>
<h2>Expresar la sintaxis como jerarqu&iacute;a (recomendado)</h2>
<p style="text-align: justify;">El punto anterior sufre de unos problemas muy caracter&iacute;sticos:</p>
<ul style="text-align: justify;">
<li><span style="line-height: 13px;">Es primordial que los par&aacute;metros puedan procesarse en el orden correcto (y esto depende de la plataforma web sobre la que estemos trabajando)</span></li>
<li>Con unas pocas condiciones complejas la cadena ser&aacute; exesivamente larga</li>
<li>Son demasiado complejas</li>
</ul>
<p style="text-align: justify;">Est&aacute; claro entonces que para hacer las cosas m&aacute;s simples, podr&iacute;amos recurrir a estructuras que fueron pensadas para este tipo de informaci&oacute;n. En este caso, voy a hablar de JSON, que me agrada por la simplicidad de su sintaxis.</p>
<p style="text-align: justify;">Volvamos a plantear nuestro ejemplo:</p>
<pre>(lastName = Smith OR firstName = John) AND age > 25</pre>
<p style="text-align: justify;">Para expresarlo como jerarqu&iacute;a, supongamos que cada elemento de nuestro &aacute;rbol de operaciones que responder&iacute;a a la siguiente estructura (si saben leer gram&aacute;ticas o <a href="http://en.wikipedia.org/wiki/Augmented_Backus%E2%80%93Naur_Form">ABNF</a>, esto les va a ser f&aacute;cil):</p>
<pre>S&nbsp;&rarr; operation
operation&nbsp;&rarr; operator operands
operator&nbsp;&rarr; "AND" | "OR" | "EQUALS" | "GREATER" | ...
operands&nbsp;&rarr; operand+
operand&nbsp;&rarr; operation | field | value
field&nbsp;&rarr; "lastName" | "firstName" | "age" | ...
value&nbsp;&rarr; (cualquier valor constante)</pre>
<p style="text-align: justify;">Nuestro &aacute;rbol ya posee las precedencias expresadas en sus jerarqu&iacute;as, puesto que para resolver el &aacute;rbol y llegar a un &uacute;nico valor, deben resolverse primero las hojas y reducirlas a nodos que ser&aacute;n nuevas hojas a ser resueltas. As&iacute; sucesivamente hasta llegar a un &uacute;nico valor.</p>
<p style="text-align: justify;">Teniendo eso en cuenta, ahora expresemos nuestro ejemplo como una jerarqu&iacute;a de operaciones en formato JSON.</p>
<pre>{
    operator: "AND",
    operands: [
    {
        operator: "OR",
        operands: [
            {
                operator: "EQUALS",
                operands: [
                    { field: "lastName" },
                    { value: "Smith" }
                ]
            },
            {
                operator: "EQUALS",
                operands: [
                    { field: "firstName" },
                    { value: "John" }
                ]
            }
        ]
     },
     {
         operator: "GREATER",
         operands: [
             { field: "age" },
             { value: "25" }
        ]
     }
}</pre>
<p style="text-align: justify;">Ahora, el problema con esto es que es excesivamente largo, pero dado que los nombres de los operadores van a ser identificables, podemos reducir el &aacute;rbol haciendo un poco de trampa sint&aacute;ctica y remover lo que m&aacute;s espacio nos cuesta: los identificadores de los campos.</p>
<pre>{
    AND: [
    {
        OR: [
            {
                EQUALS: [
                    { field: "lastName" },
                    { value: "Smith" }
                ]
            },
            {
                EQUALS: [
                    { field: "firstName" },
                    { value: "John" }
                ]
            }
        ]
     },
     {
         GREATER: [
             { field: "age" },
             { value: "25" }
        ]
     }
}</pre>
<p style="text-align: justify;">Quitando espacios e identaci&oacute;n:</p>
<pre>{AND:[{OR:[{EQUALS:[{field:"lastName"},{value:"Smith"}]},{EQUALS:[{field:"firstName"},{value:"John"}]}]},{GREATER:[{field:"age"},{value:"25"}]}}</pre>
<pre>GET /clients?filter={AND:[{OR:[{EQUALS:[{field:"lastName"},{value:"Smith"}]},{EQUALS:[{field:"firstName"},{value:"John"}]}]},{GREATER:[{field:"age"},{value:"25"}]}}</pre>
<p style="text-align: justify;">Espero que esto haya sido de utilidad. Acepto sugerencias sobre otras aproximaciones, ventajas y desventajas de las aqu&iacute; presentadas.</p>
