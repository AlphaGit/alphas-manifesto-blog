---
layout: post
status: publish
published: true
title: Code review guidelines
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 1032
wordpress_url: http://blog.alphasmanifesto.com.ar/?p=1032
date: '2009-03-02 00:40:50 +0000'
date_gmt: '2009-03-02 02:40:50 +0000'
categories:
- Projects
- Technology
tags: []
comments: []
---
<p style="text-align: justify;">En estos d&iacute;as mientras anduve haciendo los code reviews se me ocurri&oacute; estandarizar de alguna forma c&oacute;mo podr&iacute;an estos hacerse y de qu&eacute; forma podr&iacute;a "puntuarse" al c&oacute;digo evaluado en cuesti&oacute;n. Por ahora, eso &uacute;ltimo queda pendiente (ya que es lo m&aacute;s dif&iacute;cil de determinar y no lo m&aacute;s &uacute;til), pero lo primero se convirti&oacute; en un conjunto de categor&iacute;as y puntos que pueden ser muy interesantes tener en cuenta al momento de ver el c&oacute;digo y ver qu&eacute; se puede mejorar de &eacute;l.</p>
<p style="text-align: justify;">Seguro que esta lista que viene a continuaci&oacute;n est&aacute; lejos de estar completa, y que se podr&iacute;an agregar y quitar un mont&oacute;n de cosas, pero lo tiro como una introducci&oacute;n a esto que quiero (queremos?) terminar de formar, que nos puede llegar a ser muy &uacute;til.</p>
<p style="text-align: justify;">PD: No creo que nada de esto sea "requerido" para que un sistema est&eacute; "bien", sino que partiendo de que funciona, podemos decir "qu&eacute; tan bien" o "qu&eacute; tan mal" estamos.</p>
<p style="text-align: justify;"><strong>Estandarizaci&oacute;n / Legibilidad de c&oacute;digo</strong></p>
<p style="text-align: justify;"><em>&iquest;El c&oacute;digo est&aacute; comentado explicativamente?</em></p>
<p style="text-align: justify;">El c&oacute;digo deber&iacute;a estar acompa&ntilde;ado de comentarios que expliquen qu&eacute; es lo que se est&aacute; haciendo y por qu&eacute; m&aacute;s all&aacute; de explicar el c&oacute;mo. A la vez, el c&oacute;digo deber&iacute;a ser lo suficientemente claro como para que se entienda c&oacute;mo es que se est&aacute; resolviendo un problema en particular.</p>
<p style="text-align: justify;"><em>&iquest;Los nombres son significativos?</em></p>
<p style="text-align: justify;">Deber&iacute;a entenderse qu&eacute; funci&oacute;n tiene una variable, un m&eacute;todo o una clase cuando se lee el nombre que se le dio.</p>
<p style="text-align: justify;"><em>&iquest;El c&oacute;digo de una clase accede a la informaci&oacute;n que necesita de forma correcta?</em></p>
<p style="text-align: justify;">Si una clase necesita informaci&oacute;n de otras deber&iacute;a pedirla en los par&aacute;metros de sus m&eacute;todos o en su constructor. Las propiedades tambi&eacute;n son una buena opci&oacute;n.</p>
<p style="text-align: justify;"><em>&iquest;El c&oacute;digo se encuentra correctamente modularizado?</em></p>
<p style="text-align: justify;">El c&oacute;digo de un m&eacute;todo no deber&iacute;a excederse en tama&ntilde;o, y deber&iacute;a ser explicativo en unas pocas l&iacute;neas de c&oacute;digo sobre qu&eacute; es lo que est&aacute; haciendo. De ser compleja su acci&oacute;n, deber&iacute;a repartirse en varios pasos que se desdoblen en todo lo que deban hacer.</p>
<p style="text-align: justify;"><strong>Arquitectura</strong></p>
<p style="text-align: justify;"><em>&iquest;Se respeta el concepto de la arquitectura propuesta?</em></p>
<p style="text-align: justify;">Sea cual sea la arquitectura propuesta para la aplicaci&oacute;n, deber&iacute;a respetarse el esquema que esta propone, poniendo la l&oacute;gica de la aplicaci&oacute;n en donde esta deber&iacute;a estar, el acceso a datos en otro lado, etc.</p>
<p style="text-align: justify;"><em>&iquest;Se encuentran separadas las capas de la misma lo suficiente?</em></p>
<p style="text-align: justify;">De existir distintas capas en la arquitectura, estas deber&iacute;an encontrarse lo suficientamente separadas como para depender de cada otra s&oacute;lo como distintos m&oacute;dulos de un sistema y nunca seg&uacute;n su implementaci&oacute;n.</p>
<p style="text-align: justify;"><em>&iquest;Qu&eacute; tan f&aacute;cil ser&iacute;a camiar alguna de las capas por una implementaci&oacute;n distinta?</em></p>
<p style="text-align: justify;">Como medici&oacute;n de la independencia de las capas, el acto de crear una nueva implementaci&oacute;n para una de ellas deber&iacute;a ser tan costoso como la implementaci&oacute;n misma y no m&aacute;s que eso. De ser de otra forma, existe dependencia en la implementaci&oacute;n de las capas.</p>
<p style="text-align: justify;"><strong>Code-coverage</strong></p>
<p style="text-align: justify;"><em>&iquest;Existe un testing definido para el c&oacute;digo escrito?</em></p>
<p style="text-align: justify;">Deber&iacute;a existir alguna forma de probar el c&oacute;digo escrito, cualquiera sea su metodolog&iacute;a.</p>
<p style="text-align: justify;"><em>&iquest;Las pruebas testean que el c&oacute;digo devuelva resultados correctos en escenarios esperados?</em></p>
<p style="text-align: justify;">Las pruebas deber&iacute;an testear, como caso esencial, que el sistema se comporte correctamente ante determinados escenarios.</p>
<p style="text-align: justify;"><em>&iquest;Las pruebas testean el comportamiento del c&oacute;digo en escenarios no esperados?</em></p>
<p style="text-align: justify;">Las pruebas deberian testear, como caso adicional, determinadas situaciones no comunes, o incluso situaciones que no deber&iacute;an darse, para poder probar la forma en la que el sistema responde al mismo.</p>
<p style="text-align: justify;"><em>&iquest;Ocurre esto &uacute;ltimo con cada uno de los datos de entrada?</em></p>
<p style="text-align: justify;">Las pruebas con elementos err&oacute;neos o inesperados deber&iacute;an variarse para cada uno de los datos de entrada, pudiendo evaluar qu&eacute; tan sensible es el sistema a la variaci&oacute;n de cada uno de estos.</p>
<p style="text-align: justify;"><em>&iquest;Ocurre esto &uacute;ltimo con combinaciones de los datos de entrada?</em></p>
<p style="text-align: justify;">La misma situaci&oacute;n es aplicable a la combinaci&oacute;n de distintos datos de entrada. A veces la variaci&oacute;n de los datos de entrada de forma individual no genera problemas, pero una determinada combinaci&oacute;n de los mismos, s&iacute;. As&iacute; tambi&eacute;n puede evaluarse la correlaci&oacute;n que tienen estos datos de entrada respecto del funcionamiento del sistema.</p>
<p style="text-align: justify;"><strong>Estabilidad</strong></p>
<p style="text-align: justify;"><em>&iquest;Qu&eacute; parte del c&oacute;digo se encuentra atrapando excepciones o situaciones no esperadas?</em></p>
<p style="text-align: justify;">El sistema deber&iacute;a programarse considerando que pueden darse situaciones adversas que puedan afectar el correcto funcionamiento de los bloques sobre los que depende. Si bien un extremo de esto llevar&iacute;a a la reescritura de todo el c&oacute;digo en cada capa superior (lo cual no s&oacute;lo es imposible sino indeseable), debe considerarse que un bloque del que dependemos, cuanto menos, no est&eacute; disponible.</p>
<p style="text-align: justify;"><em>&iquest;C&oacute;mo se comporta la l&oacute;gica de tratamiento de errores?</em></p>
<p style="text-align: justify;">Un sistema deber&iacute;a tener al menos una rutina de tratamiento de errores, que controle la situaci&oacute;n o alerte al usuario.</p>
<p style="text-align: justify;"><em>&iquest;Puede una situaci&oacute;n imprevista alterar el funcionamiento del sistema?</em></p>
<p style="text-align: justify;">La ocurrencia de un error o una situaci&oacute;n no esperada no deber&iacute;a generar comportamientos no esperados del sistema. Posiblemente resultados err&oacute;neos, pero el comportamiento del sistema deber&iacute;a mantenerse estable.</p>
<p style="text-align: justify;"><strong>Flexibilidad</strong></p>
<p style="text-align: justify;"><em>&iquest;Cu&aacute;nta informaci&oacute;n utilizada es parametrizable, versus la que se encuentra codificada en el sistema?</em></p>
<p style="text-align: justify;">La informaci&oacute;n que se considera "fija" para el sistema deber&iacute;a poderse parametrizar, para otorgar m&aacute;s flexibilidad en casos especiales en donde la misma se viera sujeta a cambios.</p>
<p style="text-align: justify;"><em>&iquest;Es extensible el funcionamiento del sistema o sus funcionalidades?</em></p>
<p style="text-align: justify;">En caso de no poderse alterar el c&oacute;digo de la aplicaci&oacute;n, deber&iacute;a existir cierta posibilidad de agregarle funcionalidad desde la entrada o la salida de datos.</p>
<p style="text-align: justify;"><em>&iquest;Qu&eacute; tanto afecta al sistema agregar una funcionalidad?</em></p>
<p style="text-align: justify;">En caso de tener que agregar una funcionalidad al sistema, la menor cantidad de m&oacute;dulos deber&iacute;an verse afectados, y nunca deber&iacute;a verse afectado el c&oacute;digo de otras funcionalidades.</p>
<p style="text-align: justify;"><em>&iquest;Qu&eacute; tanto afecta al sistema quitar una funcionalidad?</em></p>
<p style="text-align: justify;">En caso de tener que quitar o deshabilitar una funcionalidad al sistema, el c&oacute;digo de las dem&aacute;s funcionalidades no deber&iacute;a verse afectado.</p>
<p style="text-align: justify;"><em>&iquest;Qu&eacute; tanto afecta al sistema el modificar la implementaci&oacute;n de una funcionalidad?</em></p>
<p style="text-align: justify;">En caso de tener que alterar una funcionalidad del sistema, el c&oacute;digo de las dem&aacute;s funcionalidades no deber&iacute;a verse afectado.</p>
<p style="text-align: justify;"><em>&iquest;Cu&aacute;nto afecta al sistema que cambien las reglas de negocios?</em></p>
<p style="text-align: justify;">Si las reglas de negocio que definen el comportamiento del sistema cambiaran, ser&iacute;a deseable que la menor parte del sistema se volver&iacute;a obsoleto, y que el resto pudiera ser reusado para la implementaci&oacute;n de las nuevas reglas de negocios.</p>
<p style="text-align: justify;"><strong>Recursos</strong></p>
<p style="text-align: justify;"><em>&iquest;Qu&eacute; recursos requiere el sistema para su funcionamiento?</em></p>
<p style="text-align: justify;">Ser&iacute;a deseable que un sistema requiera la menor cantidad de recursos posibles. Estos incluyen tanto la utilizaci&oacute;n de procesador, memoria, tiempo de ejecuci&oacute;n, sistemas sobre los que depende, bases de datos, archivos en disco, etc.</p>
<p style="text-align: justify;"><em>&iquest;Cu&aacute;nto tiempo hace uso de los recursos versus cu&aacute;nto tiempo los retiene ociosos?</em></p>
<p style="text-align: justify;">Ser&iacute;a deseable que en el momento mismo en que el sistema ya no hace uso de un recurso, lo libere. A veces esto puede ser contraproducente por cuestiones de performance, pero de todos modos ser&iacute;a deseable que lo haga.</p>
<p style="text-align: justify;"><strong>Performance</strong></p>
<p style="text-align: justify;"><em>&iquest;Cu&aacute;nto tiempo requiere el m&aacute;s pesado de los procesos que efect&uacute;a el sistema?</em></p>
<p style="text-align: justify;">Los procesos que requieren mucho tiempo de ejecuci&oacute;n deber&iacute;an ser optimizados al m&aacute;ximo posible, ya que en ellos se encuentra el peor de los casos que el sistema puede encontrar.</p>
<p style="text-align: justify;"><em>&iquest;Cu&aacute;ntos cuellos de botella se identifican en el flujo de informaci&oacute;n / acciones del sistema?</em></p>
<p style="text-align: justify;">Ser&iacute;a deseable que existan alternativas para que un punto en particular no sea determinante de no poder utilizar el sistema. A veces las reglas de negocios requieren que as&iacute; sea, pero de no ser necesario, es deseable que existan v&iacute;as alternativas de continuar con el flujo de utilizaci&oacute;n del mismo.</p>
<p style="text-align: justify;"><strong>Seguridad</strong></p>
<p style="text-align: justify;"><em>&iquest;Cu&aacute;ntos datos de entrada son validados por el sistema en cuanto a su tipo de datos?</em></p>
<p style="text-align: justify;">Los datos que entran al sistema deber&iacute;an controlarse si son v&aacute;lidos para el tipo de datos que deben representar. Ejemplo t&iacute;pico es el de los datos num&eacute;ricos, o de fecha, que muchas veces se leen simplemente como cadenas.</p>
<p style="text-align: justify;"><em>&iquest;Cu&aacute;ntos datos de entrada son validades en cuanto a sus restricciones seg&uacute;n su uso?</em></p>
<p style="text-align: justify;">Los datos tambi&eacute;n deber&iacute;an validarse seg&uacute;n su contenido, es decir, que contengan un valor que tenga sentido en el &aacute;mbito en el que se necesita usar. Ejemplo, una fecha de nacimiento del 1/1/0001.</p>
<p style="text-align: justify;"><em>&iquest;Qu&eacute; medidas toma el sistema para la protecci&oacute;n de los distintos recursos que utiliza?</em></p>
<p style="text-align: justify;">Algunos datos alteran el funcionamiento del sistema (recursos tiempo de ejecuci&oacute;n, memoria, etc) y otros se env&iacute;an a ser almacenados en determinados recursos del sistema (recursos de bases de datos, archivos, etc). Todos estos recursos deben verse protegidos de datos que hagan al sistema abusar de ellos, como ser por ejemplo los loops infinitos, el escalado de prioridades, SQL Injection, XSS, etc.</p>
<p style="text-align: justify;"><em>&iquest;Qu&eacute; usuarios tienen acceso a la utilizaci&oacute;n del sistema y cu&aacute;les no?</em></p>
<p style="text-align: justify;">Es deseable que el sistema restrinja el acceso a los usuarios que efectivamente deben hacer uso de &eacute;l y tienen permitido acceder a la informaci&oacute;n que el sistema maneja.</p>
<p style="text-align: justify;"><em>&iquest;Qu&eacute; usuarios tienen acceso a la administraci&oacute;n o configuraci&oacute;n del sistema y cu&aacute;les no?</em></p>
<p style="text-align: justify;">De la misma manera, el sistema deber&iacute;a restringir el acceso solo a determinados usuarios que puedan modificar su configuraci&oacute;n o comportamiento. A veces es incluso deseable que este perfil de usuarios no puedan tener acceso al resto de la informaci&oacute;n que el sistema utiliza, sino solo a la informaci&oacute;n de configuraci&oacute;n en s&iacute;.</p>
