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
---

![]({{ site.baseurl }}/assets/Building2lq.jpg)

El escenario de juego y el jugador en él


[En la entrega pasada](https://blog.alphasmanifesto.com/2013/03/13/programando-arkanoid-parte-1/) hablamos sobre cómo comenzó el <a title="Arkanoid" href="http://randomjs.alphasmanifesto.com/arkanoid-canvas/arkanoid.html">juego de Arkanoid</a>, ahora continuaremos ese camino sobre la construcción del escenario de juego.

<!--more-->

En <a title="Programando Arkanoid - Parte 1" href="https://blog.alphasmanifesto.com/2013/03/13/programando-arkanoid-parte-1/">esa instancia</a> cubrimos la estructura general de los archivos, la inicialización del objeto `canvas`, los estilos a usar y la inicialización de las opciones. Dejamos algo pendiente, que era el escenario, en un objeto `ArkanoidStage`. En ese post no expliqué qué hacía este objeto o como trabajaba. Hoy comenzaremos por ahí. Lo que describiremos en este post está cubierto en el commit [90e6...abd9](https://github.com/AlphaGit/random-javascript/commit/90e6540100631e1a3ae590c3bde4a21b74f7abd9).

<script src="https://gist.github.com/AlphaGit/5158029.js"></script>

## Introducción del escenario

![]({{ site.baseurl }}/assets/arkanoidescenario.jpg)


Ya tenemos generado el objeto `canvas` y las opciones para comenzar a dibujar sobre el contexto. Ahora, toda esa lógica de dibujado debería ser encerrada en algún objeto que pueda coordinar los elementos a dibujar -- o a no dibujar (por ejemplo, cuando un bloque desaparezca). Por otra parte, este objeto podrá hacer los cálculos de tamaños según el tamaño del escenario (una de las opciones que ya inicializamos).

Para eso introducimos la clase `ArkanoidStage`.

<script src="https://gist.github.com/AlphaGit/5218647.js"></script>

Como podrán ver, la declaración de clases en JavaScript no es realmente muy distinta de una función. En realidad, _es_ una función, que funciona como generadora de los objetos y ámbito limitador de sus acciones. Los argumentos de esta función serán los parámetros actuales que son pasados al constructor (no hablaré de los parámetros formales porque no son realmente necesarios para el pasaje de los mismos). Como preferencia personal, declaro los parámetros a recibir para tener en cuenta en el futuro. Más aún, es más fácil hacer validaciones sobre ellos si es que quisiéramos.

Los parámetros que `ArkanoidStage` recibirá son tres: el contexto sobre el que se dibujará, el alto y el ancho del escenario. Asumiremos desde ahora que todas las distancias están medidas en píxeles, y que la coordenada (0, 0) es la esquina superior izquierda de la pantalla, aumentando hacia abajo y hacia la derecha.

Una buena idea para el cálculo de los dibujos a realizar es plantear una grilla. Para eso, decidiremos primero el tamaño de los bloques como una porción del ancho y alto disponible. De esta forma, el juego será siempre el mismo independientemente del tamaño de la ventana del navegador. Para eso, el escenario calcula `blockHeight` y `blockWidth`. Estamos considerando que en una pantalla de juego podrán entrar 10 bloques horizontalmente, y 50 bloques verticalmente.  ¿Cómo surgieron estos números? Simplemente me gustaron, y encontré que la proporción entre ellos era bastante aceptable. Por supuesto, esto puede cambiar a gusto.

Ya que estamos calculando tamaños, es importante notar que hay un elemento que no sigue esta regla: la pelota del juego. A ella la haremos un poco más grande que el tamaño de un bloque, algo así como un bloque y medio de alto (su menor dimensión). Para eso entonces, calcularemos el radio de la pelota como un 80% del tamaño de un bloque, lo que nos dará una pelota de 1.6 bloques-alto de diámetro.

Por último, el escenario comenzará dibujando nuestro primer objeto: El jugador. Como el jugador posee lógica propia (movimiento fuera de la grilla, velocidad incremental), vamos a hacer una clase propia para este objeto. Pero por ahora, vamos a instanciarlo y a pedirle que se dibuje (líneas 7 y 8). Lo que el jugador necesitará es:

- el contexto (para dibujarse),
- un color (para dibujarse),
- el alto de un bloque (ya calculado para sus dimensiones)
- el ancho de un bloque (ya calculado para sus dimensiones)
- el ancho del escenario (para poder calcular sus movimientos)
- el alto del escenario (sólo por consistencia -- pero en retrospectiva, podría haber eliminado esta parte)

Finalmente, nuestro escenario no tiene nada que devolver porque es quién se encargará de todo en el futuro. Por supuesto que la decisión podría ser otra, pero este es el camino que decidí tomar.

Como nota extra, notarán que no me preocupó escribir esto en el global scope. Como toda la lógica estará encerrada en cada uno de los objetos, me parece aceptable. Para aplicaciones reales o más complejas, aconsejaría encerrar en un namespace, que no sería más que una variable global a la que estas funciones se le van anexando. En este caso, no lo veo realmente necesario.

## El jugador

![]({{ site.baseurl }}/assets/Building1lq.jpg)


El jugador será el primero de los elementos que se dibuje en nuestra pantalla, y eso ya agrega varias responsabilidades a resolver. El dibujado en sí no debería ser una responsabilidad del jugador, sino las características que lo hacen un jugador (como su posición y su movimiento). Por supuesto, también debe dibujarse pero esa no es una característica única de él. ¡Esto suena a herencia de objetos!

Por tanto, planteando que tendremos varios objetos que van a dibujarse, podemos partir desde entidades básicas que sabrán dibujarse. Llamemos a esa `DrawableEntityBase`. Siguiente a esto, habrá  dos tipos de entidades distintas que se dibujarán. Unas de ellas son bloques (cuadrados), como los bloques objetivos y el jugador. La otra será la pelota, que tendrá forma circular. Como el dibujado actual varía entre estos, `DrawableEntityBase` deberá delegar a sus clases hijas el dibujado, por lo que deberemos emular una clase abstracta, o una virtual que no haga nada por defecto. Prefiero emular una abstracta por mayor consistencia y _forzar_ a que las clases hijas implementen su dibujado.

Por ahora nos ocuparemos de los bloques, y a estos los llamaremos `DrawableBlock`, heredando de `DrawableEntityBase`.

Y finalmente, entre los bloques, tendremos tanto a los bloques objetivos como al jugador. Concentrémosnos en el jugador por ahora, y creemos una clase para él: `ArkanoidPlayer`, heredando de `DrawableBlock`. Hasta este momento, esta es nuestra herencia de clases:

![]({{ site.baseurl }}/assets/DrawableEntityBaseDrawableBlockArkanoidPlayer.png)


Vamos a un poco de código.

### DrawableEntityBase

<script src="https://gist.github.com/AlphaGit/5218769.js"></script>

Lo primero a determinar es qué necesitará cualquier objeto que se pueda dibujar en pantalla. Está claro que necesitará el contexto 2D del canvas para dibujarse, y finalmente un color a ser usado para dibujarse. Esto tiene sentido si asumimos que cualquier entidad tendrá un único color, el cual es nuestro caso. Si no fuera así, cada tipo de entidad debería decidir cuántos colores recibe entre sus parámetros.

Lo primero de lo primero es validar que tenemos lo necesario. No me preocupa tanto el color, pero sí el contexto. Verificamos entonces, que el `drawingContext` exista. En JavaScript existe algo llamado _falsy values_, objetos y elementos que a pesar de no valer estrictamente `false`, aún así evalúan como `false` ante una expresión condicional. Estos son: `false` (obviamente), `0` (el número cero), `""` (la cadena vacía), `null` (objeto nulo), `undefined` (objeto no definido) y `NaN` (números no numéricos -- por contradictorio que suene). Para más detalles sobre valores _truthy_ y _falsy_, les recomiendo leer [Truthy and Falsy: When All is Not Equal in JavaScript](http://www.sitepoint.com/javascript-truthy-falsy/).

Como en nuestra situación, cualquiera de esas es totalmente inválida para un contexto, podemos verificar con un simple negador. Por supuesto, que de ser más estricto podríamos verificar por el contexto siendo una instancia de las clases que los navegadores exponen como contextos, pero en mi opinión ya es mucha paranoia. Si este objeto no tiene los métodos que necesitamos, no tardaremos mucho en saberlo.

Como segundo acto, nos guardaremos referencias al contexto y al color, y declararemos nuestra función de dibujado: `draw`. Sin embargo, no podemos implementarla realmente -- como dije, `DrawableEntityBase` debe comportarse como una clase abstracta. Lo que haremos es entonces arrojar una excepción dejando claro que una clase hija debe implementar este método. Eso prevendrá que podamos utilizarla (aunque no instanciarla individualmente, lo cual no es enteramente malo).

Por último, devolveremos nuestro método disponible para exponerlo como público a cualquier elemento que cree una instancia nuestra.

### DrawableBlock

Algún texto esotérico que leí decía que _crear es limitar_. `DrawableEntityBase` es muy genérica y por eso no hace demasiado. Ahora la limitaremos y le daremos más funcionalidad, lentamente creando nuestro resultado.

<script src="https://gist.github.com/AlphaGit/5218835.js"></script>

Lo primero es crear nuestra nueva clase, y hacerla heredar de la clase base. Hay varias formas de hacer esto, y las más recomendadas incluyen librerías que ya se encargan de problemas de sobrecarga y múltiple herencia, pero yo quería hacer esto sin ninguna otra herramienta que mis dedos contra el teclado. De todas formas, las mejores recomendaciones vienen del señor John Resig, quien sabe mucho de JavaScript y nos cuenta de su forma de hacer herencia en <a title="Simple JavaScript Inheritance [John Resig]" href="http://ejohn.org/blog/simple-javascript-inheritance/">su post sobre herencia JavaScript</a>.

Para poder tener esta herencia, debemos, por supuesto, declarar la función, y agregar la clase base a su prototipo, lo que le dará al principio toda esa funcionalidad. Sin embargo, esto debe ocurrir _antes_ de la implementación de la función. Si esto les resulta raro, tengan en cuenta que declaración e implementación son dos momentos distintos aunque se escriban en el mismo lugar. En el caso de JavaScript, el hecho de declarar la función la hace disponible tanto para el código posterior como el anterior, y eso es lo que nos permite utilizar su prototipo antes de darle cuerpo. Si bien el cuerpo será ejecutado después, me agrada la idea de mantener la información de herencia a la cabeza de la función.

El prototipo base debe tener una instancia de la clase base --  ¿pero cómo creamos una instancia si no tenemos los parámetros necesarios? La forma más simple es hacer `new DrawableEntityBase()` sin pasar parámetros, lo que aún generaría la instancia. Esto, sin embargo, no nos sirve a nosotros porque tenemos validaciones que pueden arrojar errores. Para esto entonces podemos utilizar <span style="font-family: 'courier new', courier;">[Object.create()](https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object/create)</span>, disponible desde JavaScript 1.8.5.

Por último, asignamos la función base al constructor de nuestro nuevo prototipo y comenzamos con el cuerpo de la función.

Lo primero es la declaración, con los argumentos que necesitaremos para construir y dibujar un bloque. Estos son:

- contexto para dibujar (la clase base lo necesita) -- `drawingContext`</li>
- color para dibujar (la clase base lo necesita) -- `color`</li>
- coordenada x de la esquina superior derecha -- `posX`</li>
- coordenada y de la esquina superior derecha -- `posY`</li>
- el alto del bloque a dibujar -- `height`</li>
- el ancho del bloque a dibujar -- `width`</li>
</ul>

Lo segundo a hacer, pero primero en el cuerpo de la función, es llamar al constructor base, para que las variables internas necesarias sean inicializadas, y cualquier lógica de inicialización también sea ejecutada. Eso lo haremos utilizando el método `call`, que nos permite pasar como primer argumento el contexto de la función. Esto significa que la función se ejecutará como si se estuviera ejecutando en este mismo objeto. Para más información sobre `call`, pueden ver su documentación y algunos usos interesantes: [MDN: `Function.prototype.call`](https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Function/call).

Lo tercero a hacer es guardarnos los valores que necesitemos, y paso posterior, es darle una implementación a la función draw. Para esto sólo tenemos que utilizar el contexto y setear el color con el que se va a dibujar (`fillStyle`, que también tiene otras opciones), y pedirle dibujar un rectángulo utilizando `fillRect`, y pasando coordenadas y tamaños. Noten que la referencia a `color` que uso no está prefijada con `self.` como las demás. Esto es un error, y es importante si tenemos una clase compleja: la referencia a `color` sin prefijar se refiere al argumento pasado en la instanciación de ese objeto, que será único y no cambiará a menos que lo alteremos a mano. Sin embargo, si nuestra clase posee varios niveles de herencia, mixins o múltiples padres, sería posible que la referencia guardada en `self.color` cambiara, mientras que la que fue pasada por argumento no. Nostros perderíamos ese cambio por no utilizar la referencia correcta. Lo recomendable para mí es siempre utilizar las referencias almacenadas; no por alguna razón técnica, sino sólo por consistencia y organización.

### ArkanoidPlayer

Siguiendo la misma técnica para la herencia de clases, ahora debemos declarar `ArkanoidPlayer` herendado de `DrawableBlock`. Podríamos requerir más argumentos en su constructor, específicos de `ArkanoidPlayer`, pero dado que no son realmente necesarios, vamos a calcularlos por defecto. Este es el caso de su posición en la pantalla.

Los parámetros que necesitaremos, entonces, son:

- contexto para dibujar (la clase base lo necesita) -- `drawingContext`
- color para dibujar (la clase base lo necesita) -- `color`
- alto del bloque (la clase base lo necesita) -- `blockHeight`
- ancho del bloque (la clase base lo necesita) -- `blockWidth`
- alto del escenario (para calcular la posición del jugador) -- `stageHeight`
- ancho del escenario (para calcular la posición del jugador) -- `stageWidth`

<script src="https://gist.github.com/AlphaGit/5229666.js"></script>

Nos guardamos las referencias a las variables nuevas y creamos dos más: la posición X y la posición Y, que se referirán a la esquina superior izquierda (desde la cual comenzaremos a dibujar el bloque). Es importante que estemos actualizando estas variables porque el redibujado debe utilizarlas para mover al jugador.

Como paso siguiente, llamamos al constructor de `DrawableBlock` pasando un default para la posición X y la posición Y , que serán correspondientes a:

- el punto X de la pantalla a dibujar el jugador para que el bloque esté centrado -- `(stageWidth - blockWidth)/2`
- el punto Y de la pantalla a dibujar el jugador para que el bloque esté casi al final de la pantalla -- `stageHeight - blockHeight * 2`
- el ancho del bloque a dibujar: `blockWidth`
- el alto del bloque a dibujar: `blockHeight`

También debemos proveer la posibilidad de centrar al jugador, cuando el juego comience o cuando debamos resetear la partida o avanzar de nivel. En este caso, vamos a actualizar las coordenadas. Declaramos la función `centerPlayer` y su cuerpo sólo actualizará la coordenada X, puesto que la coordenada Y del jugador nunca cambiará.

Para asegurarnos de tener los datos consistentes, llamamos a esa función y por último, devolvemos nuestro objeto con las funciones públicas disponibles.

## La pelota

Teniendo toda esta base, plantear el dibujado de un círculo para representar la pelota con la que se interactúa no es demasiado difícil. Extendemos `DrawableEntityBase` para declarar `DrawableCircle` y redefinimos sus propiedades para basarse en el centro (y no una esquina) y el radio (y no ancho/alto) y reescribimos la implementación de `draw()` para que llame a la función correspondiente del contexto.

<script src="https://gist.github.com/AlphaGit/5289147.js"></script>

Para este caso, invocaremos a `ellipse()`, [quién recibe los siguientes parámetros](http://docs.webplatform.org/wiki/apis/canvas/CanvasRenderingContext2D/ellipse):

- el punto X del centro del círculo
- el punto Y del centro del círculo
- el radio en la dimensión X
- el radio en la dimensión Y (en nuestro caso, el mismo)
- la rotación -- en nuestro caso cero, será un círculo perfecto y la rotación no cambiaría nada, sólo agregaría procesamiento extra
- el ángulo de comienzo de la elipse -- en nuestro caso, cero
- el ángulo de fin de la elipse -- en nuestro caso, cero, para una vuelta completa
- si debe dibujarse en sentido antihorario -- en nuestro caso `false`, pero es indiferente

Hasta ahora, entonces, nuestra jerarquía de objetos se vería así:

![]({{ site.baseurl }}/assets/hierarchy2.png)


No será la última vez que trabajemos con la pelota, porque además de la capacidad de dibujarse, hay otras características que deberemos tratar más adelante.

Con todo esto, ya tenemos los elementos principales para comenzar a trabajar en el orden y la interacción de elementos entre sí. Material que dejaré para otros posts.
