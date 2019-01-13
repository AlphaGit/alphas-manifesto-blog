---
layout: post
status: publish
published: true
title: 'Pruebas con VS11: D&iacute;a uno'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 3877
wordpress_url: http://blog.alphasmanifesto.com/?p=3877
date: '2012-05-11 15:11:03 +0000'
date_gmt: '2012-05-11 20:11:03 +0000'
categories:
- Projects
- Technology
tags:
- ".NET"
- C#
- Microsoft
- Im&aacute;genes
- desarrollo
- herramientas
- color
- Visual Studio
- interfaz
- IDE
- c&aacute;lculo lambda
- colores
- ".NET 4.5"
- Beta
- programming
comments:
- id: 8871
  author: 'Pruebas con VS11: D&iacute;a dos | Alpha&#039;s Manifesto'
  author_email: ''
  author_url: http://blog.alphasmanifesto.com/2012/05/30/pruebas-con-vs11-dia-dos/
  date: '2012-05-30 16:37:11 +0000'
  date_gmt: '2012-05-30 21:37:11 +0000'
  content: "[...] con mi serie de posts e investigaci&oacute;n sobre lo que VS11 ofrece
    (Parte 1), quisiera tomar una aproximaci&oacute;n separada. Si bien la exploraci&oacute;n
    es interesante, es poco [...]"
- id: 8906
  author: VS2012, d&iacute;a tres | Alpha&#039;s Manifesto
  author_email: ''
  author_url: http://blog.alphasmanifesto.com/2012/08/15/vs2012-dia-tres/
  date: '2012-08-15 18:17:24 +0000'
  date_gmt: '2012-08-15 23:17:24 +0000'
  content: "[...] Ya he mencionado esto, por lo que simplemente podemos decir que
    la interfaz y la performance del framework de unit testing es mucho mejor que
    en las versiones anteriores. [...]"
- id: 8907
  author: VS2012, d&iacute;a cuatro | Alpha&#039;s Manifesto
  author_email: ''
  author_url: http://blog.alphasmanifesto.com/2012/08/22/vs2012-dia-cuatro/
  date: '2012-08-22 16:29:12 +0000'
  date_gmt: '2012-08-22 21:29:12 +0000'
  content: "[...] Pruebas con VS11: D&iacute;a uno [...]"
---
<p style="text-align: justify;">Comenc&eacute; como un proceso de autocapacitaci&oacute;n mi investigaci&oacute;n personal de las caracter&iacute;sticas que Visual Studio 11, todav&iacute;a en Beta, nos ofrece. Pretendo documentar mi experiencia personal porque si bien no va a ser una buena indicaci&oacute;n de c&oacute;mo es el producto, puede que detecte muchos peque&ntilde;os problemitas o cosas que estar&iacute;an buenos tener en cuenta, al menos prepararse para ellos. Conociendo mi suerte, estoy seguro de que algo voy a romper.</p>
<h2 style="text-align: justify;">Instalaci&oacute;n</h2>

![](/assets/vs11installscreen.png){ :align-left }

<p style="text-align: justify;">Lo primero que tengo que comentar es la instalaci&oacute;n. La interfaz est&aacute; mucho m&aacute;s refinada, pero m&aacute;s all&aacute; de eso, es un poco m&aacute;s oscura en el sentido en que no tenemos mucha informaci&oacute;n sobre qu&eacute; est&aacute; pasando. No he tenido problemas con la instalaci&oacute;n, pero imagino que debe ser m&aacute;s complicado de hacer troubleshooting si ocurriera alg&uacute;n error. Por &uacute;ltimo, la instalaci&oacute;n toma su buen par de horas, quiz&aacute; extendi&eacute;ndose hasta cuatro o cinco. Si tiene que bajar los updates de internet, es lo suficientemente inteligente como para hacerlo en paralelo mientras otra cosa se instala, as&iacute; que tener una conexi&oacute;n pobre no deber&iacute;a ser un problema a menos que fuera muy acotada.</p>
<p style="text-align: justify;">Mi instalaci&oacute;n termin&oacute; sin problemas excepcionales. Una caracter&iacute;stica rara que me ocurri&oacute; en una de las dos m&aacute;quinas que la instal&eacute; (solo en una) es sobre un paquete que debe continuar la instalaci&oacute;n. Como varias de las instalaciones de VS, a veces es requerido un reinicio hasta que se pueda continuar la instalaci&oacute;n. La forma en la que el instalador se asegura continuar luego es poniendo una entrada en el registro para volver a correr la pr&oacute;xima vez. Resulta que en mi caso, ese ejecutable se inici&oacute; pero nunca se quit&oacute; del registro. Nunca supe si ejecut&oacute; correctamente o no porque ese ejecutable en particular parece no tener interfaz. Tras cada reinicio que yo hac&iacute;a, el ejecutable volv&iacute;a a pedirme permiso (ya que es un archivo bajado de internet).</p>
<p style="text-align: justify;">Ese se encuentra aqu&iacute;, algo que futuros visitantes pueden encontrar muy &uacute;til para diagonsticar problemas:</p>
<pre style="text-align: justify;">"C:\ProgramData\Package Cache\{a3c0442e-f8f7-4089-ac77-1e0c50901f63}\vs_ultimate.exe" /burn.log.append "C:\Users\<em><User></em>\AppData\Local\Temp\dd_vs_ultimate_<em><timestamp></em>.log" /uninstall /quiet -burn.related.upgrade</pre>
<p style="text-align: justify;">Por el comando que ejecuta y deja en el archivo de log, parecer&iacute;a ser un servicio de updates y de rollout de nuevas funcionalidades agregadas. Si estoy en lo correcto, no deber&iacute;an preocuparse ya que VS tiene su propia plataforma de updates. Lo que yo hice es simplemente quitar eso de mi inicio. No he visto complicaciones hasta ahora.</p>
<h2 style="text-align: justify;">Interfaz, UI y UX</h2>
<p style="text-align: justify;">Lo primero que voy a probar es hacer algo parecido a mis tareas diarias.</p>
<p style="text-align: justify;">Mi primer sorpresa es la elecci&oacute;n de colores que tuvieron con el entorno. En general, todo gris&aacute;ceo y de colores muy uniformes. Es f&aacute;cil ver el texto pero no lo es tanto como el contraste que propon&iacute;a el blanco sobre azul de la versi&oacute;n anterior. Es dif&iacute;cil distinguir las ventanas sobre el fondo, especialmente si no tienen contenido. Cada tanto los mensajes de di&aacute;logo pierden ese estilo y vuelven al estilo normal que tienen las ventanas de Windows, dejando ese feo sabor <a href="http://adobegripes.tumblr.com/">del cual todos se quejan de la suite Adobe</a>, en donde el programa realmente desentona con el entorno en el que est&aacute; corriendo.</p>
<p style="text-align: justify;">Recordemos nuevamente que est&aacute; pensado tambi&eacute;n para Windows 8, con lo que mi apreciaci&oacute;n podr&iacute;a ser equivocada, pero no lo he probado a&uacute;n. Esa es otra historia y probablemente otra serie de posts.</p>

![](/assets/vs11intellisense.png)

<p style="text-align: justify;">Como pueden ver en el screenshot que tom&eacute;, tambi&eacute;n optaron por eliminar los colores de los men&uacute;es contextuales, espec&iacute;ficamente les muestro el de Intellisense, el cual me parece una p&eacute;sima decisi&oacute;n. La habilidad de distinguir propiedades, m&eacute;todos, clases, enumerados y campos por color a simple vista era una bendici&oacute;n. Las selecciones de arriba siguen siendo dropdowns anque parezcan desaparecidos, y los &iacute;conos m&aacute;s el gris claro/gris oscuro/negro de toda la secci&oacute;n derecha lo hace dif&iacute;cil de acostumbrarse. Creo entender la intenci&oacute;n: esta pantalla nos concentra, sin duda, en el c&oacute;digo, y eso definitivamente deber&iacute;a ocurrir.</p>
<p style="text-align: justify;">El entorno completo parecer ser m&aacute;s r&aacute;pido y responsivo, sospecho que estar&aacute; utilizando la misma tecnolog&iacute;a de async que el nuevo framework ofrece. &iquest;Recuerdan el cuadro de di&aacute;logo de Add Reference, que f&aacute;cilmente deten&iacute;a todo unos minutos hasta recuperar el listado de assemblies? Sigue tardando, pero ya no significa un problema, el entorno sigue respondiendo como si nada estuviera ocurriendo de fondo.</p>

![](/assets/vs11errorlist.png)

<p style="text-align: justify;">Una muy buena adici&oacute;n que encontr&eacute; es la capacidad de filtrar errores desde el listado de errores de compilaci&oacute;n. Esto nos permite dar un paso adelante, cuando ya estamos acostumbrados a determinados errores causando otros, pudiendo concentrar nuestro esfuerzo en solucionar esos primero. Como pueden ver adem&aacute;s, el filtro funciona para cualquier campo, lo cual resulta totalmente natural.</p>

![](/assets/vs11unittest.png)

<p style="text-align: justify;">Desafortunadamente, parece que esta caracter&iacute;stica no se comporta de forma consistente en todas la ventanas. Otra que me interesa que vean es la ventana <em>Unit Test Explorer</em>, otra que estaremos viendo muy seguido, m&aacute;s todav&iacute;a si trabajamos con TDD. En este caso la b&uacute;squeda s&oacute;lo funciona con el nombre de las pruebas y uno debe presionar enter para aceptar la b&uacute;squeda, cuando en la anterior ya con s&oacute;lo filtrar pod&iacute;amos ver nuestro filtro aplicarse.</p>
<p style="text-align: justify;">Esta ventana, sin embargo, tuvo un redise&ntilde;o visual algo importante y me agrada el cambio. En las versiones anteriores los detalles de una prueba se encontraban separados de la prueba en s&iacute;, esto har&aacute; mucho m&aacute;s f&aacute;cil poder ver qu&eacute; pasa con cada una de las pruebas, y asumo que su output tambi&eacute;n aparecer&aacute; aqu&iacute;.</p>
<p style="text-align: justify;">Parece que otra caracter&iacute;stica que tampoco nos dejar&aacute; muy contentos es algo que estaba siendo muy aclamado. Cualquiera que reconozca la frase "<em>Expression cannot contain lambda expressions"</em>&nbsp;sabe de qu&eacute; estoy hablando. As&iacute; es, esa frase sigue presente y nos sigue molestando a&uacute;n en esta nueva versi&oacute;n. Por favor, espero que la versi&oacute;n final del IDE agregue esto porque es una funcionalidad que puede salvar horas y horas de desarrollo.</p>

![](/assets/vs11quickwatch.png)

<p style="text-align: justify;">Desafortunadamente alguien ha decidido que agregar coloreado al texto que tipeamos ah&iacute; fue m&aacute;s importante, y terminamos con una versi&oacute;n algo buggeada de texto formateado (como pueden ver en la imagen anterior, ambas decepciones juntas). No es realmente nada tan terrible como algo que no funcione, pero muchos queremos poder efectuar un <em>.Where()</em> para no tener que pasar por m&aacute;s de 200 elementos en un enumerable.</p>
<p style="text-align: justify;">En otra de mis pruebas descubr&iacute; que existe algo llamado <a href="http://msdn.microsoft.com/en-us/library/hh418499(v=vs.110).aspx">Parallel Watch</a>, que b&aacute;sicamente es una ventana de watch que nos permite ver valores de una misma variable a lo largo de distintos threads. Supongo que esto puede volverse confuso ya que distintas intancias de una misma variable son en realidad distintas variables e instancias no-thread safe son en realidad la misma variable. Eso o yo me estoy perdiendo algo del concepto de trabajar en paralelo. (Si alg&uacute;n lector tiene algo que aportar, es bienvenido.)</p>
<p style="text-align: justify;">Dispuse la siguiente prueba para verificar su funcionalidad, y como sorpresa extra, encontr&eacute; que puedo editar el c&oacute;digo mientras est&aacute; ejecutando, algo que anteriormente s&oacute;lo ocurr&iacute;a en determinados casos. Me trajo un poco de satisfacci&oacute;n (aunque no tanto como me habr&iacute;a dado poder usar lamdbas en el quick watch.)</p>
<p><script src="https://gist.github.com/2662168.js"> </script></p>
<p style="text-align: justify;">Desafortunadamente mi prueba no result&oacute; muy exitosa, ya que al elegir una ventana de watch para poder ver, el siguiente mensaje se hace presente (les dije que algo iba a romper):</p>

![](/assets/vs11parallelwatch.png)

<p style="text-align: justify;">Creo que de todos momentos puedo estar en el camino equivocado, ya que en la ventana de Parallel Tasks nada aparec&iacute;a. Seguramente tenga algo que ver con la nueva caracter&iacute;stica de <a href="http://msdn.microsoft.com/en-us/library/hh191443(v=vs.110).aspx">async tasks de .NET 4.5</a>.</p>
<p style="text-align: justify;">Es un muy buen punto de partida para retomar mi investigaci&oacute;n, ya que mi tiempo se acab&oacute; por hoy.</p>
