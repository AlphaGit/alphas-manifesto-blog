---
layout: post
status: publish
published: true
title: Configuración de ManagedFusion.Rewriter como proxy reverso
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 4991
wordpress_url: http://blog.alphasmanifesto.com/?p=4991
date: '2013-10-28 21:43:25 +0000'
date_gmt: '2013-10-29 02:43:25 +0000'
categories:
- Projects
- Technology
tags:
- JavaScript
- Technology
- seguridad
- herramientas
- configuración
- proxy
---
Guía rápida para tener un proxy reverso en 5 pasos


En mi post anterior de [alternativas para superar la limitación de la Same Origin Policy](https://blog.alphasmanifesto.com/2013/10/13/amar-al-proxy-mo/), expliqué brevemente el por qué de mi preferencia por los reverse proxy.

Aquí quiero contar un poco más al respecto y contar, con lujo de detalles, cómo configurar un proxy reverso gratuito para proyectos .NET.

<!--more-->

##  ¿Por qué un proxy reverso?

Entre todas las opciones mencionadas en [el post anterior](https://blog.alphasmanifesto.com/2013/10/13/amar-al-proxy-mo/) se destacaba al proxy reverso como una de mis opciones preferidas, por las siguientes razones:

1. **Se puede configurar y versionar como parte del proyecto.** Esto significa que personas que se sumen al equipo no tienen más que actualizar el código y ejecutarlo para que la aplicación les funcione. Puede que esto varíe según el proxy elegido, pero si podemos usar componentes que nos permita esto, es definitivamente una ventaja no menor.
1. **Es totalmente transparente para la aplicación.** Esta ventaja se da sobre supuestos en donde tenemos dos equipos distintos trabajando en una aplicación, o mientras unos están desarrollando el frontend, otros trabajan con el backend y deben exponer una API para que el frontend consuma. Por otro lado, no se debe ensuciar el código de la aplicación con mecanismos innecesarios que eviten las limitaciones del navegador cuando esta complejidad no es necesaria en un ambiente real.
1. **La configuracion es simple**, y eso incluye: fácil y no propensa a errores.

Aclarados esos puntos, pasemos a la parte central de este artículo.

## Configurando ManagedFusion.Rewriter

En mi búsqueda por proxies, encontré [ManagedFusion.Rewriter](https://github.com/managedfusion/managedfusion-rewriter), un proyecto open source y gratuito implementado en .NET que con unos pocos pasos nos permitirá configurar un rewriter de URLs y proxy reverso.

Cabe aclarar que ManagedFusion.Rewriter no tiene in desarrollo activo actualmente. Considérenlo dos veces antes de usar este proyecto para ambientes de producción. Para entornos de desarrollo, sin embargo, debería ser aceptable.

### 1. Bajar el proyecto

Recomiendo usar la última versión disponible [en Github](https://github.com/managedfusion/managedfusion-rewriter). Hay copias en Codeplex y en Nuget, pero parecen estar un par de versiones atrás. Como extra, el último release tiene un bug que impedía ejecutar requests contra URLs que parecieran paths. Pueden leer más de esto aquí: [Proxy issues for URLs without trailing slash](https://github.com/managedfusion/managedfusion-rewriter/pull/6).

En la página principal del repositorio, utilicen la opción de download zip. También pueden clonar el repositorio con su cliente git favorito, pero eso requiere que conozcan la utilización de git y quiero dejar esta guía en lo básico posible.

![]({{ site.baseurl }}/assets/ManagedFusionRewriter-downloadZip.png)


### 2. Compilar el proyecto y obtener el binario

Luego de descomprimir el archivo bajado, podrán abrir el proyecto desde Visual Studio 2012 y deberían poder compilarlo sin problemas. Recuerden hacerlo con permisos de administración porque el proyecto debe ser firmado (de otra forma recibirán un error). Hagan el build en la configuración de Release. En el momento de escritura de este artículo, la configuración es indiferente pero tiene más sentido y precaución para el futuro permitir las optimizaciomes y posibles cambios que ocurran en el proyecto.

Incluso pueden correr los unit tests solo para asegurarse de tener una versión consistente.

![]({{ site.baseurl }}/assets/ManagedFusionRewriter-runningTests.png)


Ahora navegando a la carpeta del proyecto, sub carpeta `src/bin/Release` encontrarán la librería `ManagedFusion.Rewriter.dll`.

![]({{ site.baseurl }}/assets/ManagedFusionRewriter-files.png)


### 3. Agregar la librería a nuestro proyecto

Ahora procederemos a agregar esta librería a nuestro proyecto. Describiré cómo utilizar el archivo .dll binario, pero otra opción es utilizar el código fuente como un proyecto referenciado.

 Recomiendo también agregar la librería a la solución para que todo pueda ser versionado junto.

![]({{ site.baseurl }}/assets/ManagedFusionRewriter-references.png)


### 4. Configurar el servidor ASP.NET para que Rewriter funcione

Esto se puede lograr sólo con agregar las siguientes entradas al `web.config`:

<script src="https://gist.github.com/AlphaGit/7175519.js"></script>

### 5. Configurar las reglas de rewrite

ManagedFusion.Rewriter posee varias formas de configurar las reglas de reescritura, pero personalmente prefiero la configuración por defecto, que incluye la de Apache mod_rewrite.

Para esto crearemos un archivo en la raíz de nuestro proyecto, lo llamaremos `ManagedFusion.Rewriter.txt` y le daremos las reglas de la misma forma que lo haríamos con mod_rewrite. Por ejemplo:

<script src="https://gist.github.com/AlphaGit/7175558.js"></script>

Con la segunda línea, puedo probar fácilmente que el proxy se encuentra funcionando:

![]({{ site.baseurl }}/assets/ManagedFusionRewriter-testingProxy.png)


Cuando tengamos problemas, siempre podemos descomentar las líneas de `RewriteLog` y `RewriteLogLevel` para encontrar un archivo de log con el nombre indicado y verificar qué problema está ocurriendo.

La documentación sobre las opciones disponibles está en [RewriteRule Flags](http://httpd.apache.org/docs/current/rewrite/flags.html), y los ejemplos que yo incluí tienen el siguiente efecto:

- `QA`: Mantiene la query string.
- `P`: Ejecuta un proxy reverso contra la URL especificada (esto también funciona como L: terminar la ejecución de reglas para este request).
- `NC`: No es susceptible a mayúsculas y minúsculas en la evaluación de la expresión regular.
