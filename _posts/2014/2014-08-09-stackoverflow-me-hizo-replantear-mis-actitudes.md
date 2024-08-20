---
title: StackOverflow me hizo replantear mis actitudes
date: 2014-08-09 20:07:33 +0000
date_gmt: 2014-08-10 01:07:33 +0000
categories:
  - Miscellaneous
tags:
  - sistema
  - StackOverflow
  - evaluación
  - moderación
subtitle: "Resolviendo: quién vigila al vigilante"
description: Usuarios con poder necesitan moderación, evaluación en contexto, sistemas auto-mantenibles.
---


Hace unos días me ocurrió algo genial: fui evaluado y mi evaluación fue mala. Como producto de eso tuve una pequeña epifanía.  ¿Cómo puede ser?

<!--more-->

Hace poco tiempo [mi perfil de StackOverflow](http://stackoverflow.com/users/147507/alpha) superó los 2000 puntos de reputación, lo cual me da los permisos necesario para revisar ediciones sugeridas. Es decir, cuando alguien edita una pregunta o una respuesta que no es la propia, el sistema esperará a que algunos revisores verifiquen el cambio y lo aprueben. StackOverflow nos sugiere que busquemos aprobar aquellas ediciones que mejoren sustancialmente el contenido de un post, que evitemos ediciones menores, irrelevantes o vandalismo, y que propongamos más mejoras a los cambios ya propuestos. Pueden [leer detalles de cómo funciona](http://meta.stackexchange.com/questions/76251/how-do-suggested-edits-work).

![]({{ site.baseurl }}/assets/suggestedEdit.png)


Luego de hacer una de estas revisiones, recibí un mensaje fuera de lo común: "Esta era una auditoría y no pasaste. No podrás revissr cambios en los próximos 2 días."

Tras superar la sorpresa, ví que efectivamente mi decisión fue errónea: yo sólo había leído las primeras línas y visto que se estaban haciendo algunas aclaraciones, y no leí el contenido de las demás adiciones, que eran totalmente irrelevantes al post. Efectivamente, ese post había sido vandalizado.

Esto me hizo reflexionar sobre dos cosas:

1. Los sistemas cuyo contenido es provisto por la comunidad (StackOverflow, Quora, Reddit, y millones más), **necesitan un mecanismo para asegurar que los usuarios con mayor poder lo usen correctamente**. Muchas veces estas comunidades tienen moderadores, revisores o quienes moderan el contenido o las actividades de otros usuarios. Pero  ¿quién modera a los moderadores? StackOverflow lo resuelve de una manera elegante: además de moderadores, eisten roles específicos para actividades específicas (como revisores de ediciones). Estas actividades específicas entonces pueden ser auditadas de forma automática, asegurándose que quienes efectúen esas acciones se mantengan alerta. Además, el material para auditar está disponible desde el historial de otras ediciones con decisiones fáciles. ¡Genius!
1. Mi propio método de evaluación, lo que considero en contexto y lo que no. Como sabrán, gran parte de mis responsabilidades día tras día involucra la evaluación de código de otros. Si había fallado esta prueba en StackOverflow, **¿yo estaría cometiendo el mismo error en otros casos? La respuesta es que sí.** La forma en la que yo leo una serie de cambios a evaluar es a varios niveles, pero le resto importancia a cierttas cosas que ya puedo asumir desde el contexto, para darle más importancia a las principales. Sin embargo, estas cosas secundarias a veces pueden ser toda la diferencia, como esta auditoría me demostró. Desde entonces me encuentro poniendo más atención en estos casos también.
1. (Bueno, fueron 3 en realidad.) Sistemas auto-mantenibles. Me parece importantísima la idea de que ciertas características de un sistema estén destinada a su propia limpieza interna. No aplica solo al contenido de usuarios, pero siempre hay cierto "housekeeping" que debería ocurrir --  ¿quién mejor que los sistemas mismos para hacerlos?

¿Les hace pensar este caso sobre aspectos similares? Déjenme un comentario con lo que piensan.
