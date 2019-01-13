---
layout: post
status: publish
published: true
title: 'What-now: graficando dependencias'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5064
wordpress_url: http://blog.alphasmanifesto.com/?p=5064
date: '2014-04-20 17:23:34 +0000'
date_gmt: '2014-04-20 22:23:34 +0000'
categories:
- Projects
- Technology
tags:
- proyecto
- performance
- design
- investigaci&oacute;n
- algoritmos gen&eacute;ticos
- search
- c&oacute;digo
- unit testing
- algoritmos
- Sugiyama
- what-now
comments: []
---

![](/assets/what-now-dependencies.png)

<p style="text-align: justify;">Desde hace un par de semanas estoy trabajando en lograr que el proyecto de <a href="http://what-now.herokuapp.com/">what-now</a> grafique dependencias entre tareas: si &nbsp;una tarea depende de otra, una l&iacute;nea deber&iacute;a conectarlos. Esta tarea b&aacute;sica fue muy simple, pero lo desafiante fue lograr que se graficaran de forma que las l&iacute;neas se cruzaran entre ellas lo menos posible.</p>
<p style="text-align: justify;">Aqu&iacute; contar&eacute; sobre este logro y sobre lo que aprend&iacute; en el proceso.</p>
<p><!--more--></p>
<h2>Graficar dependencias en d3</h2>
<p style="text-align: justify;">Graficar las dependencias entre las tareas prob&oacute; ser algo realmente simple. Se trata de simplemente agregar objetos <code>line</code> y asegurarnos de poner sus coordenadas y un <code>stroke</code> para que la l&iacute;nea se vea.</p>
<p><script src="https://gist.github.com/AlphaGit/10565907.js"></script></p>
<h2>La investigaci&oacute;n: minimizar cruces</h2>
<p style="text-align: justify;">Tras graficar las dependencias, me di cuenta que era muy simple que dos tareas tuvieran cruces o que la forma del grafo estuviera lejos de ser &oacute;ptima. Ya sab&iacute;a que quer&iacute;a organizar las tareas en "capas", en donde cada capa s&oacute;lo incluye tareas que dependen de las capas anteriores, de forma que las dependencias solo fluyan hacia atr&aacute;s (o hacia adelante, dependiendo de c&oacute;mo lo miren).</p>
<p style="text-align: justify;">Este proceso es simple, pero la ubicaci&oacute;n de los nodos es una misma capa no lo es tanto. Pens&eacute; un poco al respecto y no encontr&eacute; ninguna respuesta obvia, por lo que pens&eacute; que era un buen momento para investigar sobre <a href="http://stackoverflow.com/q/10802443/147507">algoritmos de layout</a>. Estos son algoritmos que me permitir&iacute;an determinar la posici&oacute;n apropiada de los nodos para minimizar la cantidad de cruces y la forma general del grafo.</p>
<h3>Distintas soluciones para distintos tipos de grafos</h3>
<p style="text-align: justify;">Claro, seg&uacute;n cada caso particular, existen muchos algoritmos particulares para distintos tipos de grafos. Y tiene sentido: querremos ordenar los nodos de forma distinta seg&uacute;n tengamos un grafo con bucles, un grafo ac&iacute;clico, un &aacute;rbol binario o tantas otras opciones. No existen algoritmos ni &oacute;ptimos ni gen&eacute;ricos por la amplia variedad de posibles situaciones. Y m&aacute;s a&uacute;n, los criterios de legibilidad para cada uno de estos var&iacute;a ampliamente, con lo que para lo que un algoritmo hace bien, el otro arrojar&iacute;a resultados desagradables a la vista.</p>
<p style="text-align: justify;">Hay un algoritmo particular basado en "fuerzas" (<a href="http://en.wikipedia.org/wiki/Force-based_algorithms_%28graph_drawing%29">Fruchterman&ndash;Reingold</a>), que de hecho es muy ingenioso en su l&oacute;gica. Si imaginamos que cada nodo repele a los otros nodos y simulamos esas fuerzas de repulsi&oacute;n, pero a la vez simulamos l&iacute;mites el&aacute;sticos seg&uacute;n los v&eacute;rtices que los unen, muchas veces el gr&aacute;fico se "acomoda solo" tras una serie de iteraciones. M&aacute;s interesante a&uacute;n, esta es una caracter&iacute;stica ya inclu&iacute;da en d3: <a href="https://github.com/mbostock/d3/wiki/Force-Layout">Force Layouts</a>.</p>
<p style="text-align: justify;">Intent&eacute; un par de aproximaciones pero me d&iacute; cuenta que esta soluci&oacute;n no aplicaba a mi caso: yo necesitaba reordenar mis grafos sin romper la estructura de capas. Sin embargo, hay algoritmos propios para el <a href="http://en.wikipedia.org/wiki/Layered_graph_drawing">dibujado de grafos en capas</a>, y para quien est&eacute; interesado, hay un muy buen cap&iacute;tulo disponible online sobre <a href="http://cs.brown.edu/~rt/gdhandbook/chapters/hierarchical.pdf">Hierarchical Drawing Algorithms</a>&nbsp;(PDF). Es un poco t&eacute;cnico y algo pesado en su lectura, porque cubre muchas posibilidades y comparaciones de algoritmos para cada uno de los pasos.</p>
<h3 style="text-align: left;">El algoritmo de Sugiyama</h3>
<p style="text-align: justify;">En mi b&uacute;squeda, encontr&eacute; que uno de los algoritmos m&aacute;s utilizados y reconocidos como simples y eficientes es el <strong>algoritmo de Sugiyama</strong>. A continuaci&oacute;n pueden ver un video de c&oacute;mo se utiliza este algoritmo para producir un gr&aacute;fico y minimizar sus cruces:</p>
<p>https://www.youtube.com/watch?v=n3tG0AKwiRE</p>
<p style="text-align: left;">El autor de este video (Lejf Diecks) tiene una serie de posts en donde explica el algoritmo. Ellos se pueden ver aqu&iacute;:</p>
<ul>
<li><a href="http://www.niftytools.de/2012/10/sugiyama-algorithm-part-1-2/">Sugiyama algorithm&nbsp;&ndash; Part 1</a></li>
<li><a href="http://www.niftytools.de/2012/10/sugiyama-algorithm-part-2/">Sugiyama algorithm &ndash;&nbsp;Part 2</a></li>
<li><a href="http://www.niftytools.de/2012/10/sugiyama-algorithm-part-3/">Sugiyama algorithm &ndash;&nbsp;Part 3</a></li>
<li><a href="http://www.niftytools.de/2012/11/sugiyama-algorithm/">Sugiyama algorithm &ndash;&nbsp;Part 4</a></li>
</ul>
<p style="text-align: left;">La explicaci&oacute;n b&aacute;sicamente expone&nbsp;los siguientes pasos:</p>
<ol>
<li>Separar a los nodos en capas seg&uacute;n los v&eacute;rtices que lleguen a ellos</li>
<li>Insertar nodos ficticios en v&eacute;rtices que alcancen m&aacute;s de dos capas</li>
<li>Minimizar los cruces enfoc&aacute;ndose entre las capas <em>n</em> y la <em>n+1</em></li>
<li>Remover los nodos ficticios</li>
</ol>
<p style="text-align: justify;">El punto 3. es particularmente especial, y merece una explicaci&oacute;n propia:&nbsp;el objetivo de insertar los nodos ficticios (punto 2.) es s&oacute;lo para simplificar este paso, que es un problema NP-dif&iacute;cil de por s&iacute;. El punto 4. tambi&eacute;n debe ser agregado por consecuencia del punto 2., ya que no queremos graficar estos nodos ficticios, sino que los usamos como herramienta de simplificaci&oacute;n.</p>
<p style="text-align: justify;">Tras agregar los nodos ficticios, podemos concentrarnos entre los cruces de las capas <em>n</em> y <em>n+1</em>, sin pensar en v&eacute;rtices que vayan en m&aacute;s de una capa. Esto significa que nuestras comparaciones para detectar cruces pueden basarse s&oacute;lamente en la posici&oacute;n relativa de los nodos dentro de las capas, y no hay necesidad de hacer c&aacute;lculos trigonom&eacute;tricos (que tambi&eacute;n podr&iacute;an ser afectados por detalles de posicionamiento de nuestro grafo: separaci&oacute;n de los nodos, ancho de los v&eacute;rtices, etc).</p>
<h4>1. Separar a los nodos en capas</h4>
<p style="text-align: justify;">La separaci&oacute;n de los nodos en capas es un problema simple de resolver, pero s&oacute;lo si estamos asumiendo ciertas condiciones como las estoy asumiendo yo. Particularmente, estoy asumiendo que se trata de un grafo ac&iacute;clico, es decir, en donde no habr&aacute; ciclos formados. En mi caso, si la tarea A depende de la tarea B, no tiene sentido que la tarea B dependa de la tarea A. De no tener esta restricci&oacute;n, es necesario convertir al grafo en uno ac&iacute;clico.</p>
<p style="text-align: justify;">La forma de entonces clasificar a los nodos en capas es:</p>
<ol>
<li style="text-align: justify;">Inicializar un listado de nodos con todos los nodos del grafo: <code>nodesToVisit&nbsp;&larr; graphNodes</code></li>
<li style="text-align: justify;">Inicializar un listado de nodos incluidos en el grafo, vac&iacute;o: <code>visitedNodes &larr; []</code></li>
<li style="text-align: justify;">Inicializar el listado de capas que devolveremos vac&iacute;o: <code>layers&nbsp;&larr; []</code></li>
<li style="text-align: justify;">Inicializar el listado de nodos que conforma la primera capa, vac&iacute;o:&nbsp;<code>currentLayer&nbsp;&larr; []</code></li>
<li style="text-align: justify;">Iteramos por cada nodo a visitar:&nbsp;<code>for each currentNode in nodesToVisit</code>
<ol>
<li>Si cada dependencia del nodo est&aacute; entre los nodos ya visitados: <code>if containsAll(visitedNodes, currentNode.previousNodes)</code>
<ol>
<li>Agregar el nodo a la capa actual: <code>currentLayer.add(currentNode)</code></li>
<li>Eliminar el nodo visitado del listado de pendientes: <code>nodesToVisit.remove(currentNode)</code></li>
</ol>
</li>
</ol>
</li>
<li style="text-align: justify;">Agregar la capa generada&nbsp;al listado de capas a devolver: <code>layers.add(currentLayer)</code></li>
<li style="text-align: justify;">Si todav&iacute;a quedan nodos pendientes a visitar: <code>if nodesToVisit.length > 0</code>
<ol>
<li>Agregar todos los nodos de la capa actual a los nodos disponibles como dependencias: <code>visitedNodes.addAll(currentLayer)</code></li>
<li>Iterar desde el paso 4. inclusive.</li>
</ol>
</li>
<li style="text-align: justify;">Devolver el listado de capas generado: <code>return layers</code></li>
</ol>
<p style="text-align: justify;">Asumo que debe haber formas mucho m&aacute;s eficientes de generar este listado, pero creo que esta es lo suficientemente simple como para ser f&aacute;cilmente comprensible. Esta soluci&oacute;n es del orden de <em>O(n<sup>2</sup>m)</em> (<em>n</em>: cantidad de nodos, <em>m</em>: cantidad de dependencias de un nodo) lo cual hace que no se comporte nada bien&nbsp;para grandes cantidades de nodos.</p>
<p><script src="https://gist.github.com/AlphaGit/11074056.js"></script></p>
<h4>2. Insertar nodos ficticios en v&eacute;rtices que alcancen m&aacute;s de dos capas</h4>
<p style="text-align: justify;">Como ya lo mencion&eacute; antes, el objetivo de este paso es poder simplificar los c&aacute;lculos m&aacute;s adelante, lo cual significa que no es enteramente necesario, pero para evitar otras explicaciones m&aacute;s espec&iacute;ficas, elegir&eacute; utilizar este m&eacute;todo.</p>
<p style="text-align: justify;">Cuando se generaron las capas, es posible haya nodos en la capa <em>n</em> que no tengan ning&uacute;n nodo siguiente en la capa <em>n+1</em>. Esto es porque los nodos siguientes pueden a su vez tener dependencias en la capa <em>n+1</em>, lo que los habr&iacute;a colocado en la capa <em>n+2</em>.&nbsp;Por ejemplo: A1 y A2 no dependen de ning&uacute;n nodo, con lo que se posicionan en la capa 1. B depende de A1, con lo que se posiciona en la capa 2. C depende de A2 y de B. Por su dependencia con B, C ser&aacute; posicionado en la capa 3, pero los nodos siguientes de A2 no se encuentran en la capa siguiente a la suya.</p>

![](/assets/Graph-dependencies-next-nodes-not-in-next-layer.png)

<p>En un caso as&iacute;, insertar un nodo ficticio en la capa 2 nos permitir&aacute; poder evaluar cruces entre esa capa y la anterior sin necesidad de evaluar &aacute;ngulos de inclinaci&oacute;n, o sin tener en cuenta nodos siguientes que puedan estar en capas totalmente separadas, haciendo nuestras comparaciones mucho m&aacute;s simples.</p>
<p style="text-align: justify;">El proceso es tan simple como se puede ver a continuaci&oacute;n:</p>
<ol>
<li style="text-align: justify;">Iteramos por cada columna: <code>for each currentColumn in grid</code>
<ol>
<li>Identificamos la columna siguiente: <code>nextColumn</code></li>
<li><span style="font-size: 13px; background-color: transparent;">Iteramos por cada nodo en la columna: <code>for each currentNode in&nbsp;currentColumn</code></span>
<ol>
<li><span style="font-size: 13px; background-color: transparent;">Iteramos por cada nodo siguiente: <code>for each nextNode in currentNode.nextNodes</code></span>
<ol>
<li><span style="font-size: 13px; background-color: transparent;">Si el nodo siguiente no est&aacute; en la columna siguiente: <code>if (!nextColumn.contains(nextNode))</code></span>
<ol>
<li>Crear un nodo falso que podamos identificar: <code>fakeNode</code></li>
<li>Desconectar el nodo actual de su siguiente: <code>disconnectNodes(currentNode, nextNode)</code></li>
<li>Conectar el nodo actual con el nodo falso: <code>connectNodes(currentNode, fakeNode)</code></li>
<li>Conectar el nodo falso con el nodo siguiente: <code>connectNodes(fakeNode, nextNode)</code></li>
<li>Insertar el nodo falso en la columna siguiente: <code>nextColumn.add(fakeNode)</code></li>
</ol>
</li>
</ol>
</li>
</ol>
</li>
</ol>
</li>
</ol>
<p><script src="https://gist.github.com/AlphaGit/11093696.js"></script></p>
<h4>3. Minimizar cruces</h4>
<p style="text-align: justify;">A&uacute;n con los cambios que hemos logrado hasta este punto, la minimizaci&oacute;n de los cruces sigue siendo un problema dif&iacute;cil. La raz&oacute;n es que es f&aacute;cil acomodar un par de nodos para evitar cruces y a la vez generar otros cruces en otras columnas. Finalmente, es posible que no exista una configuraci&oacute;n que nos libre de cruces, si es que nuestro grafo est&aacute; poblado de muchas dependencias. En casos como estos es cuando el algoritmo se comportar&aacute; de la peor forma, o requerir&aacute; de una aproximaci&oacute;n m&aacute;s avanzada para ser resuelto apropiadamente.</p>
<p style="text-align: justify;">Lejf Diecks contaba en sus art&iacute;culos&nbsp;originales que esto pod&iacute;a resolverse con un algortimo de b&uacute;squeda, posiblemente una b&uacute;squeda con ajustes para evitar m&iacute;nimos locales que nos impidan acercarnos al m&iacute;nimo global de cruces.</p>
<p style="text-align: justify;">La forma de calcular cruces a este punto es bastante simple: ya que la representaci&oacute;n de los nodos en columnas tienen sus &iacute;ndices alineados con la posici&oacute;n del nodo en la columna y como cada nodo s&oacute;lo tiene nodos siguientes en la columna siguiente, s&oacute;lo tenemos que comparar los &iacute;ndices. &Eacute;l habla de cuatro situaciones en las cuales s&oacute;lo dos ser&aacute;n cruces, pero dado que debemos seguir un orden de evaluaci&oacute;n, aprovech&eacute; eso para reducir todo a una &uacute;nica condici&oacute;n.</p>
<p style="text-align: justify;">A la vez, aprovech&eacute; el orden de evaluaci&oacute;n para mantener los cambios sobre la parte del grafo que a&uacute;n no ha sido evaluada por cruces. Esto significa que podr&iacute;amos mejorar la cantidad de cruces que tendremos hasta ahora, y llegando al final s&oacute;lo tendremos que hacer lo mismo asegur&aacute;ndonos de no afectar lo que ya ordenamos antes.</p>
<p style="text-align: justify;">El algoritmo se ver&iacute;a algo as&iacute;:</p>
<ol>
<li style="text-align: justify;">Iteramos por cada columna: <code>for each column in grids</code>
<ol>
<li>Identificamos la columna siguiente: <code>nextColumn</code></li>
<li>Iteramos por cada nodo en la columna: <code>for each node1&nbsp;in column</code>
<ol>
<li>Iteramos por cada nodo que est&aacute; debajo de este nodo en la columna: <code>for each node2 in column[node2..last]</code>
<ol>
<li>Iteramos por cada nodo siguiente del primer nodo: <code>for each nextNode1 in node1.nextNodes</code>
<ol>
<li>Iteramos por cada nodo siguiente del segundo nodo: <code>for each nextNode2 in node2.nextNodes</code>
<ol>
<li>Identificamos la posici&oacute;n del siguiente del primer nodo: <code>nextNode1Index&nbsp;&larr;&nbsp;nextColumn.indexOf(nextNode1)</code></li>
<li>Identificamos la posici&oacute;n del siguiente del segundo nodo: <code>nextNode2Index &larr; nextColumn.indexOf(nextNode2)</code></li>
<li>Si el siguiente del segundo nodo&nbsp;tiene un &iacute;ndice menor al siguiente del primer nodo, tenemos un cruce: <code>if (nextNode2Index < nextNode1Index)</code>
<ol>
<li>Intercambiamos&nbsp;los lugares de los nodos siguientes que producen el cruce: <code>swap(nextColumn, nextNode1, nextNode2)</code></li>
</ol>
</li>
</ol>
</li>
</ol>
</li>
</ol>
</li>
</ol>
</li>
</ol>
</li>
</ol>
<p style="text-align: justify;">El resultado no es ciertamente &oacute;ptimo, pero considero que es lo suficientemente bueno como para la demostraci&oacute;n. En el art&iacute;culo original de Lejf Diecks, &eacute;l recomendaba la generaci&oacute;n de un algortimo gen&eacute;tico, que permitir&iacute;a alcanzar un m&aacute;ximo tras unas cuentas iteraciones, haciendo el proceso muy r&aacute;pido. La idea me parece interesante, pero he elegido no implentarla todav&iacute;a. Sin embargo, s&eacute; que ser&iacute;a f&aacute;cil crear la funci&oacute;n de evaluaci&oacute;n, ya que solamente se tratar&iacute;a de contar la cantidad de cruces y el objetivo ser&iacute;a minimizarlos (0 ser&iacute;a un caso definitivamente &oacute;ptimo que podr&iacute;a terminar la generaci&oacute;n de forma temprana). Para mayor est&eacute;tica visual, podr&iacute;a agregarse el criterio de la cantidad de v&eacute;rtices inclinados, en donde tambi&eacute;n menos es mejor. Por otro lado, tambi&eacute;n es f&aacute;cil la generaci&oacute;n de cada una de las entidades, ya que s&oacute;lo hay que modelar la posici&oacute;n de cada uno de los nodos, sin necesidad de variar las capas en la que cada nodo se encuentra. Finalmente, incluso se podr&iacute;a permitir que el algoritmo gen&eacute;tico utilice m&aacute;s filas que la cantidad de nodos que existen en una fila (creando as&iacute; la posibilidad de abrir paso a&nbsp;colocar nodos m&aacute;s alejados para que otros cruces no se produzcan).</p>
<p style="text-align: justify;">As&iacute; es que se ver&iacute;a el c&oacute;digo resultante:</p>
<p><script src="https://gist.github.com/AlphaGit/11125541.js"></script></p>
<h4>4. Remover nodos falsos</h4>
<p style="text-align: justify;">En este punto, ya no hacen falta los nodos falsos que hab&iacute;amos creado, de forma que podemos eliminarlos. Esto es tan simple como recorrer todo el grafo y quitar los nodos falsos, conectando nuevamente los nodos que est&eacute;n detr&aacute;s y adelante del nodo falso.</p>
<p style="text-align: justify;">Podr&iacute;amos simplemente asumir que los nodos falsos tienen un &uacute;nico predecesor y que tienen un s&oacute;lo siguiente, por la forma en la que los hemos colocado anteriormente, pero en este caso asumir&eacute; que no es el caso. Esto es porque una futura posibilidad de estos nodos falsos es que sean conectados a varios nodos y que reemplacen otros posibles cruces -- pero eso es historia para otro d&iacute;a. Sea como sea, tambi&eacute;n es buena idea que asumamos casos m&aacute;s gen&eacute;ricos, lo que nos permitir&aacute; m&aacute;s adelante refactorizar este c&oacute;digo en algo m&aacute;s reutilizable.</p>
<p style="text-align: justify;">Nuestro algoritmo para esto ser&iacute;a:</p>
<ol>
<li style="text-align: justify;">Iteramos por cada columna: <code>for each column in grid</code>
<ol>
<li><span style="background-color: transparent;">Identificamos el nodo actual: <code>node</code></span></li>
<li><span style="background-color: transparent;">Si es un nodo falso: <code>if (isFakeNode(node))</code></span>
<ol>
<li><span style="background-color: transparent;">Iteramos por cada nodo previo: <code>for each previousNode in node.previousNodes</code></span>
<ol>
<li><span style="background-color: transparent;">Iteramos por cada nodo siguiente: <code>for each nextNode in node.nextNodes</code></span>
<ol>
<li><span style="background-color: transparent;">Conectamos el nodo previo con el nodo siguiente: <code>connectNodes(previousNode, nextNode)</code></span></li>
</ol>
</li>
<li><span style="background-color: transparent;">Desconectamos el nodo previo del nodo falso: <code>disconnectNodes(previousNode, </code></span><code><span style="background-color: transparent;">node</span><span style="background-color: transparent;">)</span></code></li>
</ol>
</li>
<li><span style="background-color: transparent;">Iteramos por cada nodo siguiente: <code>for each nextNode in node.nextNodes</code></span>
<ol>
<li><span style="background-color: transparent;">Desconectamos el nodo siguiente del nodo falso: <code>disconnectNodes(node, nextNode)</code></span></li>
</ol>
</li>
<li><span style="background-color: transparent;">Eliminamos el nodo falso de la columna: <code>column.remove(node)</code></span></li>
</ol>
</li>
</ol>
</li>
</ol>
<p style="text-align: justify;">Y en c&oacute;digo se puede ver as&iacute;:</p>
<p><script src="https://gist.github.com/AlphaGit/11125710.js"></script></p>
<h2>Otros pensamientos</h2>
<h3>El unit testing me gener&oacute;&nbsp;alarmas sobre el dise&ntilde;o</h3>
<p style="text-align: justify;">El unit testing me result&oacute; dif&iacute;cil y antinatural en este caso. En mi mente, tener un servicio que implementara el algoritmo de Sugiyama era una &uacute;nica responsabilidad y por tanto una buena idea para estar aislado en uno y s&oacute;lo un servicio. Sin embargo, me di cuenta que es muy dif&iacute;cil poder probarlo de comienzo a final sin tener en cuenta todos los pasos intermedios, y como yo no quer&iacute;a que mi servicio expusiera su comportamiento interno, era imposible para mi partirlo en unidades m&aacute;s peque&ntilde;as para unit testear.</p>
<p style="text-align: justify;">Esto me hace pensar que mi servicio no es tan unitario como yo lo pensaba -- si es dif&iacute;cil de testear como unidad, quiz&aacute; no es una unidad despu&eacute;s de todo.&nbsp;Mi soluci&oacute;n temporal ha sido exponer algunos m&eacute;todos internos de este servicio y testearlos, pero claramente podr&iacute;a todo convertirse en un m&oacute;dulo y tener una clase de facade que exponga los que yo necesito utilizar en mi aplicaci&oacute;n mientras el resto es unit testeado como unidades independientes.</p>
<h3>La complejidad ciclom&aacute;tica me gener&oacute;&nbsp;alarmas sobre la performance</h3>
<p style="text-align: justify;">Por otro lado, encontr&eacute; que existen muchas variantes de implementaci&oacute;n y quiz&aacute; considere alterar la que estoy usando a una m&aacute;s. M&aacute;s all&aacute; del experimento, es posible que se vuelva muy ineficiente esta aplicaci&oacute;n si es que estamos hablando de una cantidad grande de nodos. Miren la cantidad de bucles anidados que tienen los algoritmos que describ&iacute; antes -- no hay forma que eso sea eficiente en n&uacute;meros grandes.</p>
<p style="text-align: justify;">No s&oacute;lo eso hace que sea ineficiente, tambi&eacute;n es dif&iacute;cil de seguir y me forz&oacute; a partirlo en unidades m&aacute;s peque&ntilde;as s&oacute;lo para poder probar. Si no puedo seguir el m&eacute;todo mentalmente, est&aacute; claro que deber&iacute;a partirlo en partes m&aacute;s peque&ntilde;as.</p>
<h3>Explicar c&oacute;mo lo hago me hizo replantearme decisiones</h3>
<p style="text-align: justify;">Muy curiosamente, no not&eacute; mucho de esto hasta el momento en que escrib&iacute; este art&iacute;culo y al momento de explicarlo me di cuenta que las soluciones eran exageradamente complicadas o innecesariamente ineficientes. Probablemente no lo vean, pero hubo varios cambios que hice s&oacute;lo al momento de explicar esto porque la versi&oacute;n anterior era peor a&uacute;n.</p>
<p style="text-align: justify;">Quiz&aacute; tenga que comprarme un <a href="http://en.wikipedia.org/wiki/Rubber_duck_debugging">patito de goma</a>.</p>
<h3>La pasi&oacute;n por el producto mismo</h3>
<p style="text-align: justify;">Cuando comenc&eacute; este proyecto, ten&iacute;a en mente s&oacute;lo hacer lo m&aacute;s b&aacute;sico posible como una excusa para experimentar con d3js. Sin embargo, ahora que lo veo semi-funcional me dar&iacute;a l&aacute;stima no terminar de generar un producto -- posiblemente siga agreg&aacute;ndole funcionalidad hasta que otras prioridades tomen lugar o hasta que llegue a un punto en donde realmente me sienta c&oacute;modo con &eacute;l como producto final.</p>
<h2>Conclusi&oacute;n</h2>
<p style="text-align: justify;">En este punto what-now tiene estas nuevas funcionalidades presentes en su versi&oacute;n online: <a href="http://what-now.heroku.com">http://what-now.heroku.com</a>. La investigaci&oacute;n de c&oacute;mo lograr esto fue muy interesante y me llev&oacute; a encontrar varios conceptos que desconoc&iacute;a totalmente. A&uacute;n as&iacute;, no quiero ahondar en ellos a&uacute;n, sino que quiero continuar con este proyecto para que sea usable y para luego continuar con otros.</p>
