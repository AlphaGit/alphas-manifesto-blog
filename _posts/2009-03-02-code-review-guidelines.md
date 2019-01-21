---
layout: post
title: Code review guidelines
wordpress_url: http://blog.alphasmanifesto.com.ar/?p=1032
date: '2009-03-02 00:40:50 +0000'
date_gmt: '2009-03-02 02:40:50 +0000'
categories:
- Projects
- Technology
tags: []
---

En estos días mientras anduve haciendo los code reviews se me ocurrió estandarizar de alguna forma cómo podrían estos hacerse y de qué forma podría "puntuarse" al código evaluado en cuestión. Por ahora, eso último queda pendiente (ya que es lo más difícil de determinar y no lo más útil), pero lo primero se convirtió en un conjunto de categorías y puntos que pueden ser muy interesantes tener en cuenta al momento de ver el código y ver qué se puede mejorar de él.

Seguro que esta lista que viene a continuación está lejos de estar completa, y que se podrían agregar y quitar un montón de cosas, pero lo tiro como una introducción a esto que quiero (queremos?) terminar de formar, que nos puede llegar a ser muy útil.

PD: No creo que nada de esto sea "requerido" para que un sistema esté "bien", sino que partiendo de que funciona, podemos decir "qué tan bien" o "qué tan mal" estamos.

**Estandarización / Legibilidad de código**

_¿El código está comentado explicativamente?_

El código debería estar acompañado de comentarios que expliquen qué es lo que se está haciendo y por qué más allá de explicar el cómo. A la vez, el código debería ser lo suficientemente claro como para que se entienda cómo es que se está resolviendo un problema en particular.

_¿Los nombres son significativos?_

Debería entenderse qué función tiene una variable, un método o una clase cuando se lee el nombre que se le dio.

_¿El código de una clase accede a la información que necesita de forma correcta?_

Si una clase necesita información de otras debería pedirla en los parámetros de sus métodos o en su constructor. Las propiedades también son una buena opción.

_¿El código se encuentra correctamente modularizado?_

El código de un método no debería excederse en tamaño, y debería ser explicativo en unas pocas líneas de código sobre qué es lo que está haciendo. De ser compleja su acción, debería repartirse en varios pasos que se desdoblen en todo lo que deban hacer.

**Arquitectura**

_¿Se respeta el concepto de la arquitectura propuesta?_

Sea cual sea la arquitectura propuesta para la aplicación, debería respetarse el esquema que esta propone, poniendo la lógica de la aplicación en donde esta debería estar, el acceso a datos en otro lado, etc.

_¿Se encuentran separadas las capas de la misma lo suficiente?_

De existir distintas capas en la arquitectura, estas deberían encontrarse lo suficientamente separadas como para depender de cada otra sólo como distintos módulos de un sistema y nunca según su implementación.

_¿Qué tan fácil sería camiar alguna de las capas por una implementación distinta?_

Como medición de la independencia de las capas, el acto de crear una nueva implementación para una de ellas debería ser tan costoso como la implementación misma y no más que eso. De ser de otra forma, existe dependencia en la implementación de las capas.

**Code-coverage**

_¿Existe un testing definido para el código escrito?_

Debería existir alguna forma de probar el código escrito, cualquiera sea su metodología.

_¿Las pruebas testean que el código devuelva resultados correctos en escenarios esperados?_

Las pruebas deberían testear, como caso esencial, que el sistema se comporte correctamente ante determinados escenarios.

_¿Las pruebas testean el comportamiento del código en escenarios no esperados?_

Las pruebas deberian testear, como caso adicional, determinadas situaciones no comunes, o incluso situaciones que no deberían darse, para poder probar la forma en la que el sistema responde al mismo.

_¿Ocurre esto último con cada uno de los datos de entrada?_

Las pruebas con elementos erróneos o inesperados deberían variarse para cada uno de los datos de entrada, pudiendo evaluar qué tan sensible es el sistema a la variación de cada uno de estos.

_¿Ocurre esto último con combinaciones de los datos de entrada?_

La misma situación es aplicable a la combinación de distintos datos de entrada. A veces la variación de los datos de entrada de forma individual no genera problemas, pero una determinada combinación de los mismos, sí. Así también puede evaluarse la correlación que tienen estos datos de entrada respecto del funcionamiento del sistema.

**Estabilidad**

_¿Qué parte del código se encuentra atrapando excepciones o situaciones no esperadas?_

El sistema debería programarse considerando que pueden darse situaciones adversas que puedan afectar el correcto funcionamiento de los bloques sobre los que depende. Si bien un extremo de esto llevaría a la reescritura de todo el código en cada capa superior (lo cual no sólo es imposible sino indeseable), debe considerarse que un bloque del que dependemos, cuanto menos, no esté disponible.

_¿Cómo se comporta la lógica de tratamiento de errores?_

Un sistema debería tener al menos una rutina de tratamiento de errores, que controle la situación o alerte al usuario.

_¿Puede una situación imprevista alterar el funcionamiento del sistema?_

La ocurrencia de un error o una situación no esperada no debería generar comportamientos no esperados del sistema. Posiblemente resultados erróneos, pero el comportamiento del sistema debería mantenerse estable.

**Flexibilidad**

_¿Cuánta información utilizada es parametrizable, versus la que se encuentra codificada en el sistema?_

La información que se considera "fija" para el sistema debería poderse parametrizar, para otorgar más flexibilidad en casos especiales en donde la misma se viera sujeta a cambios.

_¿Es extensible el funcionamiento del sistema o sus funcionalidades?_

En caso de no poderse alterar el código de la aplicación, debería existir cierta posibilidad de agregarle funcionalidad desde la entrada o la salida de datos.

_¿Qué tanto afecta al sistema agregar una funcionalidad?_

En caso de tener que agregar una funcionalidad al sistema, la menor cantidad de módulos deberían verse afectados, y nunca debería verse afectado el código de otras funcionalidades.

_¿Qué tanto afecta al sistema quitar una funcionalidad?_

En caso de tener que quitar o deshabilitar una funcionalidad al sistema, el código de las demás funcionalidades no debería verse afectado.

_¿Qué tanto afecta al sistema el modificar la implementación de una funcionalidad?_

En caso de tener que alterar una funcionalidad del sistema, el código de las demás funcionalidades no debería verse afectado.

_¿Cuánto afecta al sistema que cambien las reglas de negocios?_

Si las reglas de negocio que definen el comportamiento del sistema cambiaran, sería deseable que la menor parte del sistema se volvería obsoleto, y que el resto pudiera ser reusado para la implementación de las nuevas reglas de negocios.

**Recursos**

_¿Qué recursos requiere el sistema para su funcionamiento?_

Sería deseable que un sistema requiera la menor cantidad de recursos posibles. Estos incluyen tanto la utilización de procesador, memoria, tiempo de ejecución, sistemas sobre los que depende, bases de datos, archivos en disco, etc.

_¿Cuánto tiempo hace uso de los recursos versus cuánto tiempo los retiene ociosos?_

Sería deseable que en el momento mismo en que el sistema ya no hace uso de un recurso, lo libere. A veces esto puede ser contraproducente por cuestiones de performance, pero de todos modos sería deseable que lo haga.

**Performance**

_¿Cuánto tiempo requiere el más pesado de los procesos que efectúa el sistema?_

Los procesos que requieren mucho tiempo de ejecución deberían ser optimizados al máximo posible, ya que en ellos se encuentra el peor de los casos que el sistema puede encontrar.

_¿Cuántos cuellos de botella se identifican en el flujo de información / acciones del sistema?_

Sería deseable que existan alternativas para que un punto en particular no sea determinante de no poder utilizar el sistema. A veces las reglas de negocios requieren que así sea, pero de no ser necesario, es deseable que existan vías alternativas de continuar con el flujo de utilización del mismo.

**Seguridad**

_¿Cuántos datos de entrada son validados por el sistema en cuanto a su tipo de datos?_

Los datos que entran al sistema deberían controlarse si son válidos para el tipo de datos que deben representar. Ejemplo típico es el de los datos numéricos, o de fecha, que muchas veces se leen simplemente como cadenas.

_¿Cuántos datos de entrada son validades en cuanto a sus restricciones según su uso?_

Los datos también deberían validarse según su contenido, es decir, que contengan un valor que tenga sentido en el ámbito en el que se necesita usar. Ejemplo, una fecha de nacimiento del 1/1/0001.

_¿Qué medidas toma el sistema para la protección de los distintos recursos que utiliza?_

Algunos datos alteran el funcionamiento del sistema (recursos tiempo de ejecución, memoria, etc) y otros se envían a ser almacenados en determinados recursos del sistema (recursos de bases de datos, archivos, etc). Todos estos recursos deben verse protegidos de datos que hagan al sistema abusar de ellos, como ser por ejemplo los loops infinitos, el escalado de prioridades, SQL Injection, XSS, etc.

_¿Qué usuarios tienen acceso a la utilización del sistema y cuáles no?_

Es deseable que el sistema restrinja el acceso a los usuarios que efectivamente deben hacer uso de él y tienen permitido acceder a la información que el sistema maneja.

_¿Qué usuarios tienen acceso a la administración o configuración del sistema y cuáles no?_

De la misma manera, el sistema debería restringir el acceso solo a determinados usuarios que puedan modificar su configuración o comportamiento. A veces es incluso deseable que este perfil de usuarios no puedan tener acceso al resto de la información que el sistema utiliza, sino solo a la información de configuración en sí.
