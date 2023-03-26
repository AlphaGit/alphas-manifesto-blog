---

title: Comentarios sobre The State of Responsive Web Design
date: '2013-06-02 16:32:34 +0000'
date_gmt: '2013-06-02 21:32:34 +0000'
categories:
- Technology
tags:
- JavaScript
- HTML
- CSS
- Imágenes
- problema
- usabilidad
- design
- navegadores
- best practices
- artículo
- responsive
- opinión
- solución
- píxel
subtitle: Opiniones propias sobre muchos problemas mencionados
---

Acabo de terminar de leer un artículo largo y genial de Smashing Magazine, llamado [The State of Responsive Web Design](http://mobile.smashingmagazine.com/2013/05/29/the-state-of-responsive-web-design/). Como el título lo indica, habla sobre el estado actual del diseño de webs responsive y sus pros y contras. Mucho mejor aún, habla de los distintos problemas a superar y la forma en la que la tecnología de hoy nos permite hacerlo. Pero no es una introducción al tema, sino que abarca todos esos problemas que aún no tienen soluciones definitivas. Totalmente novedoso.

Sin embargo, como bien dicen al final, esto no es ni el comienzo, y sobre las cosas mencionadas tengo mucho que mencionar. Quería dejar mis comentarios por aquí.

<!--more-->

Por supuesto, si no leíste el artículo original puede que no entiendas completamente lo que escribo aquí. Te recomiendo leer el artículo y luego leer este. Te recomiendo leer el artículo también, aunque no leas este. Te recomiendo leerlo antes, pero como mejor prefieras. Ambos a la vez, un ojo en cada artículo, no sé, como quieras.

## Imágenes

### Pixel ratio

El problema con las imágenes es el tamaño que se le da a cada una, teniendo en cuenta el tamaño de la pantalla, el tamaño de la imagen, el pixel ratio del dispositivo, y cómo hacer lo mejor para cada situación.

Tener que lidiar con el pixel ratio me molesta un poco, porque creo que estamos atacando al problema de forma incorrecta. Las pantallas con un mayor pixel ratio inventaron algo que tiene una resolución mayor a la capacidad de posicionamiento que utilizamos, que antes eran uno a uno. Si tu pantalla tenía 800 píxeles de ancho, nosotros teníamos 800 píxeles para poner cosas y no había nada entre píxel y pixel. En lugar de inventar una pantalla de más cantidad de píxeles con menor tamaño físico, inventaron una pantalla con igual cantidad de píxeles pero más resolución.

Fue una buena idea, porque así resolvieron el tener que hacer a todos sus usuarios ver webs diminutas que no estaban preparadas para esto. El problema que nos generaron a los programadores web es separar el concepto de posicionamiento/dimensionamiento y resolución. La forma en la que la quieren resolver es cambiando la dimensión de las imágenes que se ven pero posicionándolas igual para que el dispositivo las muestre con mayor resolución. Dos errores no hacen una correcta, creo que esto es una mala idea.

¿Por qué? Más allá de las complicaciones y dolores de cabeza, estamos acomodando nuestra forma de resolver el problema a la tecnología y no la tecnología al problema a resolver. Esencialmente, debemos diseñar sistemas distintos de resolución y de posicionamiento. Esto debe de haberse resuelto hace tiempo, con la resolución sub-píxel que muchos sistemas ofrecen.

Esencialmente, este problema se resuelve si decimos "para pantallas de alta calidad, las imágenes deben ser de 600 dpi, y para pantallas normales, 300 dpi alcanza". Olvídense de los píxeles. Por supuesto, esto no resuelve el problema del bandwidth o de la forma de elegir entre ellas, pero sí plantea el problema desde un punto de vista correcto. Tener que duplicar el tamaño de una imagen y redimensionar para el tamaño original parece un baile ritual, huele totalmente a una solución incorrecta.

Invito a la discusión en este tema.

### Formatos

Respecto de los formatos, está claro que ahora y en el futuro habrá más avances sobre nuevos algoritmos o ideas que nos permitirán comprimir imágenes mejor. Hoy la mejor opción parece ser WebP y ya está soportado en una determinada cantidad de browsers. El artículo menciona que Firefox no tiene intenciones de implementar WebP (¡ ¿por qué?!) pero no pude encontrar referencias al respecto.

Sobre WebP, si están dispuesto a sacrificar un script y un poquito de procesamiento, ya hay un JavaScript que permite decodificar ese formato en cualquier navegador que no lo soporte. Está aún en desarrollo y seguramente con algunos bugs, pero pueden experimentar un poco con él: [WebPJS](http://webpjs.appspot.com/).

## Layout

### Unidades relativas al viewport

Esto lo encuentro un poco relacionado con lo que mencioné antes: unidades de posicionamiento independientes a las unidades de resolución. Sin embargo, en el fondo no importa porque parece que todo se vuelve a calcular a píxeles, así que estamos siempre en el mismo problema. Sin embargo, me parece una idea fantástica, y no sólo abrirá las puertas para hacer diseños mucho más simples que hoy se hacen de forma _quirky_, sino que además permitirá hacer cosas más complejas.

### Tipografía adaptativa

Realmente creo que no entendí el propósito de la propuesta de rem como unidad de medida, o realmente no me parece algo tan grave. Es decir, me parece buena idea poder rehacer las cuentas en base a una unidad original, pero lo único que estamos evitando es la pérdida de precisión. Digamos, decir esto:

<script src="https://gist.github.com/AlphaGit/5694899.js"></script>

Es exactamente lo mismo que esto:

<script src="https://gist.github.com/AlphaGit/5694912.js"></script>

Con la diferencia que tengo que hacer menos cuentas en mi cabeza y tengo más independencia de los elementos. Pero si se supone que los elementos son relevantes respecto de su contenedor -- entonces  ¿no estaré planteando mal mis reglas y la forma en la que se aplican?

## Contenido complejo

### Formularios

Hablando de formularios, mucho de lo que dice el artículo es cierto, pero dejar detalles de implementación a cada browser puede ser un problema con el diseño. El mismo artículo habla mal de los iframes y las APIs de otros sistemas como problemáticas al momento de querer tener un diseño consistente, y hacer un diseño correcto para que Chrome, FireFox y Safari muestren los input type="date" de la forma que más les guste es ciertamente un problema. Por supuesto, no funcionalmente, pero visualmente es un problema.

Y no estoy mencionando el tema de la internacionalización. Bien aclara el artículo que estas implementaciones se encargarían de resolver los problemas de formato y nos aportarían un formato unificado para trabajar con fechas, números y monedas. Aplaudo eso, pero hay que tener mucho en cuenta que si todo el diseño de un sistema está orientado a trabajar en determinado idioma o cultura, el propio idioma del browser del usuario cambiando el comportamiento de esos controles puede verse mal. Por ejemplo, si todo el sitio se encuentra en inglés, para que al momento de elegir una fecha el explorador me deje elegir "2 de Junio", ciertamente no se ve bien.

### Tablas

Las propuestas sobre las tablas me gustaron, pero no me gustaron como opciones en el contexto de un sitio responsive. Estoy de acuerdo con que al momento de ir a una pantalla pequeña, lo esencial de la información debe mostrarse, pero también soy fan del minimalismo, y si podías ocultar información no esencial --  ¿por qué no lo estabas haciendo desde el comienzo?

Por otro lado, re-ordenar el formato de una tabla a filas una tras otra con encabezados puede verse muy elegante para navegar en un teléfono, pero derrota el propósito de la exposición tabular. A veces es muy importante que la información esté realmente dispuesta de esa forma: el usuario debe tener que comparar números o ver patrones. Si tu datos tiene mejor sentido de esta forma que como tabla, quizá lo planteaste mal desde un principio.

Las tablas scrolleables no caen en ninguno de estos problemas que mencioné, pero aparte de lo que menciona el artículo (quizá no haya un scroll visible incialmente para el usuario? -- siento que ese es un problema para que los browsers resuelvan), realmente no se ve bien. De alguna forma es decirle al usuario "tenemos para mostrarte más información de la que tu pantalla soporta". Es una afirmación algo fuerte, más aún en tablas con datos. Imaginen que si una tabla crece vertical y horizontalmente, la cantidad de datos que muestra crece cuadráticamente. No es divertido para mi, mi dedo pulgar y mi teléfono pequeño.

### Contenido externo

Estoy de acuerdo con lo que el artícul original menciona: es difícil lidear con contenido externo. Parte de eso es algo que ya podría atacarse hoy, como mejores APIs para mejor personalización del contenido expuesto. Recuerdo haber usado gráficos desde [Google Charts](https://developers.google.com/chart/), que entre opciones nos permite indicar colores, tamaño y otras cosas que poco tienen que ver con el contenido, pero más con el diseño de la información que queremos mostrar y la forma de integrarlo. Eso es agradable, y siendo parámetros opcionales, quien no quiere sumergirse en esa complejidad no tiene por qué hacerlo.

El uso de iframes y embed tienen sus propios problemas y no se van a ir en mucho tiempo.

## Navegación

La navegación es un problema un poco más grande que la exposición de un ícono, o mostrar un listado de opciones. Muchos basan la teoría de la navegación en una analogía con el índice de un libro, pero en un sitio, o en una aplicación, la información no se distribuye de forma lineal, e incluso jerárquica desafía algunas aplicaciones. Es un tema difícil de tratar, pero creo que una vez que pueda indicarse una forma correcta de representar la información, la representación de como debería verse la navegación es un problema secundario que se resolverá solo.

Otro problema que creo que está mal encarado es la posición del acceso a la navegación. Es verdad que sería _interesante_ que la navegación se encuentre disponible en poco esfuerzo, pero creo que estamos desviando nuestro objetivo. Si podemos evitar que el usuario deba navegar, entonces estamos solucionando el problema base: darle al usuario la información que necesita cuando la necesita. El usuario navegando es una forma de decir "estoy buscando algo que no está aquí", y ese es el problema que debemos resolver. Por supuesto, la navegación no es algo que debería desaparecer (¡no podría!) pero debemos minimizar que eso ocurra lo más posible, si es que le damos al usuario lo que necesita cuando lo necesita.

## Meta-contenido

Un tema muy curioso fue mencionado en ese artículo también: meta-contenido. Plantea que el contenido debe estar diseñado para ser mostrar en cualquier tipo de dispositivo, y que no debemos depender de la forma en la que se ve sino más en la forma en la que se muestra la información. Suena contradictorio, pero creo que hubo un par de ideas detrás de eso que no fueron explícitamente mencionadas.

Por ejemplo,  ¿qué tal si todo el contenido de la web fuera markup y fuera cada dispositivo el que le diera una representación apropiada para ese dispositivo? Imaginemos que ya no escribiéramos más CSS ni más información de posisionamiento, sino puro HTML o XML que indica qué cosas son parte de lo que estamos queriendo exponer y cómo se relaciona esa información. "Esto es un menú, esto es un artículo, esto es navegación, esto es cabecera, esto es una imagen." Cada dispositivo se encargaría de mostrarlo de la forma más apropiada.

Si suena muy loca esa idea, miren a los readers o a los agregadores de contenido: Instapaper, Feedly, y cualquier otro lector RSS de alguna forma ya atacaron ese problema. Ellos quitan todo contenido irrelevante basándose en el markup y mostrándolo de la forma más apropiada. Me encanta la forma en la que Instapaper lo hace, pero por supuesto, no está libre de fallos, porque los contenidos originales no fueron pensados para eso.

Divagando más sobre esa idea me pregunto si podremos clasificar todo tipo de información a exponer en una cantidad finita de categorías que puedan estandarizarse e implementarse. Por supuesto, teóricamente es posible: la cantidad de información disponible es finita, así que indefectiblemente las categorías para esa información deben tener una cantidad finita, pero si pensamos en un mundo un poco más realista, hablar por encima de los pocos cientos se hace un poco infactible.  ¿Quién recordará todos esos tags, clases, microformatos, o instrucciones especiales?  ¿Quién estará seguro de que todos los dispositivos interpreten esas categorías de la forma correcta y que las desviaciones no se propaguen para caer en caos entre lo que los desarrolladores hacen y los navegadores entienden?

## Conclusión

Me encantaría saber qué piensan. Aquí hay mucho que discutir y no hice más que exponer mis opiniones sobre los conceptos que muy buen artículo mencionó.
