---


title: 'Link del día: Minify'
date: '2011-06-20 11:36:47 +0000'
date_gmt: '2011-06-20 13:36:47 +0000'
categories:
- Link del día
tags:
- JavaScript
- performance
- CSS
- desarrollo web
- PHP
- librería

---


Tratando de retomar la periodicidad de los links del día, hoy quiero hablar de Minify. [Minify](http://code.google.com/p/minify/) es una librería PHP de código abierto autocontenida que podemos utilizar para minimizar, unificar, cachear y definir nombres propios para recursos que queremos utilizar y mejorar la performance de nuestro sitio.

La librería no sólo soporta el trabajo con CSS, JS y HTML, minimizándolo completamente, sino que además puede ser utilizado para minimizar recursos bajo un solo nombre, y mejor aún, también es extensible para que podamos servir cualquier tipo de contenido de cualquier otra fuente. De hecho, lo probé cacheando y sirviendo recursos desde un sitio propio cuando los recursos en realidad son leídos de un lugar ajeno. Las ventajas de eso son el poder servir todo el JavaScript/CSS junto incluso aunque no nos pertenezcan, y ahorramos pedidos, y evitamos que el cliente deba acceder a múltiples dominios.

Y lo mejor, ni siquiera tenemos que andar haciendo referencia a los nombres de los archivos (aunque es la forma más fácil), ya que podemos definir grupos con nombres y utilizarlos. Eso nos brinda la ventaja de poder jugar mucho con eso y con el dinamismo de nuestra aplicación.

Pero en fin, lo interesante es la forma en la que minimiza, y lo simple que es de usar. ¡Dénle un intento!

_Soy un zorrinito minimizado._
