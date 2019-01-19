---
layout: post
status: publish
published: true
title: 'CommonJobs: el fin de una etapa'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5180
wordpress_url: http://blog.alphasmanifesto.com/?p=5180
date: '2014-10-02 18:20:54 +0000'
date_gmt: '2014-10-02 23:20:54 +0000'
categories:
- Life
- Projects
tags:
- proyecto
- vida
- CommonSense
- documentación
- GitHub
- ASP.NET MVC 3
- MakingSense
- BackboneJS
- tesis
- CommonJobs
- RavenDB
- proceso
- Scrum
comments: []
---

![]({{ site.url }}/assets/commonJobs.png)

Proyecto final y producto real


Como varios pueden haberse enterado, hace poco CommonJobs dio su etapa final como proyecto oficial que comprendía mi proyecto de tesis final. Voy a contar un poquito al respecto y qué fue lo que lo hizo destacar, si es que hubo algo al respecto.

<!--more-->

##  ¿Fue un proyecto de tesis?

Sí, para quienes no estén muy acostumbrados a esto, puede ser una especie de sorpresa. En la universidad en donde estudié, el proyecto de tesis para ingenieros y licenciados en el área de sistemas se denomina "Proyecto Final" y no se trata tanto de una tesis doctoral como muchos lo imaginan, sino de un proyecto en sí mismo y su ejecución. De esta forma, las típicas tesis doctorales serían consideradas proyectos de investigación, pero el caso más común es de proyectos de software que se ejecutan de principio a fin, en donde los alumnos deben llevar el proyecto adelante y documentar su proceso. Llegada a su conclusión, los alumnos presentan entonces todo lo ocurrido durante el proyecto y demuestran que conocen lo necesario para la ejecución del mismo y son lo suficientemente críticos como para encontrar las fallas y superarlas en el futuro. Este fue uno de esos casos, y de allí surgió CommonJobs.

##  ¿Por qué _CommonJobs_?

CommonJobs sería el proyecto que administraba postulantes a ofertas de trabajo para la empresa CommonSense, que pasó a llamarse MakingSense, en donde trabajo. Esta empresa automatizaría toda su área de postulantes y proceso de contratación de candidatos, pero las verdades de la vida hicieron que el proyecto se centrara en informatizar otros procesos ya existentes.

### Información técnica sobre el proyecto

Si están interesados en el proyecto y quieren mirarlo o colaborar, este se encuentra en <a href="https://github.com/CommonJobs/CommonJobs">su repositorio en GitHub</a>, issues conocidos en <a href="https://github.com/CommonJobs/CommonJobs/issues">la sección de issues</a>, y documentación en <a href="https://github.com/CommonJobs/CommonJobs/tree/master/entregables/site/Docs">la carpeta de documentación</a>, tanto técnica como de proyecto.

Para una breve introducción, el sistema se encuentra desarrollado sobre ASP.NET MVC 3, Raven DB, BackboneJS y una librería de data binding propio que denominamos nervoustissue.

##  ¿Qué destacó del proyecto?

Sinceramente: no el producto. El producto es útil y logró lo que tenía que lograr, pero en cuanto a funcionalidad o experiencia de usuario, es promedio o mediocre. Sin embargo, creo que otra cosa sí destacó: el proceso del proyecto.

TL;DR: Todo lo que voy a mencionar está incluido en la <a href="https://github.com/CommonJobs/CommonJobs/tree/master/entregables/site/Docs/Proyecto/Presentacion%20Publica">presentación pública del proyecto</a>. Les recomiendo verla pero por el momento deben bajar esa carpeta y abrir el archivo `presentacion.html`, ya que al momento de escritura no hay una versión online del mismo. Pero lo recomiendo, es mucho más simple que leer lo que voy a escribir a continuación.

El proyecto comenzó intentando ser un Scrum, pero ya algunas cosas no eran como se suponían: había un equipo distribuido, la comunicación era difícil y poco frecuente, los sprints demasiado largos y el avance lento. Esto era en parte porque sólo podíamos dedicarle ratos libres al proyecto, lo cual además es cansador y desmotivante. Y estos, por supuesto, también son factores que afectan al éxito o frecaso de un proyecto.

Para combatir estas cosas, se propusieron algunos objetivos secundarios al proyecto y se trabajó de la siguiente forma:

- **Experimentar y aprender era uno de los objetivos principales:** Comenzamos a trabajar con tecnologías que ni conocíamos. RavenDB era nueva para nosotros, apenas estábamos comenzando con git y GitHub, BackboneJS también era nuevo para nosotros y éramos algo novatosos para JavaScript. No puedo decir que ahora seamos gurús en todo esto, pero experimentar, descubrir y sortear problemas fue una experiencia interesante.
- **Se trabajaba cuando se podía:** Cada uno trabajaba en horarios distintos o en momentos distintos. Sólo intentábamos comprometernos con una cantidad determinadas de horas, y basados en estimaciones de velocidad, procurábamos cumplir con lo requerido. Todo nuestro proceso fue administrable a través de Trello, en donde nuestro workflow iba de izquierda a derecha (To Do, Doing, Pull Request, Done, Para el siguiente sprint). Lo maravilloso de esto es que sin cruzar una sola palabra con otros integrantes del equipo, ya sabíamos el estado en donde se encontraba todo lo que había que trabajar.
- **Algunas reuniones eran sagradas:** Mal que mal, era necesario juntarnos eventualmente para coordinar y tomar decisiones que afectaran al equipo (como este proceso, o requerimientos). Este tipo de cosas se hacía con todo el equipo, y eran las únicas reuniones que había que respetar a rajatabla. Creo que fue un punto interesante, y la retrospectiva de <a href="https://raw.githubusercontent.com/CommonJobs/CommonJobs/master/entregables/site/Docs/Proyecto/Retrospectiva/Images/Horas-por-persona-por-actividad.png">horas por actividad por persona</a> muestra que la gestión de proyecto estuvo muy equilibrada entre los tres integrantes del equipo.
- **Toda la comunicación era a través de Trello o temática:** de esa forma era fácil encarar las discusiones: todo lo que se mencionaba en una tarjetita era relativo a ella. Sabía que una pregunta estaría relacionada a la tarjeta en donde se encuentra, y la respuesta quedaba también registrada para quien tuviera que revisarla. Por supuesto, discusiones más amplias ocurrían por email, o por Skype si fuera necesario.

Gracias a la (buena y sana) insistencia de <a href="https://github.com/andresmoschini">Andrés</a>, fuimos muy rigurosos con el registrado de las horas insumidas. Esto nos permitía ser críticos y serios sobre nuestra dedicación. Algunos sprints se sentían interminables y al final, sólo le había dedicado unas 20 horas en lugar de 30. Algunos sprints se sentían cortos y había dedicado casi 40. Fuera como fuera, los números no mentían, y los sentimientos engañan. Esto nos dejaba ver si íbamos en buen camino, si íbamos lento, o si alguien estaba teniendo problemas para poder dedicarse. (Spoiler alert: todo eso ocurrió.)

### Problemas

Claro, no todo fue perfecto. Alrededor de la mitad del proyecto nos dimos cuenta que el sistema no estaba teniendo tanta utilización como lo esperábamos. Nos dimos cuenta que nuestro backlog seguía creciendo con propuestas de "algún día", pero que a la vez había muchas cosas que la gente tenía que hacer antes de poder usar el sistema en su día a día. Replanteamos si el proyecto estaba yendo en la dirección correcta, y decidimos corregir eso.

Así fue como CommonJobs adquirió un par de secciones que antes no esperábamos, pero que resultó más útil al fin del día. Muchas ideas interesantes terminaron no desarrollándose, pero todos los backlogs siguen públicos y disponibles para que alguien los implemente algún día, tanto como el código que se encuentra disponible públicamente.

## Conclusión

El proyecto terminó muy bien, el producto es aceptable, se cumplieron los objetivos y se otorgó oficialmente los derechos de uso pertinentes a la empresa. Demostramos que sabíamos llevar proyectos adelante y con eso, ganamos nuestro título.

_Soy ingeniero zorrinito._
