---
layout: post
status: publish
published: true
title: "&iquest;Por qu&eacute; distintos dominios para recursos est&aacute;ticos?"
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
- Link del d&iacute;a
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
- est&aacute;ndar
- bandwidth
- dominio
comments:
- id: 8830
  author: Exos
  author_email: tioscar@gmail.com
  author_url: http://blog.exodica.com.ar
  date: '2012-03-28 10:06:04 +0000'
  date_gmt: '2012-03-28 15:06:04 +0000'
  content: "La limitaci&oacute;n es tanto por dominio como por ip, si no me equivoco
    son 3 conexiones por dominio, y 5 por IP, y no es malo, es para evitar que los
    browsers \"maten\" al webserver, y tiene su logica porque si tenes una infraestructura
    que lo soporte no va a ser con un solo server.\r\n\r\nPor otro lado lo de las
    cookies es rid&iacute;culo, si una im&aacute;gen liviana pesa 4k no creo que 30
    bytes que es lo que debe ocupar la linea de cookies haga la diferencia, de hecho
    el que env&iacute;a las cookies es el cliente, el server si no quiere no, y por
    el tama&ntilde;o de un paquete HTTP se discrimina.\r\n\r\nOtro factor por lo que
    se usa esto y no lo nombraste es por los CDN's, normalmente los sitios se encuentran
    hosteados en un mismo lugar, por ejemplo el Datacenter de Facebook queda en USA
    y sea cual sea la velocidad de conexi&oacute;n, cuando mas lejos geograficamente
    este el servidor mas delay de conexion hay, para eso los servidores CDN estan
    distribuidos por todo el mundo y los DNS te van a resolver el equipo mas cercano
    (en verdad el que menos enrutamientos requiera) por lo que podes estar consutando
    imagenes, css, js en un servidor de tu pais. Obviamente esto solo se usa para
    contenido est&aacute;tico ya que tener un servidor en Uruguay que use una base
    de datos en USA conlleva muchas complicaciones :-)"
- id: 8831
  author: Alpha
  author_email: alpha@furries.com.ar
  author_url: http://www.alphasmanifesto.com.ar/
  date: '2012-03-28 11:13:08 +0000'
  date_gmt: '2012-03-28 16:13:08 +0000'
  content: "@Exos, MUY buen aporte, much&iacute;simas gracias. Lo de las limitaciones
    por IP no lo sab&iacute;a. &iquest;Qui&eacute;n pone esa limitaci&oacute;n? &iquest;El
    browser, es parte del est&aacute;ndar o el SO?\r\n\r\nLo de las CDNs es verdad,
    fall&eacute; en verle la relaci&oacute;n con los servidores actuales, porque a&uacute;n
    teniendo los distintos servers f&iacute;sicos, el DNS puede resolver a cualquiera
    de ellos, sea cual sea el dominio que tengan. Pero tu punto es cierto: teniendo
    DNSs localizados y servidores localizados tambi&eacute;n, esto es una enorme ganancia.
    No creo 100% que fueran necesarios dominios para esto (subdominios serv&iacute;an
    tambi&eacute;n), pero aplica.\r\n\r\nSin embargo, me encuentro en desacuerdo respecto
    de lo que dec&iacute;s con las cookies. S&eacute; que 30 bytes no es nada en un
    request y que el servidor no tiene ni que enviarlo, pero el ancho de banda que
    esto consume no es poca cosa, cuando consider&aacute;s que esos 30 bytes se suman
    a cada request (&iquest;cu&aacute;ntos puede haber por cada p&aacute;gina?), que
    a la cantidad por cada usuario, a la cantidad de usuarios activos simult&aacute;neos
    puede ser enorme. Creo que incluso se le puede considerar un favor a los ISPs.
    Nuevamente, s&eacute; que suena tonto porque al lado de 40 KBs 30 o 10 bytes no
    son nada, pero en su totalidad hacen una diferencia enorme."
- id: 8832
  author: Exos
  author_email: tioscar@gmail.com
  author_url: http://blog.exodica.com.ar
  date: '2012-03-28 11:58:40 +0000'
  date_gmt: '2012-03-28 16:58:40 +0000'
  content: "Sobre el ancho de banda \"total\" la verdad lo veo medio ralativo, ya
    que nada se guarda en tama&ntilde;o 100% exactos, por ejemplo si guardas un archivo
    de 1KB en una particion con un tama&ntilde;o de 4KB por inode (que es lo default)
    el archivo fisicamente va a ocupar 4KB, de ahi a que pese 1KB o 2KB a la hora
    del kernel de SO generar los buffers va a gastar lo mismo de memoria/transferencia.
    Si ponemos este ejemplo en las tranferencias por red/internet (por eso te comente
    que por el tama&ntilde;o de los paquetes se discrimina) si envias una imagen de
    40KB,  este va a llegar en varios paquetes TCP/IP, por defecto el MTU (tama&ntilde;o
    de estos paquetes es de 1518 bytes) asi que 40KB = 40960B dividido el tama&ntilde;o
    por defecto de los MTU de TCP/IP menos los 20B que ocupa la cabecera del paquete
    (1498B en total)  serian 28 paquetes (41944 Bytes) osea que ahi solo ya tenes
    984B de sobra (cerca de 1KB).\r\n\r\nEn conclucion si a esa imagen de 40KB le
    agregas 900B fisicamente ser&iacute;a lo mismo.\r\n\r\nA la vez esta el webserver,
    la verdad desconozco el funcionamiento de cada uno, pero supongo que a la hora
    de reserver la memoria para el buffer, lo hara con un tama&ntilde;o predeterminado,
    por ejemplo en Nginx que es un webserver super optimizable bastante usado para
    servir contenido estatico, normalmente se usa un limite de buffer para el header
    bastante bajo:\r\n\r\nclient_header_buffer_size 1k;\r\n\r\nA nivel proceso es
    mucho mas r&aacute;pido para el nginx reservar un buffer de 1KB en memoria que
    ponerse a calcular cuanto necesita.\r\n\r\nPor eso te digo que no creo que una
    cadena mas de cookies sea relevante."
- id: 8833
  author: Alpha
  author_email: alpha@furries.com.ar
  author_url: http://www.alphasmanifesto.com.ar/
  date: '2012-03-28 12:11:43 +0000'
  date_gmt: '2012-03-28 17:11:43 +0000'
  content: "Usted, se&ntilde;or, ha derrotado mi argumento.\r\n\r\nImagino que debe
    haber alguna otra raz&oacute;n para utilizar dominios separados m&aacute;s all&aacute;
    de las cookies. Me imagino razones pero ninguna de ellas es puramente t&eacute;cnica.\r\n\r\n&iquest;Te
    molestar&iacute;a si (m&aacute;s tarde) modifico el art&iacute;culo agregando
    un resumen de la informaci&oacute;n que aportaste? (Los cr&eacute;ditos ser&aacute;n
    dados apropiadamente, claro.)"
- id: 8834
  author: Exos
  author_email: tioscar@gmail.com
  author_url: http://blog.exodica.com.ar
  date: '2012-03-29 11:53:19 +0000'
  date_gmt: '2012-03-29 16:53:19 +0000'
  content: "No problem, es su blog :-), lo de los dominios diferente, se me ocurren
    2 cosas, una que por el tama&ntilde;o de esos proyectos lo hacen para facilitar
    la parte burocr&aacute;tica.\r\n\r\nOtra es por el tema de HTTPs con contenido
    est&aacute;tico, seg&uacute;n Wikipedia:\r\n\r\n\"Tambi&eacute;n, HTTPS es vulnerable
    cuando se aplica a contenido est&aacute;tico de publicaci&oacute;n disponible
    [...] Esto permite a un atacante tener acceso al Texto plano (contenido est&aacute;tico
    de publicaci&oacute;n), y al Texto cifrado (La versi&oacute;n cifrada del contenido
    est&aacute;tico), permitiendo un ataque criptogr&aacute;fico.\"\r\n\r\nhttps://es.wikipedia.org/wiki/Hypertext_Transfer_Protocol_Secure#Limitaciones\r\n\r\nAunque
    la certificaci&oacute;n SSL va por ip/puerto y no por dominio, por lo que un subdominio
    con el contenido est&aacute;tico supongo que ya alcanzar&iacute;a, pero talvez
    lo hacen por un tema de f&aacute;cilidad de manejo y para evitar errores que puedan
    comprometer la seguridad.\r\n\r\nUna tercera que se me ocurre ahora al vuelo,
    que tiene que ver con los CDN, es que la empresa use un servicio externo (hay
    varios) y para no darle acceso al dominio principal por cuestiones de seguridad,
    cren un dominio para dicho servicio, hasta puede ser que use varios y a cada uno
    le de un dominio. \r\n\r\nLa verad no s&eacute;, esas son las que se me ocurren."
---
<p style="text-align: justify;">Sabemos que el nombre no es m&aacute;s que un nombre y que no importa cu&aacute;l sea el servidor actual en donde se est&aacute;n alojando los datos, pero parecer&iacute;a que es una pr&aacute;ctica com&uacute;n de muchos sitios grandes (l&eacute;ase: Facebook, Twitter, Google, etc.) hacer referencia a muchos de sus recursos en dominios externos. Por ejemplo, las im&aacute;genes de Facebook se encuentran alojadas debajo de <em>http://static.ak.fbcdn.net/</em> y no debajo de <em>http://www.facebook.com/</em>, ni siquiera debajo de <em>http://imgs.facebook.com/</em>. &iquest;Por qu&eacute;?</p>
<p style="text-align: justify;">Alguien <a href="http://webmasters.stackexchange.com/questions/26753/why-do-big-sites-host-their-images-css-on-external-domains">ya hizo esa pregunta</a> y <a href="http://webmasters.stackexchange.com/a/26757/9403">la respuesta</a> fue nueva para m&iacute;: hay una limitaci&oacute;n en varios browsers (y hastas donde yo sab&iacute;a, algunos sistemas operativos) que previene hacer m&aacute;s de dos, tres o cuatro conexiones simult&aacute;neas a un mismo hostname. De hecho, es parte de la especificaci&oacute;n HTTP 1.1 (parece que cumplir el est&aacute;ndar no siempre est&aacute; tan bueno, &iquest;no?). Ahora, si notaron, la limitaci&oacute;n es por hostname, &iquest;por qu&eacute; entonces utilizar distintos dominios? <del>La raz&oacute;n es evitar cookies que pueden estar yendo y volviendo en cada uno de los pedidos, y para evitar eso, se puede usar un dominio extra que nunca devuelva cookies. De esa forma, sitios grandes como estos se ahorran <strong>mucho</strong>&nbsp;bandwidth.</del></p>
<p style="text-align: justify;"><strong>UPDATE:</strong>&nbsp;Gracias a <a href="http://blog.exodica.com.ar/">Exos</a>, que claramente estaba m&aacute;s informado que yo en este tema, las limitaciones exactas son de tres conexiones por cada dominio y cinco para cada IP. Los distintos dominios/subdominios ayudan a utilizar CDNs para distribuci&oacute;n de contenido con mayor velocidad. Exos est&aacute; en desacuerdo (y demuestra por qu&eacute;, miren los comentarios) con que las cookies sean una gran carga respecto del bandwidth. Entonces el por qu&eacute; de los dominios vs. subdominios queda en duda, pero suponemos que debe estar relacionado con pol&iacute;ticas de administraci&oacute;n interna de cada empresa.</p>
<p style="text-align: justify;"><em>Soy un zorrinito performante.</em></p>
