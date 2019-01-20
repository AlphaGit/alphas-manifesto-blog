---
layout: post
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
---

Hace un par de días encontré un hueco de seguridad muy grande en un foro conocido (no voy a dar direcciones por protección del mismo), y dicha falla permitía acceso directo a su base de datos.

No sé si tenga que ver (puesto que mi intención original nunca fue atacar ese foro, sino que simplemente estaba navegando por él), pero el foro es de un tipo MyBB, y la falla ocurrió de la siguiente manera.

Dicho servidor, ese día, esta un tanto sobrecargado de pedidos, por lo que cada tanto fallaban las respuestas al cliente. Esto es algo normal y esperado en dichas condiciones, pero lo que no se espera, es que el proceso de PHP se muera.

Y si lo hiciera, dado que puede tener mucho procesamiento de fondo, que no haya tenido un buffer sin preprocesamiento en la salida. Digamos, que ese proceso PHP ya ponía en la salida el código PHP y luego lo procesaba. Si moría en el medio, entonces el código salía sin pre-procesar, por lo cual yo, solo navegando con mi humilde zorro, podía ver todo el código PHP que formaba al foro.

El header con comentarios en el archivo PHP ya me indicaba que se trataba de un foro MyBB.

Luego le pregunté a Google: "dónde guarda los archivos de configuración MyBB?"<br />Google respondió: "/inc/config.php"

Entonces le digo a mi zorro: "Andate a http://www.adasdadadaad.com/inc/config.php"

Y ahí veo:

```php
$config['dbtype'] = 'mysql';
$config['hostname'] = '<nombreservidor>';
$config['username'] = '<usuario>';
$config['password'] = '<password>';
$config['database'] = '<schema>';
$config['table_prefix'] = 'mybb_';
```

Obviamente, los datos no son los mismos que el original, por protección.

Mi siguiente pregunta fue: "Se aceptarán conexiones remotas a la base?"

Ctrl+Space, abrí el Launchy, "mysql", seleccioné el MySQL Query Browser, Enter. Ingresé los datos, Enter.

Estaba adentro.

Mi próximo paso fue enviar un mail a los administradores del foro para avisar del tema, pero dado que como todo andaba sobrecargado, tuve que hacerlo después.

Por entretención y entrenamiento (uno nunca sabe), me quedé con los hashes md5 de las tablas de usuarios (ni me los pidan, no los voy a repartir), como para analizar la fuerza de los passwords. Paso previo, me correspondía crackearlos, bajo algún método de criptoanálisis.

Hace algunos días que estoy creando [Rainbow Tables](http://en.wikipedia.org/wiki/Rainbow_tables) para crackear los passwords, y a la vez aprendo sobre esto, el desempeño de mi máquina y cosas similares.<br /><span style="font-style:italic;font-size:130%;"><br />SE ME MUERE LA MAQUINAAA!!!</span>

Como se puede apreciar, esto no es para cualquiera... no por uno, sino por la salud de la máquina. Ni hablar de que poseo actualmente 40 archivos de 2 GBs cada uno lleno de hahes md5, que se graban, se leen, se ordenan, se indexan, se buscan, etc, etc, etc... por ahora no he tenido suerte con nada, pero eso es una buena señal de que estoy fallando en algo...

...y ahí es donde tengo que seguir experimentando para aprender.

BTW: Ya pasaron 4 días y tras haberme comunicado con 3 administradores, ninguno me envía respuesta.

_Soy un zorrinito de sombrero blanco._
