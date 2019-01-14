---
layout: post
status: publish
published: true
title: Alpha's Manifesto ahora tiene men&uacute; configurable
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 4675
wordpress_url: http://blog.alphasmanifesto.com/?p=4675
date: '2013-03-12 23:24:53 +0000'
date_gmt: '2013-03-13 04:24:53 +0000'
categories:
- Projects
- Technology
tags:
- desarrollo web
- PHP
- administraci&oacute;n
- WordPress
- desarollo
- theme
- Alpha's Manifesto
comments: []
---

![](/assets/configurableMenu.jpg)

Y cómo agregar propiedades a menús

<p style="text-align: justify;">Como parte del proceso de dejar el theme listo para publicar, estuve trabajando en el <a title="Theme Testing Process, de Wordpress Codex" href="http://codex.wordpress.org/Theme_Development#Theme_Testing_Process">Wordpress Theme Testing</a>. El proceso es largo y detallado, y la documentaci&oacute;n tambi&eacute;n, pero yo estoy trackeando mi progreso en <a title="Setup Wordpress Theme Testing" href="https://github.com/AlphaGit/alphasmanifesto/issues/10">este issue en Github</a>. Una de las partes es lograr que los men&uacute;es de navegaci&oacute;n sean configurables, y es algo que se cumpli&oacute; hoy para <strong>Alpha's Manifesto</strong>.</p>
<p><!--more--></p>
<h2 style="text-align: justify;">C&oacute;mo funcionaba antes</h2>
<p style="text-align: justify;">La implementaci&oacute;n anterior recorr&iacute;a las categor&iacute;as disponibles en el blog y las mostraba una por una, generando un slug desde el nombre de la categor&iacute;a que usaba para generar un URL de una imagen. La carpeta misma del&nbsp;theme ten&iacute;a varios de los iconos con esos mismos nombres, y un archivo <span style="font-family: 'courier new', courier;">.htaccess</span> se usaba para devolver el icono por default de la carpeta vac&iacute;a si es que el nombre de la categor&iacute;a no exist&iacute;a como archivo.</p>
<p style="text-align: justify;">En esta aproximaci&oacute;n, el usuario no ten&iacute;a que configurar nada excepto las categor&iacute;as del blog y ya ten&iacute;a el menu disponible. Exist&iacute;an varios problemas con esto que ahora fueron solucionados:</p>
<ul style="text-align: justify;">
<li><strong>El men&uacute; no se pod&iacute;a deshabilitar:&nbsp;</strong>no hab&iacute;a una forma desde el theme por la que uno pudiera quitar el men&uacute; si no lo quisiera. Las opciones eran modificar el theme manualmente, o no tener ninguna categor&iacute;a en el blog. Eso o romperlo a trav&eacute;s de JavaScript para que no se viera. Ninguna de las opciones es totalmente recomendable.</li>
<li><strong>No se pod&iacute;an elegir qu&eacute; im&aacute;genes uno quer&iacute;a</strong> m&aacute;s que agregando im&aacute;genes en la carpeta del theme. Tampoco recomendable, pero ten&iacute;a cierto encanto, ya que el theme se encargaba de dar im&aacute;genes por defecto si estas no exist&iacute;an. Lo malo es que uno requer&iacute;a utilizar la conexi&oacute;n FTP directa al servidor (si la ten&iacute;a) y estaba forzado a usar im&aacute;genes de &eacute;l.</li>
<li><strong>No se pod&iacute;a elegir el orden de las categor&iacute;as,</strong> sino que el theme las eleg&iacute;a por uno.</li>
<li><strong>S&oacute;lo se pod&iacute;an ver categor&iacute;as en este men&uacute;,</strong> es decir que no se pod&iacute;an incluir ning&uacute;n otro tipo de links. Ni a links externos ni a p&aacute;ginas (page).</li>
<li><strong>El .htacess deb&iacute;a ser distinto en la configuraci&oacute;n de desarrollo y la de producci&oacute;n.</strong> Si bien esto no es un problema para el usuario com&uacute;n del theme, es un problema si uno lo quiere tener instalado en una versi&oacute;n local. Para alguien que lo use profesionalmente, para desarrollar con &eacute;l, y para mi, para desarrollar sobre &eacute;l. El problema de que <span style="font-family: 'courier new', courier;">RewriteBase</span> tuviera que ser distinto seg&uacute;n el servidor en donde lo ten&iacute;a me generaba sospechas de que estaba haciendo algo mal.</li>
<li><strong>No se pod&iacute;a elegir qu&eacute; categor&iacute;as mostrar u ocultar,&nbsp;</strong>porque el theme autom&aacute;ticamente escaneaba todas para mostrarlas.</li>
</ul>
<p style="text-align: justify;">Con los cambios introducidos, esto se solucion&oacute;.</p>
<h2>C&oacute;mo funciona hoy</h2>
<p style="text-align: justify;">Hoy se usa la caracter&iacute;stica de Menus expuesta por Wordpress, en donde uno puede configurar men&uacute;s personalizados y asignarlos a secciones que el theme soporte.</p>

![](/assets/alphasManifestoCurrentMenuConfiguration.jpg)

<p style="text-align: justify;">En la configuraci&oacute;n actual, el theme dispone de una localizaci&oacute;n llamada&nbsp;<em>Menu al pie</em>, para el cual uno puede definir el men&uacute; a utilizar, de entre el listado de men&uacute;es particulares que uno haya generado en la secci&oacute;n de administraci&oacute;n. Como extra, cada item debe actualizarse para que tenga incluida la imagen que se usar&aacute; en la representaci&oacute;n del men&uacute;. Esto es, simple y llanamente, la URL de esa imagen en particular.</p>
<p style="text-align: justify;">El orden de los &iacute;tems se puede actualizar simplemente arrastrando los items hasta que tengan el orden deseado.</p>
<p style="text-align: justify;">Cabe aclarar que por la forma del men&uacute; actual, no se permite una representaci&oacute;n jer&aacute;rquica de la navegaci&oacute;n. Esto quiere decir que los &iacute;tems hijos, o los &iacute;tems de un nivel inferior no ser&aacute;n mostrados. Por el momento, esto es a drede, ya que no habr&iacute;a una forma s imple de mostrar esa relaci&oacute;n. Entusiastas de dise&ntilde;o y UX, <strong>los invito a proveer sugerencias</strong> e ideas de c&oacute;mo podr&iacute;a indicarse esto conservando el estilo poco intrusivo del men&uacute;.</p>
<h2>C&oacute;mo se implement&oacute;</h2>
<p style="text-align: justify;">Si sos un desarrollador de Wordpress o est&aacute;s pensando en hacer un theme, esto puede ser muy valioso para vos, especialmente si tienes necesidades particulares de controlar el HTML generado para los items. (Y especialmente dado que parece no haber mucha documentaci&oacute;n de c&oacute;mo lograr esto.)</p>
<p style="text-align: justify;">Seg&uacute;n explica el <a href="http://codex.wordpress.org/Theme_Development#Template_File_Checklist">Template File Checklist</a> de Wordpress Theme Development, la navegaci&oacute;n debe implementarse a trav&eacute;s de la funci&oacute;n <a href="http://codex.wordpress.org/Function_Reference/wp_nav_menu"><span style="font-family: 'courier new', courier;">wp_nav_menu()</span></a>. La utilizaci&oacute;n de dicha funci&oacute;n es bastante simple si estamos en las siguientes situaciones:</p>
<ul>
<li style="text-align: justify;"><span style="line-height: 13px;">Generar el men&uacute; con listas sin ordenar es suficiente para nosotros (<span style="font-family: 'courier new', courier;">ul > li</span>)</span></li>
<li style="text-align: justify;">El soporte a la anidaci&oacute;n se har&aacute; tambi&eacute;n con listas sin ordenar (<span style="font-family: 'courier new', courier;">ul > li > ul > li</span>)</li>
<li style="text-align: justify;">Queremos cambiar las clases o los IDs que recibe la lista sin ordenar (<span style="font-family: 'courier new', courier;">ul</span>)</li>
<li style="text-align: justify;">Queremos agregar atributos propios a la lista (<span style="font-family: 'courier new', courier;">ul</span>)</li>
<li style="text-align: justify;">Queremos que la lista se encuentre contenida en alg&uacute;n otro elemento del DOM</li>
</ul>
<p style="text-align: justify;">Todo lo anterior se puede lograr con distintos valores de los par&aacute;metros <span style="font-family: 'courier new', courier;">container</span>, <span style="font-family: 'courier new', courier;">menu_class</span>, <span style="font-family: 'courier new', courier;">menu_id</span>, e <span style="font-family: 'courier new', courier;">items_wrap</span>. Notes&eacute; que no <strong>existe forma de manipular el output de cada item de la lista</strong>, al menos no entre los par&aacute;metros. Para estos casos es en donde Wordpress recomienda utilizar un&nbsp;<em>walker</em>, que es una herencia de la clase <a href="http://phpdoc.wordpress.org/trunk/WordPress/Nav_Menus/Walker_Nav_Menu.html"><span style="font-family: 'courier new', courier;">Walker_Nav_Menu</span></a>.</p>
<h3>Modificando la generaci&oacute;n del men&uacute;</h3>
<p style="text-align: justify;"><span style="font-family: 'courier new', courier;">Walker_Nav_Menu</span> es una clase que implementa la forma en la que se genera el HTML de la lista y de cada item interior. Podemos siempre extender la clase e incluirla en el scope de nuestro theme, e indicar que queremos usar esta clase en lugar de la clase default de Wordpress.</p>
<p style="text-align: justify;">Por ejemplo, <strong>este es el footer del theme</strong> de Alpha's Manifesto. Vean c&oacute;mo se indica la forma en la que se quiere utilizar un walker propio:</p>
<p><script src="https://gist.github.com/AlphaGit/5149170.js"></script></p>
<p style="text-align: justify;">Y por supuesto, la implementaci&oacute;n del mismo. Mucho del mismo no es m&aacute;s que una copia de <span style="font-family: 'courier new', courier;">Walker_Nav_Menu</span>, localizado en el archivo <span style="font-family: 'courier new', courier;">/wp-includes/nav-menu-template.php</span>. S&oacute;lo tienen que cambiar lo que quieren, y los m&eacute;todos que no cambien pueden dejarse sin implementar.</p>
<p><script src="https://gist.github.com/AlphaGit/5149182.js"></script></p>
<h3>Permitir al usuario agregar la informaci&oacute;n necesaria</h3>
<p style="text-align: justify;">Si miran con atenci&oacute;n, habr&aacute;n visto que en el snippet de c&oacute;digo anterior estoy usando <span style="font-family: 'courier new', courier;">$item->image_url</span> para la generaci&oacute;n de la imagen del men&uacute;. Sin embargo, esta informaci&oacute;n no existe en la definici&oacute;n de los items, y mucho menos en la interfaz del usuario. Para esto es necesario registrar la informaci&oacute;n necesaria para que Wordpress nos permita agregar esos datos. Esto fue dif&iacute;cil de lograr porque casi no existe documentaci&oacute;n al respecto (o al menos yo no logr&eacute; encontrarla).</p>
<p style="text-align: justify;">El c&oacute;digo en general lo pueden encontrar en <a href="https://github.com/AlphaGit/alphasmanifesto/blob/8517782b4b4bfeeedbb5aa684bc690540d9ab479/custom_menu_setup.php">el archivo custom_menu_setup.php del theme</a>, pero pasar&eacute; a explicarlo por partes.</p>
<p style="text-align: justify;">Como cualquier atributo extra que se agregue no se leer&aacute; o guardar&aacute; para el item por defecto, podemos usar filtros y acciones que nos permitir&aacute;n hacer esa operaci&oacute;n cuando los items se lean o se guarden a la base de datos. De esta forma, extendemos Wordpress para trabajar con esa informaci&oacute;n extra.</p>
<p><script src="https://gist.github.com/AlphaGit/5149216.js"></script></p>
<p style="text-align: justify;">Tras poder guardar y leer esa informaci&oacute;n, falta una parte crucial: mostrar un lugar en la interfaz en donde el usuario pueda editarlo.&nbsp;Esto fue muy dif&iacute;cil de lograr, y me bas&eacute; en algunas aproximaciones distintas:</p>
<p style="text-align: justify;">En <a title="How to add a custom field in the advanced menu properties?" href="http://wordpress.stackexchange.com/a/33495/28848">una respuesta de Wordpress.SE</a>, el usuario djrmom hace lo siguiente:</p>
<ul style="text-align: justify;">
<li><span style="line-height: 13px;">Agrega los filtros y acciones necesarias para guardar / leer la propiedad nueva a los items (como hicimos m&aacute;s arriba)</span></li>
<li>Registra un custom Walker para la edici&oacute;n de los men&uacute;s</li>
<li>En la implementaci&oacute;n de este Walker, copia la generaci&oacute;n del form original para agregar al final su propio campo</li>
</ul>
<p style="text-align: justify;">El usuario Cek (Frank) tom&oacute; un paso m&aacute;s y cre&oacute; <a title="Wordpress Menu Item Meta Fields" href="http://changeset.hr/blog/code/wordpress-menu-item-meta-fields">un plugin para Wordpress que permite agregar campos custom</a>, que utiliza casi la misma t&eacute;cnica para extender la funcionalidad de Wordpress, con una diferencia: &eacute;l no reescribe el c&oacute;digo del Walker de Wordpress, sino que utiliza <a href="https://code.google.com/p/phpquery/">phpQuery</a> para que la clase base genere su HTML y &eacute;l anexar al final del formulario su propios datos al formulario.</p>
<p style="text-align: justify;">Si bien su aproximaci&oacute;n me result&oacute; muy interesante y simple, prefer&iacute; no seguirla por dos razones:</p>
<ol>
<li style="text-align: justify;"><span style="line-height: 13px;">No me agrada del todo la idea de un theme (el que estoy desarrollando) cargando phpQuery en memoria y us&aacute;ndolo s&oacute;lo una fracci&oacute;n del tiempo.</span></li>
<li style="text-align: justify;">La complejidad del Walker no desapareci&oacute;, s&oacute;lo ahora lo ejecuta otra clase y la nuestra le anexa algunas cosas</li>
</ol>
<p style="text-align: justify;">Por eso, prefer&iacute; la aproximaci&oacute;n general y reescribir el contenido del Walker de Wordpress. En el c&oacute;difo de Cek, se est&aacute; extendiendo una clase llamada <span style="font-family: 'courier new', courier;">Walker_Nav_Menu_Edit</span>, pero esta clase no se encuentra definida completamente en todos los &aacute;mbitos en donde el theme se ejecuta. &Eacute;l incluye una condici&oacute;n para tratar con eso, pero yo s&oacute;lo encontr&eacute; problemas que romp&iacute;an la administraci&oacute;n de Wordpress. Por eso, en este caso, tambi&eacute;n extend&iacute; Walker_Nav_Menu (<span style="font-family: 'courier new', courier;">Walker_Nav_Menu_Edit</span> es una implementaci&oacute;n de <span style="font-family: 'courier new', courier;">Walker_Nav_Menu</span> y no agrega m&eacute;todos propios) y lo registramos de otra forma, utilizando la funci&oacute;n add_action con&nbsp;<span style="font-family: 'courier new', courier;">wp_edit_nav_menu_walker</span> como primer par&aacute;metro.</p>
<p>El c&oacute;digo general de esta clase lo pueden ver en <span style="font-family: 'courier new', courier;"><a href="https://github.com/AlphaGit/alphasmanifesto/blob/master/custom_menu_setup.php">custom_menu_setup.php</a></span> del theme, pero la parte importante es la siguiente:</p>
<p><script src="https://gist.github.com/AlphaGit/5149321.js"></script></p>
<p>Aqu&iacute; pueden ver lo que se hizo:</p>
<ul>
<li style="text-align: justify;"><span style="line-height: 13px;">Se copi&oacute; c&oacute;digo para generar un campo m&aacute;s, usando las mismas clases de Wordpress para dar estilos</span></li>
<li style="text-align: justify;">Se generan cadenas &uacute;nicas para la descripci&oacute;n de los campos y IDs</li>
<li style="text-align: justify;">El nombre del campo (<span style="font-family: 'courier new', courier;">name</span>) es la propiedad que definimos a leer (ver variable <span style="font-family: 'courier new', courier;">$_POST</span> en los ejemplos anteriores) y el &iacute;ndice de ese array es el ID del item (ver funciones de save/restore m&aacute;s arriba)</li>
</ul>
<p style="text-align: justify;">Con esto, ya nuestro campo est&aacute; disponible para ser editado por el usuario.</p>
<p style="text-align: justify;">Espero que esto les haya sido de ayuda.</p>
