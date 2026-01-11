---
title: La confianza por el equipo
date: 2012-07-30 08:59:31 +0000
date_gmt: 2012-07-30 13:59:31 +0000
categories:
  - Thoughts
tags:
  - proyecto
  - Quality Assurance
  - requerimientos
  - comunicación
  - user testing
  - historia
  - confianza
  - procesos
  - problemas
  - anécdota
  - coordinación
  - team work
  - UAT
  - QA
  - project management
subtitle: El manual de Nick Fury para coordinar equipos
description: >-
  Nick Fury arriesga todo para defender equipo. Confianza crece entre equipo y
  cliente. Usuarios felices con sinceridad. Buen resultado final.
---


Cuando escribí _mi review de la película Avengers_ mencioné lo siguiente:

> Nick Fury es el coordinador de ese movimiento [Avengers defendiendo al mundo], y con su actitud de _badass_ se encarga de dejar claro qué es lo que estamos enfrentando y qué es lo que él está dispuesto a hacer.
> 
> De hecho, ese último punto me gusta mucho y lo usaré como referencia luego. Se nota mucho como él, creyendo en su grupo a pesar de las deficiencias del mismo, pone en peligro mucho de su persona y de su carrera personal para permitirles hacer lo suyo. Ya habrá otro post sobre eso.

Esta parte de la película (no se preocupen, no arruinaré la trama) me trajo una anécdota muy interesante y algo que quiero destacar sobre la forma en la que _MakingSense_ busca hacer su trabajo. En esta historia, el Consejo (autoridad) no creía que los Avengers fueran la solución y deciden hacerlos de lado, haciendo caso omiso de las recomendaciones de Nick Fury y sus palabras de esperanza. Cuando ellos, de forma determinante, deciden que el grupo de Nick no tiene nada que hacer, él deja todo de lado. A riesgo de perder su carrera, ser acusado de traición y hacer fracasar toda la operación, él toma un lanzacohetes y elimina un avión del Consejo.

 ¿Qué mejor forma de demostrar que **tenemos confianza en nuestro equipo **que tomar un lanzacohetes y defender al equipo, arriesgando todo?

<!--more-->

![]({{ site.baseurl }}/assets/nickFury.jpg)


Este es, salvando las diferencias y las armas de fuego, el tipo de relaciones que queremos tener internamente en nuestros equipos, y el tipo de relaciones que queremos que nuestros partners tengan con nosotros. Es algo que nos ha ocurrido muchas veces. Es fácil confiar cuando todo está bien, así que quiero contar la anécdota que más me gusta: cuando las cosas no estaban tan bien.

## El proyecto difícil, ya casi recuperado

Estábamos trabajando en un proyecto que presentaba complicaciones por razones políticas y burocráticas. Era el tipo de proyectos en donde debía haber resultados pero no había certezas en las que basarse. A pesar de eso, logramos trabajar en la comunicación con los distintos roles y personas que estaban involucrados, y el proyecto tomó un rumbo más aceptable. Nuestro jefe, es decir, nuestro superior en nuestra empresa cliente o partner y a quién aquí llamaré _Nick_, nos da absoluta confianza y ni se preocupa sobre cómo avanzan nuestras tareas. **él sólo sabe que estamos trabajando en el proyecto, y que si no le comunicamos que hay un problema, él puede confiar que vamos por buen camino**, o que podemos resolver nuestros problemas. Me encuentro yo, entonces, realizando un poco de análisis de negocios, análisis de requerimientos, administración de nuestro propio equipo, coordinación y un poquito de project management. El resto de nuestro equipo daba buenas recomendaciones técnicas, identificaba problemas de integraciones que debíamos resolver, y por supuesto, hacía un espléndido trabajo en la implementación del producto.

Pasan los meses y el proyecto llega al final de su codificación, cuando pasamos a etapa de QA, en donde se buscan bugs y comportamientos extraños basados en la documentación acordada. Tras unas semanas, esta estapa termina alegremente y comienza UAT (_User Acceptance Test_), en donde los usuarios originales observarán y probarán el sistema, y de ellos depende la decisión de considerarlo aceptable o no.

### El proceso de UAT

En las rondas de UAT, varias cosas fuera inesperadas pueden ocurrir. El caso feliz y deseado es que los usuarios prueben el sistema, se sientan satisfechos con lo que ven, den la aceptación formal y el sistema sea pasado a los entornos de producción. Esto ocurre mucho más fácilmente cuando el usuario final está involucrado activamente y de forma constante, como suele ser en los desarrollos ágiles.

En los desarrollos tradicionales, el usuario se vió involucrado en el comienzo del proceso de análisis y desapareció del panorama hasta UAT para ver los resultados. Es por eso que **con ciclo de vida en cascada pueden surgir sorpresas**, debidas a cambios en el entorno de trabajo real durante el desarrollo, a necesidades nuevas, a malinterpretaciones que simplemente no se detectaron antes y a expectativas variables que el usuario tiene mientras el tiempo pasó. Todo eso es factible.

Entenderán entonces por qué muchas empresas apuestan al desarrollo ágil, en donde el riesgo de que esto ocurra se ve muy minimizado, y de ocurrir, el impacto es mínimo.

## La discrepancia

Y el caso feliz no fue el que ocurrió en nuesta historia. Muchas características del sistema no eran lo que los usuarios esperaban. Ya que habíamos trabajado fuertemente en la documentación de cada requerimiento, nos basamos en los papeles oficialmente aprobados para aclarar que muchas de sus expectativas eran claramente pedidos nuevos y que, por lo tanto, debían ser dejadas de lado o implementadas en un futuro.

**Hay varias razones por las que delegar la perfecta calidad puede ser una opción factible y realista**, a pesar de lo contraproductivo que parece. Intuitivamente parecería que dejar al usuario contento es la mejor de las opciones, pero cuando una empresa debe invertir tiempo y dinero, relegando otras prioridades, a veces no es la mejor decisión. Especialmente cuando se trata de empresas grandes, los usuarios pueden no conocer otras prioridades que esperan al departamento de IT, y, por supuesto, están dispuestos a tratar su proyecto como la más alta prioridad. No los culpo por hacerlos, es la forma en la que protegen la inversión salida del presupuesto de su propio departamento, la misma que otorgó tiempo y dinero por tener un producto de software desarrollado para ellos.

En esta historia, había otras prioridades más grandes que estaban esperando a que nosotros termináramos este proyecto. Era nuestra tarea terminar lo antes posible, y si un pedido agregaba una hora de trabajo, debíamos usar sólo cinco minutos para aclarar que no íbamos a hacerlo. Por supuesto, todo lo que estaba documentado como pedido original debía ser parte del trabajo acordado, y si algo de esto faltaba, debía implementarse lo más rápidamente posible.

Una característica en particular dio mucho que hablar. Casi durante unas tres semanas, los usuarios insistían con que era algo que se había pactado, y yo aseguraba que no. Yo miraba la documentación y efectivamente no había nada al respecto. Buscaba entre papeles y documentos, y no había nada de eso. A diferencia de otras características, los usuarios insistían, y cuando la discusión no llevaba a ningún lado productivo, decidí escalar el problema.

Contacté a mi jefe y coordinador, el _Nick Fury_ de nuestro equipo (con quien, curiosamente, también tiene un parecido físico). Sin perder un segundo ni mirar en detalles, Nick apuntó su lanzacohetes y declaró que si no estaba escrito, no se haría, y que si había que llevar la discusión a niveles ejecutivos, lo haríamos sin verg&uuml;enza para llegar a una resolución. No necesitó verificar los datos por sí mismo, él sabía que podía confiar en mí.

Y fue en ese mismo momento, o en los próximos 15 segundos, en donde encontré un email antiguo, enterrado varios meses en el olvido con dos o tres párrafos en él.

### La sorpresa

Mientras seguía participando de esta reunión, atendiendo por teléfono, leí el email para ver que mi temor se hacía realidad: era el pedido del requerimiento que estábamos discutiendo. Un mail olvidado, ni siquiera respondido, y que en una sola frase, mencionaba vagamente la característica en disputa. Me alegraba estar por teléfono para que no vieran mi cara de verg&uuml;enza, y debo confesar que sentí una gran tentación por eliminarlo y pretender que nada pasó. Pero el resultado de eso comprendería un producto incompleto, usuarios descontentos, más discusiones y, lo peor de todo, estaríamos traicionando una confianza que, estaba claro, nos daban ciegamente. Viera del ángulo en que se lo viera, había una verdad innegable: **yo estaba equivocado**.

Interrumpí la conversación y dije tan calmado como pude:

_"Disculpen. Me equivoqué."_

Un pesadísimo silencio invadió la línea. Sólo podía imaginar los rostros de los presentes y las miradas que estarían dándose unos a otros. Nick preguntó algo desconcertado:

_" ¿Qué?"_

_"Me equivoqué. Sí, ellos habían pedido el requerimiento, y yo lo perdí entre mis mails. No sé por qué ocurrió, pero tienen razón ellos: esta característica debería estar implementada. Si comenzamos ahora la tendremos en 3 días."_

La conversación terminó rápidamente y todos salimos de la reunión, algunos colgamos el teléfono y otros salieron de la sala. Llamé a mi superior y en un intento de calmar la tensa situación, dije:

_"Tienes derecho a 15 minutos para gritarme todo lo que quieras."_

_"No, está bien. Cualquiera puede equivocarse. Sólo preocúpense en terminar rápido para que continuemos con el resto del trabajo que está esperando."_

## El resultado a largo plazo

A pesar del mal momento, culpa de mi propias acciones o inacciones, creo que estuvo bien lo que hicimos, y **la confianza con nuestro partner es más estrecha y fuerte hoy en día que nunca**. Yo soy el doble de cuidadoso y organizado, y ellos nos siguen dando tanta libertad y confianza como antes, si no es que más. Aún hoy seguimos trabajando juntos, en proyectos más desafiantes, más complicados y con sus propias historias para documentar en otras entradas.

Los usuarios mismos se sintieron muy contentos de escuchar mi sinceridad, hasta el punto que varios me contactaron en privado para felicitarme, y son esos mismos usuarios los que, en un proyecto posterior, aceptaron nuestras sugerencias desafiando a sus requerimientos, a pesar de haber sido ya aceptados y documentados. (Pero este es material para otra anécdota.)

Si esto no es un buen resultado, no sé cómo podría haber sido mejor.
