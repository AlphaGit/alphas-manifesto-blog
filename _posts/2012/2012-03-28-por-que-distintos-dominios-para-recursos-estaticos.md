---

title: " ¿Por qué distintos dominios para recursos estáticos?"
date: '2012-03-28 08:39:50 +0000'
date_gmt: '2012-03-28 13:39:50 +0000'
categories:
- Link del día
- Technology
tags:
- Google
- performance
- Twitter
- Facebook
- navegadores
- URL
- HTTP
- cookies
- pregunta
- respuesta
- estándar
- bandwidth
- dominio
sub_title: La razón detrás de las URLs raras...
---

Sabemos que el nombre no es más que un nombre y que no importa cuál sea el servidor actual en donde se están alojando los datos, pero parecería que es una práctica común de muchos sitios grandes (léase: Facebook, Twitter, Google, etc.) hacer referencia a muchos de sus recursos en dominios externos. Por ejemplo, las imágenes de Facebook se encuentran alojadas debajo de _http://static.ak.fbcdn.net/_ y no debajo de _http://www.facebook.com/_, ni siquiera debajo de _http://imgs.facebook.com/_.  ¿Por qué?

Alguien [ya hizo esa pregunta](http://webmasters.stackexchange.com/questions/26753/why-do-big-sites-host-their-images-css-on-external-domains) y [la respuesta](http://webmasters.stackexchange.com/a/26757/9403) fue nueva para mí: hay una limitación en varios browsers (y hastas donde yo sabía, algunos sistemas operativos) que previene hacer más de dos, tres o cuatro conexiones simultáneas a un mismo hostname. De hecho, es parte de la especificación HTTP 1.1 (parece que cumplir el estándar no siempre está tan bueno,  ¿no?). Ahora, si notaron, la limitación es por hostname,  ¿por qué entonces utilizar distintos dominios? <del>La razón es evitar cookies que pueden estar yendo y volviendo en cada uno de los pedidos, y para evitar eso, se puede usar un dominio extra que nunca devuelva cookies. De esa forma, sitios grandes como estos se ahorran **mucho** bandwidth.</del>

**UPDATE:** Gracias a [Exos](http://blog.exodica.com.ar/), que claramente estaba más informado que yo en este tema, las limitaciones exactas son de tres conexiones por cada dominio y cinco para cada IP. Los distintos dominios/subdominios ayudan a utilizar CDNs para distribución de contenido con mayor velocidad. Exos está en desacuerdo (y demuestra por qué, miren los comentarios) con que las cookies sean una gran carga respecto del bandwidth. Entonces el por qué de los dominios vs. subdominios queda en duda, pero suponemos que debe estar relacionado con políticas de administración interna de cada empresa.

_Soy un zorrinito performante._
