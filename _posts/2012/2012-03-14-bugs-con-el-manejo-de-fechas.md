---
layout: single
title: Bugs con el manejo de fechas
date: '2012-03-14 08:56:58 +0000'
date_gmt: '2012-03-14 13:56:58 +0000'
categories:
- Link del día
tags:
- proyecto
- open source
- desarrollo
- preguntas
- StackOverflow
- respuestas
- fecha
- hora
- zona horaria
sub_title: ...it's more likely than you think.
---

Muchos se habrán enterado del problema que tuvo Windows Azure con el día bisiesto del 29 de Febrero de 2012, el famoso [leap year bug](http://www.techweekeurope.co.uk/news/windows-azure-leap-year-glitch-takes-down-g-cloud-63920) que causó downtime en la nube por todo el día. En algún momento se dijo que el problema no estaba relacionado con las fechas sino que fue coincidente, pero explicaciones posteriores confirmaron que era un problema de generación de certificados en el día bisiesto. Las razones de por qué se hace y cuáles fueron los problemas están explicados detalladamente en el blog de Azure: [Summary of Windows Azure Service Disruption on Feb 29th, 2012](http://blogs.msdn.com/b/windowsazure/archive/2012/03/09/summary-of-windows-azure-service-disruption-on-feb-29th-2012.aspx).

Alguien preguntó en StackOverflow [cómo protegerse de estos problemas](http://stackoverflow.com/questions/9647269/how-can-we-develop-coding-practices-designed-to-protect-against-leap-year-bugs). Por supuesto, si a Microsoft le pasa, a cualquiera de nosotros nos puede pasar. Por supuesto, no está del todo claro cómo fue que se generó la fecha inexistente, ni en qué lenguaje y Microsoft no da datos al respecto, pero esta persona aclara que aparentemente en el Framework .NET esto no ocurre.

Hay [una respuesta en particular](http://stackoverflow.com/a/9647300/147507) que me gustó enormemente, a pesar de no haber respondido la pregunta. él habla de un proyecto en el que está embarcado llamado [Noda Time](http://noda-time.googlecode.com/), basado en el [Joda Time](http://joda-time.sourceforge.net/) de Java. Esta API resuelve muchos problemas que por lo general ni siquiera conocemos.

Me gustaría transcribir y traducir parte de su post, indicando algunos ejemplos de estos problemas (aunque no te interese la programación puede que encuentres esto muy curioso):

> (...)
> 
> - Mapear un horario local a zona horaria no es tan simple como pensarías. Una fecha/hora local > puede ocurrir una vez, dos veces (ambig&uuml;edad) o ninguna vez (se salta) por transiciones > de horarios de verano.
> - Las zonas horarias varían históricamente - más de lo que TimeZoneInfo generalmente quiere > revelar, francamente (no soporta una zona horaria cuya idea de "tiempo estándar" cambia > durante el tiempo, o que cambia a horario de verano de forma definitiva.)
> - Incluso con la base de datos de zonas horarias, los IDs de zonas horarias no son de fiar. > (CLDR se encarga de esto, algo que estoy esperando en soportar en Noda Time eventualmente.)
> - Las representaciones textuales de fechas y horas son una pesadilla, no sólo en términos de > su ordenamiento, sino también los separadores de fecha, los separadores de hora, y cosas raras > como los nombres de los meses genitivos.
> - El comienzo del día no es siempre medianoche - en Brasil, por ejemplo, el cambio de horario > de primavera mueve el reloj de 11.59:59 PM a 1 AM.
> - En algunos casos (bueno, yo conozco uno) una zona horaria puede forzar a que todo un día se > salte - El 30 de Diciembre de 2011 no ocurrió en Samoa! Sospecho que muchos programadores > pueden ignorar esto, pero...
> - Si vas a usar otro calendario aparte del Gregoriano, sé cuidadoso y asegúrate de saber cómo > se va a comportar.
> 
> (...)

_Soy un zorrinito CST._
