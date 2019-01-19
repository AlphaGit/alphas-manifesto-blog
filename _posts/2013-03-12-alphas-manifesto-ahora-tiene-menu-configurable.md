---
layout: post
status: publish
published: true
title: Alpha's Manifesto ahora tiene menú configurable
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
- administración
- WordPress
- desarollo
- theme
- Alpha's Manifesto
comments: []
---

![]({{ site.url }}/assets/configurableMenu.jpg)

Y cómo agregar propiedades a menús


Como parte del proceso de dejar el theme listo para publicar, estuve trabajando en el <a title="Theme Testing Process, de Wordpress Codex" href="http://codex.wordpress.org/Theme_Development#Theme_Testing_Process">Wordpress Theme Testing</a>. El proceso es largo y detallado, y la documentación también, pero yo estoy trackeando mi progreso en <a title="Setup Wordpress Theme Testing" href="https://github.com/AlphaGit/alphasmanifesto/issues/10">este issue en Github</a>. Una de las partes es lograr que los menúes de navegación sean configurables, y es algo que se cumplió hoy para **Alpha's Manifesto**.

<!--more-->

## Cómo funcionaba antes

La implementación anterior recorría las categorías disponibles en el blog y las mostraba una por una, generando un slug desde el nombre de la categoría que usaba para generar un URL de una imagen. La carpeta misma del theme tenía varios de los iconos con esos mismos nombres, y un archivo `.htaccess` se usaba para devolver el icono por default de la carpeta vacía si es que el nombre de la categoría no existía como archivo.

En esta aproximación, el usuario no tenía que configurar nada excepto las categorías del blog y ya tenía el menu disponible. Existían varios problemas con esto que ahora fueron solucionados:

- **El menú no se podía deshabilitar:** no había una forma desde el theme por la que uno pudiera quitar el menú si no lo quisiera. Las opciones eran modificar el theme manualmente, o no tener ninguna categoría en el blog. Eso o romperlo a través de JavaScript para que no se viera. Ninguna de las opciones es totalmente recomendable.
- **No se podían elegir qué imágenes uno quería** más que agregando imágenes en la carpeta del theme. Tampoco recomendable, pero tenía cierto encanto, ya que el theme se encargaba de dar imágenes por defecto si estas no existían. Lo malo es que uno requería utilizar la conexión FTP directa al servidor (si la tenía) y estaba forzado a usar imágenes de él.
- **No se podía elegir el orden de las categorías,** sino que el theme las elegía por uno.
- **Sólo se podían ver categorías en este menú,** es decir que no se podían incluir ningún otro tipo de links. Ni a links externos ni a páginas (page).
- **El .htacess debía ser distinto en la configuración de desarrollo y la de producción.** Si bien esto no es un problema para el usuario común del theme, es un problema si uno lo quiere tener instalado en una versión local. Para alguien que lo use profesionalmente, para desarrollar con él, y para mi, para desarrollar sobre él. El problema de que `RewriteBase</span> tuviera que ser distinto según el servidor en donde lo tenía me generaba sospechas de que estaba haciendo algo mal.
- **No se podía elegir qué categorías mostrar u ocultar, **porque el theme automáticamente escaneaba todas para mostrarlas.

Con los cambios introducidos, esto se solucionó.

## Cómo funciona hoy

Hoy se usa la característica de Menus expuesta por Wordpress, en donde uno puede configurar menús personalizados y asignarlos a secciones que el theme soporte.

![]({{ site.url }}/assets/alphasManifestoCurrentMenuConfiguration.jpg)

En la configuración actual, el theme dispone de una localización llamada _Menu al pie_, para el cual uno puede definir el menú a utilizar, de entre el listado de menúes particulares que uno haya generado en la sección de administración. Como extra, cada item debe actualizarse para que tenga incluida la imagen que se usará en la representación del menú. Esto es, simple y llanamente, la URL de esa imagen en particular.

El orden de los ítems se puede actualizar simplemente arrastrando los items hasta que tengan el orden deseado.

Cabe aclarar que por la forma del menú actual, no se permite una representación jerárquica de la navegación. Esto quiere decir que los ítems hijos, o los ítems de un nivel inferior no serán mostrados. Por el momento, esto es a drede, ya que no habría una forma s imple de mostrar esa relación. Entusiastas de diseño y UX, **los invito a proveer sugerencias** e ideas de cómo podría indicarse esto conservando el estilo poco intrusivo del menú.

## Cómo se implementó

Si sos un desarrollador de Wordpress o estás pensando en hacer un theme, esto puede ser muy valioso para vos, especialmente si tienes necesidades particulares de controlar el HTML generado para los items. (Y especialmente dado que parece no haber mucha documentación de cómo lograr esto.)

Según explica el <a href="http://codex.wordpress.org/Theme_Development#Template_File_Checklist">Template File Checklist</a> de Wordpress Theme Development, la navegación debe implementarse a través de la función <a href="http://codex.wordpress.org/Function_Reference/wp_nav_menu">`wp_nav_menu()`</a>. La utilización de dicha función es bastante simple si estamos en las siguientes situaciones:

- Generar el menú con listas sin ordenar es suficiente para nosotros (`ul > li`)
- El soporte a la anidación se hará también con listas sin ordenar (`ul > li > ul > li`)
- Queremos cambiar las clases o los IDs que recibe la lista sin ordenar (`ul`)
- Queremos agregar atributos propios a la lista (`ul`)
- Queremos que la lista se encuentre contenida en algún otro elemento del DOM

Todo lo anterior se puede lograr con distintos valores de los parámetros `container`, `menu_class`, `menu_id`, e `items_wrap`. Notesé que no **existe forma de manipular el output de cada item de la lista**, al menos no entre los parámetros. Para estos casos es en donde Wordpress recomienda utilizar un _walker_, que es una herencia de la clase <a href="http://phpdoc.wordpress.org/trunk/WordPress/Nav_Menus/Walker_Nav_Menu.html">`Walker_Nav_Menu`</a>.

### Modificando la generación del menú

`Walker_Nav_Menu` es una clase que implementa la forma en la que se genera el HTML de la lista y de cada item interior. Podemos siempre extender la clase e incluirla en el scope de nuestro theme, e indicar que queremos usar esta clase en lugar de la clase default de Wordpress.

Por ejemplo, **este es el footer del theme** de Alpha's Manifesto. Vean cómo se indica la forma en la que se quiere utilizar un walker propio:

<script src="https://gist.github.com/AlphaGit/5149170.js"></script>

Y por supuesto, la implementación del mismo. Mucho del mismo no es más que una copia de `Walker_Nav_Menu`, localizado en el archivo `/wp-includes/nav-menu-template.php`. Sólo tienen que cambiar lo que quieren, y los métodos que no cambien pueden dejarse sin implementar.

<script src="https://gist.github.com/AlphaGit/5149182.js"></script>

### Permitir al usuario agregar la información necesaria

Si miran con atención, habrán visto que en el snippet de código anterior estoy usando `$item->image_url` para la generación de la imagen del menú. Sin embargo, esta información no existe en la definición de los items, y mucho menos en la interfaz del usuario. Para esto es necesario registrar la información necesaria para que Wordpress nos permita agregar esos datos. Esto fue difícil de lograr porque casi no existe documentación al respecto (o al menos yo no logré encontrarla).

El código en general lo pueden encontrar en <a href="https://github.com/AlphaGit/alphasmanifesto/blob/8517782b4b4bfeeedbb5aa684bc690540d9ab479/custom_menu_setup.php">el archivo custom_menu_setup.php del theme</a>, pero pasaré a explicarlo por partes.

Como cualquier atributo extra que se agregue no se leerá o guardará para el item por defecto, podemos usar filtros y acciones que nos permitirán hacer esa operación cuando los items se lean o se guarden a la base de datos. De esta forma, extendemos Wordpress para trabajar con esa información extra.

<script src="https://gist.github.com/AlphaGit/5149216.js"></script>

Tras poder guardar y leer esa información, falta una parte crucial: mostrar un lugar en la interfaz en donde el usuario pueda editarlo. Esto fue muy difícil de lograr, y me basé en algunas aproximaciones distintas:

En <a title="How to add a custom field in the advanced menu properties?" href="http://wordpress.stackexchange.com/a/33495/28848">una respuesta de Wordpress.SE</a>, el usuario djrmom hace lo siguiente:

- Agrega los filtros y acciones necesarias para guardar / leer la propiedad nueva a los items (como hicimos más arriba)
- Registra un custom Walker para la edición de los menús
- En la implementación de este Walker, copia la generación del form original para agregar al final su propio campo

El usuario Cek (Frank) tomó un paso más y creó <a title="Wordpress Menu Item Meta Fields" href="http://changeset.hr/blog/code/wordpress-menu-item-meta-fields">un plugin para Wordpress que permite agregar campos custom</a>, que utiliza casi la misma técnica para extender la funcionalidad de Wordpress, con una diferencia: él no reescribe el código del Walker de Wordpress, sino que utiliza <a href="https://code.google.com/p/phpquery/">phpQuery</a> para que la clase base genere su HTML y él anexar al final del formulario su propios datos al formulario.

Si bien su aproximación me resultó muy interesante y simple, preferí no seguirla por dos razones:

1. No me agrada del todo la idea de un theme (el que estoy desarrollando) cargando phpQuery en memoria y usándolo sólo una fracción del tiempo.
1. La complejidad del Walker no desapareció, sólo ahora lo ejecuta otra clase y la nuestra le anexa algunas cosas

Por eso, preferí la aproximación general y reescribir el contenido del Walker de Wordpress. En el códifo de Cek, se está extendiendo una clase llamada `Walker_Nav_Menu_Edit`, pero esta clase no se encuentra definida completamente en todos los ámbitos en donde el theme se ejecuta. él incluye una condición para tratar con eso, pero yo sólo encontré problemas que rompían la administración de Wordpress. Por eso, en este caso, también extendí Walker_Nav_Menu (`Walker_Nav_Menu_Edit` es una implementación de `Walker_Nav_Menu` y no agrega métodos propios) y lo registramos de otra forma, utilizando la función add_action con `wp_edit_nav_menu_walker` como primer parámetro.

El código general de esta clase lo pueden ver en <a href="https://github.com/AlphaGit/alphasmanifesto/blob/master/custom_menu_setup.php">`custom_menu_setup.php`</a> del theme, pero la parte importante es la siguiente:

<script src="https://gist.github.com/AlphaGit/5149321.js"></script>

Aquí pueden ver lo que se hizo:

- Se copió código para generar un campo más, usando las mismas clases de Wordpress para dar estilos
- Se generan cadenas únicas para la descripción de los campos y IDs
- El nombre del campo (`name`) es la propiedad que definimos a leer (ver variable `$_POST` en los ejemplos anteriores) y el índice de ese array es el ID del item (ver funciones de save/restore más arriba)

Con esto, ya nuestro campo está disponible para ser editado por el usuario.

Espero que esto les haya sido de ayuda.
