---
layout: post
status: publish
published: true
title: Configuraci&oacute;n de ManagedFusion.Rewriter como proxy reverso
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
- configuraci&oacute;n
- proxy
comments: []
---
<p style="text-align: justify;">En mi post anterior de <a href="https://blog.alphasmanifesto.com/2013/10/13/amar-al-proxy-mo/">alternativas para superar la limitaci&oacute;n de la Same Origin Policy</a>, expliqu&eacute; brevemente el por qu&eacute; de mi preferencia por los reverse proxy.</p>
<p style="text-align: justify;">Aqu&iacute; quiero contar un poco m&aacute;s al respecto y contar, con lujo de detalles, c&oacute;mo configurar un proxy reverso gratuito para proyectos .NET.</p>
<p><!--more--></p>
<h2>&iquest;Por qu&eacute; un proxy reverso?</h2>
<p style="text-align: justify;">Entre todas las opciones mencionadas en <a href="https://blog.alphasmanifesto.com/2013/10/13/amar-al-proxy-mo/">el post anterior</a> se destacaba al proxy reverso como una de mis opciones preferidas, por las siguientes razones:</p>
<ol style="text-align: justify;">
<li><strong>Se puede configurar y versionar como parte del proyecto.</strong> Esto significa que personas que se sumen al equipo no tienen m&aacute;s que actualizar el c&oacute;digo y ejecutarlo para que la aplicaci&oacute;n les funcione. Puede que esto var&iacute;e seg&uacute;n el proxy elegido, pero si podemos usar componentes que nos permita esto, es definitivamente una ventaja no menor.</li>
<li><strong>Es totalmente transparente para la aplicaci&oacute;n.</strong> Esta ventaja se da sobre supuestos en donde tenemos dos equipos distintos trabajando en una aplicaci&oacute;n, o mientras unos est&aacute;n desarrollando el frontend, otros trabajan con el backend y deben exponer una API para que el frontend consuma. Por otro lado, no se debe ensuciar el c&oacute;digo de la aplicaci&oacute;n con mecanismos innecesarios que eviten las limitaciones del navegador cuando esta complejidad no es necesaria en un ambiente real.</li>
<li><strong>La configuracion es simple</strong>, y eso incluye: f&aacute;cil y no propensa a errores.</li>
</ol>
<p style="text-align: justify;">Aclarados esos puntos, pasemos a la parte central de este art&iacute;culo.</p>
<h2 style="text-align: justify;">Configurando ManagedFusion.Rewriter</h2>
<p style="text-align: justify;">En mi b&uacute;squeda por proxies, encontr&eacute; <a href="https://github.com/managedfusion/managedfusion-rewriter">ManagedFusion.Rewriter</a>, un proyecto open source y gratuito implementado en .NET que con unos pocos pasos nos permitir&aacute; configurar un rewriter de URLs y proxy reverso.</p>
<p style="text-align: justify;">Cabe aclarar que ManagedFusion.Rewriter no tiene in desarrollo activo actualmente. Consid&eacute;renlo dos veces antes de usar este proyecto para ambientes de producci&oacute;n. Para entornos de desarrollo, sin embargo, deber&iacute;a ser aceptable.</p>
<h3 style="text-align: justify;">1. Bajar el proyecto</h3>
<p style="text-align: justify;">Recomiendo usar la &uacute;ltima versi&oacute;n disponible <a href="https://github.com/managedfusion/managedfusion-rewriter">en Github</a>. Hay copias en Codeplex y en Nuget, pero parecen estar un par de versiones atr&aacute;s. Como extra, el &uacute;ltimo release tiene un bug que imped&iacute;a ejecutar requests contra URLs que parecieran paths. Pueden leer m&aacute;s de esto aqu&iacute;: <a href="https://github.com/managedfusion/managedfusion-rewriter/pull/6">Proxy issues for URLs without trailing slash</a>.</p>
<p style="text-align: justify;">En la p&aacute;gina principal del repositorio, utilicen la opci&oacute;n de download zip. Tambi&eacute;n pueden clonar el repositorio con su cliente git favorito, pero eso requiere que conozcan la utilizaci&oacute;n de git y quiero dejar esta gu&iacute;a en lo b&aacute;sico posible.</p>

![](/assets/ManagedFusionRewriter-downloadZip.png)

<h3 style="text-align: justify;">2. Compilar el proyecto y obtener el binario</h3>
<p style="text-align: justify;">Luego de descomprimir el archivo bajado, podr&aacute;n abrir el proyecto desde Visual Studio 2012 y deber&iacute;an poder compilarlo sin problemas. Recuerden hacerlo con permisos de administraci&oacute;n porque el proyecto debe ser firmado (de otra forma recibir&aacute;n un error).&nbsp;Hagan el build en la configuraci&oacute;n de Release. En el momento de escritura de este art&iacute;culo, la configuraci&oacute;n es indiferente pero tiene m&aacute;s sentido y precauci&oacute;n para el futuro permitir las optimizaciomes y posibles cambios que ocurran en el proyecto.</p>
<p style="text-align: justify;">Incluso pueden correr los unit tests solo para asegurarse de tener una versi&oacute;n consistente.</p>

![](/assets/ManagedFusionRewriter-runningTests.png)

<p style="text-align: justify;">Ahora navegando a la carpeta del proyecto, sub carpeta <code>src/bin/Release</code> encontrar&aacute;n la librer&iacute;a <code>ManagedFusion.Rewriter.dll</code>.</p>

![](/assets/ManagedFusionRewriter-files.png)

<h3 style="text-align: justify;">3. Agregar la librer&iacute;a a nuestro proyecto</h3>
<p style="text-align: justify;">Ahora procederemos a agregar esta librer&iacute;a a nuestro proyecto. Describir&eacute; c&oacute;mo utilizar el archivo .dll binario, pero otra opci&oacute;n es utilizar el c&oacute;digo fuente como un proyecto referenciado.</p>
<p style="text-align: justify;">&nbsp;Recomiendo tambi&eacute;n agregar la librer&iacute;a a la soluci&oacute;n para que todo pueda ser versionado junto.</p>

![](/assets/ManagedFusionRewriter-references.png)

<h3 style="text-align: justify;">4. Configurar el servidor ASP.NET para que Rewriter funcione</h3>
<p style="text-align: justify;">Esto se puede lograr s&oacute;lo con agregar las siguientes entradas al <code>web.config</code>:</p>
<p><script src="https://gist.github.com/AlphaGit/7175519.js"></script></p>
<h3 style="text-align: justify;">5. Configurar las reglas de rewrite</h3>
<p style="text-align: justify;">ManagedFusion.Rewriter posee varias formas de configurar las reglas de reescritura, pero personalmente prefiero la configuraci&oacute;n por defecto, que incluye la de Apache mod_rewrite.</p>
<p style="text-align: justify;">Para esto crearemos un archivo en la ra&iacute;z de nuestro proyecto, lo llamaremos <code>ManagedFusion.Rewriter.txt</code> y le daremos las reglas de la misma forma que lo har&iacute;amos con mod_rewrite. Por ejemplo:</p>
<p><script src="https://gist.github.com/AlphaGit/7175558.js"></script></p>
<p style="text-align: justify;">Con la segunda l&iacute;nea, puedo probar f&aacute;cilmente que el proxy se encuentra funcionando:</p>

![](/assets/ManagedFusionRewriter-testingProxy.png)

<p style="text-align: justify;">Cuando tengamos problemas, siempre podemos descomentar las l&iacute;neas de <code>RewriteLog</code> y <code>RewriteLogLevel</code> para encontrar un archivo de log con el nombre indicado y verificar qu&eacute; problema est&aacute; ocurriendo.</p>
<p style="text-align: justify;">La documentaci&oacute;n sobre las opciones disponibles est&aacute; en <a href="http://httpd.apache.org/docs/current/rewrite/flags.html">RewriteRule Flags</a>, y los ejemplos que yo inclu&iacute; tienen el siguiente efecto:</p>
<ul>
<li><code>QA</code>: Mantiene la query string.</li>
<li><code>P</code>: Ejecuta un proxy reverso contra la URL especificada (esto tambi&eacute;n funciona como L: terminar la ejecuci&oacute;n de reglas para este request).</li>
<li><code>NC</code>: No es susceptible a may&uacute;sculas y min&uacute;sculas en la evaluaci&oacute;n de la expresi&oacute;n regular.</li>
</ul>
