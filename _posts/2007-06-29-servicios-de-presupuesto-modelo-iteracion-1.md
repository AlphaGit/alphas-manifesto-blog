---
layout: post
status: publish
published: true
title: Servicios de Presupuesto - Modelo Iteración 1
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
  content: 'Pregunta Sr.Zorrino:  ¿no hacen la fase de inicio del Proceso Unificado?'
- id: 1150
  author: Alpha
  author_email: ''
  author_url: ''
  date: '2007-07-01 16:20:00 +0000'
  date_gmt: '2007-07-01 16:20:00 +0000'
  content: 'Qué tal, Grisáceo.<br/><br/>Sí y no es la respuesta.
    En realidad acá, trabajando sobre procesos iterativos, la parte de lo que
    sería inicio del proceso unificado se reduce casi a nulo, y se reparte
    en cada una de las iteraciones.<br/><br/>Lo único que se hace al comienzo
    es el relevamiento, pero no en detalle, lo cual es algo que me choca profundamente.
    Es como dividir el proyecto en varias iteraciones, en cada una de las cuales vas
    a desarrollar casos de uso, según lo difícil que te "parezcan" hacerlos.
    <br/><br/>Sobre esa base, luego en cada iteración tenés que implementar
    dichos casos de uso...<br/><br/>..pero existe una fase de inicio en donde se ve
    el sistema como un completo y se trata de especificar las condiciones globales
    del proyecto.<br/><br/>En definitiva, no sabría qué responderte
    con exactitud.<br/><br/>Te dejo para más info el blog de referencia de
    un profesional que trabaja en el asunto: www.fernandosoriano.com.ar<br/><br/>SldZ.-'
- id: 1151
  author: El Hombre Gris
  author_email: ''
  author_url: ''
  date: '2007-07-01 19:38:00 +0000'
  date_gmt: '2007-07-01 19:38:00 +0000'
  content: 'Ojo, creo que estás confundiendo el proceso unificado con un modelo
    en cascada. El proceso unificado es un modelo iterativo, donde está planteado
    un modelo genérico de iteraciones clasificadas en etapas, donde en realidad
    la primera etapa tiene un artifact para definir que cambios se deben contemplar
    sobre el proceso unificado para el proyecto en curso, o sea que en realidad funciona
    como guideline.<br/><br/>Hechale un vistazo al libro de Larman que les dio como
    bibliografía.<br/><br/>De todas maneras me sorprendió que no tuvieran
    esta primera iteración, que dura muy poco, y su iteración 1 fuera
    ya de elaboración. Tal vez la primera iteración la hicieron en clase,
    o se las dio el profesor en la consigna.<br/><br/>Igual estaría bueno verlo
    eso como para entender la totalidad del trabajo. O sea, estas cosas: análisis
    del negocio, casos de uso y actores identificados, detalle del caso de uso principal
    (o casos de uso principales). Lo que expones acá se parece al plan de iteración,
    artifact que se genera en la iteración inicial y planifica la siguiente
    iteración.'
- id: 1152
  author: Alpha
  author_email: ''
  author_url: ''
  date: '2007-07-01 19:59:00 +0000'
  date_gmt: '2007-07-01 19:59:00 +0000'
  content: 'Tan groso como siempre.<br/><br/>Efectivamente: yo estaba confundiendo
    el proceso unificado con modelos en cascada.<br/><br/>Respecto de la primera iteración,
    eso sí lo tengo claro. La primera iteración en realidad es de definición
    del proyecto, que ya la hicimos, pero no la incluimos en la numeración
    solo para tener numeradas las iteraciones que serán similares entre sí.<br/><br/>Gracias
    Grisáceo, como siempre sacándome las papas del fuego.'
- id: 1153
  author: El Hombre Gris
  author_email: ''
  author_url: ''
  date: '2007-07-01 20:33:00 +0000'
  date_gmt: '2007-07-01 20:33:00 +0000'
  content: De nada che, pa' servir nomas.
---

Como ejercicio para la universidad, tengo que desarrollar un servicio de presupuestación para una empresa ficticia. Voy a ir publicando de a poco lo que voy haciendo, muy probablemente le sea útil a alguien más.

Notesé que vamos (somos dos personas en grupo) a estar trabajando en un sistema iterativo en espiral, por lo que en estas primeras entregas no vamos a tener el sistema terminado, sino que de a poco se irán acercando a la versión final.

---

Mail mío del 28/06/2007:

> XXX,
> 
> para los casos de uso que vamos a implementar, tenemos que implementar las siguientes clases del modelo. No son pocas y sus relaciones no son simples, así que lo voy a hacer lo más explicativo que pueda. Cualquier cosa me mandás un mail, me llamás, me mandás un mensaje de texto, me golpeás la puerta de casa, me tirás piedras en el auto, me comprás un sandwich de mortadela, me barrés el piso y me programás el sistema.
> 
> Antes que nada, todas las clases que vamos a hacer se denominan de modelo, es decir, son los que representan las entidades persistentes. Luego vamos a tener que implementar otros dos tipos. Las de lógica de negocio (que, para ser ordenados, irán aparte), y las de interfaces (también aparte, solamente para ser ordenados).
> 
> Por tanto, todas las clases que explico luego irán en un mismo paquete, denominado **com.jarc.presupuestario.model**. Por qué el nombre? Es una convención que se sigue, relacionado con la forma en que se ponen los namespaces en XML o la forma inversa a como se hace en .NET... pero bue', tampoco me quiero ir de tema.
> 
> Otro tema es que para cada elemento, los atributos serán de tipo **protected**. La idea de esto es que sean privados, pero que si la clase es heredada por otra, pueda usarlos también. NINGUN ATRIBUTO ES PúBLICO. Aparte de eso, cada atributo va a tener una operación asociada setter y otra getter, como ya viste. Por ejemplo, atributo _String nombreDeUsuario_, tendría _String getNombreDeUsuario(); y void setNombreDeUsuario(String nombreDeUsuario);_. Los casos en donde esto no ocurre son de verdad muy pocos, en cuyo caso lo señalaré. En el resto, TODOS los atributos tienen su correspondiente setter y getter, respetando el mismo orden de mayúsculas y minúsculas también.
> 
> Otra consideración general: para todo lo que sea monetario, vamos a usar una clase de Java llamada _BigDecimal_. La razón de esto es que al usar uno de los tipos predefinidos para decimales, como _float o double_, nos vamos a comer un bug tremendo que ocurre en la multiplicación y la división, en donde a veces te da un resultado erróneamente redondeado. En realidad no es un problema de Java sino de la representación en memoria del IEEE de los comas flotantes, pero bue', nosotros usamos _BigDecimal _y punto.
> 
> Vamos a la posta:
> 
> Dado que vamos a implementar el Login como uno de los casos de uso, vamos a tener que tener los usuarios. Esta es la clase **Usuario**, que tiene los campos  **nombreUsuario** y **password**, ambos **String**.
> 
> Una clase heredada de este ** Usuario** es **Empresario**. Este va a representar al tipo que se loggea como empresario, aunque en las interfaces le digamos que es administrador o algo parecido. Le dejamos ese nombre de clase porque es más significativo para nosotros. Por ahora tiene un solo atributo (no se me ocurrió ninguno, acá podés innovar tranquilo si querés - solo avisame) que es **nombreResponsable**.
> 
> Otra clase que es hija de **Usuario** es **Cliente**. Esta representa al tipo que se loggea como cliente, que pide los presupuestos (dado que también vamos a implementar el caso de uso "Solicita Presupuesto"). Los datos del cliente son: **nombre, direccion, telefono, email**. (Notesé el uso de minúsculas y ninguna cosa rara para emular los acentos).
> 
> Un elemento pesadito para nuestro sistema es la clase ** Presupuesto**. Pero antes de esta, vamos a tener que implementar los items, dado que en realidad son estos los que mueven todo el sistema.
> 
> Cada tipo de item puede ser uno de tres, como ya sabíamos: un artículo individual, un producto complejo (hecho de artículos individuales) o un servicio.
> 
> Por tanto, vamos a tener una clase **Item** que tiene los siguientes atributos: **descripcion, nombre**.  ** nombre** es el nombre que se le da al ítem y la **descripcion** es toda la verdura que quiera explicar el empresario al respecto. Una nota IMPORTANTE es que además esta clase contiene dos métodos virtuales llamados **getPrecioTotal()** y **getCostoTotal()**. Estos serán implementados en cada uno de las clases que hereden de esta. Así, según el polimorfismo, cada clase resolverá como devuelve el precio total y el costo total de ese item, sin importar si tiene que ver un solo número, o recorrer dos mil.
> 
> Ahora, según sea este item en particular, tendremos una de tres clases, correspondientes a los tres tipos de item.
> 
> Así, tendremos la clase **Articulo**. No tiene nada de loco. Tiene su  **precio** y su **costo**, los asigna y los devuelve. El **precio** es el precio que se usa para la venta. El **costo** es el precio al cual el empresario lo compra. Obviamente, **getPrecioTotal()** va a devolver el **precio** y
> 
> Ahora, la clase ** Servicio** es distinta. Esta clase, además de heredar las correspondientes de **Item**, va a agregar cuatro atributos. Estos son: ** nombreUnidad, precioPorUnidad, costoPorUnidad, cantidadUnidades**. El atributo **cantidadUnidades** se refiere a una cantidad entera, por lo que con un tipo ** int** está bien. El motivo de que sea así es poder medir cuestiones que no tienen un precio fijo por unidad, o que no son artículos pero se agregan por alguna razón. Por ejemplo, impuestos, flete, etc. El caso del flete es el más versátil, en donde todo toma sentido. Supongamos que por cada 100 metros recorridos, cueste $10, y se cobre $15. Si para vender un producto complejo se mandó un flete a 2 kms, las variables valdrían _costoPorUnidad = 10.00_, _precioPorUnidad = 15.00_, _nombreUnidad = "100 metros"_, _cantidadUnidades = 20._ Así, **Servicio** debe implementar:
> 
> - **getPrecioTotal() **como _precioPorUnidad*cantUnidades_
> - **getCostoTotal() **como _costoPorUnidad*cantUnidades_
> 
> Otro caso es el de los objetos ** ProductoComplejo**. Pero antes de hablar de este, voy a hablar de otra clase, una llamada **ListadoItems**. Esta clase **ListadoItems** lo que nos permite es tener encerrado en una clase todo lo necesario para poder manejar múltiples items como uno solo, sean del tipo que sean. Si bien para la funcionalidad que le vamos a dar en este caso de uso, podría usarse muy fácilmente un ArrayList y punto, no lo vamos a hacer así por que esto no nos permitiría tener encerrada esa lógica, por lo que tendría que estar repartida en cualquier otro lugar donde se use (y se va a usar en otros lugares). Entonces, es necesaria.
> 
> Esta clase, Sí tendrá dentro suyo un ArrayList de objetos **Item**, y tendrá los métodos:
> 
> - **Item agregarItem(Item item)**: agrega el item pasado al ArrayList y lo devuelve.
> - **removerItem(Item item)**: remueve el item pasado del ArrayList.
> - **Item getItem(int index)**: devuelve el item que esté en la posición _index_ del ArrayList.
> - **int getCantidadItems()**: devuelve la cantidad de items que hay en el ArrayList.
> - **BigDecimal getPrecioTotal()**: devuelve la suma de todos los precios totales del ArrayList.
> - **BigDecimal getCostoTotal()**: devuelve la suma de todos los costos totales del ArrayList.
> 
> Con eso, tenemos lo suficiente para manejar los items, y mantener la lógica de forma cerrada y heredable en caso necesario.
> 
> Esta clase será usada por varias otras, entre ellas el **ProductoComplejo**. Este tendrá, aparte de un atributo **itemsFabricadores** que será del tipo  _ListadoItems_, un atributo **costoFabricacion** y un atributo **precioAgregado** . **ProductoComplejo** implementará:
> 
> - **getPrecioTotal()** como _itemsFabricadores.getPrecioTotal() + precioAgregado_
> - **getCostoTotal()** como _itemsFabricadores.getCostoTotal() + costoFabricacion_
> 
> Finalmente, tenemos todos los elementos que conformarán a un item, cualquiera que sea. Sea lo que sea, podrá ser contenido por una clase **Item**.
> 
> Así, estamos en condiciones de ver nuestra clase **Presupuesto**. Esta clase va a tener tres atributos. ** cliente**, de tipo **Cliente** (el cliente que pidió ese presupuesto), **ordenDeCompra** de tipo **OrdenDeCompra** (IMPORTANTE: no tenés que implementarlo. Pone en el código que falta ese atributo y comentale la línea. Es para que no falte en el futuro). Y un último atributo llamado **estado**, que será de tipo  **EstadoPresupuesto**.
> 
> Notesé que **EstadoPresupuesto** no será una clase, sino simplemente un _Enum_ global. Para esto hacé una clase estática y hacé un tipo Enum ahí suelto, que quede separado del resto en una clase estática donde vamos a meter toda la mierda que no va instanciada en ningún lado. Acordate que los valores que forman parte de ese enum son: _Solicitado, Preparado, Rechazado, Aceptado,_ y _EnProduccion_.
> 
> PD: Te mando una imagen con un diagrama de estas clases. En lugar de ayudarte te va a complicar más y te acerca en un 0.05% a la embolia cerebral. Pero es un problema que resuelve tu instancia, no la mía. xD
> 
> ![]({{ site.baseurl }}/assets/Clases+Iteracion+1.GIF)
> 
> PD 2:  Me olvidé de decir que la clase **Presupuesto** es hija de la clase  **ListadoItems**. Esto es porque debe tener toda la funcionalidad que tiene un listado de items. De hecho, es básicamente un listado con un poco más de funcionalidad. Me olvidé de mencionarlo pero en el diagrama está indicado.

_Soy un zorrinito diseñador._
