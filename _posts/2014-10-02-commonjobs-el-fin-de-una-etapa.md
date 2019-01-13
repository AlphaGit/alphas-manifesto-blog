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
- documentaci&oacute;n
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

![](/assets/commonJobs.png)

<p style="text-align: justify;">Como varios pueden haberse enterado, hace poco CommonJobs dio su etapa final como proyecto oficial que&nbsp;comprend&iacute;a mi proyecto de tesis final. Voy a contar un poquito al respecto y qu&eacute; fue lo que lo hizo destacar, si es que hubo algo al respecto.</p>
<p><!--more--></p>
<h2>&iquest;Fue un proyecto de tesis?</h2>
<p style="text-align: justify;">S&iacute;, para quienes no est&eacute;n muy acostumbrados a esto, puede ser una especie de sorpresa. En la universidad en donde estudi&eacute;, el proyecto de tesis para ingenieros y licenciados en el &aacute;rea de sistemas se denomina "Proyecto Final" y no se trata tanto de una tesis doctoral como muchos lo imaginan, sino de un proyecto en s&iacute; mismo y su&nbsp;ejecuci&oacute;n. De esta forma, las t&iacute;picas tesis doctorales ser&iacute;an consideradas proyectos de investigaci&oacute;n, pero el caso m&aacute;s com&uacute;n es de proyectos de software que se ejecutan de principio a fin, en donde los alumnos deben llevar el proyecto adelante y documentar su proceso. Llegada a su conclusi&oacute;n, los alumnos presentan entonces todo lo ocurrido durante el proyecto y demuestran que conocen lo necesario para la ejecuci&oacute;n del mismo y son lo suficientemente cr&iacute;ticos como para encontrar las fallas y superarlas en el futuro. Este fue uno de esos casos, y de all&iacute; surgi&oacute; CommonJobs.</p>
<h2>&iquest;Por qu&eacute; <em>CommonJobs</em>?</h2>
<p style="text-align: justify;">CommonJobs ser&iacute;a el proyecto que administraba postulantes a ofertas de trabajo para la empresa CommonSense, que pas&oacute; a llamarse MakingSense, en donde trabajo. Esta empresa automatizar&iacute;a toda su &aacute;rea de postulantes y proceso de contrataci&oacute;n de candidatos, pero las verdades de la vida hicieron que el proyecto se centrara en informatizar otros procesos ya existentes.</p>
<h3>Informaci&oacute;n t&eacute;cnica sobre el proyecto</h3>
<p style="text-align: justify;">Si est&aacute;n interesados en el proyecto y quieren mirarlo o colaborar, este se encuentra en <a href="https://github.com/CommonJobs/CommonJobs">su repositorio en GitHub</a>, issues conocidos en <a href="https://github.com/CommonJobs/CommonJobs/issues">la secci&oacute;n de issues</a>, y documentaci&oacute;n en <a href="https://github.com/CommonJobs/CommonJobs/tree/master/entregables/site/Docs">la carpeta de documentaci&oacute;n</a>, tanto t&eacute;cnica como de proyecto.</p>
<p style="text-align: justify;">Para una breve introducci&oacute;n, el sistema se encuentra desarrollado sobre ASP.NET MVC 3, Raven DB, BackboneJS y una librer&iacute;a de data binding propio que denominamos nervoustissue.</p>
<h2>&iquest;Qu&eacute; destac&oacute; del proyecto?</h2>
<p style="text-align: justify;">Sinceramente: no el producto. El producto es &uacute;til y logr&oacute; lo que ten&iacute;a que lograr, pero en cuanto a funcionalidad o experiencia de usuario, es promedio o mediocre. Sin embargo, creo que otra cosa s&iacute; destac&oacute;: el proceso del proyecto.</p>
<p style="text-align: justify;">TL;DR: Todo lo que voy a mencionar est&aacute; incluido en la <a href="https://github.com/CommonJobs/CommonJobs/tree/master/entregables/site/Docs/Proyecto/Presentacion%20Publica">presentaci&oacute;n p&uacute;blica del proyecto</a>. Les recomiendo verla pero por el momento deben bajar esa carpeta y abrir el archivo <code>presentacion.html</code>, ya que al momento de escritura no hay una versi&oacute;n online del mismo. Pero lo recomiendo, es mucho m&aacute;s simple que leer lo que voy a escribir a continuaci&oacute;n.</p>
<p style="text-align: justify;">El proyecto comenz&oacute; intentando ser un Scrum, pero ya algunas cosas no eran como se supon&iacute;an: hab&iacute;a un equipo distribuido, la comunicaci&oacute;n era dif&iacute;cil y poco frecuente, los sprints demasiado largos y el avance lento. Esto era en parte porque s&oacute;lo pod&iacute;amos dedicarle ratos libres al proyecto, lo cual adem&aacute;s es cansador y desmotivante. Y estos, por supuesto, tambi&eacute;n son factores que afectan al &eacute;xito o frecaso de un proyecto.</p>
<p style="text-align: justify;">Para combatir estas cosas, se propusieron algunos objetivos secundarios al proyecto y se trabaj&oacute; de la siguiente forma:</p>
<ul style="text-align: justify;">
<li><strong>Experimentar y aprender era uno de los objetivos principales:</strong> Comenzamos a trabajar con tecnolog&iacute;as que ni conoc&iacute;amos. RavenDB era nueva para nosotros, apenas est&aacute;bamos comenzando con git y GitHub, BackboneJS tambi&eacute;n era nuevo para nosotros y &eacute;ramos algo novatosos para JavaScript. No puedo decir que ahora seamos gur&uacute;s en todo esto, pero experimentar, descubrir y sortear problemas fue una experiencia interesante.</li>
<li><strong>Se trabajaba cuando se pod&iacute;a:</strong>&nbsp;Cada uno trabajaba en horarios distintos o en momentos distintos. S&oacute;lo intent&aacute;bamos comprometernos con una cantidad determinadas de horas, y basados en estimaciones de velocidad, procur&aacute;bamos cumplir con lo requerido. Todo nuestro proceso fue administrable a trav&eacute;s de Trello, en donde nuestro workflow iba de izquierda a derecha (To Do, Doing, Pull Request, Done, Para el siguiente sprint). Lo maravilloso de esto es que sin cruzar una sola palabra con otros integrantes del equipo, ya sab&iacute;amos el estado en donde se encontraba todo lo que hab&iacute;a que trabajar.</li>
<li><strong>Algunas reuniones eran sagradas:</strong> Mal que mal, era necesario juntarnos eventualmente para coordinar y tomar decisiones que afectaran al equipo (como este proceso, o requerimientos). Este tipo de cosas se hac&iacute;a con todo el equipo, y eran las &uacute;nicas reuniones que hab&iacute;a que respetar a rajatabla. Creo que fue un punto interesante, y la retrospectiva de <a href="https://raw.githubusercontent.com/CommonJobs/CommonJobs/master/entregables/site/Docs/Proyecto/Retrospectiva/Images/Horas-por-persona-por-actividad.png">horas por actividad por persona</a>&nbsp;muestra que la gesti&oacute;n de proyecto estuvo muy equilibrada entre los tres integrantes del equipo.</li>
<li><strong>Toda la comunicaci&oacute;n era a trav&eacute;s de Trello o tem&aacute;tica:</strong> de esa forma era f&aacute;cil encarar las discusiones: todo lo que se mencionaba en una tarjetita era relativo a ella. Sab&iacute;a que una pregunta estar&iacute;a relacionada a la tarjeta en donde se encuentra, y la respuesta quedaba tambi&eacute;n registrada para quien tuviera que revisarla. Por supuesto, discusiones m&aacute;s amplias ocurr&iacute;an por email, o por Skype si fuera necesario.</li>
</ul>
<p style="text-align: justify;">Gracias a la (buena y sana) insistencia de <a href="https://github.com/andresmoschini">Andr&eacute;s</a>, fuimos muy rigurosos con el registrado de las horas insumidas. Esto nos permit&iacute;a ser cr&iacute;ticos y serios sobre nuestra dedicaci&oacute;n. Algunos sprints se sent&iacute;an interminables y al final, s&oacute;lo le hab&iacute;a dedicado unas 20 horas en lugar de 30. Algunos sprints se sent&iacute;an cortos y hab&iacute;a dedicado casi 40. Fuera como fuera, los n&uacute;meros no ment&iacute;an, y los sentimientos enga&ntilde;an. Esto nos dejaba ver si &iacute;bamos en buen camino, si &iacute;bamos lento, o si alguien estaba teniendo problemas para poder dedicarse. (Spoiler alert: todo eso ocurri&oacute;.)</p>
<h3>Problemas</h3>
<p style="text-align: justify;">Claro, no todo fue&nbsp;perfecto. Alrededor de la mitad del proyecto nos dimos cuenta que el sistema no estaba teniendo tanta utilizaci&oacute;n como lo esper&aacute;bamos. Nos dimos cuenta que nuestro backlog segu&iacute;a creciendo con propuestas de "alg&uacute;n d&iacute;a", pero que a la vez hab&iacute;a muchas cosas que la gente ten&iacute;a que hacer antes de poder usar el sistema en su d&iacute;a a d&iacute;a. Replanteamos si el proyecto estaba yendo en la direcci&oacute;n correcta, y decidimos corregir eso.</p>
<p style="text-align: justify;">As&iacute; fue como CommonJobs adquiri&oacute; un par de secciones que antes no esper&aacute;bamos, pero que result&oacute; m&aacute;s &uacute;til al fin del d&iacute;a. Muchas ideas interesantes terminaron no desarroll&aacute;ndose, pero todos los backlogs siguen p&uacute;blicos y disponibles para que alguien los implemente alg&uacute;n d&iacute;a, tanto como el c&oacute;digo que se encuentra disponible p&uacute;blicamente.</p>
<h2>Conclusi&oacute;n</h2>
<p style="text-align: justify;">El proyecto termin&oacute; muy bien, el producto es aceptable, se cumplieron los objetivos y se otorg&oacute; oficialmente los derechos de uso pertinentes a la empresa. Demostramos que sab&iacute;amos llevar proyectos adelante y con eso, ganamos nuestro t&iacute;tulo.</p>
<p style="text-align: justify;"><em>Soy ingeniero zorrinito.</em></p>
