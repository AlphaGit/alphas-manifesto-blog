---
layout: post
title: Gerenciamiento difuso
date: '2007-05-20 20:40:00 +0000'
date_gmt: '2007-05-20 20:40:00 +0000'
categories:
- Projects
- Technology
tags: []
comments: []
---

Muchas veces nos hemos encontrado con el problema de querer decidir las cosas por simple democracia. El proceso es simple. Se da un problema, se proponen soluciones, cada uno pone su voto por una y solo una solución, y la solución con más votos es la llevada a cabo por el grupo. A pesar de que muchos no estén de acuerdo, es lo que la mayoría quiere y por tanto es lo que mejor se cree en general que se puede hacer.

Como ejemplo ilustrativo, supongamos que los votantes son las personas P<sub>1</sub>, P<sub>2</sub>, P<sub>3</sub>, P<sub>4</sub> y P<sub>5</sub>. Se plantea un problema y se presentan tres soluciones: S<sub>1</sub>, S<sub>2</sub> y S<sub>3</sub>.

Si P<sub>1</sub> pone su voto por S<sub>1</sub>, P<sub>2</sub> y P<sub>3</sub> lo ponen por S<sub>2</sub>, y P<sub>4</sub> y P<sub>5</sub> lo ponen por S<sub>3</sub>, entonces al hacer el recuento de votos nos encontraremos en la siguiente situación:

| Solución | Cantidad de votos |
| :--: | :--: |
| S<sub>1</sub> | 1 |
| S<sub>2</sub> | 2 |
| S<sub>3</sub> | 2 |

En este caso, el problema obvio es que no se puede decidir por una solución inmediatamente, puesto que no hay una definida en donde la mayoría haya decidido. En estos casos, muy comúnmente se apela a una segunda vuelta, en donde las soluciones que de seguro no serán elegidas por la mayoría son descartadas. En nuestro ejemplo, podemos ver que S<sub>1 </sub>no será elegida como la última solución, de modo que quedará descartada. Se volverá a hacer una votación, y el proceso se repetirá varias veces si es necesario, hasta que haya una solución "ganadora".

Podemos suponer que en este caso, al ser descartada la solución S<sub>1</sub>, P<sub>1 </sub>deberá elegir otra de las opciones, a pesar de que no sea su favorita. Este es el caso conocido vulgarmente como la votación por el "menos peor", por lo que elige de las otras soluciones la que más satisface sus necesidades o expectativas.

| Solución | Cantidad de votos |
| :--: | :--: |
| S<sub>2</sub> | 3 |
| S<sub>3</sub> | 2 |

Si en nuestro ejemplo, P<sub>1</sub> se decidió por S<sub>2</sub>, entonces habrá una clara mayoría en las votaciones, y puede definirse a S<sub>2</sub> como la ganadora.

Este sistema de votación, tan básico y directo, es el sistema utilizado en muchas naciones como sistema de elección político. También suele utilizarse en la administración de negocios para la toma de decisiones en un grupo, o incluso suele hacerse así en una reunión entre amigos decidiendo qué comer.

Sin embargo, existe un grave problema en estas situaciones. Supongamos que P<sub>1 </sub>nunca hubiese formado parte del grupo, y que por tanto, S<sub>2 </sub>y S<sub>3</sub> solo hubiesen obtenido 2 votos cada una.  ¿De qué manera se resuelve cuál es la mayoría?

Muchas veces se supone que eso nunca va a ocurrir (como en las elecciones políticas), muchas veces se resuelve por medio del azar (como arrojando una moneda al aire entre amigos), o muchas veces se coloca una ponderación sobre los votos (como en los grupos dirigentes de empresas - si el director de la empresa eligió S<sub>2 </sub>entonces ante la indecisión, se sigue ese camino).

----


Hace poco se me pidió que diseñe un sistema de votación para un grupo reducido (par - pueden haber empates), en donde no puede haber ponderación de votos, y el azar no es un método fiable por los medios que este grupo maneja.

Durante un tiempo lo pensé sin muchas soluciones, pero luego tuve la inspiración de atacar a las constantes del sistema para cambiarlo. Es decir,  ¿cómo surgían las tres alternativas que planteé hasta recién?

La del suponer que eso nunca ocurrirá, en el caso de las elecciones políticas, surge por la improbabilidad del caso. Supongamos que quizás las personas de un país no sólo son de un número par (posibilidad: 50%), sino que es prácticamente imposible que en la votación a dos candidatos, exactamente la mitad elija a uno, y exactamente la mitad elija a otro. Eso es el cambio de una constante: las reglas de votación suponen la posibilidad de que exista este empate ideal... esa posibilidad, esa "constante" (valor que existe por la forma de las reglas) existe. Nosotros la cambiamos, hacemos que no exista simplemente al no tenerla en cuenta por la baja posibilidad del caso.

En el sistema ponderado, como el del grupo dirigente de la empresa, se cambia otra constante. Todos los votos valen iguales, por ejemplo, "1 voto", como unidad de medida. Con otro criterio, los votos de otros (grupo superior, líder de la empresa, accionista o quién fuera) valen más, por ejemplo "1.2 votos". En caso de un empate de "cantidad", estos votos ponderados serán los que hagan desaparecer la posibilidad de empate. Se cambia, en pocas palabras, el valor constante de cada voto.

En el último ejemplo que nombré, el de los amigos, la constante que se cambia es la cantidad de votantes. Al haber un empate, debe crearse una forma en la que un elemento externo introduzca una variación en ese sistema "equilibrado" entre la cantidad de gente que elige una solución y la gente que elige otra. Tanto una moneda, como un dado, como cualquier elemento que esté fuera del control de los involucrados (si es que se va a hacer de una forma "justa"). De esta forma, se cambia la constante de la cantidad de votantes.

En mi caso particular, tuve la idea de cambiar otra constante... aunque son dos en realidad: la cantidad de votos por votante, junto con la ponderación de la votación.

Inspirado en los sistemas difusos, se me ocurrió la posibilidad de que cada votante otorgara una puntuación a cada solución posible.

Supongamos el caso anterior, en donde los votantes son P<sub>1</sub>, P<sub>2</sub>, P<sub>3</sub>, P<sub>4</sub> y P<sub>5</sub>. Las soluciones son S<sub>1</sub>, S<sub>2</sub> y S<sub>3</sub>. A continuación, veremos una posible situación en donde cada votante vota las soluciones con un puntaje del 1 al 10.

| Votante | Solución | Puntaje Otorgado |
| :--: | :--: | :--: |
| P<sub>1</sub> | S<sub>1</sub> | 10
| | S<sub>2</sub> | 7 |
| | S<sub>3</sub> | 2 |
| P<sub>2</sub> | S<sub>1</sub> | 4
| | S<sub>2</sub> | 7
| | S<sub>3</sub> | 2
| P<sub>3</sub> | S<sub>1</sub> | 4
| | S<sub>2</sub> | 9 
| | S<sub>3</sub> | 1
| P<sub>4</sub> | S<sub>1</sub> | 6
| | S<sub>2</sub> | 2
| | S<sub>3</sub> | 10
| P<sub>5</sub> | S<sub>1</sub> | 4
| | S<sub>2</sub> | 4
| | S<sub>3</sub> | 8

En letra _cursiva_ podemos apreciar como, al igual que en el primer ejemplo, P<sub>1 </sub>tiene preferencia por S<sub>1</sub>, P<sub>2 </sub>y P<sub>3 </sub>tienen preferencia por S<sub>2 </sub>y por último, P<sub>4 </sub>y P<sub>5 </sub>tienen preferencia por S<sub>3</sub>. Esto se manifiesta en que esas opciones recibieron más puntajes que las demás. El resto de las opciones recibió también un puntaje, y a la vez la solución elegida tampoco tiene por qué recibir el puntaje máximo (como es el caso de P<sub>5 </sub>decidiéndose por S<sub>3</sub> o P<sub>3 </sub>decidiéndose por S<sub>2</sub>).

En este sistema, la solución elegida sería la que obtuviera mayor puntuación. En este ejemplo:

| | | |
| :-- | :-- | :-- |
| S<sub>1</sub>: | &sum; S<sub>1</sub>(P<sub>i</sub>) = | |
| | = S<sub>1</sub>(P<sub>1</sub>) + S<sub>1</sub>(P<sub>2</sub>) + S<sub>1</sub>(P<sub>3</sub>) + S<sub>1</sub>(P<sub>4</sub>) + S<sub>1</sub>(P<sub>5</sub>) = | |
| | = 10 + 4 + 4 + 6 + 4 = | 28 |
| S<sub>2</sub>: |  &sum; S<sub>2</sub>(P<sub>i</sub>) = | |
| | = S<sub>2</sub>(P<sub>1</sub>) + S<sub>2</sub>(P<sub>2</sub>) + S<sub>2</sub>(P<sub>3</sub>) + S<sub>2</sub>(P<sub>4</sub>) + S<sub>2</sub>(P<sub>5</sub>) = | |
| | = 7 + 7 + 9 + 2 + 4 = | 29 |
| S<sub>3</sub>: | &sum; S<sub>3</sub>(P<sub>i</sub>) = |
| | = S<sub>3</sub>(P<sub>1</sub>) + S<sub>3</sub>(P<sub>2</sub>) + S<sub>3</sub>(P<sub>3</sub>) + S<sub>3</sub>(P<sub>4</sub>) + S<sub>3</sub>(P<sub>5</sub>) = | |
| | = 2 + 2 + 1 + 10 + 8 = | 23 |

Siguiendo el anterior ejemplo, podríamos ver que si P<sub>1 </sub>no está en el grupo para votar, los resultados serían de la siguiente forma:

| | | |
| :-- | :-- | :-- |
| S<sub>1</sub>: | &sum; S<sub>1</sub>(P<sub>i</sub>) = | |
| | = S<sub>1</sub>(P<sub>2</sub>) + S<sub>1</sub>(P<sub>3</sub>) + S<sub>1</sub>(P<sub>4</sub>) + S<sub>1</sub>(P<sub>5</sub>) = | |
| | = 4 + 4 + 6 + 4 = | 18 |
| S<sub>2</sub>: |  &sum; S<sub>2</sub>(P<sub>i</sub>) = | |
| | = S<sub>2</sub>(P<sub>2</sub>) + S<sub>2</sub>(P<sub>3</sub>) + S<sub>2</sub>(P<sub>4</sub>) + S<sub>2</sub>(P<sub>5</sub>) = | |
| | = 7 + 9 + 2 + 4 = | 22 |
| S<sub>3</sub>: | &sum; S<sub>3</sub>(P<sub>i</sub>) = |
| | = S<sub>3</sub>(P<sub>2</sub>) + S<sub>3</sub>(P<sub>3</sub>) + S<sub>3</sub>(P<sub>4</sub>) + S<sub>3</sub>(P<sub>5</sub>) = | |
| | = 2 + 1 + 10 + 8 = | 21 |

---


En el caso hipotético en que las soluciones resultantes tuvieran igual puntuación, se puede implementar la teoría del método _Delphi_. Este método habla de hacer sucesivas rondas. En la primera ronda, cada uno hace una ponderación de las opciones, sin conocer la puntuación que los demás otorgan. Al no ser satisfactoria la solución, se hace una segunda ronda. Obviamente, al haber visto los puntajes de los demás, algunos considerarán que algunas ponderaciones propias no eran del todo correctas y las variarán.

Si luego de la segunda o tercera ronda de hacer estos cambios, aún no se llega a una determinación satisfactoria, cada integrante explica las razones de su propias puntuaciones, detallando los pro y los contra que le llevó a poner un determinado puntaje a una determinada solución. Luego de esto, se hace otra ronda más, en donde cada integrante pone una nueva puntuación a cada una de las soluciones propuestas, pensando en todos los pros y los contras expuestos.

---

Con este sistema, no sólo se hace mucho más difícil el problema que tiene la "democracia par", que es el de los empates y su resolución, sino que además no se descartan soluciones sino que se tienen en cuenta según el grado de aceptación que estas tienen, que es lo más administrativamente correcto para poder llevar un buen manejo de las decisiones tomadas.

_Soy un zorrinito gerencial._
