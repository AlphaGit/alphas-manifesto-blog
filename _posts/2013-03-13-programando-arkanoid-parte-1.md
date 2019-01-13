---
layout: post
status: publish
published: true
title: Programando Arkanoid - Parte 1
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 4626
wordpress_url: http://blog.alphasmanifesto.com/?p=4626
date: '2013-03-13 20:46:58 +0000'
date_gmt: '2013-03-14 01:46:58 +0000'
categories:
- Projects
- Technology
tags:
- JavaScript
- CSS
- desarrollo web
- HTML5
- desarrollo
- CSS3
- Canvas
- c&oacute;digo
comments:
- id: 8975
  author: Programando Arkanoid &#8211; Parte 2 | Alpha&#039;s Manifesto
  author_email: ''
  author_url: http://blog.alphasmanifesto.com/2013/04/01/programando-arkanoid-parte-2/
  date: '2013-04-01 20:24:19 +0000'
  date_gmt: '2013-04-02 01:24:19 +0000'
  content: "[...] En la entrega pasada hablamos sobre c&oacute;mo comenz&oacute; el
    juego de Arkanoid, ahora continuaremos ese camino sobre la construcci&oacute;n
    del escenario de juego. [...]"
---

![](/assets/arkanoid.jpg)

<p style="text-align: justify;">Haciendo ya mucho tiempo que no trabajaba en JavaScript sin la utilizaci&oacute;n de ning&uacute;n framework, me propuse crear algo simple que a la vez fuera divertido. Pens&eacute; en algunas opciones y la ganadora fue un juego de <a href="http://en.wikipedia.org/wiki/Arkanoid">Arkanoid</a>&nbsp;(que, ahora me entero, es <a href="http://en.wikipedia.org/wiki/Breakout_clones">una de las tantas copias del Breakout</a>, y para mi el nombre original siempre fue Arkanoid, en fin).</p>
<p style="text-align: justify;">El resultado final lo pueden ver <a href="http://randomjs.alphasmanifesto.com/arkanoid-canvas/arkanoid.html">aqu&iacute;</a> y el c&oacute;digo fuente est&aacute; en mi <a href="https://github.com/AlphaGit/random-javascript">repositorio de GitHub</a>, pero no es tanto el resultado sino el viaje lo que fue interesante, y <strong>quiero describir las cosas que aprend&iacute; en ese camino</strong>.</p>
<p style="text-align: justify;">Vengan y acomp&aacute;&ntilde;enme en mi viaje.</p>
<p><!--more--></p>
<h2>Documentaci&oacute;n:</h2>
<p style="text-align: justify;">Como todo principante, o incluso como todo experto que cada tanto necesita verificar el estado de los est&aacute;ndares, la documentaci&oacute;n de referencia es importante. Para hacer este peque&ntilde;o proyecto me bas&eacute; en algo de mi experiencia previa, y en la documentaci&oacute;n disponible en los siguientes sitios:</p>
<ul>
<li style="text-align: justify;"><span style="line-height: 13px;"><a href="https://developer.mozilla.org/">Mozilla Developer Network</a>, impagable, la calidad de la documentaci&oacute;n es incre&iacute;ble.</span></li>
<li style="text-align: justify;"><a href="http://www.webplatform.org/">WebPlatform.org</a>, acabo de enterarme de este sitio por la clase de juegos HTML5 en Udacity, pero est&aacute; tambi&eacute;n muy completa</li>
<li style="text-align: justify;"><a href="http://www.w3schools.com/">W3Schools</a> para refrescar cosas b&aacute;sicas ("&iquest;c&oacute;mo eran los par&aacute;metros a array.slice?" y similares)</li>
</ul>
<h2>El contenedor:</h2>
<p style="text-align: justify;">(Lo que escribir&eacute; desde ahora se puede ver en el <a href="https://github.com/AlphaGit/random-javascript/commit/90e6540100631e1a3ae590c3bde4a21b74f7abd9">commit 90e6...4f7abd9</a>.)</p>
<p style="text-align: justify;">Lo primero y principal, y lo m&aacute;s simple fue setear el HTML y los estilos necesarios. <strong>Todo estar&aacute; hecho en HTML5 Canvas</strong> y siendo manejado a trav&eacute;s de JavaScript, nuestra estructura en el DOM en s&iacute; no deber&iacute;a ser demasiado compleja. S&iacute; necesitamos, sin embargo, un documento v&aacute;lido y limpio.</p>
<p><script src="https://gist.github.com/AlphaGit/5156953.js"></script></p>
<p style="text-align: justify;">Esto est&aacute; claro: s&oacute;lo tenemos un DOM HTML5, en donde asignamos un t&iacute;tulo, una referencia a un archivo CSS para que nos de los estilos a la p&aacute;gina. Luego, por supuesto, la referencia a nuestro script, en donde se encontrar&aacute; toda la l&oacute;gica de la aplicaci&oacute;n. Vamos a suponer por ahora que este archivo JavaScript expone un objeto llamado <span style="font-family: 'courier new', courier;">arkanoid</span>, el cu&aacute;l tiene un m&eacute;todo llamado <span style="font-family: 'courier new', courier;">.init()</span> al que podemos llamar. Eso lo hacemos, por supuesto, en el momento en que la p&aacute;gina carga.</p>
<p style="text-align: justify;">Ahora, los estilos no deben ser complejos tampoco. Todo lo que necesitamos es que en el cuerpo de la p&aacute;gina exista un canvas y que este se vea como ocupando todo el espacio disponible. Por supuesto que esto significa poner los m&aacute;rgenes y los paddings a cero, pero lo que yo no sab&iacute;a es que para evitar tener scrollbars o espaciados innecesarios, debemos indicar espec&iacute;ficamente que el objeto canvas va a comportase como bloque, y que <strong>todo</strong> en la p&aacute;gina carezca de espaciados. Esto lo aprend&iacute; de <a href="http://stackoverflow.com/questions/4288253/html5-canvas-100-width-height-of-viewport">una respuesta de StackOverflow</a>.</p>
<p style="text-align: justify;">Para esto podemos usar muy apropiadamente el selector de CSS *, que matchear&aacute; absolutamente todo elemento. Este selector se llama <a href="http://www.w3.org/TR/selectors/#universal-selector">Universal Selector</a> y est&aacute; disponble para los navegadores que soporten caracter&iacute;sticas de CSS3. Por supuesto, estamos trabajando en Canvas con lo que es muy factible que los navegadores que soportan el segundo tambi&eacute;n soporten el primero.</p>
<p style="text-align: justify;">Nuestro CSS se ve, entonces, as&iacute;:</p>
<p><script src="https://gist.github.com/AlphaGit/5156967.js"></script></p>
<h2>El c&oacute;digo</h2>
<p style="text-align: justify;">Para proceder a la parte de JavaScript, ya ten&iacute;amos una limitaci&oacute;n particular: debemos crear un objeto <span style="font-family: 'courier new', courier;">arkanoid</span> que tenga la funci&oacute;n <span style="font-family: 'courier new', courier;">init()</span>. De una forma simplista entonces instanciaremos el objeto arkanoid asign&aacute;ndole un valor al objeto window, o podr&iacute;amos haberla declarado de forma independiente. Para mayor seguridad, podemos devolver los resultados de una funci&oacute;n auto-ejecutable, de forma que todas las variables que creemos sean locales y no est&eacute;n manchando el namespace global.</p>
<p style="text-align: justify;">Como tambi&eacute;n estaremos codificando l&oacute;gica interna, seguramente querremos tener varias funciones y variables privadas. Nuestra funci&oacute;n autoejecutable tiene solo que devolver entonces aquello que queramos hacer p&uacute;blico, en nuestro caso, la funci&oacute;n <span style="font-family: 'courier new', courier;">init()</span>.</p>
<p><script src="https://gist.github.com/AlphaGit/5158029.js"></script></p>
<p style="text-align: justify;">Vayamos analizando ese c&oacute;digo l&iacute;nea a l&iacute;nea:</p>
<ul>
<li style="text-align: justify;"><span style="line-height: 13px;"><strong>La l&iacute;nea 1</strong> <strong>define el objeto <span style="font-family: 'courier new', courier;">arkanoid</span> que necesit&aacute;bamos</strong>. Lo define como el resultado de una funci&oacute;n que ser&aacute; llamada, y tiene la capacidad de recibir par&aacute;metros que ser&aacute;n las opciones del usuario. Esto es, en caso en que quisi&eacute;ramos pasar informaci&oacute;n al momento de inicializarlo.</span></li>
<li style="text-align: justify;"><strong>Las l&iacute;neas 4 a 6 definen variables locales</strong>, solamente disponibles para este objeto arkanoid, que ser&aacute;n utilizadas por las dem&aacute;s funciones interiores. Estas no estar&aacute;n disponibles a los objetos externos al momento de devolver el resultado, y m&aacute;s a&uacute;n, tampoco se encontrar&aacute;n disponible a elementos que hagan referencias a <span style="font-family: 'courier new', courier;">this</span> o a <span style="font-family: 'courier new', courier;">self</span>. Si eso los confunde, a m&iacute; tambi&eacute;n me ocurri&oacute;, checkeen esta pregunta en StackOverflow: <a href="http://stackoverflow.com/q/15046910/147507">JavaScript local scoping: var vs. this</a>.</li>
<li style="text-align: justify;"><strong>Las l&iacute;neas 8 a 13 definen otra variable local</strong>, pero esta ser&aacute; un objeto literal, para agrupar las posibles opciones con valores por defecto que tomaremos en caso en que el usuario (quien llama a esta funci&oacute;n) no las provea.</li>
<li style="text-align: justify;"><strong>Las l&iacute;neas 17 a 21 definen la funci&oacute;n <span style="font-family: 'courier new', courier;">initOptions</span></strong>, que se encargar&aacute; de identificar el conjunto de opciones v&aacute;lidas a utilizar, basado tanto en lo provisto por el usuario, los defaults, y la l&oacute;gica interna. En este caso, obtendremos el override de lo que provey&oacute; el usuario sobre lo default, y verificaremos que si estamos trabajando a pantalla completa (<span style="font-family: 'courier new', courier;">fullWidth</span> y <span style="font-family: 'courier new', courier;">fullHeight</span>), actualizaremos las variables de ancho y alto para que sean consistentes (<span style="font-family: 'courier new', courier;">stageWidth</span> y <span style="font-family: 'courier new', courier;">stageHeight</span>).</li>
<li style="text-align: justify;"><strong>Las l&iacute;neas 23 a 28 hacen la magia de obtener el conjunto de opciones desde los defaults y con lo que el usuario provey&oacute;.</strong> La l&oacute;gica es tan simple como copiar todo lo que el usuario nos dio sobre el objeto de las opciones por default. Cabe destacar que aqu&iacute; estamos escribiendo sobre el objeto de destino, por lo que si quisi&eacute;ramos volver al valor por defecto, ya lo habr&iacute;amos perdido. Una forma simple de haber hecho esto es, en lugar de llamarlo as&iacute;:<br />
<span style="font-family: 'courier new', courier;">options = mergeObjects(defaultOptions, userOptions);</span><br />
Deber&iacute;amos llamarlo as&iacute;:<br />
<span style="font-family: 'courier new', courier;">options = mergeObjects({}, defaultOptions); // creates a copy</span><br />
<span style="font-family: 'courier new', courier;">options = mergeObjects(options, userOptions); // overrides defaults</span></li>
<li style="text-align: justify;"><strong>Las l&iacute;neas 30 a 39 inicializan el objeto canvas</strong> que se utilizar&aacute;. Muy b&aacute;sicamente se obtiene el objeto <span style="font-family: 'courier new', courier;">body</span>, se crea un objeto <span style="font-family: 'courier new', courier;">canvas</span> y se le anexa, con el tama&ntilde;o apropiado seg&uacute;n las opciones. Para uso posterior, se almacenan las referencias al canvas y al contexto de dibujo 2D.</li>
<li style="text-align: justify;"><strong>Las l&iacute;neas 41 a 46 realizan ese trabajo en sucesi&oacute;n</strong> llamando a las funciones apropiadas, e inicializa el stage sobre el que la magia ocurrir&aacute;.</li>
<li style="text-align: justify;">Por &uacute;ltimo, <strong>las l&iacute;neas 49 a 51 devuelven el objeto</strong> exponiendo s&oacute;lo la &uacute;ltima funci&oacute;n, y d&aacute;ndole el nombre de <span style="font-family: 'courier new', courier;">init</span>.</li>
</ul>
<p style="text-align: justify;">Por ahora nos detendremos aqu&iacute; y continuaremos en la parte dos. Mientras lo preparo, estoy dispuesto a responder preguntas, y seguramente las preguntas y los comentarios ayudar&aacute;n a generar las partes posteriores.</p>
<p>&nbsp;</p>
