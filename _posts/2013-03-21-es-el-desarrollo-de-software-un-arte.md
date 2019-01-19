---
layout: post
status: publish
published: true
title: " ¿Es el desarrollo de software un arte?"
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 4706
wordpress_url: http://blog.alphasmanifesto.com/?p=4706
date: '2013-03-21 13:56:03 +0000'
date_gmt: '2013-03-21 18:56:03 +0000'
categories:
- Miscelaneous
tags:
- desarrollo
- art
- análisis
- procesos
- disciplina
- estructuras
comments:
- id: 27668
  author: Sebastian
  author_email: naiosoft@hotmail.com
  author_url: ''
  date: '2016-01-28 13:04:20 +0000'
  date_gmt: '2016-01-28 19:04:20 +0000'
  content: 'lamentablemente no concluyo igual que vos. Luego de leer y reflexionar
    sobre el tema mi conclusion es la siguiente: Podria considerarse un arte el proceso
    de crear algoritmos que solucionen problemas, que la gente comun no lo comprenda
    es otro cantar. Si a 100 programadores les pedis que programen una determinada
    aplicacion, posiblemente todas vayan a ser diferentes y no iguales. Por lo que
    hay muchas tecnicas, pero cada programador apllica el arte de combinar esas tecnicas
    y alcanzar el resultado. Cuando un pintor pinta un cuadro TAMBIEN usa tecnicas
    que estan preescritas por pintores anteriores, por lo que se valen de la tecnica.
    Pero posiblemente las pinturas sean todas diferentes ante un mismo pedido. Lo
    que si esta muy claro, que todo desarrollo tiene una parte interactiva con el
    usuario. A esto se lo denomina "presentacion" o "interfaz grafica". Esto indefectiblemente
    tiene arte 100%, se eligen colores, tamaños, imagenes, se hace una maquetacion.
    Esto podriamos llamarle etapa de diseño, hoy por hoy muchos diseños
    los hace el programador y otros muchos los "diseñadores". Estos en terminos
    ingleses es conocido como back-end y front-end. El front-end seria el arte que
    todo el mundo puede comprender, el back-end es un arte mas castico, solo los programadores
    pueden apreciar la belleza de la arquitectura, como lo penso, como lo desarrollo,
    y esa belleza es influida 100% por su forma de ser a la hora de programar.'
- id: 27674
  author: Alpha
  author_email: alphagma@gmail.com
  author_url: http://www.alphasmanifesto.com/
  date: '2016-01-28 13:35:25 +0000'
  date_gmt: '2016-01-28 19:35:25 +0000'
  content: |-
    ¡Hola Sebastián! Gracias por tu respuesta. Como bien dijiste, parece que tenemos puntos de vista separado, y si no te molesta, me gustaría seguir la conversación. Responderé a tu exposición en partes:

    > Podria considerarse un arte el proceso de crear algoritmos que solucionen problemas, que la gente comun no lo comprenda es otro cantar.

    No estoy de acuerdo. Sobre el hecho de crear algoritmos y si eso es arte o no, responderé más adelante. Sobre que la gente no lo comprenda, estoy de acuerdo con que no es un requerimiento: hay mucho arte que es difícil descifrar para la gente. (Y de hecho, entramos en un área muy interesante: si el mensaje no fue apropiadamente transmitido -- es arte? Pensemos en ejemplos como arte moderno, abstracto o conceptual.) Sea cual sea el caso, creo que no es relevante para nuestra discusión.

    > Si a 100 programadores les pedis que programen una determinada aplicacion, posiblemente todas vayan a ser diferentes y no iguales. (...)

    Estoy de acuerdo, pero ni esto ni el ejemplo con los pintores alude a una cualidad que lo determine como artístico. Alude a que no es un proceso determinista, y que varias soluciones distintas cumplen con el objetivo. De la misma forma puede serlo, por ejemplo, un email, que debe transmitir un mensaje y se pueden usar distintas palabras.  ¿Es arte el mensaje que me mandó mi jefe para pedirme una tarea? Probablemente no.  ¿Es posible que algún email en particular se convierta en arte? Posiblemente sí, pero porque tiene una cualidad que lo quita de ese contexto y lo coloca en otro. (Como otro ejemplo, existe un artista que sólo tomó screenshots de Instagram y los colocó en museos y los vendió.)

    > Lo que si esta muy claro, que todo desarrollo tiene una parte interactiva con el usuario. A esto se lo denomina &ldquo;presentacion&rdquo; o &ldquo;interfaz grafica&rdquo;. Esto indefectiblemente tiene arte 100% (...)

    Estoy fuertemente en desacuerdo en este punto. No todo el arte es diseño y no todo el diseño es arte.

    Sin embargo, creo captar algo más profundo en el corazón de tu respuesta: existe un componente de estética y de placer de consumisión que por lo general es asociado con el arte. Pero el objetivo del arte no es ser estético (nuevamente, abstracto, conceptual) y a veces incluso hace buen uso de elementos grotescos para transmitir su mensaje. A veces la estética no es para nada un elemento del arte (arte de crítica social, Banksy como primer ejemplo que me viene a la mente), y a veces lo es todo.

    De otra forma, el diseño compromete elementos de estética por usabilidad, y (por lo general) busca un buen balance estético que apela a la emoción del usuario, bajo los mismos conceptos que la estética (cuando el arte lo contiene) apela a la emoción del consumidor.

    Entiendo por qué se podrían ver muy relacionados, pero sigo pensando que son cosas distintas. Los urinales y su diseño nunca fue arte hasta que Duchamp lo quitó de contexto y no era el diseño el que era arte: era el objeto fuera de contexto y el mensaje que eso implicaba. De la misma forma, sigo pensando que un diseño de software no es arte.  ¿A menos que se haga por otros fines? (Programas en Piet?)

    Repito que concuerdo con que diseño (gráfico o de software) y arte suelen entrelazarse con aspectos de estética, pero no creo que los ate el uno a otro.

    ¡Saludos!
---

¿O acaso no lo es?


Hoy me venía este pensamiento a la mente:  ¿es el desarrollo de software un arte? Sé que muchos estarían de acuerdo en decir que sí, pero quiero plantear la pregunta con un rigor científico, algo que la frase que comúnmente usamos no contiene.

Por lo general hablamos de una disciplina siendo un arte cuando tiene cierta belleza en sí (apreciada o inapreciada) y cuando requiere de mucha habilidad para hacerlo bien. Sin embargo, para que algo sea considerado _arte_ realmente, hay otros requisitos. No soy un experto en el tema, pero quería intentar darle una mirada a esta pregunta y ver a dónde me lleva.

<!--more-->

## El desarrollo de software

Esta disciplina es, como mínimo, _rara_. Alguien alguna vez la describió como "construir castillos en el cielo". La disciplina de generar estructuras y procesos desde la absoluta nada. Tanta flexibilidad, tanta libertad puede fácilmente caer en el caos, y esto es algo que ha sido muy fácilmente observado por los desarrolladores de varias décadas en el pasado. Como el desorden genera complejidad innecesaria, y esa complejidad se observa como flujos sin dirección clara, el término de [Spaghetti Code](http://en.wikipedia.org/wiki/Spaghetti_code) fue acuñado tiempo atrás, incluso llevando consigo varios otros términos del mundo de la pasta.

Sin embargo, estructuras, métodos y paradigmas surgieron. Formas de hacer las cosas que nos aseguran que diferentes partes tengan significados diferentes, y partes similares estén juntas. Métodos que nos aseguran separar distintos conceptos en distintas entidades (como lógica de cálculo vs. almacenamiento de datos). Métodos que nos aseguran que cada cambio agregará o cambiará algo sin afectar a nada más. Métodos que nos permiten medir la velocidad de trabajo o el avance. Métodos que se pueden reusar una y otra vez para resolver problemas similares.

Y la complejidad de estos métodos creció tanto que comenzaron a hablarse de patrones de arquitecturas, una palabra que denota una actividad compleja y difícil: construir objetos complejos desde partes simples, que requiere a alguien con más habilidad que un trabajador normal. (Del griego: _arkhi_: jefe, _tekton_: construir.) Las arquitecturas a su vez se acoplan, se mezclan y se redefinen cada vez que el mercado hace disponible una nueva tecnología por hardware más barato y software más potente. Los sabios de la disciplina hablan de simplificar. [YAGNI](http://en.wikipedia.org/wiki/You_aren't_gonna_need_it) (_You Ain't Gonna Need It_ -- no lo vas a necesitar) para evitar complejidad injustificada, [KISS](http://en.wikipedia.org/wiki/KISS_principle) (_Keep It Simple Stupid_ -- mantenlo simple y estúpido), para concientemente abocar por la simplicidad.

Está claro que la disciplina es compleja, y que existen no sólo reglas de cómo hacer las cosas bien o "mejor de lo común", sino que además existe una amplia gama de posibilidades en cuanto a complejidad. En mi desarrollo personal he encontrado que hay distintos tipos de persona que disfrutan de distintos niveles de complejidad para una misma solución. La complejidad no es inherentemente mala, sino que es un precio a pagar por mayor flexibilidad o robustez. Todos ellos tienen una idea distinta de lo que un software _bello_ es, y esa belleza no se encuentra en el producto, sino en la estructura interior y el proceso.

## El arte

El arte no carece de reglas u opiniones, y, a pesar de la opinión popular, no cualquier cosa es arte. También existen reglas básicas que definen qué es y qué no lo es. He aquí algunas cuantas, pero no son todas. Cabe aclarar que aún así, <a title="Disputas de clasificación de arte [Wikipedia]" href="http://en.wikipedia.org/wiki/Art#Classification_disputes">existen muchas disputas sobre esto</a>, pero muy básicamente, algunas cosas pueden decirse.

**1. El propósito de la obra debe ser la evocación de un sentimiento.** Todo arte se hace con el objetivo de alimentar el sentimiento. (Del artista o de la audiencia.) Como todo ser humano posee en cierta medida la necesidad de experimentar sentimientos, la necesidad también puede convertirse en negocio. Nadie discutiría que el cine y la música son artes, incluso aunque sean un negocio millonario. Incluso aunque se hagan con objetivo de vender, puede cumplir el propósito de evocar sentimientos.

**1. a.** Como extensión de lo anterior, **la obra no debe ser utilizada como herramienta.** Es por esto que el arte se exhibe para ser experimentado y no se usa como medio para algo más. Esto define una línea muy fina entre el arte y el diseño (que también juega con el concepto de belleza y experiencias de uso). Un martillo no es arte. Un martillo bonito no es arte. Un martillo colgado en el centro en una habitación vacía para causar confusión podría ser arte. Un martillo destruyendo una obra clásica para señalar lo etéreo de todo lo material es arte.

**2. La obra debe transmitir un mensaje.** Muchas corrientes artísticas quieren desafiar este concepto, pero ese desafío ya es un mensaje en sí. Cada obra tiene algo que decir, algo que quiere expresar. Las distintas corrientes artísticas se enfocan en distintos mensajes, en distintas formas de hacer llegar ese mensaje o en distintas formas de apreciar el mismo concepto. El arte abstracto es, muy a mi pesar, arte que habla de la belleza sin necesidad de formas. El arte conceptual busca el mensaje profundo en el mundo ordinario. El expresionismo utiliza el color como herramienta principal para enviar un mensaje. El romanticismo utiliza nuestra posición en un universo vasto para transmitir el mensaje.

**2. a.** Como consecuencia, **el mensaje debe poder ser transmitido.** Cuando el mensaje no encuentra su camino y no provoca el sentimiento que debe provocar, falló en su propósito. Esto se pone interesante cuando el propósito de la obra en sí es producir confusión. Pero si el mensaje en general no se entiende, no se considera una forma de arte. Considérenlo de esta forma:  ¿era la literatura un arte cuando sólo los monjes sabían leer y escribir? Probablemente no.  ¿Era un arte la cinematografía cuando las primeras películas fueran inventadas por los hermanos Lumi&egrave;re? Sí, porque cualquiera que viera la obra la comprendería y obtendría su mensaje.

## Desarrollo y arte

Teniendo esas ideas en mente, volvamos a analizar el desarrollo de software.

**1.  ¿Es su propósito evocar un sentimiento? Por lo general, no.** (El software no cuenta: es un producto del desarrollo, no desarrollo en sí.) Sin embargo, estos últimos tiempos han mostrado más y más casos en donde se desarrolla por el placer de desarrollar. A la vez, muchas técnicas han permitido exaltar el valor interesante del desarrollo más allá de su producto, y de la forma en la que sus partes interactúan. Estos procesos y estos objetivos se alinean con el objetivo original del desarrollo -- obtener un producto -- pero no tiene el mismo objetivo.

Por otro lado, dado que ya entre muchas comunidades no se entregan sólo productos sino código, y muchas veces, no el código en sí, sino la creatividad detrás del código. (Y tengo [un ejemplo favorito](http://codegolf.stackexchange.com/q/3245/2415).) En ellas muchas veces se transmite lo bueno o lo malo de las estructuras, lo bello de la sincronización, lo bizarro de las decisiones mal tomadas. A veces, el propósito es el mensaje.

Consideremos esto como un punto semi-aceptable.

**1. a.  ¿Es utilizado como herramienta? Sí, lo es.** En más del 90% de los casos, el desarrollo de software es la herramienta que nos dará el producto que estamos buscando. En esa minoría, existen casos en donde el propósito es el desarrollo en sí y la experiencia que este brinda. Creo que fácilmente podremos estar todos de acuerdo con esto. Las estructuras y los diseños buscan hacer este proceso más simple, y buscan brindar un sentido de significancia al proceso y a las entidades internas del software. La elegencia y la belleza de un buen diseño hablan por sí mismas, pero no tuvieron propósito de estar ahí.

**2.  ¿Transmite un mensaje?** Sí, pero es un mensaje puramente funcional en lugar de emocional. Casos excepcionales existen. Las estructuras correctamente usadas generan el sentimiento de orden y tranquilidad, mientras que el spaghetti code y un código mal escrito genera incomodidad interna. Pero el mensaje no va más allá de su propia función o propósito. Creo que en este caso deberemos responder que **no**.

**2. a.  ¿Puede ser efectivamente transmitido su mensaje? No.** De la misma forma que ocurría con la literatura cuando nadie podía leer, es el caso que sufre el desarrollo de software al ser una disciplina muy específica. Sólo aquellos que estén entrenados y educados de la manera suficiente podrán apreciar la belleza o la aspereza de las buenas soluciones.

## Conclusión

Me sorprendo a mí mismo ahora. Comencé a escribir este post imaginando argumentar que el desarrollo de software es un arte y dar buenas razones al respecto, y me contradije a mí mismo llegando a la respuesta opuesta. Aparentemente, **no podremos declarar que el desarrollo de software sea un arte**.

Sin embargo, para todos aquellos que me leen en este momento, comparto con ustedes la decepción de la conclusión: sé de las bellezas ocultas que esconde un buen software. Sé de la creatividad e ingeniosidad, la inspiración que transmiten soluciones simples y elegantes ante problemas complejos. Sé de la habilidad, casi intuitiva, que es necesaria para encontrar esas soluciones y esas oportunidades. Incluso ese hijo del desarrollo de software, la seguridad, es una disciplina con tanta variedad e intuición que parecería obvio que podríamos declararla arte. Sé que existen obras maestras en el mundo del software, y que existen bolas de barro que alguien tipeó en una noche de borrachera.

Por último, y como consolación, esto no quiere decir que no podamos <a title="Arte generativo [Wikipedia]" href="http://en.wikipedia.org/wiki/Generative_art">utilizar el software como medio para generar arte</a>.
