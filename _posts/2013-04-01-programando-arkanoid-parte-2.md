---
layout: post
status: publish
published: true
title: Programando Arkanoid - Parte 2
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 4718
wordpress_url: http://blog.alphasmanifesto.com/?p=4718
date: '2013-04-01 20:23:58 +0000'
date_gmt: '2013-04-02 01:23:58 +0000'
categories:
- Projects
- Technology
tags:
- proyecto
- JavaScript
- HTML5
- OOP
- Canvas
- clases
- herencia
- objetos
- prototipo
- coordenadas
- programming
comments:
- id: 9081
  author: Alex
  author_email: xanderllopp@gmail.com
  author_url: ''
  date: '2013-10-08 22:26:28 +0000'
  date_gmt: '2013-10-09 03:26:28 +0000'
  content: Amigo te felicito por el c&oacute;digo, una pregunta, &iquest;c&oacute;mo
    le aumento la velocidad a la pelota?
- id: 9082
  author: Alpha
  author_email: alpha@furries.com.ar
  author_url: http://www.alphasmanifesto.com/
  date: '2013-10-09 08:06:58 +0000'
  date_gmt: '2013-10-09 13:06:58 +0000'
  content: |-
    Muchas gracias! Todav&iacute;a no he cubierto esa parte pero la velocidad aumenta autom&aacute;ticamente cada vez que la pelota rebota 10 veces sin hacer perder al jugador.

    Estas son las l&iacute;neas responsables, en la versi&oacute;n actual del c&oacute;digo:

    <a href="https://github.com/AlphaGit/random-javascript/blob/master/arkanoid-canvas/arkanoid.js#L44" rel="nofollow">L&iacute;nea 44</a>: identifica los frames por segundo (FPS) a los que el juego corre. Ese "200" son los FPS del juego. Poner un n&uacute;mero m&aacute;s alto acelerar&aacute; todo el juego proporcionalmente.

    <a href="https://github.com/AlphaGit/random-javascript/blob/master/arkanoid-canvas/arkanoid.js#L271" rel="nofollow">L&iacute;nea 271</a>: es la velocidad siendo aumentada cada 10 golpes. Multiplicar ese n&uacute;mero por un valor mayor a 1 har&aacute; que la velocidad aumente m&aacute;s, cambiar 10 por un n&uacute;mero m&aacute;s peque&ntilde;o har&aacute; que ocurra m&aacute;s seguido.

    <a href="https://github.com/AlphaGit/random-javascript/blob/master/arkanoid-canvas/arkanoid.js#L256" rel="nofollow">L&iacute;nea 256</a>: es el movimiento inicial, actualmente de 1 p&iacute;xel vertical y 1 p&iacute;xel horizontal. Poner valores m&aacute;s grandes har&aacute; que la pelota comience con una velocidad mayor.

    &iexcl;Saludos!
- id: 9094
  author: Alex
  author_email: xanderllopp@gmail.com
  author_url: ''
  date: '2013-10-22 21:54:25 +0000'
  date_gmt: '2013-10-23 02:54:25 +0000'
  content: Gracias por la repuesta, ahora mi idea es poner dos barras en vertical
    para hacer un juego como el pong o una especie de tennis con los bloques como
    obst&aacute;culos.
---

![](/assets/Building2lq.jpg)

El escenario de juego y el jugador en él

<p style="text-align: justify;"><a href="https://blog.alphasmanifesto.com/2013/03/13/programando-arkanoid-parte-1/">En la entrega pasada</a> hablamos sobre c&oacute;mo comenz&oacute; el <a title="Arkanoid" href="http://randomjs.alphasmanifesto.com/arkanoid-canvas/arkanoid.html">juego de Arkanoid</a>, ahora continuaremos ese camino sobre la construcci&oacute;n del escenario de juego.</p>
<p><!--more--></p>
<p style="text-align: justify;">En&nbsp;<a title="Programando Arkanoid - Parte 1" href="https://blog.alphasmanifesto.com/2013/03/13/programando-arkanoid-parte-1/">esa instancia</a>&nbsp;cubrimos la estructura general de los archivos, la inicializaci&oacute;n del objeto <span style="font-family: 'courier new', courier;">canvas</span>, los estilos a usar y la inicializaci&oacute;n de las opciones. Dejamos algo pendiente, que era el escenario, en un objeto <span style="font-family: 'courier new', courier;">ArkanoidStage</span>. En ese post no expliqu&eacute; qu&eacute; hac&iacute;a este objeto o como trabajaba. Hoy comenzaremos por ah&iacute;. Lo que describiremos en este post est&aacute; cubierto en el commit <a href="https://github.com/AlphaGit/random-javascript/commit/90e6540100631e1a3ae590c3bde4a21b74f7abd9">90e6...abd9</a>.</p>
<p><script src="https://gist.github.com/AlphaGit/5158029.js"></script></p>
<h2>Introducci&oacute;n del escenario</h2>

![](/assets/arkanoidescenario.jpg)

<p style="text-align: justify;">Ya tenemos generado el objeto <span style="font-family: 'courier new', courier;">canvas</span> y las opciones para comenzar a dibujar sobre el contexto. Ahora, toda esa l&oacute;gica de dibujado deber&iacute;a ser encerrada en alg&uacute;n objeto que pueda coordinar los elementos a dibujar -- o a no dibujar (por ejemplo, cuando un bloque desaparezca). Por otra parte, este objeto podr&aacute; hacer los c&aacute;lculos de tama&ntilde;os seg&uacute;n el tama&ntilde;o del escenario (una de las opciones que ya inicializamos).</p>
<p style="text-align: justify;">Para eso introducimos la clase&nbsp;<span style="font-family: 'courier new', courier;">ArkanoidStage</span>.</p>
<p><script src="https://gist.github.com/AlphaGit/5218647.js"></script></p>
<p style="text-align: justify;">Como podr&aacute;n ver, la declaraci&oacute;n de clases en JavaScript no es realmente muy distinta de una funci&oacute;n. En realidad,&nbsp;<em>es</em> una funci&oacute;n, que funciona como generadora de los objetos y &aacute;mbito limitador de sus acciones. Los argumentos de esta funci&oacute;n ser&aacute;n los par&aacute;metros actuales que son pasados al constructor (no hablar&eacute; de los par&aacute;metros formales porque no son realmente necesarios para el pasaje de los mismos). Como preferencia personal, declaro los par&aacute;metros a recibir para tener en cuenta en el futuro. M&aacute;s a&uacute;n, es m&aacute;s f&aacute;cil hacer validaciones sobre ellos si es que quisi&eacute;ramos.</p>
<p style="text-align: justify;">Los par&aacute;metros que <span style="font-family: 'courier new', courier;">ArkanoidStage</span> recibir&aacute; son tres: el contexto sobre el que se dibujar&aacute;, el alto y el ancho del escenario. Asumiremos desde ahora que todas las distancias est&aacute;n medidas en p&iacute;xeles, y que la coordenada (0, 0) es la esquina superior izquierda de la pantalla, aumentando hacia abajo y hacia la derecha.</p>
<p style="text-align: justify;">Una buena idea para el c&aacute;lculo de los dibujos a realizar es plantear una grilla. Para eso, decidiremos primero el tama&ntilde;o de los bloques como una porci&oacute;n del ancho y alto disponible. De esta forma, el juego ser&aacute; siempre el mismo independientemente del tama&ntilde;o de la ventana del navegador. Para eso, el escenario calcula <span style="font-family: 'courier new', courier;">blockHeight</span> y <span style="font-family: 'courier new', courier;">blockWidth</span>. Estamos considerando que en una pantalla de juego podr&aacute;n entrar 10 bloques horizontalmente, y 50 bloques verticalmente. &iquest;C&oacute;mo surgieron estos n&uacute;meros? Simplemente me gustaron, y encontr&eacute; que la proporci&oacute;n entre ellos era bastante aceptable. Por supuesto, esto puede cambiar a gusto.</p>
<p style="text-align: justify;">Ya que estamos calculando tama&ntilde;os, es importante notar que hay un elemento que no sigue esta regla: la pelota del juego. A ella la haremos un poco m&aacute;s grande que el tama&ntilde;o de un bloque, algo as&iacute; como un bloque y medio de alto (su menor dimensi&oacute;n). Para eso entonces, calcularemos el radio de la pelota como un 80% del tama&ntilde;o de un bloque, lo que nos dar&aacute; una pelota de 1.6 bloques-alto de di&aacute;metro.</p>
<p style="text-align: justify;">Por &uacute;ltimo, el escenario comenzar&aacute; dibujando nuestro primer objeto: El jugador. Como el jugador posee l&oacute;gica propia (movimiento fuera de la grilla, velocidad incremental), vamos a hacer una clase propia para este objeto. Pero por ahora, vamos a instanciarlo y a pedirle que se dibuje (l&iacute;neas 7 y 8). Lo que el jugador necesitar&aacute; es:</p>
<ul>
<li style="text-align: justify;">el contexto (para dibujarse),</li>
<li style="text-align: justify;">un color (para dibujarse),</li>
<li style="text-align: justify;">el alto de un bloque (ya calculado para sus dimensiones)</li>
<li style="text-align: justify;">el ancho de un bloque (ya calculado para sus dimensiones)</li>
<li style="text-align: justify;">el ancho del escenario (para poder calcular sus movimientos)</li>
<li style="text-align: justify;">el alto del escenario (s&oacute;lo por consistencia -- pero en retrospectiva, podr&iacute;a haber eliminado esta parte)</li>
</ul>
<p style="text-align: justify;">Finalmente, nuestro escenario no tiene nada que devolver porque es qui&eacute;n se encargar&aacute; de todo en el futuro. Por supuesto que la decisi&oacute;n podr&iacute;a ser otra, pero este es el camino que decid&iacute; tomar.</p>
<p style="text-align: justify;">Como nota extra, notar&aacute;n que no me preocup&oacute; escribir esto en el global scope. Como toda la l&oacute;gica estar&aacute; encerrada en cada uno de los objetos, me parece aceptable. Para aplicaciones reales o m&aacute;s complejas, aconsejar&iacute;a encerrar en un namespace, que no ser&iacute;a m&aacute;s que una variable global a la que estas funciones se le van anexando. En este caso, no lo veo realmente necesario.</p>
<h2>El jugador</h2>

![](/assets/Building1lq.jpg)

<p style="text-align: justify;">El jugador ser&aacute; el primero de los elementos que se dibuje en nuestra pantalla, y eso ya agrega varias responsabilidades a resolver. El dibujado en s&iacute; no deber&iacute;a ser una responsabilidad del jugador, sino las caracter&iacute;sticas que lo hacen un jugador (como su posici&oacute;n y su movimiento). Por supuesto, tambi&eacute;n debe dibujarse pero esa no es una caracter&iacute;stica &uacute;nica de &eacute;l. &iexcl;Esto suena a herencia de objetos!</p>
<p style="text-align: justify;">Por tanto, planteando que tendremos varios objetos que van a dibujarse, podemos partir desde entidades b&aacute;sicas que sabr&aacute;n dibujarse. Llamemos a esa <span style="font-family: 'courier new', courier;">DrawableEntityBase</span>. Siguiente a esto, habr&aacute; &nbsp;dos tipos de entidades distintas que se dibujar&aacute;n. Unas de ellas son bloques (cuadrados), como los bloques objetivos y el jugador. La otra ser&aacute; la pelota, que tendr&aacute; forma circular. Como el dibujado actual var&iacute;a entre estos, <span style="font-family: 'courier new', courier;">DrawableEntityBase</span> deber&aacute; delegar a sus clases hijas el dibujado, por lo que deberemos emular una clase abstracta, o una virtual que no haga nada por defecto. Prefiero emular una abstracta por mayor consistencia y&nbsp;<em>forzar</em> a que las clases hijas implementen su dibujado.</p>
<p style="text-align: justify;">Por ahora nos ocuparemos de los bloques, y a estos los llamaremos <span style="font-family: 'courier new', courier;">DrawableBlock</span>, heredando de <span style="font-family: 'courier new', courier;">DrawableEntityBase</span>.</p>
<p style="text-align: justify;">Y finalmente, entre los bloques, tendremos tanto a los bloques objetivos como al jugador. Concentr&eacute;mosnos en el jugador por ahora, y creemos una clase para &eacute;l: <span style="font-family: 'courier new', courier;">ArkanoidPlayer</span>, heredando de <span style="font-family: 'courier new', courier;">DrawableBlock</span>. Hasta este momento, esta es nuestra herencia de clases:</p>

![](/assets/DrawableEntityBaseDrawableBlockArkanoidPlayer.png)

<p style="text-align: justify;">Vamos a un poco de c&oacute;digo.</p>
<h3>DrawableEntityBase</h3>
<p><script src="https://gist.github.com/AlphaGit/5218769.js"></script></p>
<p style="text-align: justify;">Lo primero a determinar es qu&eacute; necesitar&aacute; cualquier objeto que se pueda dibujar en pantalla. Est&aacute; claro que necesitar&aacute; el contexto 2D del canvas para dibujarse, y finalmente un color a ser usado para dibujarse. Esto tiene sentido si asumimos que cualquier entidad tendr&aacute; un &uacute;nico color, el cual es nuestro caso. Si no fuera as&iacute;, cada tipo de entidad deber&iacute;a decidir cu&aacute;ntos colores recibe entre sus par&aacute;metros.</p>
<p style="text-align: justify;">Lo primero de lo primero es validar que tenemos lo necesario. No me preocupa tanto el color, pero s&iacute; el contexto. Verificamos entonces, que el <span style="font-family: 'courier new', courier;">drawingContext</span> exista. En JavaScript existe algo llamado <em>falsy values</em>, objetos y elementos que a pesar de no valer estrictamente <span style="font-family: 'courier new', courier;">false</span>, a&uacute;n as&iacute; eval&uacute;an como <span style="font-family: 'courier new', courier;">false</span> ante una expresi&oacute;n condicional. Estos son: <span style="font-family: 'courier new', courier;">false</span> (obviamente), <span style="font-family: 'courier new', courier;">0</span> (el n&uacute;mero cero), <span style="font-family: 'courier new', courier;">""</span> (la cadena vac&iacute;a), <span style="font-family: 'courier new', courier;">null</span> (objeto nulo), <span style="font-family: 'courier new', courier;">undefined</span> (objeto no definido) y <span style="font-family: 'courier new', courier;">NaN</span> (n&uacute;meros no num&eacute;ricos -- por contradictorio que suene). Para m&aacute;s detalles sobre valores <em>truthy</em> y <em>falsy</em>, les recomiendo leer <a href="http://www.sitepoint.com/javascript-truthy-falsy/">Truthy and Falsy: When All is Not Equal in JavaScript</a>.</p>
<p style="text-align: justify;">Como en nuestra situaci&oacute;n, cualquiera de esas es totalmente inv&aacute;lida para un contexto, podemos verificar con un simple negador. Por supuesto, que de ser m&aacute;s estricto podr&iacute;amos verificar por el contexto siendo una instancia de las clases que los navegadores exponen como contextos, pero en mi opini&oacute;n ya es mucha paranoia. Si este objeto no tiene los m&eacute;todos que necesitamos, no tardaremos mucho en saberlo.</p>
<p style="text-align: justify;">Como segundo acto, nos guardaremos referencias al contexto y al color, y declararemos nuestra funci&oacute;n de dibujado: <span style="font-family: 'courier new', courier;">draw</span>. Sin embargo, no podemos implementarla realmente -- como dije, <span style="font-family: 'courier new', courier;">DrawableEntityBase</span> debe comportarse como una clase abstracta. Lo que haremos es entonces arrojar una excepci&oacute;n dejando claro que una clase hija debe implementar este m&eacute;todo. Eso prevendr&aacute; que podamos utilizarla (aunque no instanciarla individualmente, lo cual no es enteramente malo).</p>
<p style="text-align: justify;">Por &uacute;ltimo, devolveremos nuestro m&eacute;todo disponible para exponerlo como p&uacute;blico a cualquier elemento que cree una instancia nuestra.</p>
<h3>DrawableBlock</h3>
<p style="text-align: justify;">Alg&uacute;n texto esot&eacute;rico que le&iacute; dec&iacute;a que&nbsp;<em>crear es limitar</em>. <span style="font-family: 'courier new', courier;">DrawableEntityBase</span> es muy gen&eacute;rica y por eso no hace demasiado. Ahora la limitaremos y le daremos m&aacute;s funcionalidad, lentamente creando nuestro resultado.</p>
<p><script src="https://gist.github.com/AlphaGit/5218835.js"></script></p>
<p style="text-align: justify;">Lo primero es crear nuestra nueva clase, y hacerla heredar de la clase base. Hay varias formas de hacer esto, y las m&aacute;s recomendadas incluyen librer&iacute;as que ya se encargan de problemas de sobrecarga y m&uacute;ltiple herencia, pero yo quer&iacute;a hacer esto sin ninguna otra herramienta que mis dedos contra el teclado. De todas formas, las mejores recomendaciones vienen del se&ntilde;or John Resig, quien sabe mucho de JavaScript y nos cuenta de su forma de hacer herencia en&nbsp;<a title="Simple JavaScript Inheritance [John Resig]" href="http://ejohn.org/blog/simple-javascript-inheritance/">su post sobre herencia JavaScript</a>.</p>
<p style="text-align: justify;">Para poder tener esta herencia, debemos, por supuesto, declarar la funci&oacute;n, y agregar la clase base a su prototipo, lo que le dar&aacute; al principio toda esa funcionalidad. Sin embargo, esto debe ocurrir&nbsp;<em>antes</em> de la implementaci&oacute;n de la funci&oacute;n. Si esto les resulta raro, tengan en cuenta que declaraci&oacute;n e implementaci&oacute;n son dos momentos distintos aunque se escriban en el mismo lugar. En el caso de JavaScript, el hecho de declarar la funci&oacute;n la hace disponible tanto para el c&oacute;digo posterior como el anterior, y eso es lo que nos permite utilizar su prototipo antes de darle cuerpo. Si bien el cuerpo ser&aacute; ejecutado despu&eacute;s, me agrada la idea de mantener la informaci&oacute;n de herencia a la cabeza de la funci&oacute;n.</p>
<p style="text-align: justify;">El prototipo base debe tener una instancia de la clase base -- &iquest;pero c&oacute;mo creamos una instancia si no tenemos los par&aacute;metros necesarios? La forma m&aacute;s simple es hacer <span style="font-family: 'courier new', courier;">new DrawableEntityBase()</span> sin pasar par&aacute;metros, lo que a&uacute;n generar&iacute;a la instancia. Esto, sin embargo, no nos sirve a nosotros porque tenemos validaciones que pueden arrojar errores. Para esto entonces podemos utilizar <span style="font-family: 'courier new', courier;"><a href="https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object/create">Object.create()</a></span>, disponible desde JavaScript 1.8.5.</p>
<p style="text-align: justify;">Por &uacute;ltimo, asignamos la funci&oacute;n base al constructor de nuestro nuevo prototipo y comenzamos con el cuerpo de la funci&oacute;n.</p>
<p style="text-align: justify;">Lo primero es la declaraci&oacute;n, con los argumentos que necesitaremos para construir y dibujar un bloque. Estos son:</p>
<ul style="text-align: justify;">
<li><span style="line-height: 13px;">contexto para dibujar (la clase base lo necesita) -- <span style="font-family: 'courier new', courier;">drawingContext</span></span></li>
<li>color para dibujar (la clase base lo necesita) -- <span style="font-family: 'courier new', courier;">color</span></li>
<li>coordenada x de la esquina superior derecha -- <span style="font-family: 'courier new', courier;">posX</span></li>
<li>coordenada y de la esquina superior derecha -- <span style="font-family: 'courier new', courier;">posY</span></li>
<li>el alto del bloque a dibujar -- <span style="font-family: 'courier new', courier;">height</span></li>
<li>el ancho del bloque a dibujar -- <span style="font-family: 'courier new', courier;">width</span></li>
</ul>
<p style="text-align: justify;">Lo segundo a hacer, pero primero en el cuerpo de la funci&oacute;n, es llamar al constructor base, para que las variables internas necesarias sean inicializadas, y cualquier l&oacute;gica de inicializaci&oacute;n tambi&eacute;n sea ejecutada. Eso lo haremos utilizando el m&eacute;todo <span style="font-family: 'courier new', courier;">call</span>, que nos permite pasar como primer argumento el contexto de la funci&oacute;n. Esto significa que la funci&oacute;n se ejecutar&aacute; como si se estuviera ejecutando en este mismo objeto. Para m&aacute;s informaci&oacute;n sobre <span style="font-family: 'courier new', courier;">call</span>, pueden ver su documentaci&oacute;n y algunos usos interesantes: <a href="https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Function/call">MDN: <span style="font-family: 'courier new', courier;">Function.prototype.call</span></a>.</p>
<p style="text-align: justify;">Lo tercero a hacer es guardarnos los valores que necesitemos, y paso posterior, es darle una implementaci&oacute;n a la funci&oacute;n draw. Para esto s&oacute;lo tenemos que utilizar el contexto y setear el color con el que se va a dibujar (<span style="font-family: 'courier new', courier;">fillStyle</span>, que tambi&eacute;n tiene otras opciones), y pedirle dibujar un rect&aacute;ngulo utilizando <span style="font-family: 'courier new', courier;">fillRect</span>, y pasando coordenadas y tama&ntilde;os. Noten que la referencia a <span style="font-family: 'courier new', courier;">color</span> que uso no est&aacute; prefijada con <span style="font-family: 'courier new', courier;">self.</span> como las dem&aacute;s. Esto es un error, y es importante si tenemos una clase compleja: la referencia a <span style="font-family: 'courier new', courier;">color</span> sin prefijar se refiere al argumento pasado en la instanciaci&oacute;n de ese objeto, que ser&aacute; &uacute;nico y no cambiar&aacute; a menos que lo alteremos a mano. Sin embargo, si nuestra clase posee varios niveles de herencia, mixins o m&uacute;ltiples padres, ser&iacute;a posible que la referencia guardada en <span style="font-family: 'courier new', courier;">self.color</span> cambiara, mientras que la que fue pasada por argumento no. Nostros perder&iacute;amos ese cambio por no utilizar la referencia correcta. Lo recomendable para m&iacute; es siempre utilizar las referencias almacenadas; no por alguna raz&oacute;n t&eacute;cnica, sino s&oacute;lo por consistencia y organizaci&oacute;n.</p>
<h3>ArkanoidPlayer</h3>
<p style="text-align: justify;">Siguiendo la misma t&eacute;cnica para la herencia de clases, ahora debemos declarar <span style="font-family: 'courier new', courier;">ArkanoidPlayer</span> herendado de <span style="font-family: 'courier new', courier;">DrawableBlock</span>. Podr&iacute;amos requerir m&aacute;s argumentos en su constructor, espec&iacute;ficos de <span style="font-family: 'courier new', courier;">ArkanoidPlayer</span>, pero dado&nbsp;que no son realmente necesarios, vamos a calcularlos por defecto. Este es el caso de su posici&oacute;n en la pantalla.</p>
<p style="text-align: justify;">Los par&aacute;metros que necesitaremos, entonces, son:</p>
<ul>
<li style="text-align: justify;"><span style="line-height: 13px;">contexto para dibujar (la clase base lo necesita) -- <span style="font-family: 'courier new', courier;">drawingContext</span></span></li>
<li style="text-align: justify;">color para dibujar (la clase base lo necesita) -- <span style="font-family: 'courier new', courier;">color</span></li>
<li style="text-align: justify;">alto del bloque (la clase base lo necesita) -- <span style="font-family: 'courier new', courier;">blockHeight</span></li>
<li style="text-align: justify;">ancho del bloque (la clase base lo necesita) -- <span style="font-family: 'courier new', courier;">blockWidth</span></li>
<li style="text-align: justify;">alto del escenario (para calcular la posici&oacute;n del jugador) -- <span style="font-family: 'courier new', courier;">stageHeight</span></li>
<li style="text-align: justify;">ancho del escenario (para calcular la posici&oacute;n del jugador) -- <span style="font-family: 'courier new', courier;">stageWidth</span></li>
</ul>
<p><script src="https://gist.github.com/AlphaGit/5229666.js"></script></p>
<p style="text-align: justify;">Nos guardamos las referencias a las variables nuevas y creamos dos m&aacute;s: la posici&oacute;n X y la posici&oacute;n Y, que se referir&aacute;n a la esquina superior izquierda (desde la cual comenzaremos a dibujar el bloque). Es importante que estemos actualizando estas variables porque el redibujado debe utilizarlas para mover al jugador.</p>
<p style="text-align: justify;">Como paso siguiente, llamamos al constructor de <span style="font-family: 'courier new', courier;">DrawableBlock</span> pasando un default para la posici&oacute;n X y la posici&oacute;n Y , que ser&aacute;n correspondientes a:</p>
<ul style="text-align: justify;">
<li><span style="line-height: 13px;">el punto X de la pantalla a dibujar el jugador para que el bloque est&eacute; centrado --&nbsp;<span style="font-family: 'courier new', courier;">(stageWidth - blockWidth)/2</span><br />
</span></li>
<li>el punto Y de la pantalla a dibujar el jugador para que el bloque est&eacute; casi al final de la pantalla -- <span style="font-family: 'courier new', courier;">stageHeight - blockHeight * 2</span></li>
<li>el ancho del bloque a dibujar: <span style="font-family: 'courier new', courier;">blockWidth</span></li>
<li>el alto del bloque a dibujar: <span style="font-family: 'courier new', courier;">blockHeight</span></li>
</ul>
<p style="text-align: justify;">Tambi&eacute;n debemos proveer la posibilidad de centrar al jugador, cuando el juego comience o cuando debamos resetear la partida o avanzar de nivel. En este caso, vamos a actualizar las coordenadas. Declaramos la funci&oacute;n <span style="font-family: 'courier new', courier;">centerPlayer</span> y su cuerpo s&oacute;lo actualizar&aacute; la coordenada X, puesto que la coordenada Y del jugador nunca cambiar&aacute;.</p>
<p style="text-align: justify;">Para asegurarnos de tener los datos consistentes, llamamos a esa funci&oacute;n y por &uacute;ltimo, devolvemos nuestro objeto con las funciones p&uacute;blicas disponibles.</p>
<h2>La pelota</h2>
<p style="text-align: justify;">Teniendo toda esta base, plantear el dibujado de un c&iacute;rculo para representar la pelota con la que se interact&uacute;a no es demasiado dif&iacute;cil. Extendemos <span style="font-family: 'courier new', courier;">DrawableEntityBase</span> para declarar <span style="font-family: 'courier new', courier;">DrawableCircle</span> y redefinimos sus propiedades para basarse en el centro (y no una esquina) y el radio (y no ancho/alto) y reescribimos la implementaci&oacute;n de <span style="font-family: 'courier new', courier;">draw()</span> para que llame a la funci&oacute;n correspondiente del contexto.</p>
<p><script src="https://gist.github.com/AlphaGit/5289147.js"></script></p>
<p style="text-align: justify;">Para este caso, invocaremos a <span style="font-family: 'courier new', courier;">ellipse()</span>, <a href="http://docs.webplatform.org/wiki/apis/canvas/CanvasRenderingContext2D/ellipse">qui&eacute;n recibe los siguientes par&aacute;metros</a>:</p>
<ul style="text-align: justify;">
<li><span style="line-height: 13px;">el punto X del centro del c&iacute;rculo</span></li>
<li>el punto Y del centro del c&iacute;rculo</li>
<li>el radio en la dimensi&oacute;n X</li>
<li>el radio en la dimensi&oacute;n Y (en nuestro caso, el mismo)</li>
<li>la rotaci&oacute;n -- en nuestro caso cero, ser&aacute; un c&iacute;rculo perfecto y la rotaci&oacute;n no cambiar&iacute;a nada, s&oacute;lo agregar&iacute;a procesamiento extra</li>
<li>el &aacute;ngulo de comienzo de la elipse -- en nuestro caso, cero</li>
<li>el &aacute;ngulo de fin de la elipse -- en nuestro caso, cero, para una vuelta completa</li>
<li>si debe dibujarse en sentido antihorario -- en nuestro caso <span style="font-family: 'courier new', courier;">false</span>, pero es indiferente</li>
</ul>
<p style="text-align: justify;">Hasta ahora, entonces, nuestra jerarqu&iacute;a de objetos se ver&iacute;a as&iacute;:</p>

![](/assets/hierarchy2.png)

<p style="text-align: justify;">No ser&aacute; la &uacute;ltima vez que trabajemos con la pelota, porque adem&aacute;s de la capacidad de dibujarse, hay otras caracter&iacute;sticas que deberemos tratar m&aacute;s adelante.</p>
<p style="text-align: justify;">Con todo esto, ya tenemos los elementos principales para comenzar a trabajar en el orden y la interacci&oacute;n de elementos entre s&iacute;. Material que dejar&eacute; para otros posts.</p>
