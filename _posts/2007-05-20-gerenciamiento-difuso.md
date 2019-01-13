---
layout: post
status: publish
published: true
title: Gerenciamiento difuso
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 76
wordpress_url: http://zorri2.wordpress.com/2007/05/20/gerenciamiento-difuso/
date: '2007-05-20 20:40:00 +0000'
date_gmt: '2007-05-20 20:40:00 +0000'
categories:
- Projects
- Technology
tags: []
comments: []
---
<div dir="ltr" style="direction:ltr;text-align:justify;"> Muchas veces nos hemos encontrado con el problema de querer decidir las cosas por simple democracia. El proceso es simple. Se da un problema, se proponen soluciones, cada uno pone su voto por una y solo una soluci&oacute;n, y la soluci&oacute;n con m&aacute;s votos es la llevada a cabo por el grupo. A pesar de que muchos no est&eacute;n de acuerdo, es lo que la mayor&iacute;a quiere y por tanto es lo que mejor se cree en general que se puede hacer.</p>
<p>Como ejemplo ilustrativo, supongamos que los votantes son las personas P<sub>1</sub>, P<sub>2</sub>, P<sub>3</sub>, P<sub>4</sub> y P<sub>5</sub>. Se plantea un problema y se presentan tres soluciones: S<sub>1</sub>, S<sub>2</sub> y S<sub>3</sub>.</p>
<p>Si P<sub>1</sub> pone su voto por S<sub>1</sub>, P<sub>2</sub> y P<sub>3</sub> lo ponen por S<sub>2</sub>, y P<sub>4</sub> y P<sub>5</sub> lo ponen por S<sub>3</sub>, entonces al hacer el recuento de votos nos encontraremos en la siguiente situaci&oacute;n:</p>
<div align="center">
<table class="zeroBorder" border="0" cellpadding="3" cellspacing="0">
<tbody>
<tr>
<td style="font-weight:bold;text-align:center;" width="50%">           Soluci&oacute;n    </td>
<td style="font-weight:bold;text-align:center;" width="50%">           Cantidad de votos    </td>
</tr>
<tr>
<td style="text-align:center;" width="50%">           S<sub>1</sub>    </td>
<td style="text-align:center;" width="50%">           1    </td>
</tr>
<tr>
<td style="text-align:center;" width="50%">           S<sub>2</sub>    </td>
<td style="text-align:center;" width="50%">           2    </td>
</tr>
<tr>
<td style="text-align:center;" width="50%">           S<sub>3</sub>    </td>
<td style="text-align:center;" width="50%">           2    </td>
</tr>
</tbody>
</table></div>
<p>En este caso, el problema obvio es que no se puede decidir por una soluci&oacute;n inmediatamente, puesto que no hay una definida en donde la mayor&iacute;a haya decidido. En estos casos, muy com&uacute;nmente se apela a una segunda vuelta, en donde las soluciones que de seguro no ser&aacute;n elegidas por la mayor&iacute;a son descartadas. En nuestro ejemplo, podemos ver que S<sub>1 </sub>no ser&aacute; elegida como la &uacute;ltima soluci&oacute;n, de modo que quedar&aacute; descartada. Se volver&aacute; a hacer una votaci&oacute;n, y el proceso se repetir&aacute; varias veces si es necesario, hasta que haya una soluci&oacute;n "ganadora".</p>
<p>Podemos suponer que en este caso, al ser descartada la soluci&oacute;n S<sub>1</sub>, P<sub>1 </sub>deber&aacute; elegir otra de las opciones, a pesar de que no sea su favorita. Este es el caso conocido vulgarmente como la votaci&oacute;n por el "menos peor", por lo que elige de las otras soluciones la que m&aacute;s satisface sus necesidades o expectativas.</p>
<div align="center">
<table class="zeroBorder" border="0" cellpadding="3" cellspacing="0">
<tbody>
<tr>
<td style="font-weight:bold;text-align:center;" width="50%">           Soluci&oacute;n    </td>
<td style="font-weight:bold;text-align:center;" width="50%">           Cantidad de votos    </td>
</tr>
<tr>
<td style="text-align:center;" width="50%">           S<sub>2</sub>    </td>
<td style="text-align:center;" width="50%">           3    </td>
</tr>
<tr>
<td style="text-align:center;" width="50%">           S<sub>3</sub>    </td>
<td style="text-align:center;" width="50%">           2    </td>
</tr>
</tbody>
</table></div>
<p>Si en nuestro ejemplo, P<sub>1</sub> se decidi&oacute; por S<sub>2</sub>, entonces habr&aacute; una clara mayor&iacute;a en las votaciones, y puede definirse a S<sub>2</sub> como la ganadora.</p>
<p>Este sistema de votaci&oacute;n, tan b&aacute;sico y directo, es el sistema utilizado en muchas naciones como sistema de elecci&oacute;n pol&iacute;tico. Tambi&eacute;n suele utilizarse en la administraci&oacute;n de negocios para la toma de decisiones en un grupo, o incluso suele hacerse as&iacute; en una reuni&oacute;n entre amigos decidiendo qu&eacute; comer.</p>
<p>Sin embargo, existe un grave problema en estas situaciones. Supongamos que P<sub>1 </sub>nunca hubiese formado parte del grupo, y que por tanto, S<sub>2 </sub>y S<sub>3</sub> solo hubiesen obtenido 2 votos cada una. &iquest;De qu&eacute; manera se resuelve cu&aacute;l es la mayor&iacute;a?</p>
<p>Muchas veces se supone que eso nunca va a ocurrir (como en las elecciones pol&iacute;ticas), muchas veces se resuelve por medio del azar (como arrojando una moneda al aire entre amigos), o muchas veces se coloca una ponderaci&oacute;n sobre los votos (como en los grupos dirigentes de empresas - si el director de la empresa eligi&oacute; S<sub>2 </sub>entonces ante la indecisi&oacute;n, se sigue ese camino).</p>
<div style="text-align:center;">     ***</div>
<p>Hace poco se me pidi&oacute; que dise&ntilde;e un sistema de votaci&oacute;n para un grupo reducido (par - pueden haber empates), en donde no puede haber ponderaci&oacute;n de votos, y el azar no es un m&eacute;todo fiable por los medios que este grupo maneja.</p>
<p>Durante un tiempo lo pens&eacute; sin muchas soluciones, pero luego tuve la inspiraci&oacute;n de atacar a las constantes del sistema para cambiarlo. Es decir, &iquest;c&oacute;mo surg&iacute;an las tres alternativas que plante&eacute; hasta reci&eacute;n?</p>
<p>La del suponer que eso nunca ocurrir&aacute;, en el caso de las elecciones pol&iacute;ticas, surge por la improbabilidad del caso. Supongamos que quiz&aacute;s las personas de un pa&iacute;s no s&oacute;lo son de un n&uacute;mero par (posibilidad: 50%), sino que es pr&aacute;cticamente imposible que en la votaci&oacute;n a dos candidatos, exactamente la mitad elija a uno, y exactamente la mitad elija a otro. Eso es el cambio de una constante: las reglas de votaci&oacute;n suponen la posibilidad de que exista este empate ideal... esa posibilidad, esa "constante" (valor que existe por la forma de las reglas) existe. Nosotros la cambiamos, hacemos que no exista simplemente al no tenerla en cuenta por la baja posibilidad del caso.</p>
<p>En el sistema ponderado, como el del grupo dirigente de la empresa, se cambia otra constante. Todos los votos valen iguales, por ejemplo, "1 voto", como unidad de medida. Con otro criterio, los votos de otros (grupo superior, l&iacute;der de la empresa, accionista o qui&eacute;n fuera) valen m&aacute;s, por ejemplo "1.2 votos". En caso de un empate de "cantidad", estos votos ponderados ser&aacute;n los que hagan desaparecer la posibilidad de empate. Se cambia, en pocas palabras, el valor constante de cada voto.</p>
<p>En el &uacute;ltimo ejemplo que nombr&eacute;, el de los amigos, la constante que se cambia es la cantidad de votantes. Al haber un empate, debe crearse una forma en la que un elemento externo introduzca una variaci&oacute;n en ese sistema "equilibrado" entre la cantidad de gente que elige una soluci&oacute;n y la gente que elige otra. Tanto una moneda, como un dado, como cualquier elemento que est&eacute; fuera del control de los involucrados (si es que se va a hacer de una forma "justa"). De esta forma, se cambia la constante de la cantidad de votantes.</p>
<p>En mi caso particular, tuve la idea de cambiar otra constante... aunque son dos en realidad: la cantidad de votos por votante, junto con la ponderaci&oacute;n de la votaci&oacute;n.</p>
<p>Inspirado en los sistemas difusos, se me ocurri&oacute; la posibilidad de que cada votante otorgara una puntuaci&oacute;n a cada soluci&oacute;n posible.</p>
<p>Supongamos el caso anterior, en donde los votantes son P<sub>1</sub>, P<sub>2</sub>, P<sub>3</sub>, P<sub>4</sub> y P<sub>5</sub>. Las soluciones son S<sub>1</sub>, S<sub>2</sub> y S<sub>3</sub>. A continuaci&oacute;n, veremos una posible situaci&oacute;n en donde cada votante vota las soluciones con un puntaje del 1 al 10.</p>
<p>
<div align="center">
<table class="zeroBorder" border="0" cellpadding="3" cellspacing="0">
<tbody>
<tr>
<td style="text-align:center;font-weight:bold;" width="33%">Votante</td>
<td style="text-align:center;font-weight:bold;" width="33%">Soluci&oacute;n</td>
<td style="text-align:center;font-weight:bold;" width="33%">Puntaje otorgado</td>
</tr>
<tr>
<td style="t<br />
ext-align:center;" width="33%">P<sub>1</sub></td>
<td style="text-align:center;font-style:italic;" width="33%">S<sub>1</sub></td>
<td style="text-align:center;font-style:italic;" width="33%">10</td>
</tr>
<tr>
<td style="text-align:center;" width="33%"></td>
<td style="text-align:center;" width="33%">S<sub>2</sub></td>
<td style="text-align:center;" width="33%">7</td>
</tr>
<tr>
<td style="text-align:center;" width="33%"></td>
<td style="text-align:center;" width="33%">S<sub>3</sub></td>
<td style="text-align:center;" width="33%">2</td>
</tr>
<tr>
<td style="text-align:center;" width="33%">P<sub>2</sub></td>
<td style="text-align:center;" width="33%">S<sub>1</sub></td>
<td style="text-align:center;" width="33%">4</td>
</tr>
<tr>
<td style="text-align:center;" width="33%"></td>
<td style="text-align:center;font-style:italic;" width="33%">S<sub>2</sub></td>
<td style="text-align:center;font-style:italic;" width="33%">7</td>
</tr>
<tr>
<td style="text-align:center;" width="33%"></td>
<td style="text-align:center;" width="33%">S<sub>3</sub></td>
<td style="text-align:center;" width="33%">2</td>
</tr>
<tr>
<td style="text-align:center;" width="33%">P<sub>3</sub></td>
<td style="text-align:center;" width="33%">S<sub>1</sub></td>
<td style="text-align:center;" width="33%">4</td>
</tr>
<tr>
<td style="text-align:center;" width="33%"></td>
<td style="text-align:center;font-style:italic;" width="33%">S<sub>2</sub></td>
<td style="text-align:center;font-style:italic;" width="33%">9</td>
</tr>
<tr>
<td style="text-align:center;" width="33%"></td>
<td style="text-align:center;" width="33%">S<sub>3</sub></td>
<td style="text-align:center;" width="33%">1</td>
</tr>
<tr>
<td style="text-align:center;" width="33%">P<sub>4</sub></td>
<td style="text-align:center;" width="33%">S<sub>1</sub></td>
<td style="text-align:center;" width="33%">6</td>
</tr>
<tr>
<td style="text-align:center;" width="33%"></td>
<td style="text-align:center;" width="33%">S<sub>2</sub></td>
<td style="text-align:center;" width="33%">2</td>
</tr>
<tr>
<td style="text-align:center;" width="33%"></td>
<td style="text-align:center;font-style:italic;" width="33%">S<sub>3</sub></td>
<td style="text-align:center;" width="33%"><span style="font-style:italic;">10</span></td>
</tr>
<tr>
<td style="text-align:center;" width="33%">P<sub>5</sub></td>
<td style="text-align:center;" width="33%">S<sub>1</sub></td>
<td style="text-align:center;" width="33%">4</td>
</tr>
<tr>
<td style="text-align:center;" width="33%"></td>
<td style="text-align:center;" width="33%">S<sub>2</sub></td>
<td style="text-align:center;" width="33%">4</td>
</tr>
<tr>
<td style="text-align:center;" width="33%"></td>
<td style="text-align:center;font-style:italic;" width="33%">S<sub>3</sub></td>
<td style="text-align:center;" width="33%"><span style="font-style:italic;">8</span></td>
</tr>
</tbody>
</table>
</div>
<p>En letra <span style="font-style:italic;">cursiva</span> podemos apreciar como, al igual que en el primer ejemplo, P<sub>1 </sub>tiene preferencia por S<sub>1</sub>, P<sub>2 </sub>y P<sub>3 </sub>tienen preferencia por S<sub>2 </sub>y por &uacute;ltimo, P<sub>4 </sub>y P<sub>5 </sub>tienen preferencia por S<sub>3</sub>. Esto se manifiesta en que esas opciones recibieron m&aacute;s puntajes que las dem&aacute;s. El resto de las opciones recibi&oacute; tambi&eacute;n un puntaje, y a la vez la soluci&oacute;n elegida tampoco tiene por qu&eacute; recibir el puntaje m&aacute;ximo (como es el caso de P<sub>5 </sub>decidi&eacute;ndose por S<sub>3</sub> o P<sub>3 </sub>decidi&eacute;ndose por S<sub>2</sub>).</p>
<p>En este sistema, la soluci&oacute;n elegida ser&iacute;a la que obtuviera mayor puntuaci&oacute;n. En este ejemplo:</p>
<div align="center">
<table class="zeroBorder" border="0" cellpadding="3" cellspacing="0">
<tbody>
<tr>
<td style="text-align:center;">S<sub>1</sub>:</td>
<td style="text-align:left;">&sum; S<sub>1</sub>(P<sub>i</sub>) =</td>
<td style="text-align:center;"></td>
</tr>
<tr>
<td style="text-align:center;"></td>
<td style="text-align:center;">= S<sub>1</sub>(P<sub>1</sub>) + S<sub>1</sub>(P<sub>2</sub>) + S<sub>1</sub>(P<sub>3</sub>) + S<sub>1</sub>(P<sub>4</sub>) + S<sub>1</sub>(P<sub>5</sub>) =</td>
<td style="text-align:center;"></td>
</tr>
<tr>
<td style="text-align:center;"></td>
<td style="text-align:right;">= 10 + 4 + 4 + 6 + 4 =</td>
<td style="text-align:center;">28</td>
</tr>
<tr>
<td style="text-align:center;">S<sub>2</sub>:</td>
<td style="text-align:left;">&sum; S<sub>2</sub>(P<sub>i</sub>) =</td>
<td style="text-align:center;"></td>
</tr>
<tr>
<td style="vertical-align:top;">  </td>
<td style="vertical-align:top;text-align:center;">= S<sub>2</sub>(P<sub>1</sub>) + S<sub>2</sub>(P<sub>2</sub>) + S<sub>2</sub>(P<sub>3</sub>) + S<sub>2</sub>(P<sub>4</sub>) + S<sub>2</sub>(P<sub>5</sub>) =</td>
<td style="vertical-align:top;">  </td>
</tr>
<tr>
<td style="text-align:center;"></td>
<td style="text-align:right;">= 7 + 7 + 9 + 2 + 4 =</td>
<td style="text-align:center;">29</td>
</tr>
<tr>
<td style="text-align:center;">S<sub>3</sub>:</td>
<td style="text-align:left;">&sum; S<sub>3</sub>(P<sub>i</sub>) =</td>
<td style="text-align:center;"></td>
</tr>
<tr>
<td style="text-align:center;"></td>
<td style="text-align:center;">= S<sub>3</sub>(P<sub>1</sub>) + S<sub>3</sub>(P<sub>2</sub>) + S<sub>3</sub>(P<sub>3</sub>) + S<sub>3</sub>(P<sub>4</sub>) + S<sub>3</sub>(P<sub>5</sub>) =</td>
<td style="text-align:center;"></td>
</tr>
<tr>
<td style="text-align:center;"></td>
<td style="text-align:right;">= 2 + 2 + 1 + 10 + 8 =</td>
<td style="text-align:center;">23</td>
</tr>
</tbody>
</table>
</div>
<p>Siguiendo el anterior ejemplo, podr&iacute;amos ver que si P<sub>1 </sub>no est&aacute; en el grupo para votar, los resultados ser&iacute;an de la siguiente forma:</p>
<div align="center">
<table class="zeroBorder" border="0" cellpadding="3" cellspacing="0">
<tbody>
<tr>
<td style="text-align:center;">S<sub>1</sub>:</td>
<td style="text-align:left;">&sum; S<sub>1</sub>(P<sub>i</sub>) =</td>
<td style="text-align:center;"></td>
</tr>
<tr>
<td style="text-align:center;"></td>
<td style="text-align:center;">= S<sub>1</sub>(P<sub>2</sub>) + S<sub>1</sub>(P<sub>3</sub>) + S<sub>1</sub>(P<sub>4</sub>) + S<sub>1</sub>(P<sub>5</sub>) =</td>
<td style="text-align:center;"></td>
</tr>
<tr>
<td style="text-align:center;"></td>
<td style="text-align:right;">= 4 + 4 + 6 + 4 =</td>
<td style="text-align:center;">18</td>
</tr>
<tr>
<td style="text-align:center;">S<sub>2</sub>:</td>
<td style="text-align:left;">&sum; S<sub>2</sub>(P<sub>i</sub>) =</td>
<td style="text-align:center;"></td>
</tr>
<tr>
<td style="vertical-align:top;">  </td>
<td style="vertical-align:top;text-align:center;">= S<sub>2</sub>(P<sub>2</sub>) + S<sub>2</sub>(P<sub>3</sub>) + S<sub>2</sub>(P<sub>4</sub>) + S<sub>2</sub>(P<sub>5</sub>) =</td>
<td style="vertical-align:top;">  </td>
</tr>
<tr>
<td style="text-align:center;"></td>
<td style="text-align:right;">= 7 + 9 + 2 + 4 =</td>
<td style="text-align:center;">22</td>
</tr>
<tr>
<td style="text-align:center;">S<sub>3</sub>:</td>
<td style="text-align:left;">&sum; S<sub>3</sub>(P<sub>i</sub>) =</td>
<td style="text-align:center;"></td>
</tr>
<tr>
<td style="text-align:center;"></td>
<td style="text-align:center;">= S<sub>3</sub>(P<sub>2</sub>) + S<sub>3</sub>(P<sub>3</sub>) + S<sub>3</sub>(P<sub>4</sub>) + S<sub>3</sub>(P<sub>5</sub>) =</td>
<td style="text-align:center;"></td>
</tr>
<tr>
<td style="text-align:center;"></td>
<td style="text-align:right;">= 2 + 1 + 10 + 8 =</td>
<td style="text-align:center;">21</td>
</tr>
</tbody>
</table>
</div>
<p>
<div style="text-align:center;">***</div>
<p>En el caso hipot&eacute;tico en que las soluciones resultantes tuvieran igual puntuaci&oacute;n, se puede implementar la teor&iacute;a del m&eacute;todo <span style="font-style:italic;">Delphi</span>. Este m&eacute;todo habla de hacer sucesivas rondas. En la primera ronda, cada uno hace una ponderaci&oacute;n de las opciones, sin conocer la puntuaci&oacute;n que los dem&aacute;s o<br />
torgan. Al no ser satisfactoria la soluci&oacute;n, se hace una segunda ronda. Obviamente, al haber visto los puntajes de los dem&aacute;s, algunos considerar&aacute;n que algunas ponderaciones propias no eran del todo correctas y las variar&aacute;n.</p>
<p>Si luego de la segunda o tercera ronda de hacer estos cambios, a&uacute;n no se llega a una determinaci&oacute;n satisfactoria, cada integrante explica las razones de su propias puntuaciones, detallando los pro y los contra que le llev&oacute; a poner un determinado puntaje a una determinada soluci&oacute;n. Luego de esto, se hace otra ronda m&aacute;s, en donde cada integrante pone una nueva puntuaci&oacute;n a cada una de las soluciones propuestas, pensando en todos los pros y los contras expuestos.</p>
<div style="text-align:center;">***</div>
<p>Con este sistema, no s&oacute;lo se hace mucho m&aacute;s dif&iacute;cil el problema que tiene la "democracia par", que es el de los empates y su resoluci&oacute;n, sino que adem&aacute;s no se descartan soluciones sino que se tienen en cuenta seg&uacute;n el grado de aceptaci&oacute;n que estas tienen, que es lo m&aacute;s administrativamente correcto para poder llevar un buen manejo de las decisiones tomadas.</p>
<p><span style="font-style:italic;">Soy un zorrinito gerencial.</span></div>
