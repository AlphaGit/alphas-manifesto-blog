---
layout: post
status: publish
published: true
title: Responsive Web vs. Mobile Web
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 4399
wordpress_url: http://blog.alphasmanifesto.com/?p=4399
date: '2012-09-05 21:37:12 +0000'
date_gmt: '2012-09-06 02:37:12 +0000'
categories:
- Technology
tags:
- HTML
- web application
- CSS
- HTML5
- desarrollo m&oacute;vil
- Technology
- design
- CSS3
- aplicaci&oacute;n m&oacute;vil
- mobile
- m&oacute;vil
- responsive
- media queries
comments:
- id: 9027
  author: Responsive Web Design - Elitist
  author_email: ''
  author_url: http://decodecode.net/elitist/2010/12/responsive-web-design/
  date: '2013-07-07 12:30:25 +0000'
  date_gmt: '2013-07-07 17:30:25 +0000'
  content: "[...] Responsive Web vs. Mobile Web | Alpha&#8217;s Manifesto&nbsp;(en
    Espa&ntilde;ol) [...]"
---

![](/assets/pantallas.png)

<p style="text-align: justify;">Ahora que el mundo web se ha acelerado de forma incre&iacute;ble, CSS3 y HTML5 son m&aacute;s y m&aacute;s poderosos cada d&iacute;a. Una de las caracter&iacute;sticas que trajo CSS3 son <em>media queries</em>, que habilitan un nuevo tipo de sitio llamado <em>responsive web</em>. &iquest;Qu&eacute; es esto y c&oacute;mo nos afecta?</p>
<p style="text-align: justify;"><!--more--></p>
<h2>HTML5 y CSS3: Nombres complicados para algo simple</h2>
<p style="text-align: justify;"><strong>HTML5</strong> (HyperText Markup Language, versi&oacute;n 5) y <strong>CSS3</strong> (Cascading Style Sheets, versi&oacute;n 3) <strong>son lo que hace que la web tenga estructura y se vea de la forma en la que se ve</strong>. En teor&iacute;a, HTML es el lenguaje que se usa para definir los datos y qu&eacute; es cada dato, y CSS es el que se usa para darles una presentaci&oacute;n o estil. Cuando escuchen hablar de <em>web sem&aacute;ntica</em>, recuerden esos conceptos. Mientras tanto, pueden leer, relacionado,&nbsp;<a href="https://blog.alphasmanifesto.com/2008/04/17/link-del-dia-como-explicarle-rest-a-la-mujer-de-uno/">c&oacute;mo explicarle REST a la mujer de uno</a>.</p>
<p style="text-align: justify;">Si alguna vez vieron algo de c&oacute;digo o quisieron aprender a hacer p&aacute;ginas web y vieron cosas como "<em>Use <span style="font-family: 'courier new', courier;"><br />
<h1>mi t&iacute;tulo</h1>
<p></span> para hacer que &laquo;mi t&iacute;tulo&raquo; sea un t&iacute;tulo</em>", eso es HTML. Para ser sincero, hay muchas m&aacute;s reglas, y mucha terminolog&iacute;a. Se puede usar f&aacute;cil, pero hay formas correctas de usarlo y formas incorrectas tambi&eacute;n. <strong>HTML define qu&eacute; es cada elemento y su contenido.</strong></p>
<p style="text-align: justify;"><strong>CSS, por otro lado, define la est&eacute;tica particular que cada elemento tendr&aacute;.</strong> Una regla CSS como <span style="font-family: 'courier new', courier;">h1 { font-size: 14px; }</span> definir&iacute;a que los elementos <span style="font-family: 'courier new', courier;">h1</span> (en nuestro ejemplo, se aplicar&iacute;a a nuestro t&iacute;tulo) &nbsp;se vean con un tama&ntilde;o de fuente de catorce p&iacute;xeles. Colores, tama&ntilde;os, espaciados y alineamientos tienen lugar aqu&iacute;. Al igual que HTML, la idea es simple pero hay muchas reglas que definen formas correctas y formas incorrectas de utilizarlo.</p>
<p style="text-align: justify;">Es importante tener en mente esta distinci&oacute;n: m&aacute;s adelante hablaremos de por qu&eacute; responsive web y mobile web siguen esta misma diferencia seg&uacute;n su funci&oacute;n.</p>
<h2>Media queries y responsive web design</h2>
<p style="text-align: justify;">CSS3 introduce algo llamado <em>media queries</em>: <strong>la capacidad de aplicar reglas CSS bajo ciertas condiciones</strong>. Estas se basar&aacute;n en propiedades que consultar&aacute;n del medio de visualizaci&oacute;n (de ah&iacute; su nombre). Por ejemplo, una regla de este estilo:</p>
<p><script src="https://gist.github.com/3642063.js?file=mediaqueries.css"></script></p>
<p style="text-align: justify;">Podr&iacute;a traducirse a nuestro lenguaje como: "<em>Si esta p&aacute;gina se ve en un dispositivo peque&ntilde;o -- menos de 480 p&iacute;xeles de ancho -- entonces no mostremos el objeto de men&uacute;</em>".</p>
<p style="text-align: justify;">Esta caracter&iacute;stica se implement&oacute; de una forma muy din&aacute;mica: no se aplican solamente al momento en que la web se carga en nuestro browser, sino en todo momento. Esto significa que si cambi&aacute;ramos el tama&ntilde;o de nuestro navegador, las reglas condicionales se aplicar&iacute;an seg&uacute;n el nuevo tama&ntilde;o del mismo. Este concepto de un dise&ntilde;o adaptable al espacio disponible din&aacute;micamente se llama <em>responsive design</em>. A las webs dise&ntilde;adas as&iacute; se les dice responsive tambi&eacute;n, y como se ha vuelto popular el concepto, a casi cualquier cosa relacionada.</p>
<h2 style="text-align: justify;">Mobile</h2>
<p style="text-align: justify;">Hace algunos a&ntilde;os, el mercado m&oacute;vil tambi&eacute;n est&aacute; creciendo much&iacute;simo. Ahora <a href="http://en.wikipedia.org/wiki/Smartphone#Market_share">la mayor&iacute;a de los tel&eacute;fonos vendidos son smartphones</a>&nbsp;(si no la totalidad), y poseen la capacidad de navegar en internet. E-book readers y tablets introducen tambi&eacute;n otras experiencias y un tama&ntilde;o reducido, tambi&eacute;n con conectividad a internet. Cuando esto comenz&oacute; a ser interesante para, adem&aacute;s de mirar contenidos, dise&ntilde;ar aplicaciones inteligentes, las posibilidades explotaron y el mercado se revolucion&oacute;.</p>
<p style="text-align: justify;">En ese momento, si los desarrolladores web ya se sent&iacute;an frustrados con la variedad de navegadores, sistemas operativos, versiones y est&aacute;ndares, al escuchar de esto elevaron un grito de ayuda al cielo. La World Wide Web Consortium (W3C) y varios grandes de la industria (Microsoft, Apple, Google y muchos grupos independientes) atendieron el llamado y propusieron nuevos est&aacute;ndares y un camino para resolver este problema. Si les interesa leer m&aacute;s en detalle sobre eso, pueden leer mi entrada sobre <a href="https://blog.alphasmanifesto.com/2011/11/17/%C2%BFpor-que-html5/">porqu&eacute; conviene utilizar HTML5</a>.</p>
<h3 style="text-align: justify;">El mundo mobile, luego de responsive design</h3>
<p style="text-align: justify;">La aplicaci&oacute;n m&aacute;s interesante para responsive design fue, entonces, el mercado mobile. A diferencia de antes, con pocas reglas un sitio puede dise&ntilde;arse para que se vea correctamente en navegadores de escritorio, en tablets y en tel&eacute;fonos. Antes este trabajo requer&iacute;a duplicar el sitio y tener un desarollo mobile separado, o hacer magia con JavaScript, pero esta &uacute;ltima opci&oacute;n (por lo general) es descartada ya que puede ser inestable y dif&iacute;cil de mantener.</p>
<h2 style="text-align: justify;">&iquest;Es Responsive Design entonces la respuesta para sitios mobile?</h2>

![](/assets/ZorriDepende.png)

<p style="text-align: justify;"><strong>La respuesta es, como muchas cosas: depende.</strong></p>
<p style="text-align: justify;">Es verdad que el uso de responsive design acorta los tiempos de desarrollo, pero a veces la complejidad de un sitio simplemente no pertenece a un tel&eacute;fono o un tablet. Si bien estos dispositivos nos permiten hacer casi cualquier cosa, no es el mejor lugar para ver videos (&iquest;subt&iacute;tulos? -- imposible), escribir mails complejos o entradas de blogs, o leer y comparar especificaciones de productos. Hacer zoom no es divertido y distrae. Teclear y equivocarse por el peque&ntilde;o teclado permite lograr el fin, pero toma demasiado tiempo -- &iquest;y qu&eacute; si est&aacute;s en un tren? Suerte con eso. Las tablets ayudan por su mayor tama&ntilde;o pero tampoco tienen el mismo poder de procesamiento que una m&aacute;quina de escritorio: las animaciones pueden verse lentas, la memoria se acaba r&aacute;pidamente y el navegador se cierra, o el teclado sigue siendo inc&oacute;modo para teclear -- si es que estamos en una situaci&oacute;n en donde siquiera podemos hacerlo.</p>
<p style="text-align: justify;">La respuesta est&aacute; escondida detr&aacute;s de lo que cont&eacute; en el p&aacute;rrafo anterior: <strong>contenido vs. interacci&oacute;n</strong>. De la misma forma que en el mundo del desarrollo, contenido vs. presentaci&oacute;n deben manejarse de forma separada, tambi&eacute;n debe aplicarse esa distinci&oacute;n a m&aacute;s alto nivel.</p>
<h3 style="text-align: justify;">Centrado en el contenido</h3>
<p style="text-align: justify;">Considerando que el contenido es lo m&aacute;s importante en nuestro caso, redise&ntilde;ar para un dispositivo m&oacute;vil s&oacute;lo debe dejarse ver distinto, pero debe tener el contenido de todos modos. Por ejemplo, es el caso de un blog mostrado para visitantes, o una p&aacute;gina de compras, o el sitio de nuestra empresa. Aqu&iacute; responsive design es un m&eacute;todo apropiado: permite no duplicar el contenido y dar una versi&oacute;n lista para dispositivos peque&ntilde;os. Si necesitamos algo de interacci&oacute;n, siempre debe ser centrada en el contenido y lo suficientemente simple como para poder hacerse con un tel&eacute;fono: botones grandes, pocos campos de entrada y pocos pasos. En general, <strong>la respuesta aqu&iacute; ser&aacute; responsive design como mejor opci&oacute;n</strong>.</p>
<h3 style="text-align: justify;">Centrado en la interacci&oacute;n</h3>
<p style="text-align: justify;">Para sitios m&aacute;s complejos, que a veces podemos denominar aplicaciones, responsive web design no es buena opci&oacute;n. Esto es porque ocultar contenido o cambiar su presentaci&oacute;n no oculta la complejidad de la interacci&oacute;n con el mismo. Una aplicaci&oacute;n por lo general tiene ciertos requerimientos del navegador que accede (por ejemplo, poder mostrar gr&aacute;ficos de forma din&aacute;mica, o actualizarse en tiempo real). Tambi&eacute;n puede requerir procesos complejos por parte del usuario: entrada de datos, correlaci&oacute;n y varias pantallas de datos para tomar una decisi&oacute;n. Tales situaciones, nuevamente, no pertenecen a un dispositivo m&oacute;vil, y el trabajo requerido para convertir esto en algo aceptable va m&aacute;s all&aacute; de simple estilizado. Una soluci&oacute;n con CSS significar&iacute;a adem&aacute;s cargar cantidades enormes de informaci&oacute;n para ocultar parte de ella, cuando la conexi&oacute;n de este dispositivo puede no ser muy buena.</p>
<p style="text-align: justify;"><strong>En estos casos se recomienda trabajar con un sitio mobile independiente.</strong> Un sitio mobile as&iacute; puede aislar ciertas funcionalidades que son apropiadas para estos casos. Por ejemplo, una secci&oacute;n de status, aprobaciones simples (s&iacute; / no / m&aacute;s tarde), alertas o informaci&oacute;n &uacute;til on-the-go. Tener una aplicaci&oacute;n independiente para mobile tambi&eacute;n permite otras cosas, como geolocalizaci&oacute;n, utilizaci&oacute;n del aceler&oacute;metro, y tantas otras caracter&iacute;sticas que los dispositivos m&oacute;viles tienen y un browser de desktop no.</p>
<h2 style="text-align: justify;">Conclusi&oacute;n</h2>
<p style="text-align: justify;">Como siempre se recomienda, hay que tener sentido com&uacute;n al momento de elegir. Cuando se planifica el objetivo de cada aplicaci&oacute;n sabiendo en qu&eacute; situaci&oacute;n se usar&aacute;, se pueden preveer este tipo de cosas y tomar decisiones correctas. Las nuevas tecnolog&iacute;as son apasionantes pero aseg&uacute;rese de utilizarlas cuando son apropiadas. Considerar responsive design cuando el centro de la experiencia es el contenido, y mobile web cuando es la interacci&oacute;n del usuario.</p>
