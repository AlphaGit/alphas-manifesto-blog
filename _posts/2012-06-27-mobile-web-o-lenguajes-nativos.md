---
layout: post
status: publish
published: true
title: 'Mobile: &iquest;Web o lenguajes nativos?'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 4044
wordpress_url: http://blog.alphasmanifesto.com/?p=4044
date: '2012-06-27 00:30:28 +0000'
date_gmt: '2012-06-27 05:30:28 +0000'
categories:
- Technology
tags:
- JavaScript
- HTML
- CSS
- HTML5
- desarrollo m&oacute;vil
- CSS3
- decisi&oacute;n
- estrategia
comments:
- id: 8888
  author: andres
  author_email: notengo@notengo.com
  author_url: ''
  date: '2012-06-27 06:47:08 +0000'
  date_gmt: '2012-06-27 11:47:08 +0000'
  content: 'Pareciera que lo que vende [Xamarin](http://xamarin.com/) es un buen h&iacute;brido:
    compila nativo y tiene distintas librer&iacute;as para cada plataforma de forma
    de hacer independientemente las UIs pero usar una l&oacute;gica com&uacute;n.'
- id: 8889
  author: Alpha
  author_email: alpha@furries.com.ar
  author_url: http://www.alphasmanifesto.com/
  date: '2012-06-27 09:29:44 +0000'
  date_gmt: '2012-06-27 14:29:44 +0000'
  content: |-
    La verdad es que no he visto esta soluci&oacute;n en particular, pero por lo general, lo que hacen muchos de los que compilan a c&oacute;digo nativo siendo comunes (que son pocos) es poner un punto intermedio com&uacute;n entre todas las plataformas. Significa que s&oacute;lo podr&iacute;as llegar al menor denominador com&uacute;n entre las distintas plataformas.

    Independientemente de eso, el ciclo de negocios sigue atado a la voluntad de cada market.
- id: 8891
  author: Cristian
  author_email: Cpwilgenhoff@gmail.com
  author_url: http://Cristianwil.com.ar
  date: '2012-07-02 00:04:32 +0000'
  date_gmt: '2012-07-02 05:04:32 +0000'
  content: Conoces el framework appcelerator ?
- id: 8892
  author: Alpha
  author_email: alpha@furries.com.ar
  author_url: http://www.alphasmanifesto.com/
  date: '2012-07-02 00:06:12 +0000'
  date_gmt: '2012-07-02 05:06:12 +0000'
  content: S&iacute;p, tambi&eacute;n se lo conoce bastante como Titanium, es una
    de esas soluciones h&iacute;bridas que mencionaba.
---
<p style="text-align: justify;">Cuando una organizaci&oacute;n, por grande o peque&ntilde;a que sea, quiere comenzar su presencia en el mercado mobile, hay una pregumta que siempre surge y que muchas veces no les resulta f&aacute;cil resolver. &iquest;Qu&eacute; es m&aacute;s conveniente: utilizar tecnolog&iacute;as web y sus capabilidades para llegar a todos los dispositivos, o utilizar el framework propio de los dispositivos para utilizar todo el potencial que ellos ofrecen?</p>
<p style="text-align: justify;">Est&aacute; claro que una soluci&oacute;n web puede hacer uso de todas las nuevas tecnolog&iacute;as, incluyendo HTML5, CSS3, las nuevas versiones de JavaScript y una variedad de trucos que muchos programadores conocen, pero utilizar el lenguaje nativo de los dispositivos hace que nada sea imposible. Entonces, &iquest;cu&aacute;l es la m&aacute;s apropiada?</p>
<p style="text-align: justify;">Como siempre, <strong>la respuesta correcta no es absoluta</strong>, sino que varios factores juegan al momento de una desici&oacute;n estrat&eacute;gica. Primero, consideremos los beneficios y problemas de cada elecci&oacute;n, lado a lado.</p>
<table class="aligncenter" style="width: 100%;" border="1" cellpadding="10" align="center">
<thead>
<tr>
<td></td>
<td>&nbsp;Web (HTML, JS, CSS)</td>
<td>&nbsp;Lenguaje nativo</td>
</tr>
</thead>
<tbody>
<tr>
<td>A&nbsp;favor</td>
<td>
<ul>
<li>Cross-browser</li>
<li>Curva de aprendizaje suave</li>
<li>Est&aacute;ndares definidos</li>
<li>Alto nivel</li>
</ul>
</td>
<td>
<ul>
<li>Acceso a cualquier funcionalidad del dispositivo</li>
<li>Mejor performance</li>
<li>Look and feel consistente con otras apps</li>
<li>Capacidad de reinventar el UI completamente</li>
</ul>
</td>
</tr>
<tr>
<td>En&nbsp;contra</td>
<td>
<ul>
<li>No toda funcionalidad de dispositivo m&oacute;vil est&aacute; disponible</li>
<li>Distintos niveles de implementaci&oacute;n seg&uacute;n el navegador</li>
<li>Est&aacute;ndares todav&iacute;a en desarrollo</li>
<li>Requiere conectividad, al menos en alg&uacute;n punto</li>
</ul>
</td>
<td>
<ul>
<li>Requiere instalaci&oacute;n de una aplicaci&oacute;n</li>
<li>Diferentes seg&uacute;n dispositivos, modelos y versiones</li>
<li>Diferentes pol&iacute;ticas de market</li>
<li>Requiere de uso de licencias para algunos markets</li>
<li>Requiere aprendizaje y especializaci&oacute;n</li>
<li>Los ciclos de vida los determina el market</li>
</ul>
</td>
</tr>
</tbody>
</table>
<p style="text-align: justify;">Existe una tercera opci&oacute;n que he elegido no listar: los h&iacute;bridos. Son compa&ntilde;&iacute;as o frameworks que aseguran la llegada a una mayor&iacute;a de dispositivos, solucionando la necesidad de aprender distintos lenguajes. Sin embargo, estas soluciones por lo general son tercerizadas (es decir, corren la aplicaci&oacute;n por su cuenta), o son wrappers (es decir, toda nuestra aplicaci&oacute;n corre dentro de otra aplicaci&oacute;n que ellos proveen) o simplemente revierten a aplicaciones HTML sin demasiado poder. El mercado todav&iacute;a est&aacute; surgiendo para estos frameworks y hay resultados muy variados con ellos a&uacute;n, raz&oacute;n por la cual he elegido dejarlos fuera de la consideraci&oacute;n de hoy.</p>
<p style="text-align: justify;">Tomar una decisi&oacute;n seg&uacute;n cu&aacute;l opci&oacute;n tenga m&aacute;s &iacute;tems de su lado puede parecer una soluci&oacute;n f&aacute;cil, pero realmente no es la m&aacute;s sabia. <strong>La decisi&oacute;n debe alinearse con los objetivos estrat&eacute;gicos de la organizaci&oacute;n</strong>, incluyendo el mercado destino, el tipo de usuario que se espera tener, los recursos disponibles para afrontar el desarrollo, y el tipo de llegada que la aplicaci&oacute;n desea tener.</p>
<p style="text-align: justify;">Como un buen ejemplo, muchas empresas grandes quieren entrar al mercado mobile, y deben hacer algo digno de su nombre, pero quieren tener presencia en todos los dispositivos. Al mismo tiempo, startups peque&ntilde;as quieren hacer una inversi&oacute;n peque&ntilde;a para aproximarse al mercado. En estos casos la mejor opci&oacute;n ser&aacute; web, excepto que requieran capacidades especiales (como acceso a la red celular, o acceso USB, etc&eacute;tera).</p>
<p style="text-align: justify;">En los otros casos, o cuando el p&uacute;blico destino es un conjunto de usuarios muy particular, las soluciones nativas pueden ser las m&aacute;s apropiadas. Por ejemplo, cuando el usuario ser&aacute;n oficiales de seguridad de una empresa, haciendo uso de la c&aacute;mara o aceler&oacute;metro del tel&eacute;fono, las organizaciones pueden decidir que tal o cu&aacute;l marca de dispositivo con tal o cu&aacute;l versi&oacute;n ser&aacute; la apropiada y reducir el desarrollo a un s&oacute;lo lenguaje.</p>
