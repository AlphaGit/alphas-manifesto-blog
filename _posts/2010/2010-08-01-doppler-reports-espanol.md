---
layout: post
title: Doppler Reports (Español)
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
- computación distribuída
- Doppler
- email
- modular
- tiempo real
- reporte
---

## Hola a todos

Me enorgullece poder anunciar que desde hace un tiempo he tenido la oportunidad de trabajar junto con el equipo Doppler para un nuevo proyecto, algo que desde entonces se estaba formando llamado [Doppler Reports](http://www.fromdoppler.com/Website/source/English/feat_reports.aspx) (link). Este proyecto finalmente vio la luz y está activo públicamente desde el 27 de Julio. Permítanme contarles un poco más sobre eso.

**Momento...  ¿qué es Doppler?**

![Doppler]({{ site.baseurl }}/assets/Doppler.png){ :align-left}

Para aquellos que no lo conocen, [Doppler](http://www.fromdoppler.com) es una herramienta de **email-marketing**. Es realmente compleja, pero explicándola en un vistazo rápido, es posible usarla para crear contenido de email online (basado en plantillas o editandolo manualmente), y enviarlo masivamente a una o más listas pre-cargadas. Sim embargo, hay mucho más para lo que puede utilizarse, y una de las grandes posibilidades que nos ofrece está en la capacidad de analizar la reacción del cliente a nuestras campañas de emails. Cuando uno tiene diez, quizá veinte, cincuenta o cien contactos, esto es algo que se puede hacer fácilmente con un listado de ellos. Uno verifica sus contactos, analiza quién abrió los emails enviados, quién hizo click en cuál link, y esa es toda la información que uno necesita.

##  ¿Reportes?

Las cosas cambiaron mucho desde [esa mañana del 2005](http://blog.fromdoppler.com/feliz-cumpleanos-doppler).  ¿Qué pasa cuando tienes mil contactos?  ¿Y un millón? No, no estoy exagerando. Eso es parte de nuestro trabajo *diario*: mantener una herramienta que envía millones de emails.  ¿Cómo obtenemos los resultados y los mostramos al usuario? La respuesta obvia es: Reportes.

Los reportes  te darán toda la información resumida que necesitas sin tener que revisar cada uno de los contactos (porque, por supuesto, el sistema lo hace por tí). A medida que la tecnología evoluciona y que el comportamiento del cliente evoluciona a medida que el marketing evoluciona, nuestras herramientas deben evolucionar también.

Aquí es donde el Equipo de Doppler vio la necesidad de una aplicación de reportes totalmente nueva, para poder satisfacer muchos pedidos que nuestros clientes tenían para la versión anterior de la misma. Pero esta herramienta debía estar pensada para **millones** de emails, **miles** de usuarios, información en **tiempo real** y al mismo tiempo, reportes **informativos** y **elegantes**.

Y entramos en la escena. Tuve la oportunidad de trabajar junto con [Juan Fazzini](http://ar.linkedin.com/in/juanfazzini) para diseñar una arquitectura que escalaría a medida que Doppler siguiera creciendo con todas las futuras características que obtendrá. Entonces, en una tarde de viernes, un pizarrón en blanco, una notebook como grabadora para todo lo que decíamos (ya saben, la documentación es importante), comenzamos a idear y pensar sobre cómo Doppler Reports trabajaría.

**¿Cómo está diseñada la arquitectura?**

### **1. Arquitectura distribuida**

![Distributed architecture]({{ site.baseurl }}/assets/ModularAndDistributed.png){ :align-right}

Cada parte de Doppler funcionará como un módulo independiente, que puede tener varias instancias funcionando al mismo tiempo. Hay un módulo en especial que se encargará de interconectar a los demás entre ellos, pero estos módulos de interconexión pueden trabajar de forma independiente también.

Esto significa que ahora tenemos **mayor tolerancia a errores catastróficos**. Si un servidor deja de funcionar, las otras instancias de los módulos seguirán trabajando, manteniendo al sistema con funcionamiento normal. Los usuarios no se darán cuenta, apenas puede que noten una demora pequeña en la aplicación.

También significa que si tenemos mucha carga por uso intensivo, podemos crear nuevas instancias de un módulo y los módulos de interconexión automáticamente balancearán la carga.

### **2. Seguridad en cada llamada**

![Keys and lock]({{ site.baseurl }}/assets/Keys.png)

Tener estos módulos ahí afuera no es poca cosa para la seguridad. La seguridad tiene que ser tan estricta como es posible. Por eso, desarrollamos un protocolo de comunicación que le permitiría a cada módulo verificar si el que llama al mismo es una aplicación autorizada y si está bien devolver datos a la misma. Si todo funciona bien, la llamada se realiza y los datos se devuelven. Si algo no sale bien, como si se provee un token de autorización incorrecto, nunca se sabrá qué pasó. Sabemos que esto no es particularmente transparente para los programadores, pero **es lo más seguro** que podemos realizar para prevenir intentos de hacking.

El resultado de esta característica es que, incluso cuando los módulos estén disponibles en Internet (no todavía, pero quizás en algún momento lo estén), no cualquiera puede acceder a ellos. Incluso si saben en dónde están o cómo llamarlos, ellos no harían nada hasta que los clientes le provean un token de seguridad auténtico.

También significa que las claves de seguridad para acceder a este módulo se pueden generar y, en el futuro, podría resultar en una API para ciertos módulos de Doppler que cualquiera (o algunos usuarios) podrían utilizar. _ ¿Imaginas crear una aplicación para tu propia empresa que automáticamente trabaje con los datos que Doppler generó para tí?_

### **3. Reportes en tiempo real**

Más que una decisión arquitectural, esto fue un desafío. Ya se sabe que estamos manejando toneladas de datos.  ¿Cómo cargarlos rápidamente?  ¿Cómo obtener una buena performance? Para eso, decidimos que algunos objetos trabajarían internamente como proxies, de forma que sólo se obtendría la información que se ve.

Esto significa que ahora al entrar a la pantalla de **Resumen de Métricas** para una de tus campañas, podrías ver (_cuidado... se viene un listado grande_):

![]({{ site.baseurl }}/assets/Time.png)

- Nombre de la campaña
- Asunto del email de la campaña
- Tipo de campaña
- Cantidad de listados de emails que recibieron la campaña
- Cuántos suscriptores recibieron la campaña
- Cuándo se envió la campaña
- Aperturas por cada hora
- Clicks por cada hora
- Cuántos emails fueron abiertos (total)
- Cuántos emails todavía no han sido abiertos
- Cuántos emails resultaron en soft-bounce
- Cuántos emails resultaron en hard-bounce
- última fecha de apertura
- Clicks únicos
- Aperturas únicas
- Cada uno de los links
- Para cada link, cuántos suscriptores hicieron click en ellos
- Para cada país del mundo, cuántas aperturas ocurrieron en ese país

_*toma aire*_  ¿Saben cuánto tiempo le toma a Doppler Reports obtener y mostrar toda esa información? Menos de 5 segundos. Pongo énfasis en ello: **Menos. De. Cinco. Segundos.** Ese es el tiempo que me toma leer las primeras tres líneas de la página. Quizá cuatro, quizá cinco. Pero antes de que haya terminado de hacerlo, la página está completamente cargada y funcionando. Y debo aclarar, mi conexión a internet no se destaca por su velocidad.

Por supuesto, también usamos caching. Esto agrega una capa más de interacción hasta los datos, pero nuestro sistema de caching nos asegura que tengamos los datos listos para el usuario en el momento que los pida. Los datos de una campaña no cambian mucho, a menos que se acabara de enviar, por lo que, para la gran mayoría de los casos, **podrías ver los datos de tu campaña tan rápido como cualquier otra página web**.

### **4. Diseño modular**

![]({{ site.baseurl }}/assets/Puzzle.png)

Mencioné antes que Doppler ha comenzado a ser más y más complejo, y ahora está siendo diseñado de una forma modular. De esta forma, los módulos trabajan independientemente y a la vez, delegan responsabilidad en el módulo que sabe cómo resolver un cierto problema o cómo tratar cierto conjunto de datos. Tener un diseño modular es un aspecto terriblemente importante para cambios futuros. Le permite a nuestro equipo paralelizar el trabajo, y le permite a nuestro equipo (y a nuestra aplicación) crecer.

Esto tiene importantes consecuencias. Para el lado que el usuario logra ver, esto significa que muchas características estarán disponibles más rápidamente. **Nuevas características, más mejoras, más robusto, más rápido, mejor.** "Harder, faster, better, stronger.", como Daft Punk recomienda construir el software.

## Eso es increíble, ¿puedo usarlo?

Por supuesto. Estas nuevas características ya están disponibles para todos los usuarios que tengan una cuenta de Doppler. Si no tienes una, puedes crearte una de forma gratuita y probar el producto por tí mismo: [http://www.FromDoppler.com/](http://www.fromdoppler.com/).

## Antes de que se vayan...

...Quería decir que considero un logro personal haber podido formar parte de todo esto. Intentamos lograr algo radical y hoy tenemos un producto radical. Creo que el [Equipo Doppler](http://www.fromdoppler.com/Website/source/English/company.aspx) está muy orgulloso de lo que han logrado. Yo ciertamente lo estoy.

Ah, y este post ha llegado hasta el blog de [GetCS](http://getcs.com/en/2010/07/doppler-reports/). Visitenló, puede que les interese.
