---
layout: single
title: 'Link del día: Cómo esconder passwords públicamente'
date: '2010-05-03 11:04:49 +0000'
date_gmt: '2010-05-03 13:04:49 +0000'
categories:
- Link del día
tags:
- creatividad
- seguridad
- passwords
- esteganografía
---

últimamente se ha puesto de moda una buena idea que la gente de [PasswordCard](http://passwordcard.org/) ha propuesto. PasswordCard es la idea de tener una tarjeta de colores y símbolos y una combinación de letras mayúsculas, minúsculas y números.

 ¿Cuál es la idea? Nosotros podemos elegir nuestro password de cualquier punto de la tarjeta. Podemos recordar en dónde se encuentra gracias a los colores y a los símbolos de la primera línea. (Por ejemplo, rojo-triángulo, o celeste-dólar.) Dicha combinación nos dará un símbolo con el que podemos comenzar a escribir nuestro password, copiando los que sigan a continuación. Sólo tenemos que recordar dicha combinación, que es ciertamente más fácil de recordar que el password en sí, y con esta tarjeta nos podemos acordar.

La tarjeta la podemos llevar a todos lados, porque, por supuesto, nadie más que nosotros sabe la combinación con la que comienza nuestro password, de forma que esta tarjeta puede mostrarse públicamente sin miedo a que roben tus passwords.

 ¿Qué ocurre si perdemos nuestra tarjeta? Podemos simplemente volver a imprimirla. Existe un código hexadecimal que identifica a cada tarjeta. Podemos guardar este código por cualquier problema, para reimprimir nuestra tarjeta si es que la perdemos o se arruina. Por supuesto, el código no indica para nada cuál es el password que elegimos, de forma que aún así no lo estaremos revelando.

Como consideración extra, suponiendo que nuestra tarjeta cayera en malas manos, cada una de las tarjetas tiene 29 columnas y 8 filas. Esto significa, nuestro password podría comenzar en 232 posiciones distintas. Asumiendo que nuestro password sólo se utiliza hasta el final de la línea, existen sólo 232 passwords posibles para esta tarjeta, con lo cual, sería fácil para cualquiera crackear nuestro password. Suponiendo que eligiéramos un límite que no es el final de la tarjeta, tendríamos 8 &times; 29 &times; 28 &times; 27 ... &times; 2 &times; 1 = 8 &times; 29! &asymp; 70 &times; 10<sup>22</sup> combinaciones. Ya es un poco más seguro. Si comparáramos contra cualquier password de la misma longitud que inventáramos nosotros (es decir, sin uso de una tarjeta), utilizando los mismos caracteres, la combinación sería de 62 (10 números + 26 minúsculas + 26 mayúsculas) &times; 62... &times; 62 = 62<sup>29</sup> &asymp; 9<sup>51</sup>, (y esto es, sin considerar la incertidumbre del tamaño del password) con lo que, en el fondo, la buena memoria está más segura que las tarjetas.

Pero para aquellos que, como yo, tengan dificultad en recordar este tipo de cosas, sin duda las tarjetas serán de buena utilidad.

_Soy un zorrinito tarjetero._
