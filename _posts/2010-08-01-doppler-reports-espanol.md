---
layout: post
status: publish
published: true
title: Doppler Reports (Espa&ntilde;ol)
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 2259
wordpress_url: http://blog.alphasmanifesto.com/?p=2259
date: '2010-08-01 05:25:39 +0000'
date_gmt: '2010-08-01 07:25:39 +0000'
categories:
- Projects
- Technology
tags:
- proyecto
- performance
- cloud computing
- arquitectura
- design
- seguridad
- marketing
- computaci&oacute;n distribu&iacute;da
- Doppler
- email
- modular
- tiempo real
- reporte
comments: []
---
<h2>Hola a todos</h2>
<p style="text-align: justify;">Me enorgullece poder anunciar que desde hace un tiempo he tenido la oportunidad de trabajar junto con el equipo Doppler para un nuevo proyecto, algo que desde entonces se estaba formando llamado <a href="http://www.fromdoppler.com/Website/source/English/feat_reports.aspx">Doppler Reports</a> (link). Este proyecto finalmente vio la luz y est&aacute; activo p&uacute;blicamente desde el 27 de Julio. Perm&iacute;tanme contarles un poco m&aacute;s sobre eso.</p>
<p style="text-align: justify;"><strong>Momento... &iquest;qu&eacute; es Doppler?</strong></p>

![Doppler](/assets/Doppler.png){ :align-left}

Para aquellos que no lo conocen, <a href="http://www.fromdoppler.com">Doppler</a> es una herramienta de <strong>email-marketing</strong>. Es realmente compleja, pero explic&aacute;ndola en un vistazo r&aacute;pido, es posible usarla para crear contenido de email online (basado en plantillas o editandolo manualmente), y enviarlo masivamente a una o m&aacute;s listas pre-cargadas. Sim embargo, hay mucho m&aacute;s para lo que puede utilizarse, y una de las grandes posibilidades que nos ofrece est&aacute; en la capacidad de analizar la reacci&oacute;n del cliente a nuestras campa&ntilde;as de emails. Cuando uno tiene diez, quiz&aacute; veinte, cincuenta o cien contactos, esto es algo que se puede hacer f&aacute;cilmente con un listado de ellos. Uno verifica sus contactos, analiza qui&eacute;n abri&oacute; los emails enviados, qui&eacute;n hizo click en cu&aacute;l link, y esa es toda la informaci&oacute;n que uno necesita.</p>
<h2>&iquest;Reportes?</h2>
<p style="text-align: justify;">Las cosas cambiaron mucho desde <a href="http://blog.fromdoppler.com/feliz-cumpleanos-doppler">esa ma&ntilde;ana del 2005</a>.&nbsp;&iquest;Qu&eacute; pasa cuando tienes mil contactos? &iquest;Y un mill&oacute;n? No, no estoy exagerando. Eso es parte de nuestro trabajo *diario*: mantener una herramienta que env&iacute;a millones de emails. &iquest;C&oacute;mo obtenemos los resultados y los mostramos al usuario? La respuesta obvia es: Reportes.</p>
<p style="text-align: justify;">Los reportes &nbsp;te dar&aacute;n toda la informaci&oacute;n resumida que necesitas sin tener que revisar cada uno de los contactos (porque, por supuesto, el sistema lo hace por t&iacute;). A medida que la tecnolog&iacute;a evoluciona y que el comportamiento del cliente evoluciona a medida que el marketing evoluciona, nuestras herramientas deben evolucionar tambi&eacute;n.</p>
<p style="text-align: justify;">Aqu&iacute; es donde el Equipo de Doppler vio la necesidad de una aplicaci&oacute;n de reportes totalmente nueva, para poder satisfacer muchos pedidos que nuestros clientes ten&iacute;an para la versi&oacute;n anterior de la misma. Pero esta herramienta deb&iacute;a estar pensada para <strong>millones</strong> de emails, <strong>miles</strong> de usuarios, informaci&oacute;n en <strong>tiempo real</strong> y al mismo tiempo, reportes <strong>informativos</strong> y <strong>elegantes</strong>.</p>
<p style="text-align: justify;">Y entramos en la escena. Tuve la oportunidad de trabajar junto con <a href="http://ar.linkedin.com/in/juanfazzini">Juan Fazzini</a> para dise&ntilde;ar una arquitectura que escalar&iacute;a a medida que Doppler siguiera creciendo con todas las futuras caracter&iacute;sticas que obtendr&aacute;. Entonces, en una tarde de viernes, un pizarr&oacute;n en blanco, una notebook como grabadora para todo lo que dec&iacute;amos (ya saben, la documentaci&oacute;n es importante), comenzamos a idear y pensar sobre c&oacute;mo Doppler Reports trabajar&iacute;a.</p>
<p style="text-align: justify;"><strong>&iquest;C&oacute;mo est&aacute; dise&ntilde;ada la arquitectura?</strong></p>
<h3><strong>1. Arquitectura distribuida</strong></h3>

![Distributed architecture](/assets/ModularAndDistributed.png){ :align-right}

Cada parte de Doppler funcionar&aacute; como un m&oacute;dulo independiente, que puede tener varias instancias funcionando al mismo tiempo. Hay un m&oacute;dulo en especial que se encargar&aacute; de interconectar a los dem&aacute;s entre ellos, pero estos m&oacute;dulos de interconexi&oacute;n pueden trabajar de forma independiente tambi&eacute;n.</p>
<p style="text-align: justify;">Esto significa que ahora tenemos <strong>mayor tolerancia a errores catastr&oacute;ficos</strong>. Si un servidor deja de funcionar, las otras instancias de los m&oacute;dulos seguir&aacute;n trabajando, manteniendo al sistema con funcionamiento normal. Los usuarios no se dar&aacute;n cuenta, apenas puede que noten una demora peque&ntilde;a en la aplicaci&oacute;n.</p>
<p style="text-align: justify;">Tambi&eacute;n significa que si tenemos mucha carga por uso intensivo, podemos crear nuevas instancias de un m&oacute;dulo y los m&oacute;dulos de interconexi&oacute;n autom&aacute;ticamente balancear&aacute;n la carga.</p>
<h3><strong>2. Seguridad en cada llamada</strong></h3>

![Keys and lock](/assets/Keys.png)

<p style="text-align: justify;">Tener estos m&oacute;dulos ah&iacute; afuera no es poca cosa para la seguridad. La seguridad tiene que ser tan estricta como es posible. Por eso, desarrollamos un protocolo de comunicaci&oacute;n que le permitir&iacute;a a cada m&oacute;dulo verificar si el que llama al mismo es una aplicaci&oacute;n autorizada y si est&aacute; bien devolver datos a la misma. Si todo funciona bien, la llamada se realiza y los datos se devuelven. Si algo no sale bien, como si se provee un token de autorizaci&oacute;n incorrecto, nunca se sabr&aacute; qu&eacute; pas&oacute;. Sabemos que esto no es particularmente transparente para los programadores, pero <strong>es lo m&aacute;s seguro</strong> que podemos realizar para prevenir intentos de hacking.</p>
<p style="text-align: justify;">El resultado de esta caracter&iacute;stica es que, incluso cuando los m&oacute;dulos est&eacute;n disponibles en Internet (no todav&iacute;a, pero quiz&aacute;s en alg&uacute;n momento lo est&eacute;n), no cualquiera puede acceder a ellos. Incluso si saben en d&oacute;nde est&aacute;n o c&oacute;mo llamarlos, ellos no har&iacute;an nada hasta que los clientes le provean un token de seguridad aut&eacute;ntico.</p>
<p style="text-align: justify;">Tambi&eacute;n significa que las claves de seguridad para acceder a este m&oacute;dulo se pueden generar y, en el futuro, podr&iacute;a resultar en una API para ciertos m&oacute;dulos de Doppler que cualquiera (o algunos usuarios) podr&iacute;an utilizar. <em>&iquest;Imaginas crear una aplicaci&oacute;n para tu propia empresa que autom&aacute;ticamente trabaje con los datos que Doppler gener&oacute; para t&iacute;?</em></p>
<h3><strong>3. Reportes en tiempo real</strong></h3>
<p style="text-align: justify;">M&aacute;s que una decisi&oacute;n arquitectural, esto fue un desaf&iacute;o. Ya se sabe que estamos manejando toneladas de datos. &iquest;C&oacute;mo cargarlos r&aacute;pidamente? &iquest;C&oacute;mo obtener una buena performance? Para eso, decidimos que algunos objetos trabajar&iacute;an internamente como proxies, de forma que s&oacute;lo se obtendr&iacute;a la informaci&oacute;n que se ve.</p>
<p style="text-align: justify;">Esto significa que ahora al entrar a la pantalla de <strong>Resumen de M&eacute;tricas</strong> para una de tus campa&ntilde;as, podr&iacute;as ver (<em>cuidado... se viene un listado grande</em>):</p>

![](/assets/Time.png)

<ul>
<li>Nombre de la campa&ntilde;a</li>
<li>Asunto del email de la campa&ntilde;a</li>
<li>Tipo de campa&ntilde;a</li>
<li>Cantidad de listados de emails que recibieron la campa&ntilde;a</li>
<li>Cu&aacute;ntos suscriptores recibieron la campa&ntilde;a</li>
<li>Cu&aacute;ndo se envi&oacute; la campa&ntilde;a</li>
<li>Aperturas por cada hora</li>
<li>Clicks por cada hora</li>
<li>Cu&aacute;ntos emails fueron abiertos (total)</li>
<li>Cu&aacute;ntos emails todav&iacute;a no han sido abiertos</li>
<li>Cu&aacute;ntos emails resultaron en soft-bounce</li>
<li>Cu&aacute;ntos emails resultaron en hard-bounce</li>
<li>&Uacute;ltima fecha de apertura</li>
<li>Clicks &uacute;nicos</li>
<li>Aperturas &uacute;nicas</li>
<li>Cada uno de los links</li>
<li>Para cada link, cu&aacute;ntos suscriptores hicieron click en ellos</li>
<li>Para cada pa&iacute;s del mundo, cu&aacute;ntas aperturas ocurrieron en ese pa&iacute;s</li>
</ul>
<p style="text-align: justify;"><em>*toma aire*</em> &iquest;Saben cu&aacute;nto tiempo le toma a Doppler Reports obtener y mostrar toda esa informaci&oacute;n? Menos de 5 segundos. Pongo &eacute;nfasis en ello: <strong>Menos. De. Cinco. Segundos.</strong> Ese es el tiempo que me toma leer las primeras tres l&iacute;neas de la p&aacute;gina. Quiz&aacute; cuatro, quiz&aacute; cinco. Pero antes de que haya terminado de hacerlo, la p&aacute;gina est&aacute; completamente cargada y funcionando. Y debo aclarar, mi conexi&oacute;n a internet no se destaca por su velocidad.</p>
<p style="text-align: justify;">Por supuesto, tambi&eacute;n usamos caching. Esto agrega una capa m&aacute;s de interacci&oacute;n hasta los datos, pero nuestro sistema de caching nos asegura que tengamos los datos listos para el usuario en el momento que los pida. Los datos de una campa&ntilde;a no cambian mucho, a menos que se acabara de enviar, por lo que, para la gran mayor&iacute;a de los casos, <strong>podr&iacute;as ver los datos de tu campa&ntilde;a tan r&aacute;pido como cualquier otra p&aacute;gina web</strong>.</p>
<h3><strong>4. Dise&ntilde;o modular</strong></h3>

![](/assets/Puzzle.png)

<p style="text-align: justify;">Mencion&eacute; antes que Doppler ha comenzado a ser m&aacute;s y m&aacute;s complejo, y ahora est&aacute; siendo dise&ntilde;ado de una forma modular. De esta forma, los m&oacute;dulos trabajan independientemente y a la vez, delegan responsabilidad en el m&oacute;dulo que sabe c&oacute;mo resolver un cierto problema o c&oacute;mo tratar cierto conjunto de datos. Tener un dise&ntilde;o modular es un aspecto terriblemente importante para cambios futuros. Le permite a nuestro equipo paralelizar el trabajo, y le permite a nuestro equipo (y a nuestra aplicaci&oacute;n) crecer.</p>
<p style="text-align: justify;">Esto tiene importantes consecuencias. Para el lado que el usuario logra ver, esto significa que muchas caracter&iacute;sticas estar&aacute;n disponibles m&aacute;s r&aacute;pidamente. <strong>Nuevas caracter&iacute;sticas, m&aacute;s mejoras, m&aacute;s robusto, m&aacute;s r&aacute;pido, mejor.</strong> "Harder, faster, better, stronger.", como Daft Punk recomienda construir el software.</p>
<h2>Eso es incre&iacute;ble, &iquest;puedo usarlo?</h2>
<p style="text-align: justify;">Por supuesto. Estas nuevas caracter&iacute;sticas ya est&aacute;n disponibles para todos los usuarios que tengan una cuenta de Doppler. Si no tienes una, puedes crearte una de forma gratuita y probar el producto por t&iacute; mismo: <a href="http://www.fromdoppler.com/">http://www.FromDoppler.com/</a>.</p>
<h2>Antes de que se vayan...</h2>
<p style="text-align: justify;">...Quer&iacute;a decir que considero un logro personal haber podido formar parte de todo esto. Intentamos lograr algo radical y hoy tenemos un producto radical. Creo que el <a href="http://www.fromdoppler.com/Website/source/English/company.aspx">Equipo Doppler</a> est&aacute; muy orgulloso de lo que han logrado. Yo ciertamente lo estoy.</p>
<p style="text-align: justify;">Ah, y este post ha llegado hasta el blog de&nbsp;<a href="http://getcs.com/en/2010/07/doppler-reports/">GetCS</a>. Visitenl&oacute;, puede que les interese.</p>
