---
layout: post
title: " ¿Es el desarrollo de software un arte?"
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
sub_title: ¿O acaso no lo es?
---

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
