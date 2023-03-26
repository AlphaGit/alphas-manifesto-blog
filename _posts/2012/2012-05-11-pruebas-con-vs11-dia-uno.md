---
title: 'Pruebas con VS11: Día uno'
date: 2012-05-11 15:11:03 +0000
date_gmt: 2012-05-11 20:11:03 +0000
categories:
  - Projects
  - Technology
tags:
  - .NET
  - C#
  - Microsoft
  - Imágenes
  - desarrollo
  - herramientas
  - color
  - Visual Studio
  - interfaz
  - IDE
  - cálculo lambda
  - colores
  - .NET 4.5
  - Beta
  - programming
subtitle: Comenzando a explorar lo que la beta nos ofrece.
description: >-
  Investigando características de Visual Studio 11 Beta. Investigación personal,
  interfaz refinada, instalación lenta, errores, uso paralelo, coloreado,
  lambdas, quick watch, async tasks.
---


Comencé como un proceso de autocapacitación mi investigación personal de las características que Visual Studio 11, todavía en Beta, nos ofrece. Pretendo documentar mi experiencia personal porque si bien no va a ser una buena indicación de cómo es el producto, puede que detecte muchos pequeños problemitas o cosas que estarían buenos tener en cuenta, al menos prepararse para ellos. Conociendo mi suerte, estoy seguro de que algo voy a romper.

## Instalación

![]({{ site.baseurl }}/assets/vs11installscreen.png){ :align-left }

Lo primero que tengo que comentar es la instalación. La interfaz está mucho más refinada, pero más allá de eso, es un poco más oscura en el sentido en que no tenemos mucha información sobre qué está pasando. No he tenido problemas con la instalación, pero imagino que debe ser más complicado de hacer troubleshooting si ocurriera algún error. Por último, la instalación toma su buen par de horas, quizá extendiéndose hasta cuatro o cinco. Si tiene que bajar los updates de internet, es lo suficientemente inteligente como para hacerlo en paralelo mientras otra cosa se instala, así que tener una conexión pobre no debería ser un problema a menos que fuera muy acotada.

Mi instalación terminó sin problemas excepcionales. Una característica rara que me ocurrió en una de las dos máquinas que la instalé (solo en una) es sobre un paquete que debe continuar la instalación. Como varias de las instalaciones de VS, a veces es requerido un reinicio hasta que se pueda continuar la instalación. La forma en la que el instalador se asegura continuar luego es poniendo una entrada en el registro para volver a correr la próxima vez. Resulta que en mi caso, ese ejecutable se inició pero nunca se quitó del registro. Nunca supe si ejecutó correctamente o no porque ese ejecutable en particular parece no tener interfaz. Tras cada reinicio que yo hacía, el ejecutable volvía a pedirme permiso (ya que es un archivo bajado de internet).

Ese se encuentra aquí, algo que futuros visitantes pueden encontrar muy útil para diagonsticar problemas:

```
"C:\ProgramData\Package Cache\{a3c0442e-f8f7-4089-ac77-1e0c50901f63}\vs_ultimate.exe" /burn.log.append "C:\Users\_<User>_\AppData\Local\Temp\dd_vs_ultimate_<timestamp>.log" /uninstall /quiet -burn.related.upgrade
```

Por el comando que ejecuta y deja en el archivo de log, parecería ser un servicio de updates y de rollout de nuevas funcionalidades agregadas. Si estoy en lo correcto, no deberían preocuparse ya que VS tiene su propia plataforma de updates. Lo que yo hice es simplemente quitar eso de mi inicio. No he visto complicaciones hasta ahora.

## Interfaz, UI y UX

Lo primero que voy a probar es hacer algo parecido a mis tareas diarias.

Mi primer sorpresa es la elección de colores que tuvieron con el entorno. En general, todo grisáceo y de colores muy uniformes. Es fácil ver el texto pero no lo es tanto como el contraste que proponía el blanco sobre azul de la versión anterior. Es difícil distinguir las ventanas sobre el fondo, especialmente si no tienen contenido. Cada tanto los mensajes de diálogo pierden ese estilo y vuelven al estilo normal que tienen las ventanas de Windows, dejando ese feo sabor [del cual todos se quejan de la suite Adobe](http://adobegripes.tumblr.com/), en donde el programa realmente desentona con el entorno en el que está corriendo.

Recordemos nuevamente que está pensado también para Windows 8, con lo que mi apreciación podría ser equivocada, pero no lo he probado aún. Esa es otra historia y probablemente otra serie de posts.

![]({{ site.baseurl }}/assets/vs11intellisense.png)


Como pueden ver en el screenshot que tomé, también optaron por eliminar los colores de los menúes contextuales, específicamente les muestro el de Intellisense, el cual me parece una pésima decisión. La habilidad de distinguir propiedades, métodos, clases, enumerados y campos por color a simple vista era una bendición. Las selecciones de arriba siguen siendo dropdowns anque parezcan desaparecidos, y los íconos más el gris claro/gris oscuro/negro de toda la sección derecha lo hace difícil de acostumbrarse. Creo entender la intención: esta pantalla nos concentra, sin duda, en el código, y eso definitivamente debería ocurrir.

El entorno completo parecer ser más rápido y responsivo, sospecho que estará utilizando la misma tecnología de async que el nuevo framework ofrece.  ¿Recuerdan el cuadro de diálogo de Add Reference, que fácilmente detenía todo unos minutos hasta recuperar el listado de assemblies? Sigue tardando, pero ya no significa un problema, el entorno sigue respondiendo como si nada estuviera ocurriendo de fondo.

![]({{ site.baseurl }}/assets/vs11errorlist.png)


Una muy buena adición que encontré es la capacidad de filtrar errores desde el listado de errores de compilación. Esto nos permite dar un paso adelante, cuando ya estamos acostumbrados a determinados errores causando otros, pudiendo concentrar nuestro esfuerzo en solucionar esos primero. Como pueden ver además, el filtro funciona para cualquier campo, lo cual resulta totalmente natural.

![]({{ site.baseurl }}/assets/vs11unittest.png)


Desafortunadamente, parece que esta característica no se comporta de forma consistente en todas la ventanas. Otra que me interesa que vean es la ventana _Unit Test Explorer_, otra que estaremos viendo muy seguido, más todavía si trabajamos con TDD. En este caso la búsqueda sólo funciona con el nombre de las pruebas y uno debe presionar enter para aceptar la búsqueda, cuando en la anterior ya con sólo filtrar podíamos ver nuestro filtro aplicarse.

Esta ventana, sin embargo, tuvo un rediseño visual algo importante y me agrada el cambio. En las versiones anteriores los detalles de una prueba se encontraban separados de la prueba en sí, esto hará mucho más fácil poder ver qué pasa con cada una de las pruebas, y asumo que su output también aparecerá aquí.

Parece que otra característica que tampoco nos dejará muy contentos es algo que estaba siendo muy aclamado. Cualquiera que reconozca la frase "_Expression cannot contain lambda expressions"_ sabe de qué estoy hablando. Así es, esa frase sigue presente y nos sigue molestando aún en esta nueva versión. Por favor, espero que la versión final del IDE agregue esto porque es una funcionalidad que puede salvar horas y horas de desarrollo.

![]({{ site.baseurl }}/assets/vs11quickwatch.png)


Desafortunadamente alguien ha decidido que agregar coloreado al texto que tipeamos ahí fue más importante, y terminamos con una versión algo buggeada de texto formateado (como pueden ver en la imagen anterior, ambas decepciones juntas). No es realmente nada tan terrible como algo que no funcione, pero muchos queremos poder efectuar un _.Where()_ para no tener que pasar por más de 200 elementos en un enumerable.

En otra de mis pruebas descubrí que existe algo llamado [Parallel Watch](http://msdn.microsoft.com/en-us/library/hh418499(v=vs.110).aspx), que básicamente es una ventana de watch que nos permite ver valores de una misma variable a lo largo de distintos threads. Supongo que esto puede volverse confuso ya que distintas intancias de una misma variable son en realidad distintas variables e instancias no-thread safe son en realidad la misma variable. Eso o yo me estoy perdiendo algo del concepto de trabajar en paralelo. (Si algún lector tiene algo que aportar, es bienvenido.)

Dispuse la siguiente prueba para verificar su funcionalidad, y como sorpresa extra, encontré que puedo editar el código mientras está ejecutando, algo que anteriormente sólo ocurría en determinados casos. Me trajo un poco de satisfacción (aunque no tanto como me habría dado poder usar lamdbas en el quick watch.)

<script src="https://gist.github.com/2662168.js"> </script>

Desafortunadamente mi prueba no resultó muy exitosa, ya que al elegir una ventana de watch para poder ver, el siguiente mensaje se hace presente (les dije que algo iba a romper):

![]({{ site.baseurl }}/assets/vs11parallelwatch.png)


Creo que de todos momentos puedo estar en el camino equivocado, ya que en la ventana de Parallel Tasks nada aparecía. Seguramente tenga algo que ver con la nueva característica de [async tasks de .NET 4.5](http://msdn.microsoft.com/en-us/library/hh191443(v=vs.110).aspx).

Es un muy buen punto de partida para retomar mi investigación, ya que mi tiempo se acabó por hoy.
