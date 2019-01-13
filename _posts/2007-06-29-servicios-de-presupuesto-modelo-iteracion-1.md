---
layout: post
status: publish
published: true
title: Servicios de Presupuesto - Modelo Iteraci&oacute;n 1
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 84
wordpress_url: http://zorri2.wordpress.com/2007/06/29/servicios-de-presupuesto-modelo-iteracion-1/
date: '2007-06-29 01:19:00 +0000'
date_gmt: '2007-06-29 01:19:00 +0000'
categories:
- Projects
tags: []
comments:
- id: 1149
  author: El Hombre Gris
  author_email: ''
  author_url: ''
  date: '2007-07-01 02:32:00 +0000'
  date_gmt: '2007-07-01 02:32:00 +0000'
  content: 'Pregunta Sr.Zorrino: &iquest;no hacen la fase de inicio del Proceso Unificado?'
- id: 1150
  author: Alpha
  author_email: ''
  author_url: ''
  date: '2007-07-01 16:20:00 +0000'
  date_gmt: '2007-07-01 16:20:00 +0000'
  content: 'Qu&eacute; tal, Gris&aacute;ceo.<br/><br/>S&iacute; y no es la respuesta.
    En realidad ac&aacute;, trabajando sobre procesos iterativos, la parte de lo que
    ser&iacute;a inicio del proceso unificado se reduce casi a nulo, y se reparte
    en cada una de las iteraciones.<br/><br/>Lo &uacute;nico que se hace al comienzo
    es el relevamiento, pero no en detalle, lo cual es algo que me choca profundamente.
    Es como dividir el proyecto en varias iteraciones, en cada una de las cuales vas
    a desarrollar casos de uso, seg&uacute;n lo dif&iacute;cil que te "parezcan" hacerlos.
    <br/><br/>Sobre esa base, luego en cada iteraci&oacute;n ten&eacute;s que implementar
    dichos casos de uso...<br/><br/>..pero existe una fase de inicio en donde se ve
    el sistema como un completo y se trata de especificar las condiciones globales
    del proyecto.<br/><br/>En definitiva, no sabr&iacute;a qu&eacute; responderte
    con exactitud.<br/><br/>Te dejo para m&aacute;s info el blog de referencia de
    un profesional que trabaja en el asunto: www.fernandosoriano.com.ar<br/><br/>SldZ.-'
- id: 1151
  author: El Hombre Gris
  author_email: ''
  author_url: ''
  date: '2007-07-01 19:38:00 +0000'
  date_gmt: '2007-07-01 19:38:00 +0000'
  content: 'Ojo, creo que est&aacute;s confundiendo el proceso unificado con un modelo
    en cascada. El proceso unificado es un modelo iterativo, donde est&aacute; planteado
    un modelo gen&eacute;rico de iteraciones clasificadas en etapas, donde en realidad
    la primera etapa tiene un artifact para definir que cambios se deben contemplar
    sobre el proceso unificado para el proyecto en curso, o sea que en realidad funciona
    como guideline.<br/><br/>Hechale un vistazo al libro de Larman que les dio como
    bibliograf&iacute;a.<br/><br/>De todas maneras me sorprendi&oacute; que no tuvieran
    esta primera iteraci&oacute;n, que dura muy poco, y su iteraci&oacute;n 1 fuera
    ya de elaboraci&oacute;n. Tal vez la primera iteraci&oacute;n la hicieron en clase,
    o se las dio el profesor en la consigna.<br/><br/>Igual estar&iacute;a bueno verlo
    eso como para entender la totalidad del trabajo. O sea, estas cosas: an&aacute;lisis
    del negocio, casos de uso y actores identificados, detalle del caso de uso principal
    (o casos de uso principales). Lo que expones ac&aacute; se parece al plan de iteraci&oacute;n,
    artifact que se genera en la iteraci&oacute;n inicial y planifica la siguiente
    iteraci&oacute;n.'
- id: 1152
  author: Alpha
  author_email: ''
  author_url: ''
  date: '2007-07-01 19:59:00 +0000'
  date_gmt: '2007-07-01 19:59:00 +0000'
  content: 'Tan groso como siempre.<br/><br/>Efectivamente: yo estaba confundiendo
    el proceso unificado con modelos en cascada.<br/><br/>Respecto de la primera iteraci&oacute;n,
    eso s&iacute; lo tengo claro. La primera iteraci&oacute;n en realidad es de definici&oacute;n
    del proyecto, que ya la hicimos, pero no la incluimos en la numeraci&oacute;n
    solo para tener numeradas las iteraciones que ser&aacute;n similares entre s&iacute;.<br/><br/>Gracias
    Gris&aacute;ceo, como siempre sac&aacute;ndome las papas del fuego.'
- id: 1153
  author: El Hombre Gris
  author_email: ''
  author_url: ''
  date: '2007-07-01 20:33:00 +0000'
  date_gmt: '2007-07-01 20:33:00 +0000'
  content: De nada che, pa' servir nomas.
---
<div style="text-align:justify;">Como ejercicio para la universidad, tengo que desarrollar un servicio de presupuestaci&oacute;n para una empresa ficticia. Voy a ir publicando de a poco lo que voy haciendo, muy probablemente le sea &uacute;til a alguien m&aacute;s.</p>
<p>Notes&eacute; que vamos (somos dos personas en grupo) a estar trabajando en un sistema iterativo en espiral, por lo que en estas primeras entregas no vamos a tener el sistema terminado, sino que de a poco se ir&aacute;n acercando a la versi&oacute;n final.</div>
<p>
<div style="text-align:center;">***</div>
<div style="text-align:justify;">Mail m&iacute;o del 28/06/2007:</p>
<p>XXX,<br />para los casos de uso que vamos a implementar, tenemos que implementar las siguientes clases del modelo. No son pocas y sus relaciones no son simples, as&iacute; que lo voy a hacer lo m&aacute;s explicativo que pueda. Cualquier cosa me mand&aacute;s un mail, me llam&aacute;s, me mand&aacute;s un mensaje de texto, me golpe&aacute;s la puerta de casa, me tir&aacute;s piedras en el auto, me compr&aacute;s un sandwich de mortadela, me barr&eacute;s el piso y me program&aacute;s el sistema.</p>
<p>Antes que nada, todas las clases que vamos a hacer se denominan de modelo, es decir, son los que representan las entidades persistentes. Luego vamos a tener que implementar otros dos tipos. Las de l&oacute;gica de negocio (que, para ser ordenados, ir&aacute;n aparte), y las de interfaces (tambi&eacute;n aparte, solamente para ser ordenados).</p>
<p>Por tanto, todas las clases que explico luego ir&aacute;n en un mismo paquete, denominado <span style="font-weight:bold;">com.jarc.presupuestario.model</span>. Por qu&eacute; el nombre? Es una convenci&oacute;n que se sigue, relacionado con la forma en que se ponen los namespaces en XML o la forma inversa a como se hace en .NET... pero bue', tampoco me quiero ir de tema.</p>
<p>Otro tema es que para cada elemento, los atributos ser&aacute;n de tipo <span style="font-weight:bold;">protected</span>. La idea de esto es que sean privados, pero que si la clase es heredada por otra, pueda usarlos tambi&eacute;n. NINGUN ATRIBUTO ES P&Uacute;BLICO. Aparte de eso, cada atributo va a tener una operaci&oacute;n asociada setter y otra getter, como ya viste. Por ejemplo, atributo <span style="font-style:italic;">String nombreDeUsuario</span>, tendr&iacute;a <span style="font-style:italic;">String getNombreDeUsuario(); y void setNombreDeUsuario(String nombreDeUsuario);</span>. Los casos en donde esto no ocurre son de verdad muy pocos, en cuyo caso lo se&ntilde;alar&eacute;. En el resto, TODOS los atributos tienen su correspondiente setter y getter, respetando el mismo orden de may&uacute;sculas y min&uacute;sculas tambi&eacute;n.<br />Otra consideraci&oacute;n general: para todo lo que sea monetario, vamos a usar una clase de Java llamada <span style="font-style:italic;">BigDecimal</span>. La raz&oacute;n de esto es que al usar uno de los tipos predefinidos para decimales, como <span style="font-style:italic;">float o double</span>, nos vamos a comer un bug tremendo que ocurre en la multiplicaci&oacute;n y la divisi&oacute;n, en donde a veces te da un resultado err&oacute;neamente redondeado. En realidad no es un problema de Java sino de la representaci&oacute;n en memoria del IEEE de los comas flotantes, pero bue', nosotros usamos <span style="font-style:italic;">BigDecimal </span>y punto.</p>
<p>Vamos a la posta:</p>
<p>Dado que vamos a implementar el Login como uno de los casos de uso, vamos a tener que tener los usuarios. Esta es la clase <span style="font-weight:bold;">Usuario</span>, que tiene los campos  <span style="font-weight:bold;">nombreUsuario</span> y <span style="font-weight:bold;">password</span>, ambos <span style="font-weight:bold;">String</span>.</p>
<p>Una clase heredada de este <span style="font-weight:bold;"> Usuario</span> es <span style="font-weight:bold;">Empresario</span>. Este va a representar al tipo que se loggea como empresario, aunque en las interfaces le digamos que es administrador o algo parecido. Le dejamos ese nombre de clase porque es m&aacute;s significativo para nosotros. Por ahora tiene un solo atributo (no se me ocurri&oacute; ninguno, ac&aacute; pod&eacute;s innovar tranquilo si quer&eacute;s - solo avisame) que es <span style="font-weight:bold;">nombreResponsable</span>.<br />Otra clase que es hija de <span style="font-weight:bold;">Usuario<span style="font-weight:bold;"><span style="font-weight:bold;"> </span></span></span>es  <span style="font-weight:bold;">Cliente</span>. Esta representa al tipo que se loggea como cliente, que pide los presupuestos (dado que tambi&eacute;n vamos a implementar el caso de uso "Solicita Presupuesto"). Los datos del cliente son: <span style="font-weight:bold;">nombre, direccion, telefono, email</span>. (Notes&eacute; el uso de min&uacute;sculas y ninguna cosa rara para emular los acentos).</p>
<p>Un elemento pesadito para nuestro sistema es la clase <span style="font-weight:bold;"> Presupuesto</span>. Pero antes de esta, vamos a tener que implementar los items, dado que en realidad son estos los que mueven todo el sistema.</p>
<p>Cada tipo de item puede ser uno de tres, como ya sab&iacute;amos: un art&iacute;culo individual, un producto complejo (hecho de art&iacute;culos individuales) o un servicio.</p>
<p>Por tanto, vamos a tener una clase <span style="font-weight:bold;">Item</span> que tiene los siguientes atributos: <span style="font-weight:bold;">descripcion, nombre</span>.  <span style="font-weight:bold;"> nombre</span> es el nombre que se le da al &iacute;tem y la <span style="font-weight:bold;">descripcion</span> es toda la verdura que quiera explicar el empresario al respecto. Una nota IMPORTANTE es que adem&aacute;s esta clase contiene dos m&eacute;todos virtuales llamados <span style="font-weight:bold;">getPrecioTotal()</span> y <span style="font-weight:bold;">getCostoTotal()</span>. Estos ser&aacute;n implementados en cada uno de las clases que hereden de esta. As&iacute;, seg&uacute;n el polimorfismo, cada clase resolver&aacute; como devuelve el precio total y el costo total de ese item, sin importar si tiene que ver un solo n&uacute;mero, o recorrer dos mil.</p>
<p>Ahora, seg&uacute;n sea este item en particular, tendremos una de tres clases, correspondientes a los tres tipos de item.<br />As&iacute;, tendremos la clase <span style="font-weight:bold;">Articulo</span>. No tiene nada de loco. Tiene su  <span style="font-weight:bold;">precio </span>y su <span style="font-weight:bold;">costo</span>, los asigna y los devuelve. El <span style="font-weight:bold;">precio</span> es el precio que se usa para la venta. El <span style="font-weight:bold;"> costo </span>es el precio al cual el empresario lo compra. Obviamente, <span style="font-weight:bold;">getPrecioTotal() </span>va a devolver el <span style="font-weight:bold;">precio</span> y</p>
<p>Ahora, la clase <span style="font-weight:bold;"> Servicio</span> es distinta. Esta clase, adem&aacute;s de heredar las correspondientes de <span style="font-weight:bold;">Item</span>, va a agregar cuatro atributos. Estos son: <span style="font-weight:bold;"> nombreUnidad, precioPorUnidad, costoPorUnidad, cantidadUnidades</span>. El atributo <span style="font-weight:bold;">cantidadUnidades</span> se refiere a una cantidad entera, por lo que con un tipo <span style="font-weight:bold;"> int</span> est&aacute; bien. El motivo de que sea as&iacute; es poder medir cuestiones que no tienen un precio fijo por unidad, o que no son art&iacute;culos pero se agregan por alguna raz&oacute;n. Por ejemplo, impuestos, flete, etc. El caso del flete es el m&aacute;s vers&aacute;til, en donde todo toma sentido. Supongamos que por cada 100 metros recorridos, cueste $10, y se cobre $15. Si para vender un producto complejo se mand&oacute; un flete a 2 kms, las variables valdr&iacute;an <span style="font-style:italic;">costoPorUnidad = 10.00</span>, <span style="font-style:italic;">precioPorUnidad = 15.00</span>, <span style="font-style:italic;">nombreUnidad = "100 metros"</span>, <span style="font-style:italic;"> cantidadUnidades = 20.</span> As&iacute;, <span style="font-weight:bold;">Servicio</span> debe implementar:</div>
<ul style="text-align:justify;">
<li><span style="font-weight:bold;">getPrecioTotal() </span>como <span style="font-style:italic;">precioPorUnidad*cantUnidades </span></li>
<li><span style="font-weight:bold;">getCostoTotal() </span>como <span style="font-styl<br />
e:italic;">costoPorUnidad*cantUnidades</span></li>
</ul>
<div style="text-align:justify;">  Otro caso es el de los objetos <span style="font-weight:bold;"> ProductoComplejo</span>. Pero antes de hablar de este, voy a hablar de otra clase, una llamada <span style="font-weight:bold;">ListadoItems</span>. Esta clase <span style="font-weight:bold;">ListadoItems</span> lo que nos permite es tener encerrado en una clase todo lo necesario para poder manejar m&uacute;ltiples items como uno solo, sean del tipo que sean. Si bien para la funcionalidad que le vamos a dar en este caso de uso, podr&iacute;a usarse muy f&aacute;cilmente un ArrayList y punto, no lo vamos a hacer as&iacute; por que esto no nos permitir&iacute;a tener encerrada esa l&oacute;gica, por lo que tendr&iacute;a que estar repartida en cualquier otro lugar donde se use (y se va a usar en otros lugares). Entonces, es necesaria.<br />Esta clase, S&Iacute; tendr&aacute; dentro suyo un ArrayList de objetos <span style="font-weight:bold;">Item</span>, y tendr&aacute; los m&eacute;todos:</div>
<ul style="text-align:justify;">
<li><span style="font-weight:bold;"><span style="font-weight:bold;">Item </span> agregarItem(Item item)</span>: agrega el item pasado al ArrayList y lo devuelve.</li>
<li><span style="font-weight:bold;">removerItem(Item item)</span>: remueve el item pasado del ArrayList.</li>
<li><span style="font-weight:bold;"> <span style="font-weight:bold;">Item </span>getItem(int index)</span>: devuelve el item que est&eacute; en la posici&oacute;n <span style="font-style:italic;">index</span> del ArrayList.</li>
<li><span style="font-weight:bold;"><span style="font-weight:bold;"> int </span>getCantidadItems()</span>: devuelve la cantidad de items que hay en el ArrayList.</li>
<li><span style="font-weight:bold;">BigDecimal getPrecioTotal()</span>: devuelve la suma de todos los precios totales del ArrayList. </li>
<li><span style="font-weight:bold;">BigDecimal getCostoTotal()</span>: devuelve la suma de todos los costos totales del ArrayList.</li>
</ul>
<div style="text-align:justify;">  Con eso, tenemos lo suficiente para manejar los items, y mantener la l&oacute;gica de forma cerrada y heredable en caso necesario.</p>
<p>Esta clase ser&aacute; usada por varias otras, entre ellas el <span style="font-weight:bold;">ProductoComplejo</span>. Este tendr&aacute;, aparte de un atributo <span style="font-weight:bold;">itemsFabricadores</span> que ser&aacute; del tipo  <span style="font-style:italic;">ListadoItems</span>, un atributo <span style="font-weight:bold;">costoFabricacion </span>y un atributo <span style="font-weight:bold;">precioAgregado</span><span style="font-style:italic;"> . </span><span style="font-weight:bold;">ProductoComplejo </span>implementar&aacute;:</div>
<ul style="text-align:justify;">
<li><span style="font-weight:bold;">getPrecioTotal() </span>como<span style="font-style:italic;"> itemsFabricadores.getPrecioTotal() + precioAgregado<br /></span></li>
<li><span style="font-weight:bold;">getCostoTotal() </span>como <span style="font-style:italic;">itemsFabricadores.getCostoTotal() + costoFabricacion</span></li>
</ul>
<div style="text-align:justify;">  Finalmente, tenemos todos los elementos que conformar&aacute;n a un item, cualquiera que sea. Sea lo que sea, podr&aacute; ser contenido por una clase <span style="font-weight:bold;">Item</span>.</p>
<p>As&iacute;, estamos en condiciones de ver nuestra clase <span style="font-weight:bold;">Presupuesto</span>. Esta clase va a tener tres atributos. <span style="font-weight:bold;"> cliente</span>, de tipo <span style="font-weight:bold;">Cliente</span> (el cliente que pidi&oacute; ese presupuesto), <span style="font-weight:bold;">ordenDeCompra</span> de tipo <span style="font-weight:bold;">OrdenDeCompra</span> (IMPORTANTE: no ten&eacute;s que implementarlo. Pone en el c&oacute;digo que falta ese atributo y comentale la l&iacute;nea. Es para que no falte en el futuro). Y un &uacute;ltimo atributo llamado <span style="font-weight:bold;">estado</span>, que ser&aacute; de tipo  <span style="font-weight:bold;">EstadoPresupuesto</span>.</p>
<p>Notes&eacute; que <span style="font-weight:bold;">EstadoPresupuesto</span> no ser&aacute; una clase, sino simplemente un <span style="font-style:italic;">Enum </span> global. Para esto hac&eacute; una clase est&aacute;tica y hac&eacute; un tipo Enum ah&iacute; suelto, que quede separado del resto en una clase est&aacute;tica donde vamos a meter toda la mierda que no va instanciada en ning&uacute;n lado. Acordate que los valores que forman parte de ese enum son: <span style="font-style:italic;">Solicitado, Preparado, Rechazado, Aceptado, </span>y <span style="font-style:italic;">EnProduccion</span>.</p>
<p>PD: Te mando una imagen con un diagrama de estas clases. En lugar de ayudarte te va a complicar m&aacute;s y te acerca en un 0.05% a la embolia cerebral. Pero es un problema que resuelve tu instancia, no la m&iacute;a. xD</p>

![](/assets/Clases+Iteracion+1.GIF)

PD 2:  Me olvid&eacute; de decir que la clase <span style="font-weight:bold;">Presupuesto</span> es hija de la clase  <span style="font-weight:bold;">ListadoItems</span>. Esto es porque debe tener toda la funcionalidad que tiene un listado de items. De hecho, es b&aacute;sicamente un listado con un poco m&aacute;s de funcionalidad. Me olvid&eacute; de mencionarlo pero en el diagrama est&aacute; indicado.</p>
<p><span style="font-style:italic;">Soy un zorrinito dise&ntilde;ador.</span></div>
