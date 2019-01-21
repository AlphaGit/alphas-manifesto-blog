---
layout: post
title: Responsive Web vs. Mobile Web
date: '2012-09-05 21:37:12 +0000'
date_gmt: '2012-09-06 02:37:12 +0000'
categories:
- Technology
tags:
- HTML
- web application
- CSS
- HTML5
- desarrollo móvil
- Technology
- design
- CSS3
- aplicación móvil
- mobile
- móvil
- responsive
- media queries
sub_title: ¿Qué son y cuándo usar cada uno?
---

![]({{ site.baseurl }}/assets/pantallas.png)

Ahora que el mundo web se ha acelerado de forma increíble, CSS3 y HTML5 son más y más poderosos cada día. Una de las características que trajo CSS3 son _media queries_, que habilitan un nuevo tipo de sitio llamado _responsive web_.  ¿Qué es esto y cómo nos afecta?

<!--more-->

## HTML5 y CSS3: Nombres complicados para algo simple

**HTML5** (HyperText Markup Language, versión 5) y **CSS3** (Cascading Style Sheets, versión 3) **son lo que hace que la web tenga estructura y se vea de la forma en la que se ve**. En teoría, HTML es el lenguaje que se usa para definir los datos y qué es cada dato, y CSS es el que se usa para darles una presentación o estil. Cuando escuchen hablar de _web semántica_, recuerden esos conceptos. Mientras tanto, pueden leer, relacionado, _cómo explicarle REST a la mujer de uno_.

Si alguna vez vieron algo de código o quisieron aprender a hacer páginas web y vieron cosas como "_Use `<h1>mi título</h1>`_"

para hacer que &laquo;mi título&raquo; sea un título", eso es HTML. Para ser sincero, hay muchas más reglas, y mucha terminología. Se puede usar fácil, pero hay formas correctas de usarlo y formas incorrectas también. **HTML define qué es cada elemento y su contenido.**

**CSS, por otro lado, define la estética particular que cada elemento tendrá.** Una regla CSS como `h1 { font-size: 14px; }` definiría que los elementos `h1` (en nuestro ejemplo, se aplicaría a nuestro título)  se vean con un tamaño de fuente de catorce píxeles. Colores, tamaños, espaciados y alineamientos tienen lugar aquí. Al igual que HTML, la idea es simple pero hay muchas reglas que definen formas correctas y formas incorrectas de utilizarlo.

Es importante tener en mente esta distinción: más adelante hablaremos de por qué responsive web y mobile web siguen esta misma diferencia según su función.

## Media queries y responsive web design

CSS3 introduce algo llamado _media queries_: **la capacidad de aplicar reglas CSS bajo ciertas condiciones**. Estas se basarán en propiedades que consultarán del medio de visualización (de ahí su nombre). Por ejemplo, una regla de este estilo:

<script src="https://gist.github.com/3642063.js?file=mediaqueries.css"></script>

Podría traducirse a nuestro lenguaje como: "_Si esta página se ve en un dispositivo pequeño -- menos de 480 píxeles de ancho -- entonces no mostremos el objeto de menú_".

Esta característica se implementó de una forma muy dinámica: no se aplican solamente al momento en que la web se carga en nuestro browser, sino en todo momento. Esto significa que si cambiáramos el tamaño de nuestro navegador, las reglas condicionales se aplicarían según el nuevo tamaño del mismo. Este concepto de un diseño adaptable al espacio disponible dinámicamente se llama _responsive design_. A las webs diseñadas así se les dice responsive también, y como se ha vuelto popular el concepto, a casi cualquier cosa relacionada.

## Mobile

Hace algunos años, el mercado móvil también está creciendo muchísimo. Ahora [la mayoría de los teléfonos vendidos son smartphones](http://en.wikipedia.org/wiki/Smartphone#Market_share) (si no la totalidad), y poseen la capacidad de navegar en internet. E-book readers y tablets introducen también otras experiencias y un tamaño reducido, también con conectividad a internet. Cuando esto comenzó a ser interesante para, además de mirar contenidos, diseñar aplicaciones inteligentes, las posibilidades explotaron y el mercado se revolucionó.

En ese momento, si los desarrolladores web ya se sentían frustrados con la variedad de navegadores, sistemas operativos, versiones y estándares, al escuchar de esto elevaron un grito de ayuda al cielo. La World Wide Web Consortium (W3C) y varios grandes de la industria (Microsoft, Apple, Google y muchos grupos independientes) atendieron el llamado y propusieron nuevos estándares y un camino para resolver este problema. Si les interesa leer más en detalle sobre eso, pueden leer mi entrada sobre [porqué conviene utilizar HTML5]({{ site.baseUrl }}{% link _posts/2011-11-17-por-que-html5.md %}).

### El mundo mobile, luego de responsive design

La aplicación más interesante para responsive design fue, entonces, el mercado mobile. A diferencia de antes, con pocas reglas un sitio puede diseñarse para que se vea correctamente en navegadores de escritorio, en tablets y en teléfonos. Antes este trabajo requería duplicar el sitio y tener un desarollo mobile separado, o hacer magia con JavaScript, pero esta última opción (por lo general) es descartada ya que puede ser inestable y difícil de mantener.

##  ¿Es Responsive Design entonces la respuesta para sitios mobile?

![]({{ site.baseurl }}/assets/ZorriDepende.png)


**La respuesta es, como muchas cosas: depende.**

Es verdad que el uso de responsive design acorta los tiempos de desarrollo, pero a veces la complejidad de un sitio simplemente no pertenece a un teléfono o un tablet. Si bien estos dispositivos nos permiten hacer casi cualquier cosa, no es el mejor lugar para ver videos ( ¿subtítulos? -- imposible), escribir mails complejos o entradas de blogs, o leer y comparar especificaciones de productos. Hacer zoom no es divertido y distrae. Teclear y equivocarse por el pequeño teclado permite lograr el fin, pero toma demasiado tiempo --  ¿y qué si estás en un tren? Suerte con eso. Las tablets ayudan por su mayor tamaño pero tampoco tienen el mismo poder de procesamiento que una máquina de escritorio: las animaciones pueden verse lentas, la memoria se acaba rápidamente y el navegador se cierra, o el teclado sigue siendo incómodo para teclear -- si es que estamos en una situación en donde siquiera podemos hacerlo.

La respuesta está escondida detrás de lo que conté en el párrafo anterior: **contenido vs. interacción**. De la misma forma que en el mundo del desarrollo, contenido vs. presentación deben manejarse de forma separada, también debe aplicarse esa distinción a más alto nivel.

### Centrado en el contenido

Considerando que el contenido es lo más importante en nuestro caso, rediseñar para un dispositivo móvil sólo debe dejarse ver distinto, pero debe tener el contenido de todos modos. Por ejemplo, es el caso de un blog mostrado para visitantes, o una página de compras, o el sitio de nuestra empresa. Aquí responsive design es un método apropiado: permite no duplicar el contenido y dar una versión lista para dispositivos pequeños. Si necesitamos algo de interacción, siempre debe ser centrada en el contenido y lo suficientemente simple como para poder hacerse con un teléfono: botones grandes, pocos campos de entrada y pocos pasos. En general, **la respuesta aquí será responsive design como mejor opción**.

### Centrado en la interacción

Para sitios más complejos, que a veces podemos denominar aplicaciones, responsive web design no es buena opción. Esto es porque ocultar contenido o cambiar su presentación no oculta la complejidad de la interacción con el mismo. Una aplicación por lo general tiene ciertos requerimientos del navegador que accede (por ejemplo, poder mostrar gráficos de forma dinámica, o actualizarse en tiempo real). También puede requerir procesos complejos por parte del usuario: entrada de datos, correlación y varias pantallas de datos para tomar una decisión. Tales situaciones, nuevamente, no pertenecen a un dispositivo móvil, y el trabajo requerido para convertir esto en algo aceptable va más allá de simple estilizado. Una solución con CSS significaría además cargar cantidades enormes de información para ocultar parte de ella, cuando la conexión de este dispositivo puede no ser muy buena.

**En estos casos se recomienda trabajar con un sitio mobile independiente.** Un sitio mobile así puede aislar ciertas funcionalidades que son apropiadas para estos casos. Por ejemplo, una sección de status, aprobaciones simples (sí / no / más tarde), alertas o información útil on-the-go. Tener una aplicación independiente para mobile también permite otras cosas, como geolocalización, utilización del acelerómetro, y tantas otras características que los dispositivos móviles tienen y un browser de desktop no.

## Conclusión

Como siempre se recomienda, hay que tener sentido común al momento de elegir. Cuando se planifica el objetivo de cada aplicación sabiendo en qué situación se usará, se pueden preveer este tipo de cosas y tomar decisiones correctas. Las nuevas tecnologías son apasionantes pero asegúrese de utilizarlas cuando son apropiadas. Considerar responsive design cuando el centro de la experiencia es el contenido, y mobile web cuando es la interacción del usuario.
