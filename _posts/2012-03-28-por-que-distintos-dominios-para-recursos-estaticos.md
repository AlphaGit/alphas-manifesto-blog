---
layout: post
status: publish
published: true
title: " ¿Por qué distintos dominios para recursos estáticos?"
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 3740
wordpress_url: http://blog.alphasmanifesto.com/?p=3740
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
comments:
- id: 8830
  author: Exos
  author_email: tioscar@gmail.com
  author_url: http://blog.exodica.com.ar
  date: '2012-03-28 10:06:04 +0000'
  date_gmt: '2012-03-28 15:06:04 +0000'
  content: "La limitación es tanto por dominio como por ip, si no me equivoco
    son 3 conexiones por dominio, y 5 por IP, y no es malo, es para evitar que los
    browsers \"maten\" al webserver, y tiene su logica porque si tenes una infraestructura
    que lo soporte no va a ser con un solo server.\r\n\r\nPor otro lado lo de las
    cookies es ridículo, si una imágen liviana pesa 4k no creo que 30
    bytes que es lo que debe ocupar la linea de cookies haga la diferencia, de hecho
    el que envía las cookies es el cliente, el server si no quiere no, y por
    el tamaño de un paquete HTTP se discrimina.\r\n\r\nOtro factor por lo que
    se usa esto y no lo nombraste es por los CDN's, normalmente los sitios se encuentran
    hosteados en un mismo lugar, por ejemplo el Datacenter de Facebook queda en USA
    y sea cual sea la velocidad de conexión, cuando mas lejos geograficamente
    este el servidor mas delay de conexion hay, para eso los servidores CDN estan
    distribuidos por todo el mundo y los DNS te van a resolver el equipo mas cercano
    (en verdad el que menos enrutamientos requiera) por lo que podes estar consutando
    imagenes, css, js en un servidor de tu pais. Obviamente esto solo se usa para
    contenido estático ya que tener un servidor en Uruguay que use una base
    de datos en USA conlleva muchas complicaciones :-)"
- id: 8831
  author: Alpha
  author_email: alpha@furries.com.ar
  author_url: http://www.alphasmanifesto.com.ar/
  date: '2012-03-28 11:13:08 +0000'
  date_gmt: '2012-03-28 16:13:08 +0000'
  content: "@Exos, MUY buen aporte, muchísimas gracias. Lo de las limitaciones
    por IP no lo sabía.  ¿Quién pone esa limitación?  ¿El
    browser, es parte del estándar o el SO?\r\n\r\nLo de las CDNs es verdad,
    fallé en verle la relación con los servidores actuales, porque aún
    teniendo los distintos servers físicos, el DNS puede resolver a cualquiera
    de ellos, sea cual sea el dominio que tengan. Pero tu punto es cierto: teniendo
    DNSs localizados y servidores localizados también, esto es una enorme ganancia.
    No creo 100% que fueran necesarios dominios para esto (subdominios servían
    también), pero aplica.\r\n\r\nSin embargo, me encuentro en desacuerdo respecto
    de lo que decís con las cookies. Sé que 30 bytes no es nada en un
    request y que el servidor no tiene ni que enviarlo, pero el ancho de banda que
    esto consume no es poca cosa, cuando considerás que esos 30 bytes se suman
    a cada request ( ¿cuántos puede haber por cada página?), que
    a la cantidad por cada usuario, a la cantidad de usuarios activos simultáneos
    puede ser enorme. Creo que incluso se le puede considerar un favor a los ISPs.
    Nuevamente, sé que suena tonto porque al lado de 40 KBs 30 o 10 bytes no
    son nada, pero en su totalidad hacen una diferencia enorme."
- id: 8832
  author: Exos
  author_email: tioscar@gmail.com
  author_url: http://blog.exodica.com.ar
  date: '2012-03-28 11:58:40 +0000'
  date_gmt: '2012-03-28 16:58:40 +0000'
  content: "Sobre el ancho de banda \"total\" la verdad lo veo medio ralativo, ya
    que nada se guarda en tamaño 100% exactos, por ejemplo si guardas un archivo
    de 1KB en una particion con un tamaño de 4KB por inode (que es lo default)
    el archivo fisicamente va a ocupar 4KB, de ahi a que pese 1KB o 2KB a la hora
    del kernel de SO generar los buffers va a gastar lo mismo de memoria/transferencia.
    Si ponemos este ejemplo en las tranferencias por red/internet (por eso te comente
    que por el tamaño de los paquetes se discrimina) si envias una imagen de
    40KB,  este va a llegar en varios paquetes TCP/IP, por defecto el MTU (tamaño
    de estos paquetes es de 1518 bytes) asi que 40KB = 40960B dividido el tamaño
    por defecto de los MTU de TCP/IP menos los 20B que ocupa la cabecera del paquete
    (1498B en total)  serian 28 paquetes (41944 Bytes) osea que ahi solo ya tenes
    984B de sobra (cerca de 1KB).\r\n\r\nEn conclucion si a esa imagen de 40KB le
    agregas 900B fisicamente sería lo mismo.\r\n\r\nA la vez esta el webserver,
    la verdad desconozco el funcionamiento de cada uno, pero supongo que a la hora
    de reserver la memoria para el buffer, lo hara con un tamaño predeterminado,
    por ejemplo en Nginx que es un webserver super optimizable bastante usado para
    servir contenido estatico, normalmente se usa un limite de buffer para el header
    bastante bajo:\r\n\r\nclient_header_buffer_size 1k;\r\n\r\nA nivel proceso es
    mucho mas rápido para el nginx reservar un buffer de 1KB en memoria que
    ponerse a calcular cuanto necesita.\r\n\r\nPor eso te digo que no creo que una
    cadena mas de cookies sea relevante."
- id: 8833
  author: Alpha
  author_email: alpha@furries.com.ar
  author_url: http://www.alphasmanifesto.com.ar/
  date: '2012-03-28 12:11:43 +0000'
  date_gmt: '2012-03-28 17:11:43 +0000'
  content: "Usted, señor, ha derrotado mi argumento.\r\n\r\nImagino que debe
    haber alguna otra razón para utilizar dominios separados más allá
    de las cookies. Me imagino razones pero ninguna de ellas es puramente técnica.\r\n\r\n ¿Te
    molestaría si (más tarde) modifico el artículo agregando
    un resumen de la información que aportaste? (Los créditos serán
    dados apropiadamente, claro.)"
- id: 8834
  author: Exos
  author_email: tioscar@gmail.com
  author_url: http://blog.exodica.com.ar
  date: '2012-03-29 11:53:19 +0000'
  date_gmt: '2012-03-29 16:53:19 +0000'
  content: "No problem, es su blog :-), lo de los dominios diferente, se me ocurren
    2 cosas, una que por el tamaño de esos proyectos lo hacen para facilitar
    la parte burocrática.\r\n\r\nOtra es por el tema de HTTPs con contenido
    estático, según Wikipedia:\r\n\r\n\"También, HTTPS es vulnerable
    cuando se aplica a contenido estático de publicación disponible
    [...] Esto permite a un atacante tener acceso al Texto plano (contenido estático
    de publicación), y al Texto cifrado (La versión cifrada del contenido
    estático), permitiendo un ataque criptográfico.\"\r\n\r\nhttps://es.wikipedia.org/wiki/Hypertext_Transfer_Protocol_Secure#Limitaciones\r\n\r\nAunque
    la certificación SSL va por ip/puerto y no por dominio, por lo que un subdominio
    con el contenido estático supongo que ya alcanzaría, pero talvez
    lo hacen por un tema de fácilidad de manejo y para evitar errores que puedan
    comprometer la seguridad.\r\n\r\nUna tercera que se me ocurre ahora al vuelo,
    que tiene que ver con los CDN, es que la empresa use un servicio externo (hay
    varios) y para no darle acceso al dominio principal por cuestiones de seguridad,
    cren un dominio para dicho servicio, hasta puede ser que use varios y a cada uno
    le de un dominio. \r\n\r\nLa verad no sé, esas son las que se me ocurren."
---
La razón detrás de las URLs raras...


Sabemos que el nombre no es más que un nombre y que no importa cuál sea el servidor actual en donde se están alojando los datos, pero parecería que es una práctica común de muchos sitios grandes (léase: Facebook, Twitter, Google, etc.) hacer referencia a muchos de sus recursos en dominios externos. Por ejemplo, las imágenes de Facebook se encuentran alojadas debajo de _http://static.ak.fbcdn.net/_ y no debajo de _http://www.facebook.com/_, ni siquiera debajo de _http://imgs.facebook.com/_.  ¿Por qué?

Alguien <a href="http://webmasters.stackexchange.com/questions/26753/why-do-big-sites-host-their-images-css-on-external-domains">ya hizo esa pregunta</a> y <a href="http://webmasters.stackexchange.com/a/26757/9403">la respuesta</a> fue nueva para mí: hay una limitación en varios browsers (y hastas donde yo sabía, algunos sistemas operativos) que previene hacer más de dos, tres o cuatro conexiones simultáneas a un mismo hostname. De hecho, es parte de la especificación HTTP 1.1 (parece que cumplir el estándar no siempre está tan bueno,  ¿no?). Ahora, si notaron, la limitación es por hostname,  ¿por qué entonces utilizar distintos dominios? <del>La razón es evitar cookies que pueden estar yendo y volviendo en cada uno de los pedidos, y para evitar eso, se puede usar un dominio extra que nunca devuelva cookies. De esa forma, sitios grandes como estos se ahorran **mucho** bandwidth.</del>

**UPDATE:** Gracias a <a href="http://blog.exodica.com.ar/">Exos</a>, que claramente estaba más informado que yo en este tema, las limitaciones exactas son de tres conexiones por cada dominio y cinco para cada IP. Los distintos dominios/subdominios ayudan a utilizar CDNs para distribución de contenido con mayor velocidad. Exos está en desacuerdo (y demuestra por qué, miren los comentarios) con que las cookies sean una gran carga respecto del bandwidth. Entonces el por qué de los dominios vs. subdominios queda en duda, pero suponemos que debe estar relacionado con políticas de administración interna de cada empresa.

_Soy un zorrinito performante._
