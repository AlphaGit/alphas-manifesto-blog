---
layout: post
status: publish
published: true
title: 'Link del d&iacute;a: En defensa de los hacks CSS'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 3023
wordpress_url: http://blog.alphasmanifesto.com/?p=3023
date: '2011-06-01 13:47:07 +0000'
date_gmt: '2011-06-01 15:47:07 +0000'
categories:
- Link del d&iacute;a
tags:
- HTML
- CSS
- design
- navegadores
- experiencia del usuario
- hacks
comments: []
---
<p style="text-align: justify;">Para mi sorpresa, me encontr&eacute; con un art&iacute;culo de Mathias Bynens llamado <a href="http://mathiasbynens.be/notes/safe-css-hacks">In defense of CSS hacks &ndash;&nbsp;introducing "safe CSS hacks"</a>. &Eacute;l habla e introduce el concepto de los hacks CSS. Perm&iacute;tanme hablar un poco sobre su idea.</p>
<p style="text-align: justify;">&Eacute;l menciona que los CSS hacks son b&aacute;sicamente comportamiento especial que podemos invocar en cada navegador, algo que a veces es totalmente deseado, y no tiene por qu&eacute; ser un problema o una mala pr&aacute;ctica, sino que puede ser usado para muchas cosas. El uso m&aacute;s com&uacute;n que se le ha dado hoy en d&iacute;a es hacer "tweaks" espec&iacute;ficos para la forma de renderizaci&oacute;n de cada navegador/versi&oacute;n y entonces lograr una visi&oacute;n consistente a lo largo de todos los navegadores.</p>
<p style="text-align: justify;">Sin embargo, decir que tenemos control sobre el estilo de cada navegador y/o versi&oacute;n no necesariamente quiere decir que lo utilicemos s&oacute;lo para lograr una vista homog&eacute;nea. De hecho, gracias a ellas podemos utilizar determinadas caracter&iacute;sticas que hacen la exploraci&oacute;n en un determinado navegador m&aacute;s natural dentro de las capacidades del mismo.</p>
<p style="text-align: justify;">Esto, combinado con sentencias condicionales, hace que podamos tener mucho control sobre lo que el navegador utiliza de nuestro c&oacute;digo.</p>
<p style="text-align: justify;">Los dejo con el &uacute;ltimo ejemplo que el art&iacute;culo plantea:</p>
<p>[code lang="html"]<br />
<!--[if lt IE 9]><html class="lte-ie8"><![endif]--><br />
<!--[if gt IE 8]><!--><html><!--<![endif]--><br />
[/code]</p>
<p>[code lang="css"]<br />
.foo {<br />
  color: black;<br />
}</p>
<p>.lte-ie8 .foo {<br />
  color: green; /* IE8 and older */<br />
  *color: blue; /* IE7 and older */<br />
  _color: red; /* IE6 and older */<br />
}<br />
[/code]</p>
<p style="text-align: justify;">Personalmente no me encuentro de acuerdo con esta propuesta, pero veo que tiene sus fundamentos. &iquest;Ideas? &iquest;Cr&iacute;ticas?</p>
<p style="text-align: justify;"><em>Soy un zorrinito hackeado.</em></p>
