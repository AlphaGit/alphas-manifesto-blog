---
layout: single
title: " ¿Por qué HTML5?"
date: '2011-11-17 21:30:09 +0000'
date_gmt: '2011-11-18 02:30:09 +0000'
categories:
- Technology
tags:
- HTML
- HTML5
- arquitectura
- Technology
- XML
- buenas prácticas
- estándares
---

Hace no mucho se me presentó en una conversación, en donde me encararon con la siguiente pregunta: "Si el estándar de HTML5 no está aprobado aún, por qué usarlo?". Me abalancé con una respuesta salvaje del estilo "Por qué no?" (aunque con otras palabras) y no dije mucho más.  ¿Por qué alguien querría **no** usarlo? Pasaron 30 segundos desde mi respuesta y me puse del otro lado, pensando en que me estaban hablando de una nueva versión de Windows y ahí creí comprender el punto de vista. Creo que no aplica a HTML5 pero... por qué habría una diferencia?

Fue entonces en donde me puse a dar una respuesta más elaborada, la cual reproduzco a continuación.

---

> HTML5 es algo muy nuevo todavía, y eso tiene sus pros y sus contras.
> 
> El contra que todos obviamente vemos ahora es que puede cambiar hasta terminar de definirse, sumado a que tiene poca adopción y (va a tener) bugs en implementaciones en distintos browsers. Sumenlé problemas de seguridad que sin duda se van a venir, backward compatibility no-tan-suave y más temas.
> 
> Ahora, qué tiene de bueno? No voy a enumerar lo nuevo {en cuanto a capacidades} porque eso lo pueden leer en cualquier lado.
> 
> HTML5 va un poquito más allá de la tecnología que implementa. Se trata de, por un lado, una forma nueva de aproximarse a la tecnología de la web. Por otro lado, de un plan mucho mayor de lograr una mejor estandarización (que comenzó con XHTML 1.0 y siguió con Transitional HTML). Por otro lado más, el efecto que ha tenido sobre la comunidad online demuestra que estamos capaces de acelerar el proceso de estándares (que hoy por hoy, no baja de los 5 o 6 años, cuando las tecnologías nuevas aparecen cada 6 meses).
> 
> Déjenme explayarme sobre lo anterior:
> 
> - **Una forma nueva de aproximarse a la tecnología de la web**
> 
> HTML5 fue un poco más "democrática" que el resto de los HTMLs pasados, en donde ya la dirección no se lleva adelante por los que están experimentando en el área, sino los que además de tenerlo asimilado, ya aprendieron de los errores pasados y tienen visión del futuro. Cosas como _webSockets_, _canvas_, _CSS3 3D acceleration_ (sé que no es HTML5 pero lo meto en el mismo paquete) no hablan tanto de algo que deba ser más fácil de programar, sino de una dirección distinta que va a empezar a tomar la web. Va a tratarse más de contenido multimedia e interacción, no más texto, imágenes y links. Abre otra forma completa en que las aplicaciones van a poder trabajar, y es un campo perfecto para la creatividad, la innovación y el avance. Cuando se asiente un poco el polvo va a venir la nueva revelación basada en esta tecnología. No estoy seguro de qué y no me las doy de visionario, pero es lo que siempre pasa, y a la velocidad que vamos, estoy seguro de que cada vez la revolución va a ser mayor.
> 
> - **Forma parte de un plan mayor**
> 
> Hace tiempo que la web viene "rota", por su cualidad de "forgiving". Cuando la web empezó había uno y luego dos navegadores. Tan poca variedad hizo que los programadores se educaran de forma terrible, y ambas partes luchaban por definir su estándar. El resultado: que cada empresa de IT tenga que tener un departamento de HTML+CSS porque algo que se suponía iba a poder hacer cualquiera se convirtió en toda una ciencia. Para sumar, el avance exponencial lo hace cada vez más difícil, con lo cual hoy hay activas 5 versiones de Internet Explorer, 4 de Firefox, 3 de Opera, 9 de Chrome, 2 de Safari y no sé cuántas más me estoy olvidando. Los renderizados y capacidades varían de SO a SO (multipliquen por todo lo que dije), y ni hablemos del mundo móvil. Cada navegador se tiene que acomodar a las 5 versiones de HTML que andan dando vueltas, más sus distintos modos. Cada navegador también implementa sus propios "extras", que se idearon al principio para que los programadores lo eligieran y dijeran "este sitio funciona con Internet Explorer 6" ( ¿ActiveX alguien?). Eso era marketing: luego la web iba a ser basada en IE. {Eso hoy es inconsistencia cross-browsing.}
> 
> Por supuesto, esto es un quilombo {lío}. Todos usaban IE hasta que FireFox y la moda open source comenzaron a tomar popularidad, luego Google Chrome y la promesa de hacer todo más liviano, más rápido y ellos "apoyando y promoviendo" los estándares, hizo que el mercado se distribuyera mucho.
> 
> Programar en HTML y hacerlo "aceptable" en todos lados es complejo también, porque los navegadores se bancan {soportan} todas las formas de hacer cosas, y nosotros tenemos que ajustarnos a ellas para que nuestra nueva página haga lo que queremos. Hoy esto es una traba a la innovación y a la mejora, porque lo que tiene que ser simple es un infierno.
> 
> El fallback de HTML5 es HTML4 y se planea en un futuro (lejano) volverlo {al HTML} tan estricto como el XML (de hecho, un schema definido por el mismo), lo cual va a significar: menor cantidad de estándares, mejor performance de los navegadores, menos ambig&uuml;edad de implementaciones, más soporte y más acogimiento de distintas plataformas y usuarios. Si piensan que HTML es una regla definida en texto, está realmente muy difícil entender por qué esto no fue así antes. (Excepto que se lean la historia de los párrafos anteriores.)
> 
> Por supuesto, proponer algo así hoy está condenado al fracaso, por algo simple: nadie lo va a hacer, y nadie va a tirar a la basura la internet que tenemos hoy. Esos pasos graduales (que cada vez van más rápido) lo van a lograr. Lo mismo se hizo con IPv4 vs IPv6, que casi llega al final de sus días (y hablamos de algo que tuvo unas buenas décadas para llevarse a cabo).
> 
> - **Acelera el proceso de estándares**
> 
> Ahora que el UX está en su auge, el entrepeneurship es una palabra (sí, también me sorprende), Microsoft se quiere redimir, Google está en la lucha, y la comunidad misma es la que presiona por todo esto, todo se aceleró. Cuando propusieron HTML5, Google Chrome ya soportaba cosas a la semana. {Nota: Esto no es históricamente correcto. La expresión denota la velocidad con que se adoptaron los cambios.} Si algo cambiara, ellos lo cambian al toque. Se ganaron el corazón de los desarrolladores y de a poco mercado con eso. Es la misma historia, pero ahora sin la burocracia de ir contra un estándar, sino al contrario, presionar para que el estándar se consolide.
> 
> Y esto es bueno porque todo lo que conté antes va a ocurrir más rápido. En definitiva, nuestras capacidades en la web no van a ser imposibles por la arquitectura cliente-servidor a la que estamos acostumbrados, sino que pronto van a venir cosas que nos van a permitir esa revolución.
> 
> **Y si yo estoy desarrollando un producto, ¿por qué me importa todo esto?**
> 
> Si sos alguien a quien le importa la tecnología y tenés tu pasión en ella, ya tuviste tu respuesta.
> 
> Si sos alguien que solo quiere vender un producto, o un cliente al que le tengo que convencer de usar tecnología nueva, la razones son las siguientes:
> 
> 1. Si tenés un target determinado, podés forzar a que usen el navegador que mejor soporten lo que quieras, y hacer uso de las nuevas capacidades. Sistemas más limpios, más seguros, y que luego solitos van a funcionar con el resto de los navegadores.
> 1. Si tu target es público en general, también te genera buena reputación estar sobre la cresta de la ola. Hay un mundo de apasionados y programadores que te van a mirar por cómo hiciste las cosas y no por lo que hiciste en sí (aunque claro, son la minoría). Si tu target es técnico, más interesante aún.
> 1. Si te importa la experiencia del usuario, hay cosas nuevas que podés lograr que de otra forma no podés. No todos van a poder experimentarlo hoy (por la compatibilidad), pero los que sí son visitantes ganados.
> 1. Cuando esta nueva tecnología se abra paso a más caminos, la ola te lleva sola sin ningún esfuerzo extra. Ejemplo: video HTML5 hizo que quienes adoptaron HTML5 llegaran al mundo móvil con multimedia. Los que se hicieron los cancheros diciendo "ya lo hicimos en Flash" se habrán enterado que esta semana Adobe anunció que abandona Flash para los móviles. Cuántos proyectos habrá que volver a tocar. Dicho sea de paso, yo pienso que Java (en web) va por el mismo camino.
> 1. Last, but not least, si alguien se va a comprar un teléfono hoy, se compra un teléfono de los nuevos. Es lo que le vende y lo que mejor le va a andar hoy y mañana. Hacer un proyecto no es tan distinto, hay que usar lo nuevo para que dure más y funcione mejor hoy y mañana. Mejor aún: no hay diferencia de costos entre HTML4 y HTML5.  ¿Por qué no elegir el mejor?
