---
layout: post
status: publish
published: true
title: Flujos de trabajo en git
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5120
wordpress_url: http://blog.alphasmanifesto.com/?p=5120
date: '2014-06-21 18:26:08 +0000'
date_gmt: '2014-06-21 23:26:08 +0000'
categories:
- Projects
- Technology
tags:
- desarrollo
- work
- desarollo
- GitHub
- git
- control de versiones
- what-now
- rebase
- merge
- historial de cambios
comments: []
---

![](/assets/gitTree.png)

<p style="text-align: justify;">Desde la &uacute;ltima vez que d&iacute; una actualizaci&oacute;n sobre what-now ha pasado un tiempo considerable. Mi intenci&oacute;n original era ser m&aacute;s consistente con estas actualizaciones, a modo de diario de desarrollo, pero varias cosas me detuvieron. Por un lado no quise convertirme en spam o publicidad de un producto que ni siquiera vale la pena, y por otro lado, no siempre tengo algo interesante que contar.</p>
<p style="text-align: justify;">Ahora s&iacute; lo tengo, de forma que proceder&eacute; a contar qu&eacute; aprend&iacute; en estos &uacute;ltimos meses, comenzando por los flujos de trabajo de git.</p>
<p><!--more--></p>
<h2>Los cambios en what-now</h2>
<p style="text-align: justify;">Desde que di mi actualizaci&oacute;n la vez pasada, estas nuevas caracter&iacute;sticas fueron incluidas en what-now como producto:</p>
<ul>
<li style="text-align: justify;">[<a href="https://github.com/AlphaGit/what-now/issues/13">#13</a>] Agregu&eacute; la p&aacute;gina de about (que luego desapareci&oacute; por el redise&ntilde;o visual)</li>
<li style="text-align: justify;">[<a href="https://github.com/AlphaGit/what-now/issues/1">#1</a>] Agregu&eacute; la posibilidad de editar tareas ya agregadas.</li>
<li style="text-align: justify;">[<a href="https://github.com/AlphaGit/what-now/issues/2">#2</a>, <a href="https://github.com/AlphaGit/what-now/issues/3">#3</a>] Agregu&eacute; la posibilidad de seleccionar una tarea y verla destacada. Esto es tanto en el listado de tareas como en el gr&aacute;fico.</li>
<li style="text-align: justify;">[<a href="https://github.com/AlphaGit/what-now/issues/6">#6</a>]&nbsp;Resolv&iacute; que los textos largos no se mostraban en m&uacute;ltiples l&iacute;neas en el gr&aacute;fico.</li>
<li style="text-align: justify;">[<a href="https://github.com/AlphaGit/what-now/issues/8">#8</a>] Le d&iacute; algo de estilo y dise&ntilde;o a la aplicaci&oacute;n. Deliberadamente dej&eacute; dispositivos m&oacute;biles de lado. Quit&eacute; la p&aacute;gina de about y una 404 que casi no se usaba.</li>
<li style="text-align: justify;">[<a href="https://github.com/AlphaGit/what-now/issues/10">#10</a>] Agregu&eacute; la posibilidad de cargar y guardar las tareas a un archivo en disco.</li>
<li style="text-align: justify;">[<a href="https://github.com/AlphaGit/what-now/issues/9">#9</a>]&nbsp;Hice m&aacute;s f&aacute;cil poder agregar varias tareas r&aacute;pidamente.</li>
<li style="text-align: justify;">[<a href="https://github.com/AlphaGit/what-now/issues/18">#18</a>] Resolv&iacute; que una tarea dependiera de s&iacute; misma, congelando la aplicaci&oacute;n.</li>
<li style="text-align: justify;">[<a href="https://github.com/AlphaGit/what-now/issues/20">#20</a>] Mejor&eacute; la forma en la que se grafica para que se muestren gr&aacute;ficos complicados sin que se mezclen los caminos.</li>
<li style="text-align: justify;">[<a href="https://github.com/AlphaGit/what-now/issues/21">#21</a>] Agregu&eacute; autocompletado y "tagging" para elegir dependencias de una tarea.</li>
<li style="text-align: justify;">[<a href="https://github.com/AlphaGit/what-now/issues/27">#27</a>] Resolv&iacute; unos problemitas de estilo con resoluciones peque&ntilde;as.</li>
</ul>
<h2>Historia en&nbsp;commits</h2>
<p style="text-align: justify;">La raz&oacute;n por la que pude poner tan f&aacute;cil en palabras qu&eacute; cambios ocurrieron de una fecha a otra, a modo de bit&aacute;cora de cambios (changelog) es porque convert&iacute; a GitHub en mi changelog. Es posible eliminar la historia de los commits dej&aacute;ndolos s&oacute;lo con la informaci&oacute;n relevante para el futuro.</p>
<h3>Flujo 1: branch, merge</h3>
<p style="text-align: justify;">Yo estaba acostumbrado al siguiente flujo en git:</p>
<ol style="text-align: justify;">
<li>Nueva rama "<code>myFeature</code>" partiendo desde <code>master</code></li>
<li>Trabajar en <code>myFeature</code> (commit, commit, commit...).&nbsp;Trabajo terminado.</li>
<li>Actualizar <code>myFeature</code> para que tenga los &uacute;ltimos cambios de master: <code>git merge master</code>
<ol>
<li>Resolver conflictos y problemas que hayan ocurrido de esos cambios</li>
</ol>
</li>
<li>Una vez todo resuelto, actualizar <code>master</code><br />
<code>git checkout master</code><br />
<code>git merge myFeature</code></li>
<li>Eliminar la rama: <code>git branch -D myFeature</code></li>
</ol>
<p style="text-align: justify;">El resultado de este es lo esperado: una rama master siendo actualizada y el historial del cambio de cada rama disponible en el historial de git. Esto es tambi&eacute;n lo que hace por defecto GitHub si manejamos pull requests y merges desde la aplicaci&oacute;n web.</p>

![](/assets/gitSimpleFlow.png)

<p>Ejemplo de flow "branch, merge" en git. Tomado de <a href="https://github.com/beatfactor/nightwatch/">Nightwatch</a>[/caption]</p>
<p style="text-align: justify;">A veces tenemos la suerte suficiente como para que el paso 4 no requiera commits de ning&uacute;n tipo, con lo cual desaparece uno de los commits de merges, y s&oacute;lo queda el original del paso 3. En esos casos, veremos algo como la figura siguiente.</p>

![](/assets/gitBranchMerge2.png)

<p style="text-align: justify;">Esto no quiere decir que no haya ocurrido el paso 4, s&oacute;lo que no hace falta un commit particular para el merge, con lo que el marcador de la rama master s&oacute;lo actualiza su posici&oacute;n y se mueve hacia adelante (fast-forward).</p>
<h3>Flujo 2: branch, rebase, fast-forward</h3>
<p style="text-align: justify;">Algunos meses atr&aacute;s descubr&iacute; que <code>git rebase</code> es una herramienta muy poderosa, ahorr&aacute;ndome el problema de commits gigantes de merge. El nuevo flujo ser&iacute;a as&iacute;:</p>
<ol style="text-align: justify;">
<li>Nueva rama "<code>myFeature</code>" partiendo desde <code>master</code></li>
<li>Trabajar en <code>myFeature</code> (commit, commit, commit...). Trabajo terminado.</li>
<li>Reposicionar <code>myFeature</code> en la punta de master: <code>git rebase master</code>
<ol>
<li>Resolver conflictos y problemas que hayan ocurrido de estos cambios</li>
</ol>
</li>
<li>Una vez todo resuelto, actualizar <code>master</code><br />
<code>git checkout master</code><br />
<code>git merge --ff-only myFeature</code></li>
<li>Eliminar la rama: <code>git branch -D myFeature</code></li>
</ol>
<p style="text-align: justify;">A diferencia del flujo anterior, este elimin&oacute; esos commits gigantes de mergeado de ramas, en donde cambiaron muchos archivos y en donde se resolvieron muchos conflictos, para aplicar eso en cada commit particular, haciendo que el resultado final sea el mismo a que si hubi&eacute;ramos trabajado desde la &uacute;ltima versi&oacute;n de master (cuando esa versi&oacute;n todav&iacute;a no exist&iacute;a -- por eso git permite viajar en el tiempo). Las desventajas es que al solucionar conflictos en el proceso de un rebase, uno tambi&eacute;n se remonta a estados parciales de nuestra implementaci&oacute;n, lo que quiere decir que a menos que tengamos una forma simple de asegurarnos que todo qued&oacute; bien, es posible que ese commit ya no sea de confiar.</p>
<p style="text-align: justify;">Imaginen el siguiente escenario: tengo mis commits 1, 2 y 3. En cada uno de los&nbsp;tres commits,&nbsp;el proyecto funcionaba pero mi funcionalidad estaba siendo terminada. Cuando hago el rebase con master me encuentro que tengo conflictos en commit1.&nbsp;Es un archivo en donde hubo muchos cambios tanto en master como en mi rama, por lo que s&eacute; que tambi&eacute;n encontrar&eacute; conflictos en commit2 y commit3.&nbsp;Como testear mi aplicaci&oacute;n es un proceso costoso, resolver&eacute; los conflictos de la forma que mejor me parezca pero s&oacute;lo al final de estos merges verificar&eacute; si todo est&aacute; bien, como para hacerlo una sola vez. Al hacerlo, me encuentro con que hubo un error en mi resoluci&oacute;n de conflictos, y lo resuelvo, resultando en commit4. Tras todo esto, el estado de commit1, commit2 y commit3 ya no son de fiar. Sabemos por seguro que en commit3, la aplicaci&oacute;n no funciona del todo bien, y commit1 y commit2 est&aacute;n en duda.</p>
<p style="text-align: justify;">Esta desventaja no es algo muy importante pero ciertamente hay que tener en cuenta. Adem&aacute;s, con el uso de unit testing y acceptance testing automatizado, ya no es tan dif&iacute;cil verificar aspectos variados, con lo que se hace m&aacute;s simple asegurarnos que nuestros conflictos hayan sido resueltos correctamente.</p>

![](/assets/gitBranchRebase.png)

<p style="text-align: justify;">Este flujo se deshace de esos commits de merging, que suelen ser confusos. La l&iacute;nea de desarrollo es, en su mayor&iacute;a, directa (excepto cuando myFeature1 y myFeature2 deben mergearse), y el avance de la rama principal es directo.</p>
<h3>Flujo 3: branch, rebase, squash, fast-forward</h3>
<p style="text-align: justify;">Un tiempo despu&eacute;s empec&eacute; a jugar con <code>git rebase -i</code>, y las posibilidades que brindaba. Descubr&iacute; que me permit&iacute;a manipular los commits mientras estoy haciendo el rebase. No solamente sus contenidos, sino adem&aacute;s el orden en el que se aplican, si se agrupan en&nbsp;un &uacute;nico commit (o varios), si se ignoran, etc.</p>
<p style="text-align: justify;">Esta ciertamente es una herramienta poderosa y hay que usarla con cuidado. Cambiar cosas en el pasado tiene consecuencias en el futuro.</p>
<ol style="text-align: justify;">
<li>Nueva rama "<code>myFeature</code>" partiendo desde <code>master</code></li>
<li>Trabajar en <code>myFeature</code> (commit, commit, commit...). Trabajo terminado.</li>
<li>Reposicionar <code>myFeature</code> en la punta de master: <code>git rebase master</code>
<ol>
<li>Resolver conflictos y problemas que hayan ocurrido de estos cambios</li>
</ol>
</li>
<li>Una vez todo resuelto, convertir el feature en un &uacute;nico commit:<br />
<code>git rebase -i master</code><br />
Elegir: pick, squash, squash, ...</li>
<li>Actualizar master:<br />
<code>git checkout master</code><br />
<code>git merge --ff-only myFeature</code></li>
<li>Eliminar la rama: <code>git branch -D myFeature</code></li>
</ol>
<p style="text-align: justify;">Esto dejar&aacute; nuestro master limpito y sin historias innecesarias. El detalle necesario puede agregarse en las l&iacute;neas posteriores del commit, y personalmente prefiero que la primera l&iacute;nea tenga una indicaci&oacute;n del feature en s&iacute;. Esto nos deja una l&iacute;nea de historia muy clara y f&aacute;cil de inspeccionar.</p>
<p style="text-align: justify;">Pueden <a href="https://github.com/AlphaGit/what-now/commits/master">ver un ejemplo de esto</a> en mi proyecto what-now, en el historial de commits:</p>

![](/assets/historyWhatNow.png)

<p style="text-align: justify;">Este flujo soluciona el problema de los commits no confiables porque simplemente desaparecen. Hay qui&eacute;nes no se sienten c&oacute;modos con esta aproximaci&oacute;n justamente por eso: se pierde el historial del desarrollo parcial de un feature particular. Personalmente, no lo veo como un problema: me parece &uacute;til mientras se est&aacute; desarrollando una parte del sistema, pero para el futuro eso ya no tiene importancia.</p>
<p style="text-align: justify;">Otro problema que esto implica es que ramas que se desprendan de myFeature estar&aacute;n bas&aacute;ndose en commits que ya no existen, por lo que&nbsp;los intentos de merge o rebase aplicar&aacute;n esos commits nuevamente, resultando en conflictos dobles. Esto puede solucionarse de dos formas: ignorando esos commits en rebases contra master (porque ya est&aacute;n aplicados), o haciendo squash / cherry-pick de los commits en todas las ramas, para que todas est&eacute;n actualizadas. Personalmente prefiero el primero, pero no siempre es obvio cu&aacute;les son los commits a ignorar, por lo que hay que tener cuidado. (Reescribir historia y borrar es doblemente peligroso.)</p>
<p style="text-align: justify;">Este es mi flujo de trabajo favorito al d&iacute;a de hoy. Adem&aacute;s de dejar una l&iacute;nea de historia limpia y entendible, esa historia misma se convierte en el historial de cambios de la aplicaci&oacute;n. Esto tiene utilidades de soporte y de mantenimiento a futuro: se puede saber qu&eacute; caracter&iacute;stica introdujo un cambio -- el hecho de en qu&eacute; punto de ese desarrollo&nbsp;ocurri&oacute; es irrelevante. Las pruebas, idas y vueltas desaparecen. Los errores que tuvieron que ser corregidos a medio camino desaparecen.</p>
<p style="text-align: justify;">Mejor a&uacute;n, esto proporciona una medici&oacute;n real de cu&aacute;nto tiempo tard&oacute; en ser liberada una caracter&iacute;stica en particular, ya que es f&aacute;cil saber cu&aacute;ndo fue&nbsp;incluida en la rama principal. Esto ayuda a los equipos a generar estimaciones basadas en tiempos, incluyendo todas las partes de su proceso.</p>
<h2 style="text-align: justify;">Conclusi&oacute;n</h2>
<p style="text-align: justify;">Aunque es m&aacute;s trabajo al momento de trabajar con los commits, el flujo de git rebase squash proporciona la l&iacute;nea de tiempo m&aacute;s simple para utilizar a futuro y de referencia, lo cual creo que es una gran ventaja. Como mencion&eacute;, este es mi flujo favorito al d&iacute;a de hoy y con el cual me encuentro trabajando siempre que es posible.</p>
