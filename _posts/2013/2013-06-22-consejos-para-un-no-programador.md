---

title: Consejos para un no-programador
date: '2013-06-22 21:18:32 +0000'
date_gmt: '2013-06-23 02:18:32 +0000'
categories:
- Technology
tags:
- proyecto
- automatización
- flexibilidad
- requerimientos
- organización
- habilidades
- sistema
- work
- software
- análisis
- consejos
- procesos
- problemas
- team work
- conocimiento
- programming
subtitle: O "cómo no perderse en este bosque"

---

Una amiga mía me comentó que quería comenzar a programar, y de alguna forma lo entendí implícitamente como un buen momento para dar consejos de orientación. No es por sonar arrogante, pero sabemos que la programación puede ser una tarea desafiante, y me pregunté cuáles serían los mejores consejos para alguien que está empezando.

<!--more-->

Curioso para la situación: no sé qué tipo de lenguaje va a estar aprendiendo, no sé en qué entorno o tipos de aplicaciones va a estar programando,. Tampoco sé cuáles son los estándares de calidad a los que tiene que someterse, ni qué proceso seguirá, ni qué tamaño tienen los proyectos que quiere perseguir. Por supuesto, los consejos variarían mucho si cada una de estas variables cambiara, pero aún así pensé que tenía consejos para dar, independientemente del contexto.

Y es parte de lo que hago, tanto por gusto como por trabajo. Participo en proyectos pequeños, de una persona y sin procesos (como es [Alpha's Manifesto](https://github.com/AlphaGit/alphasmanifesto), el theme de este blog que hago en ratos libres). También participo en proyectos pequeños colaborativos y con procesos más definidos, como [CommonJobs](https://github.com/CommonJobs/CommonJobs), y a la vez participo de proyectos más grandes, con docenas de desarrolladores, procesos rigurosos y distintos problemas ocurriendo todos los días (no hay ejemplos públicos esta vez, lo lamento). Algo aprendí de esa variabilidad.

Creo que hay ciertas habilidades que un buen desarrollador puede _desarrollar_ (pun intended), que lo hacen claramente superior, independientemente de las variables que antes mencioné.

Esta fue mi respuesta, sobre la cual elaboraré más abajo:

> Lo único que te aconsejo de antemano es:
> 
> - sé muy organizada, es lo único que te va a salvar cuando la memoria de algún detalle te falle
> - las soluciones los problemas deben sentirse elegantes y no específicas. Como si pudieras resumir en pocos pasos que resuelven muchos problemas juntos. Si estás peleando con muchos casos particulares, hay algo de tu aproximación al problema que puede estar mal.
> 
>  Diferenciá muy bien y con criterio rigurosísimo:
>
>  1. lo que sabés con seguridad,
>  1. lo que creés que sea cierto,
>  1. lo que ignorás -- tener eso claro hace muy metódico el proceso de descubrir la causa de un problema que no entendés. (Y mucha gente no sabe hacerlo!)

## Organización

Lo primero que menciono es la organización que uno debe tener. Claramente, en muchas disciplinas distintas uno debe ser organizado, y en _cualquier_ disciplina sirve ser organizado.  ¿Cuál es la novedad aquí?

**El desarrollo de software es una de esas tareas que puede crecer exponencialmente en complejidad** que uno debe batallar mentalmente. Como hablaba con [Mariano Ravinale](http://mravinale.wordpress.com/), crear software es como crear grandes castillos en las nubes. El cliente puede pedirnos una funcionalidad simple, clara y directa (¡que no siempre es el caso!), y eso puede requerir que tomemos decisiones muy específicas y demasiado técnicas, sin olvidar el impacto de todas las posibles elecciones. Si el cliente quiere que su aplicación sea de color rojo, pensamos qué tecnología permitirá que eso se vea de la mejor manera en todas las plataformas de destino, sin necesidad de repetir código. Pensamos en un módulo que le permitirá al usuario configurarlo (esto es una discusión aparte: flexibilidad vs. esfuerzo) y pensamos en cuántos módulos distintos dependerán de la decisión.

Puede que el cliente quiera guardar un dato y editarlo luego, y pensamos en métodos de persistencia, en módulos de datos vs. módulos de presentación, cómo se acoplan y cómo deberían ser independientes, en la coordinación de la lógica entre ellos, en la separación de responsabilidades y todas las capas involucradas... Claramente, esto puede ser un caos sin organización.

**La organización propia, de la forma que sea, es la que nos permitirá tener un mapa mental **del proceso a seguir, o de los pasos a verificar. Hay muchos tipos de organización y no todos son exclusivos de los demás. Organizar el tiempo propio es una cosa (por ejemplo, [mi flujo personal con Trello]({{ site.baseUrl }}{% link _posts/2012/2012-01-20-como-uso-trello-para-trabajar.md %})). Organizar el proyecto es otra cosa, y la disciplina completa del análisis y el planeamiento (top-down, bottom-up, agile, risk management, waterfall, issue tracking, etc.). Organizar los archivos físicos del proyecto es otra cosa más, y separar al sistema en componentes es algo más también (arquitectura, diseño).

Nuestra memoria no es perfecta y pasados algunos meses, olvidaremos por qué algo se hizo de alguna forma, cuánto tiempo toma, o qué tan difícil era. La organización no es la respuesta, pero es la herramienta que nos acerca a ella. Es también la herramienta que permite a varias personas trabajar en un mismo proyecto sin que se pisen los talones una a otra.

La conclusión es: la organización es imprescindible.

## Elegancia en las soluciones

El segundo punto que mencioné se refiere a la _elegancia_ de las soluciones que encontremos. Esto no es sólo para saciar un gusto personal de código ingenioso (que sí, también lo es), sino por un principio más general.

La programación de software surgió como una herramienta para automatizar tareas repetitivas. Más aún, evolucionó rápido y permitió automatizar soluciones a _tipos_ de problemas, y no a problemas específicamente. Cuando [Charles Babbage](http://en.wikipedia.org/wiki/Charles_Babbage) diseñó su máquina calculadora, no era para dar el resultado de la suma de los números que él necesitaba, sino para cualquier suma de números que pudieran presentarse.

Bajo ese mismo concepto, el software desarrollado puede resolver un tipo de problemas más amplio o más específico. Esta característica es la que se denomina _flexibilidad_ de un software: mientras a más situaciones distintas pueda un software adaptarse, se dirá que es más flexible. Por supuesto que la flexibilidad tiene su costo (¡nada es gratis!) y resolver problemas más genéricos involucra un esfuerzo mayor. Volviendo al ejemplo, la máquina de Babbage no era un procesador de textos, que vino mucho tiempo después.

En el día al día del desarrollo, planteamos soluciones a problemas y muchas veces vamos a corregir soluciones para casos específicos que no cumplieron con nuestro resultado esperado. Si nuestro programa calcula la división entre dos números, nos encontraremos con que falla al dividir por cero. Encontraremos que falla si la precisión de ambos números es demasiado distinta y no podremos dar un resultado demasiado preciso. Encontraremos que determinados resultados no pueden representarse en el tipo de datos que hemos elegido (siempre ocurrirá esto: la memoria no es infinita). Encontraremos que operaciones consecuentes propagan un determinado margen de error. Si todo esto ocurre para una simple división, ¡imaginen el software complejo!

**Si nuestro código busca resolver cada situación particular de una forma distinta, estamos haciendo algo mal.** Estamos dejando que la complejidad del código se dispare terriblemente por un poco más de flexibilidad, y no siempre vale la pena. Para procesos más complejos, estamos permitiendo que el riesgo de errores sea mucho mayor, y estamos haciendo más difícil de entender a alguien más qué es lo que el código intenta resolver. Esto es, el famoso _[código spaghetti](http://en.wikipedia.org/wiki/Spaghetti_code)_, entre otros.

Formas de resolver esto hay muchas, varias de ellas relacionadas al planeamiento, planteo de prioridades y decisiones arquitecturales o de diseño, divide &amp; conquer, etc. Pero para alguien que programa, la clave es esta: si lo que estás haciendo se siente innecesariamente complicado, quizá estés tomando la aproximación equivocada al problema.

## Manejo del conocimiento

Está claro para cualquier desarrollador con experiencia que no sabe todo lo que está pasando. A veces son dudas sobre la tecnología, a veces es desconocimiento de las reglas del proyecto en el que está. Pero saber _qué es lo que uno sabe_ y _qué es lo que uno no sabe_ marca una diferencia.

Cualquier desarrollador se encontrará también resolviendo problemas inesperados, cosas que ocurren sin una clara explicación para él. La forma de encontrar esas causas es aplicar un método riguroso de poner a prueba el conocimiento que tenemos.

**Es importante clasificar lo que conocemos** o esperamos que sea verdad en una de las siguientes categorías:

**Lo que es cierto**, son aquellas verdades que hemos comprobado o que indefectiblemente no deberían cambiar. Cosas como que 1 + 1 = 2, que tenemos suficiente disco para la operación que estamos realizando, que nuestro procesador funciona bien, que el requerimiento a resolver es el correcto. Este es el tipo de cosas que debemos tomar como base para encontrar la solución a nuestro problema, y aunque siempre hay un "pero", es cierto también que si dudamos de absolutamente todo, caemos en una crisis existencial y dejamos de existir. Así no se resuelve nada.

**Lo que creemos que es cierto**, con cierto nivel de confianza. Este es el tipo de hechos que dimos por asumido pero que no hemos verificado personalmente, y que dependiendo de cómo hayamos llegado a creerlo, el nivel de confianza que le daremos. Cosas como que la versión del software que estamos usando para desarrollar no tiene bugs (con un bajo nivel de confianza si es una versión beta, por ejemplo), o que los efectos de las instrucciones que estamos ejecutando son realmente los esperados.

Hoy por hoy me encuentro trabajando en resolver unos problemas de pruebas en Selenium, y sin tener un vistazo a lo interno del framework, aquí es donde hago suposiciones y las pongo a prueba -- todo mi conocimiento al respecto está formando su nivel de confianza y esa red de conocimiento evoluciona sin necesidad que yo me ponga a leer un libro por una semana, o el código fuente durante un mes. Aplicando el método científico de hipótesis, experimento y re-planteo es una forma fácil de llegar a soluciones rápido, pero debemos saber distinguir el nivel de credibilidad de cada una de nuestras afirmaciones.

**Lo que ignoramos**. Suena tonto, pero no lo es. Es importante saber encuadrar cuáles son las cosas que ignoramos. Sabiendo que nuestro conocimiento sobre un tema es limitado, podemos haber escuchado al respecto de otras cosas fuera de ese límite, y es importante recordar que están ahí y las ignoramos. Cuando el conocimiento que tenemos no es suficiente para resolver un problema, la solución está claramente en una de estas áreas y no haberlas identificado significa que simplemente no sabremos cómo proseguir.

##  ¿Y ustedes?

 ¿Qué consejos le darían a alguien que va a comenzar en programación? O mejor aún:  ¿qué consejo le darían a alguien que está por comenzar en lo que ustedes hacen?  ¿Hay cualidades que pueden practicarse o aprenderse sin necesidad de entrar en tecnicismos de la disciplina?

## Update 2013-07-01: Salir de la Zona de Comfort

Agradezco a [Noelia Franco](https://twitter.com/noeliasfranco) quién, tras leer el artículo, propuso lo siguiente:

> Algo que siempre le digo tmb a mis alumnos es nunca quedarse en la "zona de comfort". Es decir, esto lo se hacer así, siempre funciona y no aprendo nada nuevo total esto anda. Siempre hay que estar abierto a nuevas propuestas y sobre todo no tener miedo al cambio, algo que es tan habitual en nuestra profesión.

Estoy muy de acuerdo y creo que también es de las habilidades básicas a aprender: saber mejorar. Esto es importante no sólo por el sólo hecho de mejorar, sino porque esta es una disciplina que está constantemente en cambio. Siempre surgen nuevas formas de resolver problemas, nuevas tendencias, y con ellos nuevos problemas. Ser un novato en algo y pensar que es suficiente es una sentencia de muerte. Ser un experto en algo y pensar que es suficiente es otra sentencia de muerte, aunque más prolongada. Siempre hay que aprender, siempre hay que cuestionarse si se puede mejorar lo que uno conoce, siempre se debe investigar sobre cosas nuevas.
