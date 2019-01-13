---
layout: post
status: publish
published: true
title: El cracking y la memoria
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 170
wordpress_url: http://zorri2.wordpress.com/2007/11/23/el-cracking-y-la-memoria/
date: '2007-11-23 13:00:00 +0000'
date_gmt: '2007-11-23 13:00:00 +0000'
categories:
- Projects
- Technology
tags: []
comments:
- id: 1229
  author: "&curren;&Aacute;M&szlig;&acirc;r Vi0L&ecirc;T&acirc;&curren;"
  author_email: ''
  author_url: ''
  date: '2007-11-23 21:35:00 +0000'
  date_gmt: '2007-11-23 21:35:00 +0000'
  content: Vo' so' Neo de la Matris!<br/><br/>(Nunca podr&eacute; hacer comentarios
    m&aacute;s intelectuales en este blog =P)
- id: 1230
  author: El Hombre Gris
  author_email: ''
  author_url: ''
  date: '2007-11-29 02:16:00 +0000'
  date_gmt: '2007-11-29 02:16:00 +0000'
  content: Esto pinta bug feo de seguridad de PHP. Cuando estes por el msn te pregunto
    m&aacute;s...
---
<div style="text-align:justify;">Hace un par de d&iacute;as encontr&eacute; un hueco de seguridad muy grande en un foro conocido (no voy a dar direcciones por protecci&oacute;n del mismo), y dicha falla permit&iacute;a acceso directo a su base de datos.</p>
<p>No s&eacute; si tenga que ver (puesto que mi intenci&oacute;n original nunca fue atacar ese foro, sino que simplemente estaba navegando por &eacute;l), pero el foro es de un tipo MyBB, y la falla ocurri&oacute; de la siguiente manera.</p>
<p>Dicho servidor, ese d&iacute;a, esta un tanto sobrecargado de pedidos, por lo que cada tanto fallaban las respuestas al cliente. Esto es algo normal y esperado en dichas condiciones, pero lo que no se espera, es que el proceso de PHP se muera.</p>
<p>Y si lo hiciera, dado que puede tener mucho procesamiento de fondo, que no haya tenido un buffer sin preprocesamiento en la salida. Digamos, que ese proceso PHP ya pon&iacute;a en la salida el c&oacute;digo PHP y luego lo procesaba. Si mor&iacute;a en el medio, entonces el c&oacute;digo sal&iacute;a sin pre-procesar, por lo cual yo, solo navegando con mi humilde zorro, pod&iacute;a ver todo el c&oacute;digo PHP que formaba al foro.</p>
<p>El header con comentarios en el archivo PHP ya me indicaba que se trataba de un foro MyBB.</p>
<p>Luego le pregunt&eacute; a Google: "d&oacute;nde guarda los archivos de configuraci&oacute;n MyBB?"<br />Google respondi&oacute;: "/inc/config.php"</p>
<p>Entonces le digo a mi zorro: "Andate a http://www.adasdadadaad.com/inc/config.php"</p>
<p>Y ah&iacute; veo:

```php
$config['dbtype'] = 'mysql';
$config['hostname'] = '<nombreservidor>';
$config['username'] = '<usuario>';
$config['password'] = '<password>';
$config['database'] = '<schema>';
$config['table_prefix'] = 'mybb_';
```

<p>Obviamente, los datos no son los mismos que el original, por protecci&oacute;n.</p>
<p>Mi siguiente pregunta fue: "Se aceptar&aacute;n conexiones remotas a la base?"</p>
<p>Ctrl+Space, abr&iacute; el Launchy, "mysql", seleccion&eacute; el MySQL Query Browser, Enter. Ingres&eacute; los datos, Enter.</p>
<p>Estaba adentro.</p>
<p>Mi pr&oacute;ximo paso fue enviar un mail a los administradores del foro para avisar del tema, pero dado que como todo andaba sobrecargado, tuve que hacerlo despu&eacute;s.</p>
<p>Por entretenci&oacute;n y entrenamiento (uno nunca sabe), me qued&eacute; con los hashes md5 de las tablas de usuarios (ni me los pidan, no los voy a repartir), como para analizar la fuerza de los passwords. Paso previo, me correspond&iacute;a crackearlos, bajo alg&uacute;n m&eacute;todo de criptoan&aacute;lisis.</p>
<p>Hace algunos d&iacute;as que estoy creando <a href="http://en.wikipedia.org/wiki/Rainbow_tables">Rainbow Tables</a> para crackear los passwords, y a la vez aprendo sobre esto, el desempe&ntilde;o de mi m&aacute;quina y cosas similares.<br /><span style="font-style:italic;font-size:130%;"><br />SE ME MUERE LA MAQUINAAA!!!</span></p>
<p>Como se puede apreciar, esto no es para cualquiera... no por uno, sino por la salud de la m&aacute;quina. Ni hablar de que poseo actualmente 40 archivos de 2 GBs cada uno lleno de hahes md5, que se graban, se leen, se ordenan, se indexan, se buscan, etc, etc, etc... por ahora no he tenido suerte con nada, pero eso es una buena se&ntilde;al de que estoy fallando en algo...</p>
<p>...y ah&iacute; es donde tengo que seguir experimentando para aprender.</p>
<p>BTW: Ya pasaron 4 d&iacute;as y tras haberme comunicado con 3 administradores, ninguno me env&iacute;a respuesta.</p>
<p><span style="font-style:italic;">Soy un zorrinito de sombrero blanco.</span></div>
