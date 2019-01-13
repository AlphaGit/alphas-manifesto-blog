---
layout: post
status: publish
published: true
title: Bugs con el manejo de fechas
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 3718
wordpress_url: http://blog.alphasmanifesto.com/?p=3718
date: '2012-03-14 08:56:58 +0000'
date_gmt: '2012-03-14 13:56:58 +0000'
categories:
- Link del d&iacute;a
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
comments: []
---
<p style="text-align: justify;">Muchos se habr&aacute;n enterado del problema que tuvo Windows Azure con el d&iacute;a bisiesto del 29 de Febrero de 2012, el famoso <a href="http://www.techweekeurope.co.uk/news/windows-azure-leap-year-glitch-takes-down-g-cloud-63920">leap year bug</a>&nbsp;que caus&oacute; downtime en la nube por todo el d&iacute;a. En alg&uacute;n momento se dijo que el problema no estaba relacionado con las fechas sino que fue coincidente, pero explicaciones posteriores confirmaron que era un problema de generaci&oacute;n de certificados en el d&iacute;a bisiesto. Las razones de por qu&eacute; se hace y cu&aacute;les fueron los problemas est&aacute;n explicados detalladamente en el blog de Azure: <a href="http://blogs.msdn.com/b/windowsazure/archive/2012/03/09/summary-of-windows-azure-service-disruption-on-feb-29th-2012.aspx">Summary of Windows Azure Service Disruption on Feb 29th, 2012</a>.</p>
<p style="text-align: justify;">Alguien pregunt&oacute; en StackOverflow <a href="http://stackoverflow.com/questions/9647269/how-can-we-develop-coding-practices-designed-to-protect-against-leap-year-bugs">c&oacute;mo protegerse de estos problemas</a>. Por supuesto, si a Microsoft le pasa, a cualquiera de nosotros nos puede pasar. Por supuesto, no est&aacute; del todo claro c&oacute;mo fue que se gener&oacute; la fecha inexistente, ni en qu&eacute; lenguaje y Microsoft no da datos al respecto, pero esta persona aclara que aparentemente en el Framework .NET esto no ocurre.</p>
<p style="text-align: justify;">Hay <a href="http://stackoverflow.com/a/9647300/147507">una respuesta en particular</a>&nbsp;que me gust&oacute; enormemente, a pesar de no haber respondido la pregunta. &Eacute;l habla de un proyecto en el que est&aacute; embarcado llamado <a href="http://noda-time.googlecode.com/">Noda Time</a>, basado en el <a href="http://joda-time.sourceforge.net/">Joda Time</a> de Java. Esta API resuelve muchos problemas que por lo general ni siquiera conocemos.</p>
<p style="text-align: justify;">Me gustar&iacute;a transcribir y traducir parte de su post, indicando algunos ejemplos de estos problemas (aunque no te interese la programaci&oacute;n puede que encuentres esto muy curioso):</p>
<blockquote><p>(...)</p>
<ul>
<li>Mapear un horario local a zona horaria no es tan simple como pensar&iacute;as. Una fecha/hora local puede ocurrir una vez, dos veces (ambig&uuml;edad) o ninguna vez (se salta) por transiciones de horarios de verano.</li>
<li>Las zonas horarias var&iacute;an hist&oacute;ricamente - m&aacute;s de lo que TimeZoneInfo generalmente quiere revelar, francamente (no soporta una zona horaria cuya idea de "tiempo est&aacute;ndar" cambia durante el tiempo, o que cambia a horario de verano de forma definitiva.)</li>
<li>Incluso con la base de datos de zonas horarias, los IDs de zonas horarias no son de fiar. (CLDR se encarga de esto, algo que estoy esperando en soportar en Noda Time eventualmente.)</li>
<li>Las representaciones textuales de fechas y horas son una pesadilla, no s&oacute;lo en t&eacute;rminos de su ordenamiento, sino tambi&eacute;n los separadores de fecha, los separadores de hora, y cosas raras como los nombres de los meses genitivos.</li>
<li>El comienzo del d&iacute;a no es siempre medianoche - en Brasil, por ejemplo, el cambio de horario de primavera mueve el reloj de 11.59:59 PM a 1 AM.</li>
<li>En algunos casos (bueno, yo conozco uno) una zona horaria puede forzar a que todo un d&iacute;a se salte - El 30 de Diciembre de 2011 no ocurri&oacute; en Samoa! Sospecho que muchos programadores pueden ignorar esto, pero...</li>
<li>Si vas a usar otro calendario aparte del Gregoriano, s&eacute; cuidadoso y aseg&uacute;rate de saber c&oacute;mo se va a comportar.</li>
</ul>
<p>(...)</p></blockquote>
<p style="text-align: justify;"><em>Soy un zorrinito CST.</em></p>
