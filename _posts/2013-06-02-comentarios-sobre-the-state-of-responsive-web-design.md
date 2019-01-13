---
layout: post
status: publish
published: true
title: Comentarios sobre The State of Responsive Web Design
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 4876
wordpress_url: http://blog.alphasmanifesto.com/?p=4876
date: '2013-06-02 16:32:34 +0000'
date_gmt: '2013-06-02 21:32:34 +0000'
categories:
- Technology
tags:
- JavaScript
- HTML
- CSS
- Im&aacute;genes
- problema
- usabilidad
- design
- navegadores
- best practices
- art&iacute;culo
- responsive
- opini&oacute;n
- soluci&oacute;n
- p&iacute;xel
comments: []
---
<p style="text-align: justify;">Acabo de terminar de leer un art&iacute;culo largo y genial de Smashing Magazine, llamado <a href="http://mobile.smashingmagazine.com/2013/05/29/the-state-of-responsive-web-design/">The State of Responsive Web Design</a>. Como el t&iacute;tulo lo indica, habla sobre el estado actual del dise&ntilde;o de webs responsive y sus pros y contras. Mucho mejor a&uacute;n, habla de los distintos problemas a superar y la forma en la que la tecnolog&iacute;a de hoy nos permite hacerlo. Pero no es una introducci&oacute;n al tema, sino que abarca todos esos problemas que a&uacute;n no tienen soluciones definitivas. Totalmente novedoso.</p>
<p style="text-align: justify;">Sin embargo, como bien dicen al final, esto no es ni el comienzo, y sobre las cosas mencionadas tengo mucho que mencionar. Quer&iacute;a dejar mis comentarios por aqu&iacute;.</p>
<p style="text-align: justify;"><!--more--></p>
<p style="text-align: justify;">Por supuesto, si no le&iacute;ste el art&iacute;culo original puede que no entiendas completamente lo que escribo aqu&iacute;. Te recomiendo leer el art&iacute;culo y luego leer este. Te recomiendo leer el art&iacute;culo tambi&eacute;n, aunque no leas este. Te recomiendo leerlo antes, pero como mejor prefieras. Ambos a la vez, un ojo en cada art&iacute;culo, no s&eacute;, como quieras.</p>
<h2>Im&aacute;genes</h2>
<h3>Pixel ratio</h3>
<p style="text-align: justify;">El problema con las im&aacute;genes es el tama&ntilde;o que se le da a cada una, teniendo en cuenta el tama&ntilde;o de la pantalla, el tama&ntilde;o de la imagen, el pixel ratio del dispositivo, y c&oacute;mo hacer lo mejor para cada situaci&oacute;n.</p>
<p style="text-align: justify;">Tener que lidiar con el pixel ratio me molesta un poco, porque creo que estamos atacando al problema de forma incorrecta. Las pantallas con un mayor pixel ratio inventaron algo que tiene una resoluci&oacute;n mayor a la capacidad de posicionamiento que utilizamos, que antes eran uno a uno. Si tu pantalla ten&iacute;a 800 p&iacute;xeles de ancho, nosotros ten&iacute;amos 800 p&iacute;xeles para poner cosas y no hab&iacute;a nada entre p&iacute;xel y pixel. En lugar de inventar una pantalla de m&aacute;s cantidad de p&iacute;xeles con menor tama&ntilde;o f&iacute;sico, inventaron una pantalla con igual cantidad de p&iacute;xeles pero m&aacute;s resoluci&oacute;n.</p>
<p style="text-align: justify;">Fue una buena idea, porque as&iacute; resolvieron el tener que hacer a todos sus usuarios ver webs diminutas que no estaban preparadas para esto. El problema que nos generaron a los programadores web es separar el concepto de posicionamiento/dimensionamiento y resoluci&oacute;n. La forma en la que la quieren resolver es cambiando la dimensi&oacute;n de las im&aacute;genes que se ven pero posicion&aacute;ndolas igual para que el dispositivo las muestre con mayor resoluci&oacute;n. Dos errores no hacen una correcta, creo que esto es una mala idea.</p>
<p style="text-align: justify;">&iquest;Por qu&eacute;? M&aacute;s all&aacute; de las complicaciones y dolores de cabeza, estamos acomodando nuestra forma de resolver el problema a la tecnolog&iacute;a y no la tecnolog&iacute;a al problema a resolver. Esencialmente, debemos dise&ntilde;ar sistemas distintos de resoluci&oacute;n y de posicionamiento. Esto debe de haberse resuelto hace tiempo, con la resoluci&oacute;n sub-p&iacute;xel que muchos sistemas ofrecen.</p>
<p style="text-align: justify;">Esencialmente, este problema se resuelve si decimos "para pantallas de alta calidad, las im&aacute;genes deben ser de 600 dpi, y para pantallas normales, 300 dpi alcanza". Olv&iacute;dense de los p&iacute;xeles. Por supuesto, esto no resuelve el problema del bandwidth o de la forma de elegir entre ellas, pero s&iacute; plantea el problema desde un punto de vista correcto. Tener que duplicar el tama&ntilde;o de una imagen y redimensionar para el tama&ntilde;o original parece un baile ritual, huele totalmente a una soluci&oacute;n incorrecta.</p>
<p style="text-align: justify;">Invito a la discusi&oacute;n en este tema.</p>
<h3>Formatos</h3>
<p style="text-align: justify;">Respecto de los formatos, est&aacute; claro que ahora y en el futuro habr&aacute; m&aacute;s avances sobre nuevos algoritmos o ideas que nos permitir&aacute;n comprimir im&aacute;genes mejor. Hoy la mejor opci&oacute;n parece ser WebP y ya est&aacute; soportado en una determinada cantidad de browsers. El art&iacute;culo menciona que Firefox no tiene intenciones de implementar WebP (&iexcl;&iquest;por qu&eacute;?!) pero no pude encontrar referencias al respecto.</p>
<p style="text-align: justify;">Sobre WebP, si est&aacute;n dispuesto a sacrificar un script y un poquito de procesamiento, ya hay un JavaScript que permite decodificar ese formato en cualquier navegador que no lo soporte. Est&aacute; a&uacute;n en desarrollo y seguramente con algunos bugs, pero pueden experimentar un poco con &eacute;l: <a href="http://webpjs.appspot.com/">WebPJS</a>.</p>
<h2>Layout</h2>
<h3>Unidades relativas al viewport</h3>
<p style="text-align: justify;">Esto lo encuentro un poco relacionado con lo que mencion&eacute; antes: unidades de posicionamiento independientes a las unidades de resoluci&oacute;n. Sin embargo, en el fondo no importa porque parece que todo se vuelve a calcular a p&iacute;xeles, as&iacute; que estamos siempre en el mismo problema. Sin embargo, me parece una idea fant&aacute;stica, y no s&oacute;lo abrir&aacute; las puertas para hacer dise&ntilde;os mucho m&aacute;s simples que hoy se hacen de forma <em>quirky</em>, sino que adem&aacute;s permitir&aacute; hacer cosas m&aacute;s complejas.</p>
<h3>Tipograf&iacute;a adaptativa</h3>
<p style="text-align: justify;">Realmente creo que no entend&iacute; el prop&oacute;sito de la propuesta de rem como unidad de medida, o realmente no me parece algo tan grave. Es decir, me parece buena idea poder rehacer las cuentas en base a una unidad original, pero lo &uacute;nico que estamos evitando es la p&eacute;rdida de precisi&oacute;n. Digamos, decir esto:</p>
<p><script src="https://gist.github.com/AlphaGit/5694899.js"></script></p>
<p style="text-align: justify;">Es exactamente lo mismo que esto:</p>
<p><script src="https://gist.github.com/AlphaGit/5694912.js"></script></p>
<p style="text-align: justify;">Con la diferencia que tengo que hacer menos cuentas en mi cabeza y tengo m&aacute;s independencia de los elementos. Pero si se supone que los elementos son relevantes respecto de su contenedor -- entonces &iquest;no estar&eacute; planteando mal mis reglas y la forma en la que se aplican?</p>
<h2>Contenido complejo</h2>
<h3>Formularios</h3>
<p style="text-align: justify;">Hablando de formularios, mucho de lo que dice el art&iacute;culo es cierto, pero dejar detalles de implementaci&oacute;n a cada browser puede ser un problema con el dise&ntilde;o. El mismo art&iacute;culo habla mal de los iframes y las APIs de otros sistemas como problem&aacute;ticas al momento de querer tener un dise&ntilde;o consistente, y hacer un dise&ntilde;o correcto para que Chrome, FireFox y Safari muestren los input type="date" de la forma que m&aacute;s les guste es ciertamente un problema. Por supuesto, no funcionalmente, pero visualmente es un problema.</p>
<p style="text-align: justify;">Y no estoy mencionando el tema de la internacionalizaci&oacute;n. Bien aclara el art&iacute;culo que estas implementaciones se encargar&iacute;an de resolver los problemas de formato y nos aportar&iacute;an un formato unificado para trabajar con fechas, n&uacute;meros y monedas. Aplaudo eso, pero hay que tener mucho en cuenta que si todo el dise&ntilde;o de un sistema est&aacute; orientado a trabajar en determinado idioma o cultura, el propio idioma del browser del usuario cambiando el comportamiento de esos controles puede verse mal. Por ejemplo, si todo el sitio se encuentra en ingl&eacute;s, para que al momento de elegir una fecha el explorador me deje elegir "2 de Junio", ciertamente no se ve bien.</p>
<h3>Tablas</h3>
<p style="text-align: justify;">Las propuestas sobre las tablas me gustaron, pero no me gustaron como opciones en el contexto de un sitio responsive. Estoy de acuerdo con que al momento de ir a una pantalla peque&ntilde;a, lo esencial de la informaci&oacute;n debe mostrarse, pero tambi&eacute;n soy fan del minimalismo, y si pod&iacute;as ocultar informaci&oacute;n no esencial -- &iquest;por qu&eacute; no lo estabas haciendo desde el comienzo?</p>
<p style="text-align: justify;">Por otro lado, re-ordenar el formato de una tabla a filas una tras otra con encabezados puede verse muy elegante para navegar en un tel&eacute;fono, pero derrota el prop&oacute;sito de la exposici&oacute;n tabular. A veces es muy importante que la informaci&oacute;n est&eacute; realmente dispuesta de esa forma: el usuario debe tener que comparar n&uacute;meros o ver patrones. Si tu datos tiene mejor sentido de esta forma que como tabla, quiz&aacute; lo planteaste mal desde un principio.</p>
<p style="text-align: justify;">Las tablas scrolleables no caen en ninguno de estos problemas que mencion&eacute;, pero aparte de lo que menciona el art&iacute;culo (quiz&aacute; no haya un scroll visible incialmente para el usuario? -- siento que ese es un problema para que los browsers resuelvan), realmente no se ve bien. De alguna forma es decirle al usuario "tenemos para mostrarte m&aacute;s informaci&oacute;n de la que tu pantalla soporta". Es una afirmaci&oacute;n algo fuerte, m&aacute;s a&uacute;n en tablas con datos. Imaginen que si una tabla crece vertical y horizontalmente, la cantidad de datos que muestra crece cuadr&aacute;ticamente. No es divertido para mi, mi dedo pulgar y mi tel&eacute;fono peque&ntilde;o.</p>
<h3>Contenido externo</h3>
<p style="text-align: justify;">Estoy de acuerdo con lo que el art&iacute;cul original menciona: es dif&iacute;cil lidear con contenido externo. Parte de eso es algo que ya podr&iacute;a atacarse hoy, como mejores APIs para mejor personalizaci&oacute;n del contenido expuesto. Recuerdo haber usado gr&aacute;ficos desde <a href="https://developers.google.com/chart/">Google Charts</a>, que entre opciones nos permite indicar colores, tama&ntilde;o y otras cosas que poco tienen que ver con el contenido, pero m&aacute;s con el dise&ntilde;o de la informaci&oacute;n que queremos mostrar y la forma de integrarlo. Eso es agradable, y siendo par&aacute;metros opcionales, quien no quiere sumergirse en esa complejidad no tiene por qu&eacute; hacerlo.</p>
<p style="text-align: justify;">El uso de iframes y embed tienen sus propios problemas y no se van a ir en mucho tiempo.</p>
<h2>Navegaci&oacute;n</h2>
<p style="text-align: justify;">La navegaci&oacute;n es un problema un poco m&aacute;s grande que la exposici&oacute;n de un &iacute;cono, o mostrar un listado de opciones. Muchos basan la teor&iacute;a de la navegaci&oacute;n en una analog&iacute;a con el &iacute;ndice de un libro, pero en un sitio, o en una aplicaci&oacute;n, la informaci&oacute;n no se distribuye de forma lineal, e incluso jer&aacute;rquica desaf&iacute;a algunas aplicaciones. Es un tema dif&iacute;cil de tratar, pero creo que una vez que pueda indicarse una forma correcta de representar la informaci&oacute;n, la representaci&oacute;n de como deber&iacute;a verse la navegaci&oacute;n es un problema secundario que se resolver&aacute; solo.</p>
<p style="text-align: justify;">Otro problema que creo que est&aacute; mal encarado es la posici&oacute;n del acceso a la navegaci&oacute;n. Es verdad que ser&iacute;a&nbsp;<em>interesante</em> que la navegaci&oacute;n se encuentre disponible en poco esfuerzo, pero creo que estamos desviando nuestro objetivo. Si podemos evitar que el usuario deba navegar, entonces estamos solucionando el problema base: darle al usuario la informaci&oacute;n que necesita cuando la necesita. El usuario navegando es una forma de decir "estoy buscando algo que no est&aacute; aqu&iacute;", y ese es el problema que debemos resolver. Por supuesto, la navegaci&oacute;n no es algo que deber&iacute;a desaparecer (&iexcl;no podr&iacute;a!) pero debemos minimizar que eso ocurra lo m&aacute;s posible, si es que le damos al usuario lo que necesita cuando lo necesita.</p>
<h2>Meta-contenido</h2>
<p style="text-align: justify;">Un tema muy curioso fue mencionado en ese art&iacute;culo tambi&eacute;n: meta-contenido. Plantea que el contenido debe estar dise&ntilde;ado para ser mostrar en cualquier tipo de dispositivo, y que no debemos depender de la forma en la que se ve sino m&aacute;s en la forma en la que se muestra la informaci&oacute;n. Suena contradictorio, pero creo que hubo un par de ideas detr&aacute;s de eso que no fueron expl&iacute;citamente mencionadas.</p>
<p style="text-align: justify;">Por ejemplo, &iquest;qu&eacute; tal si todo el contenido de la web fuera markup y fuera cada dispositivo el que le diera una representaci&oacute;n apropiada para ese dispositivo? Imaginemos que ya no escribi&eacute;ramos m&aacute;s CSS ni m&aacute;s informaci&oacute;n de posisionamiento, sino puro HTML o XML que indica qu&eacute; cosas son parte de lo que estamos queriendo exponer y c&oacute;mo se relaciona esa informaci&oacute;n. "Esto es un men&uacute;, esto es un art&iacute;culo, esto es navegaci&oacute;n, esto es cabecera, esto es una imagen." Cada dispositivo se encargar&iacute;a de mostrarlo de la forma m&aacute;s apropiada.</p>
<p style="text-align: justify;">Si suena muy loca esa idea, miren a los readers o a los agregadores de contenido: Instapaper, Feedly, y cualquier otro lector RSS de alguna forma ya atacaron ese problema. Ellos quitan todo contenido irrelevante bas&aacute;ndose en el markup y mostr&aacute;ndolo de la forma m&aacute;s apropiada. Me encanta la forma en la que Instapaper lo hace, pero por supuesto, no est&aacute; libre de fallos, porque los contenidos originales no fueron pensados para eso.</p>
<p style="text-align: justify;">Divagando m&aacute;s sobre esa idea me pregunto si podremos clasificar todo tipo de informaci&oacute;n a exponer en una cantidad finita de categor&iacute;as que puedan estandarizarse e implementarse. Por supuesto, te&oacute;ricamente es posible: la cantidad de informaci&oacute;n disponible es finita, as&iacute; que indefectiblemente las categor&iacute;as para esa informaci&oacute;n deben tener una cantidad finita, pero si pensamos en un mundo un poco m&aacute;s realista, hablar por encima de los pocos cientos se hace un poco infactible. &iquest;Qui&eacute;n recordar&aacute; todos esos tags, clases, microformatos, o instrucciones especiales? &iquest;Qui&eacute;n estar&aacute; seguro de que todos los dispositivos interpreten esas categor&iacute;as de la forma correcta y que las desviaciones no se propaguen para caer en caos entre lo que los desarrolladores hacen y los navegadores entienden?</p>
<h2>Conclusi&oacute;n</h2>
<p style="text-align: justify;">Me encantar&iacute;a saber qu&eacute; piensan. Aqu&iacute; hay mucho que discutir y no hice m&aacute;s que exponer mis opiniones sobre los conceptos que muy buen art&iacute;culo mencion&oacute;.</p>
