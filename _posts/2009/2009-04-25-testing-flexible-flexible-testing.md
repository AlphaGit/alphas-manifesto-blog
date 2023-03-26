---
title: Testing Flexible | Flexible Testing
date: 2009-04-25 19:06:11 +0000
date_gmt: 2009-04-25 21:06:11 +0000
categories:
  - Projects
tags: []
description: >-
  Testing model adaptable a variabilidad, distintos tipos, planificación,
  tercerización, calidad, improvisación, documentación, cascada, dependencia,
  fracaso.
---


**Español:**

Estos días estuve trabajando en desarrollar un proceso de testing adaptable a empresas que pueden querer tener un ciclo de testing completo (con todo el ciclo de vida del mismo que eso implica) como también tener simplemente un par de días y un par de recursos libres para poder testear. Ante tanta variabilidad, es necesario generar un modelo de testing que sea adaptable y particionable según las necesidades del momento, o según lo planificado con anterioridad.

Para casos planificados, pueden anticiparse testings que comienzan a trabajarse desde los requerimientos del sistema en desarrollo, y pueden incluso seguir el ciclo de vida de desarrollo del software a lo largo del mismo y en paralelo. Este es el famoso [modelo en V](http://en.wikipedia.org/wiki/V_model) del ciclo de vida de testing, pero este es el que presenta una gran deficiencia, que es la misma dependencia entre todas sus etapas. Este modelo se ajusta perfectamente a desarrollos con ciclos de vida de cascada, y si bien es fácilmente adaptable a otros ciclos de vida definidos, qué ocurre cuando nuestras etapas no son del todo claras? O peor aún, qué pasa cuando diferentes etapas se mezclan entre sí?

Por supuesto, esta situación no es deseable, pero al momento de darse, también sería deseable que nuestro modelo de testing no sea un contra más en esta situación, sino que permita ser utilizado también para aportar calidad, que es &ndash; al fin y al cabo &ndash; la finalidad del mismo.

Nuestro acercamiento a dicha tarea fue definir distintos tipos de testing, que variarían según los requisitos que estos tuvieran (documentos en qué basarse, cantidad de recursos necesarios proporcionalmente al tamaño del sistema, tiempo invertido, nivel de capacitación necesaria para los recursos, etc.), y para cada nivel de este tipo de testing, una variante que permitiera evaluar cierto aspecto de un sistema. De esta forma, logramos tener testing que puede ser hasta casi improvisado por los mismos desarrolladores, dejando documentación útil para el futuro del desarrollo del sistema, como a la vez también tenemos testing que puede planificarse desde el comienzo del proyecto y comenzar a trabajarse desde los requerimientos.

Por supuesto, creemos que mientras más haya, mejor, pero esto no es siempre posible, y es una realidad a la que tenemos que mantenernos atentos, porque negarla es condenarnos al fracaso.

Desafortunadamente, no puedo detallar información sobre los tipos de testing que hemos definido (ya que estos son propiedad e información de la empresa), pero los mismos también han sido planeado de un estilo y estructural totalmente formal, de manera que fácilmente puede tercerizarse el trabajo, o realizar testing para terceros de ser necesario o de surgir la oportunidad.

_Soy un zorrinito adaptable._

---

**English:**

These days I've been working on developing a testing process which would be adaptable to companies having a large testing cicle (including the whole life-cycle for testing it implies) as well as companies having just a couples of days they can use for testing and few resources available. On such variability, it was necesary to generate a testing model which would be adaptable and partitionable acording to particular necesities, or according to what can be planned in the project.

For cases where the testing is a planed part of the whole development cycle, testing itself may begin from the requirement specification and may even follow the whole development life-cycle at the same time. This is the famous [V-model](http://en.wikipedia.org/wiki/V_model) of testing life-cycles, but this model presents a great deficiency, and it is the same dependency between all of its internal stages. This model adjusts perfectly to developments with waterfall life-cycles and, it is even adaptable to other well-defined life-cycles. But what happens when these life-cycles do not have well-defined stages? Or, even worse, when this stages are sometimes mixed-up?

Of course, this situation is not desirable at all for a project, but, when it is found, it would be desirable that our testing model does not fall with it, but should allow us to be used also to give more quality &ndash; i.e., the purpose of it.

Our approach to this task was defining several different types of testing, which would vary from the requirements they had (documents on which to be based on, resources needed according to project size, time invested, knowledge level required for resources, etc.), and for each of these levels of testing, different variants which would allow us to evaluate a certain aspect of a system. This way, we achieved having testing processes which could be improvised by the developers themselves leaving useful documentation for future developments, as well as it could be also used for being planned and start being analyzed by a testing team from the very beggining of the development proces.

Of course, we belive that as more testing, best quality can be achieved, but this is not always posible, and this is a fact we should take into account, as deying it is condemn ourselves to failure.

Unfortunately, I'm not allowed to go into details on about the different types of testing we've defined &ndash; as they are our company's property &ndash; but these types of testing had been designed with a formal structure and style, so that they can be also used to be outsourced to other testing companies, or that, needed the case, we could be testing another's company code.

_I'm an adaptable little skunk._

