---
layout: post
title: 'PHP: Un fractal de mal diseño'
wordpress_url: http://blog.alphasmanifesto.com/?p=4537
date: '2013-04-15 21:53:23 +0000'
date_gmt: '2013-04-16 02:53:23 +0000'
categories:
- Technology
tags:
- C#
- desarrollo web
- seguridad
- PHP
- desarrollo
- best practices
- herramientas
- artículo
- problemas
- excepciones
- traducción
- lenguaje
- CGI
- Perl
- Zend
- programming
sub_title: O mil y un razones para alejarse de PHP
---

Durante mucho tiempo utilicé PHP, y de hecho, lo sigo utilizando. Sin embargo, siempre sentí como que algunas cosas no encajaban, y aunque varias veces me propuse aprender un paradigma de PHP de forma seria, nunca lo logré. Mucho tiempo después me enteré del gran odio generalizado a PHP y los problemas que ha tenido y leyendo esos artículos me encontré el que voy a traducir a continuación. [PHP: A fractal of Bad Design](http://me.veekun.com/blog/2012/04/09/php-a-fractal-of-bad-design/) es una recopilación de [Eevee](http://me.veekun.com/), quien muy amablemente accedió a que yo lo traduzca. La elegí porque es exageradamente detallada y certera.

Debería aclarar que no estoy de acuerdo con todos los puntos mencionados como negativos o siquiera problemas, pero respeto el artículo original del autor sin interrupciones.

Sin más, los dejo con el artículo. Si pueden leer el original, lo recomiendo.

<!--more-->

## Prefacio

Soy quejoso. Me quejo sobre un montón de cosas. Hay mucho en el mundo de la tecnología que no me gusta, y eso realmente es de esperar -- programar es una disciplina irrisoriamente joven, y ninguno de nosotros tiene la más mínima idea de lo que estamos haciendo. Combinen eso con la [Ley de Sturgeon](http://en.wikipedia.org/wiki/Sturgeon%27s_Law), y tengo una vida llena de cosas sobre las que protestar.

Esto no es lo mismo. PHP no es meramente raro de usar, o inapropiado para lo que yo quiero, o subóptimo, o contra mi religión. Puedo decir cualquier tipo de cosas buenas sobre lenguajes que evado, y todo tipo de cosas malas sobre lenguajes que disfruto. Adelante, ¡pregunten! Crea conversaciones interesantes.

PHP es la única excepción. Virtualmente cualquier característica de PHP está rota de alguna forma. El lenguaje, el framework, el ecosistema, son todos simplemente **malos**. Y no puedo siquiera remarcar ninguna cosa particular porque el daño es demasiado sistémico. Cada vez que intento compilar una lista de quejas sobre PHP, me quedo estancado en esta búsqueda en profundidad descubriendo más y más trivia fatal. (Por tanto, un fractal.)

PHP es una verg&uuml;enza, una mancha en mi oficio. Está tan roto, pero tan elogiado por cada amateur emocionado a quien todavía le queda aprender algo más, hasta ser exasperante. Tiene míseras pocas cualidades redentoras que prefiero olvidarme que existe completamente.

Pero tengo que quitarme esto de encima. Así que aquí va, un último intento.

---

## Una analogía

> Se me acaba de escapar esto explicando mi frustración a Mel y ella insistió en que lo reprodujera aquí:
> 
> No puedo siquiera decir qué está mal con PHP porque -- okay. Imagina que tienes, eh, una caja de herramientas. Un conjunto de herramientas. Se ve bien, con las cosas comunes ahí.
> 
> Sacas un desarmador, y ves que es uno de esos raros de cabecitas triples. Okay, bueno, eso no es demasiado útil para tí, pero imaginas que puede servir a veces.
> 
> Sacas un martillo, pero disgustado ves que tiene las cuñas de ambos lados. De todos modos, aún sirve, me refiero a que puedes golpear los clavos con la parte del centro de la cabeza sosteniéndolo de lado.
> 
> Sacas una de las pinzas, pero no tienen esas superficies ásperas; es plana y suave. Eso es menos útil, pero aún ayuda a girar las tuercas, así que de todos modos está bien.
> 
> Y así sigues. Cada cosa en la caja es de alguna forma rara y estrafalaria, pero quizá no tanto como para hacerla inútil. Y no hay ningún problema claro con el conjunto como un todo; todavía tiene todas las herramientas.
> 
> Ahora imagina que conoces a millones de carpinteros usando esta herramienta que te dicen "hey bueno,  ¿cuál es el problema con estas herramientas? ¡Es todo lo que he usado y han funcionado bien!" Y los carpinteros te muestran las csasas que han hecho, en donde cada habitación es un pentágono y el techo está de cabeza. Y golpeas en la puerta principal y todo colapsa hacia adentro y todos te gritan por romper su puerta.
> 
> Eso es lo que está mal con PHP.

---

## Postura

Yo aseguro que las siguientes cualidades son _importantes_ para hacer a un lenguaje productivo y útil, y PHP las viola desenfrenadamente. Si no estás de acuerdo en que estas son cruciales, bueno, no puedo imaginar que estaremos de acuerdo en nada.

- Un lenguaje debe ser **predecible**. Es un medio para expresar ideas humanas y tener a una computadora ejecutándolas, por lo que es crítico que la comprensión humana de un programa sea de hecho correcta.
- Un lenguaje debe ser **consistente**. Cosas similares se ven similares, cosas diferentes se ven diferentes. Conocer parte del lenguaje debería ayudar en aprender y comprender el resto.
- Un lenguaje debe ser **conciso**. Los nuevos lenguajes existen para reducir el modelo estándar de otros lenguajes viejos. (Todos _podríamos_ escribir en código máquina.) Un lenguaje debe entonces buscar introducir nuevos modelos estándares propios.
- Un lenguaje debe ser **confiable**. Los lenguajes son herramientas para resolver problemas; deberían minimizar cualquier nuevo problema que introducen. Cualquier "gotchas" son distracciones masivas.
- Un lenguaje debe ser **debuggeable**. Cuando algo sale mal, el programador _debe_ arreglarlo, y necesitamos toda la ayuda que podamos obtener.

Mi posición es por tanto:

- PHP está lleno de sorpresas: `mysql_real_escape_string`, `E_ALL`
- PHP es inconsistente: `strpos`, `str_rot13`
- PHP requiere de un modelo estándar: checkeo alrededor de llamadas a APIs de C, `===`
- PHP es descascarado: `===`, `foreach ($foo as &amp;$bar)`
- PHP es opaco: no hay stack traces por default o for fatales, el reporte de errores es complejo

No puedo proveer un párrafo de comentario para cada problema explicando por qué falla en estas categorías, o esto sería interminable. Espero que el lector, digamos, piense.

---

## No comentes con estas cosas

He estado _mucho_ en discusiones sobre PHP. Escucho muchos argumentos muy genéricos que están solo diseñados para detener la conversación inmediatamente. No me vengas con estos por favor. :(

- No me digan que "los buenos programadores pueden escribir buen código en cualquier lenguaje", o que los malos programadores bla, bla, bla. Eso no significa nada. Un buen carpintero _puede _martillar un clavo con una roca o un martillo, pero  ¿cuántos carpinteros ves martillando con rocas? Parte de lo que hace a un buen desarrollador es la habilidad para _elegir_ las herramientas con las que trabaja mejor.
- No me digas que es responsabilidad de los programadores memorizar mil excepciones y comportamientos extraños. Sí, esto es necesario en cualquier sistema, porque las computadoras apestan. Eso no significa que no hay un límite superior por cuánto payaseo es permitido en un sistema. PHP no es nada _sino_ excepciones, y no está bien cuando pelear con el lenguaje de hecho toma más esfuerzo que escribir tu programa. Mis herramientas no deberían crear más trabajo neto para que yo haga.
- No me digas que "así es cómo funciona la API de C".  ¿Cuál es el punto de usar un lenguaje de alto nivel si todo lo que provee son utilidades de cadenas y un montón de wrappers de C textuales? ¡Sólo escriban C en ese caso! Aquí, incluso hay una [librería CGI](http://www.boutell.com/cgic/) para él.
- No me digas que "eso es lo que te pasa por hacer cosas raras". Si dos características existen, algún día, alguien va a encontrar una razón para usarlas juntas. Y nuevamente, esto no es C; no hay especificaciones, no hay necesidad para "comportamiento indeterminado".
- No me digas que Facebook y Wikipedia están construidos en PHP. ¡Ya lo sé! Podrían estar también escritos en Brainfuck, pero mientras haya gente inteligente todavía peleando con las cosas, ellos _pueden_ sobreponerse a los problemas con la plataforma. Por todo lo que sabemos, el tiempo de desarrollo podría haber sido duplicado o reducido a la mitad si huberan sido escritos en otro lenguaje; estos datos de por sí no significan nada.
- Idealmente, ¡no me digas nada! Este es mi gran intento; si esta lista no hiere tu opinión de PHP, _nada_ nunca lo hará, así que deja de discutir con un tipo en internet y ve a hacer un sitio cool en tiempo récord para demostrar que estoy equivocado. :)

Observación al margen: me encaaaaaaaaanta Python. También podría felizmente hablarte lo que quieras quejándome sobre él, si realmente quisieras que lo haga. No aseguro que sea _perfecto_; simplemente he balanceado sus beneficios contra sus problemas y he concluído que es lo mejor que se ajusta a las cosas que quiero hacer.

Y nunca he conocido a un programador de PHP que puede hacer lo mismo con PHP. Pero me he encontrado con muchos que son rápidos para disculparse por cualquier cosa y todo lo que PHP hace. Esa mentalidad es terrible.

---

## PHP

### Lenguaje central

CPAN ha sido llamada la "librería estándar de Perl". Eso no dice mucho sobre la librería estándar de Perl, pero deja ver el punto de que un núcleo sólido puede construir cosas grandes.

#### Filosofía

- PHP fue originalmente diseñado explícitamente para no-programadores (y, leyendo entre líneas, no-programas); y no ha escapado sus raíces bien. Una cita escogida desde la [documentación de PHP 2.0](http://www.php.net/manual/phpfi2.php#overload), respecto de `+` y amigos haciendo conversión de tipos:
  > Una vez que comienzas a tener operadores separados para cada tipo, comienzas a hacer el lenguaje mucho más complejo. i.e., no puedes usar '==' para stings [sic], ahora usarías 'eq'. No veo el punto, especialmente para algo como PHP en donde la mayoría de los scripts serán generalmente simples y en muchos casos escrito por no-programadores que quieren un lenguaje con una sintaxis lógica básica y no tiene una curva de aprendizaje muy elevada.
- PHP está construido para mantenerse resoplando a todo costo. Cuando se encuentra con la opción de hacer algo sin sentido o abortar con un error, hará algo sin sentido. Cualquier cosa es mejor que nada.
- No hay una filosofía de diseño clara. El antiguo PHP fue inspirado en Perl; la gran librería estándar stdlib con parámetros "out" es de C; las partes orientadas a objetos fueron diseñadas como C++ y Java.
- PHP toma grandes cantidades de inspiración de otros lenguajes, pero aún así logra ser incomprensible para aquellos que _conocen_ esos lenguajes. `(int)` se ve como C, pero `int` no existe. Los namespaces usan `\`. La nueva sintaxis de los arrays resulta en `[key => value]`, único entre cualquier lenguaje con hashes literales.
- El tipado débil (i.e., conversión silenciosa automática entre strings/números/et al) es tan complejo que cualquier esfuerzo menor de programación ahorrado no lo vale.
- Funcionalidad nueva pequeña es implementada como sintaxis nueva; mucho de lo que está hecho con funciones o cosas que parecen como funciones. Excepto por el soporte de clases, que mereció un montón de nuevos operadores y keywords.
- Algunos de los problemas listados en esta página tienen soluciones de primera mano -- si estás dispuesto a pagarle a Zend por arreglos para su lenguaje de programación open-source.
- Hay mucha acción a distancia. Considera este código, tomado de los documentos de PHP en algún lado.
    ```php
    @fopen('http://example.com/archivo-no-existente', 'r');
    ```
   ¿Qué hará?
- Si PHP fue compilador con `--disable-url-fopen-wrapper`, no funcionará. (La documentación no dice que significa "no funcionará";  ¿devuelve null, tira una excepción?)
- Si `allow_url_fopen` está deshabilitado en php.ini, aún no funcionará. ( ¿Cómo? Ni idea.)
- Dado el `@`, el warning sobre el archivo no existente no será mostrado.
- Pero será mostrado si `scream.enabled` está seteado en php.ini.
- Pero no si el `error_reporting` correcto no está seteado.
- Si _es_ mostrado, a donde va exactamente depende de `display_errors`, nuevamente en php.ini. O `ini_set`.

  No puedo saber cómo esta inocua llamada  a función se comportará sin consultar seteos de compilación, configuraciones a nivel servidor y configuraciones hechas en mi programa. Y todo esto es comportamiento _intrínseco_.
- El lenguaje está lleno de estado global implícito. `mbstring` usa un set de caracteres global. `func_get_arg` y compañía se ven como funciones regulares, pero operan en la función que se ejecuta actualmente. Manejo de errores y excepciones tienen defaults globales. `register_tick_function` setea a una función global para ser ejecutada en cada tick -- ¡ ¿qué?!
- No hay soporte de threading en absoluto. (No es sorprendente, dado lo anterior.) Combinado con la falta de un `fork` incorporado (mencionado abajo), esto hace que la programación paralela sea extremedamente difícil.

  Partes de PHP están prácticamente _diseñadas _para producir código con bugs.
- `json_decode` devuelve null para entradas inválidas, aunque null es también un objeto perfectamente válido para ser decodificado como JSON -- esta función es _completamente poco fiable_ a menos que también llames a `json_last_error` cada vez que la uses.
- `array_search`, `strpos` y funciones similares devuelven `0` si encuentra la aguja en la posición cero, pero falso si no la encuentran en absoluto.

  Permíteme expandirme en esa última parte un poco.<br />

  En C, las funciones como `strpos` devuelven `-1` si el item no es encontrado. Si no checkeas por ese caso e intentas usarlo como índice, llegarás a memoria basura y tu programa explotará. (Probablemente. Es C.  ¿Quién demonios sabe? Estoy seguro de que hay herramientas para esto, como menos.)<br />

  En, digamos, Python, el método equivalente, `.index` arrojarán una excepción  si el ítem no es encontrado. Si no checkeas por ese caso, tu programa explotará.<br />

  En PHP, estas funciones devuelven falso. Si usas `FALSE` como índice, o haces casi cualquier cosa con él excepto comparar con `===`, PHP silenciosamente lo convertirá a `0` para tí. Tu programa no explotará; en cambio, _hará lo equivocado sin aviso_, a menos que recuerdes incluir el código estándar alrededor de cada lugar en donde uses `strpos` y ciertas otras funciones.<br />

  ¡Esto está mal! Los lenguajes de programación son herramientas; se supone que deben trabajar _conmigo_. Aquí, PHP ha activamente creado una sutil trampa para que yo caiga en ella, y yo debo estar atento incluso con cosas mundanas como operaciones de cadena y comparaciones de igualdad. PHP es _un campo minado_.

He escuchado una buena cantidad de historias sobre PHP y [sus desarrolladores](http://en.wikiquote.org/wiki/Rasmus_Lerdorf) de muchos lugares. Estas son de la gente que ha trabajado en [el núcleo de PHP](http://www.reddit.com/r/lolphp/comments/qeq7k/php_540_ships_with_82_failing_tests_in_the_suite/), [ha debuggeado](http://perlbuzz.com/2008/09/optimizing-for-the-developer-not-the-user-php-misses-again.html) el núcleo de PHP, interactuado con los desarrolladores del núcleo. Ni una sola historia ha sido un elogio.

Entonces debo poner esto aquí, porque vale la pena repetirlo: PHP es una comunidad de amateurs. Muy poca gente diseñándolo, trabajando en él o escribiendo código en él parece saber lo que están haciendo. (Oh, querido lector, ¡_tú_ eres por supuesto una rara excepción!) Ellos que _sí_ logran tener una pista tienden a alejarse a otras plataformas, reduciendo la competencia promedio del todo. Este, aquí mismo, es el mayor problema con PHP: es absolutamente el ciego guiando a los ciegos.

Okay, de vuelta a los hechos.

#### Operadores

- `==` es inútil
- No es transitivo.  `"foo" == TRUE`, y `"foo" == 0`... pero, por supuesto, `TRUE != 0`.
- `==` convierte a números cuando es posible (`123 == "123foo"`... aunque `"123" != "123foo"`), lo que significa que convierte a punto flotante cuando es posible. Entonces, cadenas largas hexadecimales (como por ejemplo, digamos, hashes de passwords) pueden ocasionalmente [compararse a true cuando no lo son](http://phpsadness.com/sad/47). Ni JavaScript hace esto.
- Por la misma razón, `"6" == " 6 "`, `"4.2" == "4.20"`, y `"133" == "0133"`. Pero nota que `133 != 0133` porque `0133` es octal. ¡_Pero_ `"0x10" == "16"` y `"1e3" == "1000"`!
- `===` compara valores y tipo... excepto con objectos, ¡en donde `===` es solamente verdadero si ambos operandos son el mismo objeto! Para objetos `==` compara ambos valores (de cada atributo) y tipo, que es lo que `===` hace para cualquier otro tipo. [ ¿Qué?](http://developers.slashdot.org/comments.pl?sid=204433&amp;cid=16703529)

- La comparación no es mucho mejor.
    - Ni siquiera es consistente: `NULL < -1`, y `NULL == 0`. El ordenamiento es por tanto no determinístico; depende del orden en el que los algoritmos de ordenación comparan los elementos.
    - Los operadores de comparación tratan de ordenar arrays de dos maneras distintas: primero por tamaño, luego por _elementos_. Sin embargo, si tienen el mismo número de elementos, pero _diferente_ conjunto de claves, son incomparables.
    - Los objetos se comparan como mayores a cualquier otra cosa... excepto otros objetos, en donde nunca son menores o mayores.
    - Para un `==` con tipado más seguro, tenemos `===`. Para un `<` con tipado más seguro tenemos... nada. `"123" < "0124"`, no importa lo que hagas. El casting tampoco ayuda.

- A pesar de la locura de más arriba, y el rechazo explícito de los pares de operadores numéricos y de cadena de Perl, PHP no sobrecarga `+`. `+` es siempre adición y `.` es siempre concatenación.
- El operador de indexado `[]` también puede ser escrito `{}`.
- `[]` puede ser usado en cualquier variable, no sólo cadenas y arrays. Devuelve null y no arroja ningún warning.
- `[]` no puede partir/rebanar, sólo devuelve elementos individuales.
- `foo()[0]` es un error de sintaxis. (Arreglado en PHP 5.4.)
- A diferencia de (¡literalmente!) cualquier otro lenguaje con un operador similar, ?: es asociativo _a izquierda_. Entonces esto:
    ```php
    $arg = 'T';
    $vehicle = ( ( $arg == 'B' ) ? 'bus' :
    ( $arg == 'A' ) ? 'airplane' :
    ( $arg == 'T' ) ? 'train' :
    ( $arg == 'C' ) ? 'car' :
    ( $arg == 'H' ) ? 'horse' :
    'feet');
    echo $vehicle
    ```
    imprime `horse`.
</ul>

#### Variables

- No hay forma de declarar una variable. Las variables que no existen son creadas con un valor nulo cuando son usadas por primera vez.
- Las variables globales necesitan una declaración `global` antes de ser usadas. Esta es una consecuencia natural de lo anterior, por lo que sería perfectamente razonable, pero las variables globales no se pueden siqueira _leer_ sin una declaración explícita -- PHP en su lugar silenciosamente creará una variable local con el mismo nombre. No estoy consciente de otro lenguaje con problemas de ámbitos similares.
- No hay referencias. Lo que PHP llama referencias son en realidad alias; no hay nada que sea un paso atrás, como las referencias de Perl, y no hay identidad de pasaje-por-objeto como en Python.
- El referenciamiento infecta una variable como ninguna otra cosa en el lenguaje. PHP es de tipado dinámico, por lo que las variables generalmente no tienen tipo... excepto las referencias, que adornan definiciones de funciones, sintaxis de las variables, y asignaciones. Una vez que una variable ha sido convertida en referencia (que puede pasar en cualquier lugar), está atorada como referencia. No hay una forma obvia de detectar esto y de-referenciarla requiere destruir la variable completamente.
- Okay, mentí. Hay "[Tipos SPL](http://www.php.net/manual/en/book.spl-types.php)" que también infectan a las variables: `$x = new SplBool(true); $x = "foo";` fallará. Es como un tipado estático.
- Una referencia puede ser hecha a una key que no existe en una variable no definida (que se convierte en un array). Usar un array no existente por lo general genera un aviso, pero este no.
- Las constantes son definidas por una llamada a una función que toman una cadena; antes de eso, no existían. (Esto podría de hecho ser una copia del comportamiento de `use constant` de Perl.)
- Los nombres de las variables son sensibles a mayúsculas y minúsculas. Las funciones y nombres de clases no lo son. Esto incluye nombres de métodos, que hace que camelCase sea una elección extraña para la nomenclatura.

#### Conceptos

- `array()` y otra docena de conceptos no son funciones. `array` por cuenta propia no significa nada. `$func = "array"; $func();` no funciona.
- El desempaquetado de arrays puede hacerse con la operación `list($a, $b) = ...`. `list()` es sintaxis función-simil como array. No sé por qué a esto no se le dio una sintaxis propiamente dedicada, o por qué el nombre es tan obviamente confuso.
- `(int)` está obviamente diseñado para verse como C, pero es un token único; no hay nada llamado int en el lenguaje. Inténtalo: no sólo `var_dump(int)` no funciona, arroja un error de parseo porque el argumento se parece como el operador de casting.
- `(integer)` es un sinónimo para `(int)`. También están `(bool)` / `(boolean)` y `(float)` / `(double)` / `(real)`.
- Hay un operador `(array)` para castear a arrays y `(object)` para castear a objetos. Suela loco, pero hay al menos un uso: puedes usar `(array)` para tener un argumento de una función que sea o un item simple o una lista y tratarlo de forma idéntica. Excepto que no puedes hacerlo con seguridad, porque si alguien pasa un único _objeto_, castearlo a un array producirá un array conteniendo los atributos del objeto. (Castear a object produce la operación inversa.)
- `include()` y compañía son básicamente el `#include` de C: tiran el contenido de otro archivo de código fuente en el tuyo. No hay sistema de módulos, ni siquiera para código PHP.
- No hay algo como funciones o clases anidadas o locales. Son sólo globales. Incluir un archivo pone sus variables en el ámbito de la función actual (y le da al archivo acceso a tus variables), pero pone las funciones y clases en el ámbito global.
- Agregar a un array se hace con `$foo[] = $bar`.
- `echo` es algo estilo instrucción, no una función.
- `empty($var)` es tan extremadamente no-función que cualquier cosa excepto una variable, por ejemplo, `empty($var || $var2)`, es un error de parseo.  ¿Por qué en la Tierra tiene el parser que saber sobre [`empty`](http://phpsadness.com/sad/28)?
- Hay sintaxis redundante para los bloques: `if (...): ... endif;`, etc.

#### Manejo de errores

- El único operador de PHP es `@` (de hecho, tomado prestado de DOS), que _silencia_ errores.
- Los errores de PHP no proveen stack traces. Debes instalar un handler para que los genere. (Pero no puedes hacerlo para errores fatales -- ver abajo.)
- Los errores de parseo de PHP generalmente sólo escupen el estado de parseo y nada más, haciendo una comilla olvidada [terrible para debuggear](http://phpsadness.com/sad/44).
- El parser de PHP se refiere, por ejemplo, a `::` internamente como `T_PAAMAYIM_NEKUDOTAYIM`, y al operador `<<` como `T_SL`. Digo "internamente" pero igual que arriba, esto es lo que se le muestra al programador cuando `::` o `<<` aparecen en el lugar equivocado.
- Mucho del manejo de errores es en la forma de imprimir una línea a un log en el servidor que nadie lee y seguir adelante.
- `E_STRICT` está ahí, pero no parece prevenir mucho y no hay documentación sobre lo que en realidad hace.
- `E_ALL` incluye todas las categorias de errores -- excepto `E_STRICT`. (Arreglado en 5.4.)
- Es raramente inconsistente entre lo que está permitido y lo que no. No sé cómo `E_STRICT`aplica acá, pero estas cosas están permitidas:
    - Intentar acceder a una propiedad no existente en un objeto, i.e., `$foo->x`. (Warning.)
    - Usar una variable como un nombre de función, o nombre de variable, o nombre de clase. (Silencioso.)
    - Tratar de usar una constante no definida. (Notice.)
    - Tratar de acceder una propiedad de algo que no es un objeto. (Notice.)
    - Tratar de usar un nombre de variable que no existe. (Notice.)
    - `>2 < "foo"` (silencioso)
    - `foreach (2 as $foo);` (warning)

  Y estas cosas no lo están:

    - Tratar de acceder una constante de una clase no existente, i.e., `$foo::x`. (Error fatal.)
    - Usar una cadena constante como un nombre de funci'on, o nombre de variable, o nombre de clase. (Error de parseo.)
    - Tratar de llamar a una función indefinida. (Error fatal.)
    - No poner un punto y coma en la última instrucción en un bloque o archivo. (Error de parseo.)
    - Usar `list` y cualquier otro quasi-elemento incorporado como nombre de método. (Error de parseo.)
    - Subindicar el valor devuelto por una función, i.e., `foo()[0]`. (Error de parseo; permitido en 5.4, ver arriba.)

  Hay otros buenos ejemplos de otros errores de parseo extraños en algún otro lado en esta lista.

- El método `__toString` no puede arrojar excepciones. Si intentar, PHP ... er... arrojará una excepción. (De hecho, un error fatal, que podría ser aceptable, excepto...)
- Los errores de PHP y las excepciones de PHP son dos bestias completamente distintas. No parecen interactuar _para nada_.
    - Los errores de PHP (los internos, y las llamadas a `trigger_error`) no se pueden atrapar con `try` / `catch`.
    - De forma similar, las excepciones no desatan manejadores de errores instalados por `set_error_handler`.
    - En su lugar, hay un `set_exception_handler` separado que maneja excepciones no atrapadas, porque envolver al punto de entrada de tu programa en un bloque `try` es imposible en el modelo `mod_php`.
    - Los errores fatales (por ejemplo, `new ClassDoesntExist()`) no pueden ser atrapados por nada. _Muchas_ de las cosas inofensivas arrojan errores fatales, terminando tu programa forzosamente por razones cuestionables. Las funciones de cierre aún se ejecutarán, pero no pueden obtener un stack trace (corren al nivel más alto) y no pueden fácilmente determinar si el programa terminó por error o por haberse completado.
- No hay una construcción `finally`, haciendo al código que envuelve otro código (poner manejador, correr el código, quitar el manejador; monkeypatch, correr un test, quitar el monkeypatch) tedioso y difícil de escribir. A pensar que la orientación a objectos y las excepciones fueron en su mayor parte copiadas de Java, esto [es deliberado](https://bugs.php.net/bug.php?id=32100), porque finally "no tiene mucho sentido en el contexto de PHP".  ¿Eh?

#### Funciones

- Las llamadas a funciones aparentemente son algo [caras](http://www.phpwtf.org/php-function-calls-have-quite-some-overhead).
- Algunas funciones incorporadas interactúan con las funciones que devuelven referencias en, ehm, [una manera extraña](http://www.phpwtf.org/php-function-calls-returning-references).
- Como está mencionado en algún otro lado, muchas cosas que parecen funciones o se ven como que _deberían ser_ funciones, son de hecho construcciones del lenguaje, de forma que nada que trabaje con funciones trabajará con ellas.
- Los argumentos de las funciones pueden tener "implicación de tipos", que es básicamente tipado estático. Pero no puedes requerir que un argumento sea un `int`, o `string`, u `object`, u otro tipo "del núcleo", incluso cuando cualquier función incorporada usa este tipo de tipado, probablemente porque `int` no es nada en PHP. (Ver arriba sobre `(int)`.) Tampoco puedes usar las [decoraciones de pseudo-tipos](http://www.php.net/manual/en/language.pseudo-types.php#language.types.mixed) usada tanto en las funciones incorporadas: `mixed`, `number`, o `callback`. (`callable`está permitido desde PHP 5.4.)
    - Como resultado, esto:`function foo(string $s) {}`<br />
    `foo("hello world");`produce el error:`PHP Catchable fatal error: argument 1 passed to foo() must be an instance of string, string given, called in...`
    - Puedes notar que el "implicado de tipo" dado no tiene que existir; no hay ninguna clase `string` en este programa. Si intentas usar `ReflectionParameter::getClass()` para examinar el implicado de tipos de forma dinámica, entonces negará que la clase no existe, haciendo imposible obtener el nombre de la clase.
    - El valor devuelto por una función no puede ser tipado.

- Pasar los argumentos de una función a otra función (dispatching, no raro) es hecho llamando a `call_user_func_array('other_function', func_get_args())`. Pero `func_get_args` arroja un error fatal en tiempo de ejecución, quejándose que no puede ser un parámetro de función.  ¿Cómo y por que es esto siquiera un _tipo_ de error? (Arreglado en PHP 5.3.)
- Las clausuras requieren explícitamente nombrar cada variable sobre la que se cerrará.  ¿Por qué no puede el intérprete detectarlo solo? Como que destroza el propósito de la característica. (Okay, es porque usar una variable en algún punto, en cualquier punto, la crea a menos que se le diga explícitamente lo contrario.)
- Las variables sobre las que se cierra la clausura son "pasadas" por la misma semántica que otros argumentos de función. Eso es, arrays, strings, etc., serán "pasados" a la clausura por valor. A menos que uses `&amp;`.
- Ya que las variables sobre las que se cierra la clausura son efectivamente argumentos automáticamente pasados y no hay ámbitos anidados, una clausura no se puede referir a métodos privados, incluso si está definido dentro de una clase. ( ¿Posiblemente arreglado en 5.4? No está claro.)
- No hay argumentos nombrados a las funciones. De hecho, [se rechazaron explícitamente](http://www.php.net/~derick/meeting-notes.html#named-parameters) por los desarrolladores porque "ayuda a código más desprolijo".
- Los argumentos de función con valores por defecto pueden aparecer antes que los argumentos de función sin ellos, incluso aunque la documentación aclara que esto es raro e inútil. (Entonces,  ¿por qué permitirlo?)
- Los argumentos extras a una función son ignorados (excepto con funciones incorporadas, que arrojan un error). Los argumentos faltantes se asumen nulos.
- Las funciones "variadicas" requieren pelear con `func_num_args`, `func_get_arg` y `func_get_args`. No hay sintaxis para algo así.

#### Orientación a Objetos (OO)

- Las partes procedurales de PHP están diseñadas como C, pero la parte objeccional (jo jo) están diseñadas como Java. No puedo sobreenfatizar lo discordante que esto es. El sistema de clases está diseñado alrededor del lenguaje Java de _bajo-nivel_ que es naturalmente y deliberadamente más limitado que los contemporarios de PHP, y estoy perplejo.
    - Todavía debo encontrar alguna función global que siquiera tenga una letra mayúscula en su nombre, pero aún así varias [clases importantes incorporadas](http://www.php.net/manual/en/class.reflectionfunction.php) usan nombres de métodos camelCase y tienen métodos de acceso `getFoo` al estilo Java.
    - Perl, Python y Ruby, todos tienen algún concepto de acceso a "propiedad" vía código; PHP sólo tiene el torpe `__get` y sus amigos. (La documentación inexplicablemente se refiere a esos métodos especiales como "sobrecarga".)
    - Las clases tienen algo como la declaración de variables (`var` y `const`) para atributos de clase, mientras que la parte procedural del lenguaje no.
    - A pesar de la pesada influencia de C++/Java, donde los objetos son medianamente opacos, PHP generalmente trata a los objetos como hashes bonitos -- por ejemplo, el comportamiento por defecto de `foreach ($obj as $key => $value)` es para iterar sobre cada atributo accesible del objeto.
- Las clases no son objetos. Cualquier tipo de metaprogramación se debe referir a ellas con nombres en cadenas, igual que las funciones.
- Los tipos incorporados no son objetos y (a diferencia de Perl) no se pueden hacer parecer objetos de ninguna forma.
- `instanceof` es un operador, a pesar que las clases fueron una adición tardía y que mucho del lenguaje está construido en funciones y sintaxis orientada a funciones.  ¿Influencia de Java?  ¿Las clases no son de primera clase? (No sé si lo son.)
    - Pero _sí_ hay una función `is_a`. Con un argumento opcional indicando si se permite al objeto ser en realidad una cadena nombrando una clase.
    - `get_class` es una función; no hay operador `typeof`. Parecido a `is_subclass_of`.
    - Esto no trabaja en tipos incorporadas, sin embargo (de nuevo, `int` no es nada). Para eso necesitas `is_int`, etc.
    - También, el lado derecho debe ser una variable o una cadena literal; no puede ser una expresión. Eso causa... un error de parseo.
-  ¿!`clone` es un operador!?
- Los atributos de objetos son `$obj->foo`, pero los atributos de clases son `Class::$foo`. (`$obj::foo` intentará convertir `$obj` a string y usarlo como nombre de clase.) Los atributos de clase no pueden accederse desde los objetos, los espacios de nombres están completamente separados, haciendo que los atributos de clase sean completamente inútiles para polimorfismo. Los _métodos_ de clase, por supuesto, están excemptos de esta regla y pueden ser llamdos como cualquier otro método. (Me han dicho que C++ también hace esto. C++ no es un buen ejemplo de OO correcta.)
- También, un método de instancia puede ser llamado de forma estática. (`Class::method()`). Si se hace desde otro método, esto es tratado como una llamada regular a un método en el `$this` actual. Creo.
- `new`, `private`, `public`, `protected`, `static`, etc.  ¿Intentando ganar desarrolladores de Java? Soy consciente que esto es más una cuestión de gusto, pero no sé por qué esto es necesario en un lenguaje dinámico -- en C++, mucho de esto se trata de compilación y resolución de nombres en tiempo de compilación.
- PHP tiene soporte de primera clase para "clases abstractas", que son clases que no pueden ser instanciadas. El código en lenguajes similares logra esto arrojando una excepción en el constructor.
- Las clases derivadas no pueden sobreescribir métodos privados. Las sobreescrituras (overrides) de métodos públicos no pueden siquiera _ver_, menos llamar, a los métodos privados de la clase padre. Problemático para, digamos, mocks de testing.
- Los métodos no se pueden nombrar, por ejemplo, "list", porque `list()` es sintaxis especial (no una función), y el parser se confunde. No hay razón por la que esto debería ser ambiguo, y hacer monkeypatching de la clase funciona bien. (`$foo->list()` no es un error de sintaxis).
- Si una excepción es lanzada mientras se evalúan los argumentos de un constructor (por ejemplo, `new Foo(bar())` y `bar()` la arroja), el constructor no será llamado pero el _destructor _lo será. (Esto está arreglado en PHP 5.3).
- Las excepciones en `__autoload` y los destructores causan errores fatales. (Arreglado en PHP 5.3.6. Entonces ahora un destructor podría arrojar una excepción literalmente en cualquier lugar, dado que es llamado en el momento en donde el contador de referencias deja el zero. Hmm.)
- No hay constructores o destructores. `__construct` es un inicializador, igual que el `__init__` de Python. No hay método que puedas llamar en una clase para reservar memoria y crear un objeto.
- No hay inicializador por defecto. Llamar a `parent::_construct()` si la clase padre no define su propio `__construct` es un error fatal.
- OO trae consigo una interfaz de interador que partes del lenguaje respetan (por ejemplo, `for...as`), pero nada incorporado (como los arrays) implementa la interfaz. Si quieres un iterador de array, debes envolverlo en un `ArrayIterator`. No hay maneras incorporadas de encadenar llamadas o partir collecciones o trabajar de alguna otra forma con los iteradores como objetos de primera clase.
- Las interfaces como `Iterator` se reservan unos beuenos métodos sin prefijos. Si quieres que tu clase sera iterable (sin el comportamiento por defecto de iterar en todos sus atributos), pero quieres usar un método común como `key`, o `next`, o `current`, bueno, lástima.
- Las clases pueden sobrecargar cómo se convierten a strings y cómo actúan cuando son llamadas, pero no cómo se convierten a números ni a ningún otro tipo incorporado.
- Las cadenas, números y arrays todos tienen conversiones a cadena; el lenguaje recae fuertemente en esto. Las funciones y las clases _son_ cadenas. Aún así, intentar convertir un objeto incorporado o definido por el usuario (incluso una clausura) a un string causa un error si no se define `__toString`. Incluso `echo` se convierte en propenso a errores.
- No hay sobrecarga para igualdad u ordenamiento.
- Las variables estáticas dentro de los métodos de instancias son globales; tienen el mismo valor en todas las instancias de la clase.

### Librería estándar

Perl es "algo de construcción necesaria". Python es "baterías incluidas". PHP es "de todo y más, pero es de Canadá y [ambas llaves dicen C](http://mcguirehimself.com/?p=4146)".

#### General

- No hay sistema de módulos. Puedes compilar extensiones PHP, pero las que se carguen son especificadas en php.ini, y tus opciones son que una extensión exista (e inyecte sus contenidos en el espacio de nombres global) o no.
- Como los espacios de nombres son una característica reciente, la librería estándar no está dividida para nada. Hay miles de funciones en el espacio de nombres global.
- Pedazos de la librería son terriblemente inconsistentes de otros.
    - Guión bajo versus sin guión bajo: `strpos` / `str_rot13`, `php_uname` / `phpversion`, `base64_encode` / `urlencode`, `gettype` / `get_class`.
    - "to" versus "2": `ascii2ebcdic`, `bin2hex`, `deg2grad`, `strtolower`, `strtotime`.
    - Objeto+verbo versus verbo+objeto: `base64_decode`, `str_shuffle`, `var_dump` versus `create_function`, `recode_string`.
    - Orden de argumentos: `array_filter($input, $callback)` versus `array_map($callback, $input)`, `strpos($haystack, $needle)` versus `array_search($needle, $haystack)`.
    - Confusión de prefijos: `usleep` versus `microtime`.
    - Funciones insensitivas a mayúsculas y minúsculas que varían en donde la `i` va en el nombre.
    - Alrededor de la mitad de las funciones de arrays comienzan con `array_`. Las otras no.
    - `htmlentities` y `html_entity_decode` son _inversas_ una de la otra, con convenciones de nombre completamente distintas.
- De todo y algo más. La librería incluye:
    - Bindeos a ImageMagick, bindeos a GraphicsMagick (que es un fork de ImageMagick), y un puñado de funciones para inspeccionar datos EXIF (que ImageMagick ya puede hacer).
    - Funciones para parsear bbcode, un tipo de markup muy específico utilizado por un puñado de paquetes de foros.
    - Demasiados paquetes XML. `DOM` (orientado a objetos), `DOM XML` (no), `libxml`, `SimpleXML`, "XML Parser", `XMLReader`/`XMLWriter`, y otra media docena de acrónimos que no puedo identificar. Hay seguramente algún tipo de diferencia entre estas cosas y eres libre de averiguar cuál es.
    - Bindings para dos procesadores específicos de tarjetas de crédito, SPPLUS y MCVE.  ¿Qué?
    - Tres maneras de acceder a una base de datos MySQL: `mysql`, `mysqli`, y la cosa esa de abtracción `PDO`.

#### Influencia de C

Esto merece su propio título, porque es tan absurdo y aún así permea al lenguaje. PHP es un lenguaje de programación de alto nivel dinámicamente tipado. Aún así una porción masiva de la librería estándar son aún wrappers muy finos sobre APIs de C, con los siguientes resultados:

- Parámetros "out", incluso a pesar de que PHP puede devolver hashes ad-hoc o múltiples argumentos con poco esfuerzo.
- Al menos una docena de funciones para obtener el último error de un subsistema en particular (ver más abajo), a pesar de que PHP ha tenido excepciones por ocho años.
- Verrugas como `mysql_real_escape_string`, a pesar de que tiene los mismos argumentos que `mysql_escape_string`, sólo porque es parte de la API C de MySQL.
- Comportamiento global para funcionalidad no-global (como MySQL). Usar múltiples conexiones a MySQL aparentemente requiere pasar un identificador de conexión en cada llamada a función.
- Los wrappers son realmente, realmente finos. Por ejemplo, llamar a `dba_nextkey` sin llamar a `dba_firstkey` generará un error de segmentación.
- Hay un conjunto de funciones `ctype_*` (por ejemplo, `ctype_alnum`), que mapean a las funciones de detección de clases de caracteres de C de nombres similares, a pesar de, digamos, `isupper`.

#### Genericismo

No hay ninguno. Si una función tiene que hacer dos cosas ligeramente distintas, PHP simplemente tiene dos funciones.

¿Cómo ordenas en orden inverso? En Perl podrías hacer <span style="font-family: 'courier new', courier;">sort { $b <=> $a }. En Python, podrías hacer `sort(reverse=True)`. En PHP hay una función separada llamada `rsort()`.

- Funciones que buscan un error de C: `curl_error`, `json_last_error`, `openssl_error_string`, `imap_errors`, `mysql_error`, `xml_get_error_code`, `bzerror`, `date_get_last_errors`,  ¿otras?
- Funciones que ordenan: `array_multisort`, `arsort`, `asort`, `ksort`, `krsort`, `natsort`, `natcasesort`, `sort`, `rsort`, `uasort`, `uksort`, `usort`.
- Funciones que encuentran texto: `ereg`, `eregi`, `mb_ereg`, `mb_eregi`, `preg_match`, `strstr`, `strchr`, `stristr`, `strrchr`, `strpos`, `stripos`, `strrpos`, `strripos`, `mb_strpos`, `mb_strrpos`, más las variaciones que hacen reemplazos.
- Hay muchos alias también, lo que ciertamente no ayuda al tema: `strstr` / `strchr`, `is_int` / `is_integer` / `is_long`, `is_float` / `is_double`, `pos` / `current`, `sizeof` / `count`, `chop` / `rtrim`, `implode` / `join`, `die` / `exit`, `trigger_error` / `user_error`, `diskfreespace` / `disk_free_space`, ...
- `scandir` devuelve un listado de archivos en un directorio dado. En lugar de (potencialmente útil) devolverlos en el orden del directorio, la función devuelve los archivos ya ordenados. Y hay un argumento opcional para obtenerlos en orden alfabético _inverso_. No había, aparentemente, suficientes funciones de ordenamiento. (PHP 5.4 agrega un tercer valor para la dirección del ordenamiento que deshabilitará el ordenamiento.)
- `str_split` partirá una cadena en pedazos de igual tamaño. `chunk_split` parte una cadena en pedazos de igual tamaño y luego los une con un delimitador.
- Leer archivos requiere un conjunto separado de funciones dependiendo del formato. Hay seis grupos separados de esas funciones, todas con APIs diferentes, para bzip2, LZF, phar, rar, zip y gzip/zlib.
- Ya que llamar a una función con un array como sus argumentos es tan raro (`call_user_func_array`), hay algunos pares como `printf` / `vprintf` y `sprintf` / `vsprintf`. Estos hacen lo mismo, pero una función toma argumentos y la otra toma un array de argumentos.

#### Texto

- `preg_replace` con la opción `/e` (eval) hará un reemplazo de los resultados encontrados con una cadena de texto, y _luego la evalúa_.
- `strtok` está aparentemente diseñado desde la función C equivalente, la que ya es una mala idea por varias razones. Dejando de lado que PHP puede fácilmente deolver un array (mientras esto es raro en C), o que el mismo hack que `strtok(3)` usa (modificando la cadena en-el-lugar) no es usada aquí.
- `parse_str` parsea un query string, con ninguna indicación en su nombre. También actúa igual que `register_globals` y arroja el query en tu ámbito local como variables, a menos que le pases un array para que popule. (No devuelve nada, por supuesto.)
- `explode` se rehusa a separar cadenas con un limitador vacío o faltante. Todas las otras implementaciones de separación de cadenas hace algo útil en este caso; PHP en cambio tiene una función completamente separada, confusamente llamada `str_split` y descripta como "convierte una cadena a un array".
- Para formatear fechas, está `strftime`, que actúa como la API de C y respeta el lugar. También está date, que tiene una sintaxis completamente distinta y sólo funciona en inglés.
- [`gzgetss`](http://php.net/manual/en/function.gzgetss.php) -- Obtiene una línea desde un puntero a un archivo gz y remueve las etiquetas HTML." Me estoy muriendo por conocer la serie de circunstancias que llevaron a la concepción de esta función.
- `mbstring`
    - Es todo sobre "multi-byte", cuando el problema son los conjuntos de caracteres.
    - Aún así opera en cadenas comunes. Tiene un conjunto de caracteres "por defecto" global. Algunas funciones permiten un conjunto específico, pero luego aplica a todos los argumentos y el valor de retorno.
    - Provee funciones `ereg_*`, pero esas están obsoletas. `preg_*` no tienen suerte, aunque pueden entender UTF-8 pasándoles un indicador PCRE específico.

#### Sistema y reflexión

- Hay, en general, muchas funciones que bordean la línea entre texto y variables. `compact` y `extract` son sólo la punta del iceberg.
- Hay muchas formas de ser dinámico en PHP, y en una primera mirada no hay una diferencia obvia o beneficios orelativos. `classkit` puede modificar clases definidas por el usuario; `runkit` lo suplanta y puede modificar cualquier cosa definida por el usuario; las clases `Reflection*` pueden reflexionar en la mayor parte del lenguaje; hay una buena cantidad de funciones individuales para reportar propiedades de funciones y clases.  ¿Son estos subsistemas independientes, relacionados, redundantes?
- `get_class($obj)` devuelve el nombre de la clase del objeto, `get_class()` devuelve el nombre de la clase de la función que lo llama. Dejando de lado que esta única función hace dos cosas radicalmente distintas: `get_class(null)` funciona como el segundo. Por tanto no se lo puede confiar en un valor arbitrario. ¡Sorpresa!
- Las clases `stream_*` permiten implementar objetos de flujos de datos personalizados para usar con `fopen` y otros elementos inherentes archivezcos. "tell" no puede ser implementado por [razones internas](https://bugs.php.net/bug.php?id=30157). (También hay [MUCHAS](http://www.php.net/manual/en/book.stream.php) funciones involucradas con este sistema.)
- `register_tick_function` aceptará un objeto clausura. `unregister_tick_function` no; en lugar de eso arroja un error quejándose de que la clausura no puede ser convertida a cadena.
- `php_uname` te cuenta sobre el sistema operativo actual. A menos que PHP no pueda decir en qué está corriendo, en cuyo caso te cuenta sobre el sistema operativo en el que fue _compilado_. No te avisará si esto ocurrió.
- `fork` y `exec` no son propios del lenguaje. Vienen con la extensión pcntl, pero no está incluida por defecto. `popen` no provee un pid.
- El valor de retorno de `stat` es cacheado.
- `session_decode` es para leer una cadena de sesión PHP arbitraria, pero sólo funciona si ya hay una sesión activa. Y deja el resultado en `$_SESSION`, en lugar de devolverlo.

#### Misceláneos

- `curl_multi_exec` no cambia `curl_errno` cuando ocurre un error, pero sí cambia `curl_error`.
- Los argumentos de `mktime` son, en orden: hora, minuto, segundo, mes, día, año.

### Manipulación de datos

Los programas no son más que grandes máquinas que mastican datos y escupen más datos. Varios lenguajes grandiosos están diseñados _alrededor_ de los tipos de datos que manipulan, desde awk hasta Prolog, hasta C. Si un lenguaje no puede manejar datos, no puede hacer nada.

#### Números

- Los enteros tienen signo y tienen 32 bits en plataformas de 32 bits. A diferencia de todos los contemporarios de PHP, no hay promoción automática a bigint. Por lo que puedes terminar con sorpresas como tamaños de archivos negativos, y tu matemática puede funcionar diferentemente basada en la _arquitectura del CPU_. Tu única opción para enteros más grandes es usar las funciones wrapper GMP o BC. (Los desarrolladores han propuesto [añadir un nuevo tipo, separado, de 64 bits](http://www.php.net/~derick/meeting-notes.html#add-a-64bit-integer). Esto es locura.)
- PHP soporta sintaxis octal con un `0` inicial, por lo que, por ejemplo, `012` será el número diez. Sin embargo, `08` se convierte en el número cero. El `8` (o `9`) y cualquier dígito posterior desaparecen. `01c` es un error de sintaxis.
- `0x0+2` produce 4. El parser considera el `2` como parte simultánea del literal hexadecimal _y_ como un literal decimal separado, tratando esto como `0x002 + 2`. `0x0+0x2` muestra el mimo problema. Extrañamente, `0x0 +2` es todavía 4, pero `0x0+ 2` es correctamente 2. (Esto se arregló en PHP 5.4. Pero también se volvió a romper en PHP 5.4 con el nuevo prefijo literal `0b`: `0b0+1` produce 2.)
- `pi` es una función. O hay una constante, `M_PI`.
- No hay [operador de exponenciación](https://bugs.php.net/bug.php?id=13756), sólo la función `pow`.

#### Texto

- No hay soporte Unicode. Sólo ASCII trabajará confiablemente. Existe la extensión `mbstring`, mencionada arriba, pero apesta un poco.
- Lo que significa que usar las funciones incorporadas en texto UTF-8 lo corrompe.
- Similarmente, no hay concepto de, por ejemplo, comparaciones de mayúsculas o minúsculas fuera de ASCII. A pesar de la proliferación de versiones insensitivas a la capitalización de las funciones, ninguna de ellas considerará `é` igual a `é`.
- No puedes encomillar claves en interpolación de variables, es decir, `"$foo['key']"` es un error de sintaxis. Puedes des-encomillarlo (lo que _sí_ generaría una advertencia en cualquier otro lugar!), o usar `${...}`/`{$...}`.
- `"${foo[0]}"` está bien. `"${foo[0][0]}"` es un error de sintaxis. Poner el `$` dentro está bien en ambos casos.  ¿Mala copia de la sintaxis similar de Perl (con semánticas radicalmente distintas)?

#### Arreglos

Oh...

- Este tipo de datos actúa como lista, hash ordenado, conjunto ordenado, lista dispersa, y ocasionalmente alguna combinación extraña de esos.  ¿Cómo se desempeña?  ¿Qué tipo de uso de memoria habrá ahí?  ¿Quién sabe? De cualquier modo, no es como si tuviera otras opciones.
- `=>` no es un operador. Es una construcción especial que sólo existe dentro de `array(...)` y la construcción `foreach`.
- El indexado negativo no funciona, ya que `-1` es una clave válida como `0`.
- A pesar de que esta es la única estructura de datos del lenguaje, no hay sintaxis corta para él; `array(...)` es la sintaxis corta. (PHP 5.4 trae "literales", `[...]`.)
- La construcción `=>` está basada en Perl, que permite `foo => 1`, sin comillas. (Eso es, de hecho, porque existen en Perl; de otra forma es sólo una coma.) En PHP no puedes hacer esto sin obtener una advertencia; es el único lenguaje en su nicho que no tiene forma aprobada de crear un hash sin encomillar las claves de cadena.
- Las funciones de arreglos por lo general tienen comportamietno confuso o inconsistente porque tienen que operar en listas, hashes o quizá una combinación de los dos. Consideren `array_diff`, que "computa la diferencia de los arreglos".
    ```php
    $primero = array("foo" => 123, "bar" => 456);
    $segundo = array("foo" => 456, "bar" => 123);
    echo var_dump(array_diff($primero, $segundo));
    ```
  ¿Qué hará este código? Si `array_diff` trata sus argumentos como hashes, obviamente estos son diferentes; las mismas claves tienen distintos valores. Si los trata como listas, aún son distintas; los valores están en orden distinto.

  En realidad `array_diff` considera a estos iguales, porque los trata como _conjuntos_, compara solamente valores e ignora el orden.
- En una vena similar, `array_rand` tiene el extraño comportamiento de seleccionar _claves_ al azar, que no es tan útil para el caso más común de necesitar elegir de un listado de opciones.
- A pesar de lo mucho que el código PHP recae en preservar el orden de las claves:

   ```php
    array("foo", "bar") != array("bar", "foo")
    array("foo" => 1, "bar" => 2) == array("bar" => 2, "foo" => 1)
    ```

  Dejo como ejercicio al lector averiguar qué ocurre si los arreglos son mezclas. (Yo no lo sé.)
- `array_fill` no puede crear arreglos de tamaño cero, en lugar de eso emitirá una advertencia y devolverá falso.
- Todas de las (muchas...) funciones de ordenamiento operan en-el-lugar y no devuelven nada. No hay forma de crear una copia ordenada; hay que copiar el arreglo manualmente, luego ordenarlo, y luego usarlo.
- Pero `array_reverse` devuelve un nuevo arreglo.
- Un listado de cosas ordenadas y algunos mapeos de claves a valores suena como una gran manera de manejar argumentos de funciones, pero no.

#### No arreglos

- La librería estándar incluye "Quickhash"  una implementación OO de "clases específicas fuertemente tipadas" para implementar hashes. Y, efectivamente, hay cuatro clases, cada una tratando una combinación distinta de tipos de claves y valores. No está claro por qué la implementación incorporada de arreglos no puede optimizar para estos casos extremadamente comunes, o lo que la performance relativa es.
- Hay una clase `ArrayObject` (que implemente _cinco_ interfaces distintas) que puede envolver a un arreglo y permitirle actuar como objeto. Las clases de usuario pueden implementar las mismas interfaces. Pero sólo tienen un puñado de métodos, la mitad de los cuales no se parecen a las funciones incorporadas, y las funciones incorporadas de arreglos no saben cómo operar con un `ArrayObject` o cualquier otra clase parecida a arreglos.

#### Funciones

- Las funciones no son datos. Las clausuras son de hecho objetos, pero las funciones comunes no. No puedes referirte a ellas con sus nombres; `var_dump(strstr)` emite una advertenia y asume que querías la cadena `literal "strstr"`. No hay manera de discernir entre una cadena arbitraria y una "referencia" a función.
- `create_function` es básicamente un wrapper alrededor de `eval`. Crea una función con un nombre común y la instala globalmente (para que nunca sea recolectada por el recolector de basura -- ¡no la uses en un bucle!). De hecho no sabe nada sobre el ámbito actual, por lo que no es una clausura. El nombre contiene un byte `NUL` para que nunca pueda entrar en conflicto con una función común (porque el parser de PHP falla si hay un `NUL` en el archivo, en algún lado).
- Declarar una función llamada `__lambda_func` romperá `create_function` -- la implementación real es llamar a `eval`, crear la función llamada `__lambda_func`, e internamente renombrarla al nombre roto. Si `__lamda_func` ya existe, la primera parte arrojará un error fatal.

#### Otros

- Incrementar (`++`) un `NULL` produce `1`. Decrementar (`--`) un `NULL` produce `NULL`. Decrementar una cadena de la misma forma la deja sin cambios.
- No hay generadores.

### Framework web

#### Ejecución

- Un único archivo `php.ini` compartido controla partes _masivas_ de la funcionalidad de PHP e introduce reglas complejas respecto de qué se antepone a qué y cuándo. El software PHP que espera ser instalado en máquinas arbitrarias tiene que reescribir configuraciones de todos modos para normalizar su entorno, lo que derrota en mayor parte el uso de un mecanismo como php.ini de todos modos.
    - PHP busca a `php.ini` en varios lugares, por lo que puede (o puede que no) ser posible que se anteponga al de tu host. Sólo _un_ archivo de esos será parseado, sin embargo, por lo que no puedes sobreescribir un par de configuraciones y terminar ahí.
- PHP básicamente corre como CGI. Cada vez que una página es alcanzada, PHP recompila toda la cosa antes de ejecutarse. Incluso los frameworks de juguete de servidores de Python no actúan así.<br />
Esto ha llevado a un mercado completo de "aceleradores de PHP" que sólo compilan una vez, acelerando PHP hasta el nivel de cualquier otro lenguaje. Zend, la compañía detrás de PHP, ha hecho esto parte de su [modelo de negocios](http://www.zend.com/products/server/).
- Por un tiempo algo largo, los errores PHP iban al cliente por defecto -- supongo que para ayudar durante el desarrollo. No creo que esto siga siendo verdad, pero todavía veo el error de mysql siendo escupido al principio de alguna página.
- PHP está lleno de extraños "huevos de pascua", como [producir el logo de PHP con el argumento correcto](http://phpsadness.com/sad/11). No sólo es esto completamente irrelevante a construir _tu_ aplicación, sino que permite a cualquiera detectar si estás usando PHP (y quizá incluso estimar aproximadamente la versión), a pesar de cuántas configuraciones `mod_rewrite`, FastCGI, proxy inverso o `Server:` tengas.
- Las líneas en blanco antes o después de los tags `<?php ... ?>`, incluso en librerías, cuentan como texto literal y es interpolado en la respuesta (o causa errores de "cabeceras ya enviadas"). Tus opciones son o estrictamente evitar líneas extras al final de cada archivo (el siguiente luego de `?>` no cuenta), o simplemente evitar el token de cerrado `?>`.

#### Implantanción

La implantación por lo general se cita como una de las mayores ventajas de PHP: copiar algunos archivos y listo. En verdad, eso es mucho más fácil que correr un proceso completo como puede que tengas que hacer en Python, Ruby o Perl. Pero PHP deja mucho que desear.

En todas partes estoy en favor de correr las aplicaciones web como servidores de aplicación y hacer proxies reversos a ellos. Toma un esfuerzo mínimo configurar esto y los beneficios son muchos: puedes manjar tu servidor web y tu aplicación separadamente, puedes correr tantos o tan pocos procesos de la aplicación en tantas máquinas como quieras sin necesitar más servidores web, puedes correr la aplicación con un usuario diferente con cero esfuerzo, puedes cambiar de servidores web, puedes bajar la aplicación sin tocar el servidor web, puedes hacer implantación continua solo cambiando unos puntos fifo, etc. Malear tu aplicación a tu servidor web es absurdo y no hay una buena razón para hacerlo más.

- PHP está naturalmente atado a Apache. Correrlo separadamente, o con cualquier otro web server requiere igual de trabajo (posiblemente más) que implantar cualquier otro lenguaje.
- `php.ini` se aplica a cada aplicación en cualquier lugar. Hay un único archivo `php.ini`, y aplica globalmente; si estás en un server compartido y necesitas cambiarlo, o si corres dos aplicaciones que necesitan configuraciones distintas, no tuviste suerte; tienes que aplicar la unión de todas las configuraciones y diferenciarlas desde dentro de las aplicaciones mismas usando `init_set` o en el archvio de configuración de Apache o en .htaccess. Si puedes. También wow, hay un montón de lugares que necesitas checkear para darte cuenta de cómo una configuración está obteniendo su valor.
- Similarmente, no hay forma de "aislar" una aplicación PHP y sus dependencias del resto del sistema.  ¿Correr dos aplicaciones que requieren diferentes versiones de una librería, o incluso de PHP mismo? Comienza construyendo una segunda copia de Apache.
- La aproximación de "un montón de archivos", aparte de hacer el ruteo un gran dolor de trasero, también significa que debes cuidadosamente abilitar o deshabilitar lo que está de hecho visible, porque tu jerarquía de URLs es también tu árbol de código entero. Los archivos de configuración otros "parciales" necesitan guardas C-simil para prevenir que sean cargados directamente. El ruido de control de versiones (e.g., `.svn`) necesita protección. Con mod_php, _todo_ en tu sistema es un punto potencial de entrada; con un servidor de aplicación, hay un sólo punto de entrada y la única URL controla si es invocada.
- No puedes hacer una actualización continua de un montón de archivos que corren estilo-CGI, a menos que quieras crashes y comportamiento indefinido a medida que los usuarios llegan a tu sitio a medio camino de la actualización.
- A pesar de lo "simple" que es de configurar Apache para que corra PHP, hay trampas sutiles incluso ahí. Mientras la documentación de PHP sugiere usar `SetHandler` para hacer que los archivos .php corran como PHP, `AddHandler` parece funcionar igual de bien, y de hecho Google me da el doble de resultados para él. Aquí está el problema.<br />
Cuando usas `AddHandler`, le estás diciendo a Apache que "ejecutar esto como php" es _una posible _forma de ejecutar archivos .php. ¡**Pero**! Apache no tiene la misma idea de las extensiones de archivos que cualquier otro humano en el planeta tiene. Está diseñado para soportar, digamos, `index.html.en` siendo reconocido ambos como inglés y como HTML. Para apache, un archivo puede tener _cualquier número_ de extensiones simultáneamente.<br />
Imagina que tienes un formulario de subida de archivos en un directorio público. Para asegurarte que nadie suba archivos php, solo verificas que no tengan una extensión `.php`. Todo lo que un atacante tiene que hacer es subir un archivo llamado `foo.php.txt`; tu formulario no verá el problema, pero Apache _lo reconocerá_ como PHP y lo ejecutará alegremente.<br />
El problema aquí no es "usar el nombre de archivo original" o "no validar mejor", el problema es que tu servidor web está configurado para correr cualquier código con el que se encuentre -- precisamente la misma propiedades que hace a PHP "fácil de implantar". CGI requería, `+x`, que era _algo_, pero PHP ni siquiera eso. Y esto no es un problema teórico; he encontrado muchos sitios actuales con este problema.

#### Características faltantes

Considero todas estas ser de distinto nivel de crítico para construir una aplicación web. Parece razonable que PHP, con su mayor punto de venta siendo que es un "lenguaje web", debería tener algunas de ellas.

- No hay sistema de templates. Está PHP en sí mismo, pero nada que funcione como un gran interpolador más que un programa.
- No hay filtros de XSS. No, "recuerda usar `htmlspecialchars`" no es un filtro XSS. [Esto es](https://pypi.python.org/pypi/MarkupSafe).
- No hay protección CSRF. Te toca hacerlo a tí.
- No hay API estándar de base de datos. Cosas como PDO tienen que envolver cada llamada individual a la API para abstraer las diferencias.
- No hay ruteo. Tu website se ve exactamente igual que tu sistema de archivos. Muchos desarrolladores han sido engañados en pensar que `mod_rewrite` (y `.htaccess` en general) es un sustituto aceptable.
- No hay autenticación o autorización.
- No hay servidor de desarrollo. ("Arreglado" en 5.4. Llevó a la vulnerabilidad de `Content-Length` de más abajo. También, tienes que portar todas tus reglas de rewrite a una cosa que envuelve PHP, porque no hay ruteo.)
- No hay debugging interactivo.
- No hay un mecahismo de implantación coherente; sólo "copiar todos estos archivos al servidor".

### Seguridad

#### Límites del lenguaje

La reputación de seguridad pobre de PHP es en mayor parte porque toda datos arbitrarios de un lenguaje y los tira en otro. Esto es mala idea. `<script>` puede no significar nada en SQL, pero ciertamente lo hace en HTML.

Haciendo esto peor está el grito común por "sanitizar tus entradas". Esto está completamente _equivocado_; no puedes mover una varita mágica para hacer que un montón de datos estén inherentemente "limpios". Lo que necesitas es hablar el lenguaje: usar placeholders con SQL, usar listas de argumentos cuando se generan procesos, etc.

- PHP completamente _alienta_ el "sanitizado": hay una [extensión de filtrado de datos](http://www.php.net/manual/en/book.filter.php) entera para hacer eso.
- Todos los `addslashes`, `stripslashes` y otros sinsentidos relacionados-a-slashes son distracciones que no ayudan en nada.
- No hay, hasta lo que puedo decir, una forma segura de instanciar un proceso. SóLO puedes ejecutarlo a través de una cadena por la línea de comandos. Tus opciones son escapar como loco y esperar que la línea de comandos por defecto use el escapado correcto, o `pcntl_fork` y `pcntl_exec` _manualmente_.
- Ambos `escapeshellcmd` y `escapeshellarg` existen con descripciones vagamente similares. Noten que en Windows, `escapeshellarg` no funciona (porque asume semántica de la línea de comandos Bourne) y `escapeshellcmd` sólo reemplaza un montón de puntuación con espacios porque nadie puede entender cómo funciona el escapado de comandos de Windows (que puede silenciosamente romper todo lo que estés intentando hacer).
- Los bindeos originales incorporados para MySQL, todavía ampliamente usados, no tienen forma de crear instrucciones preparadas.

Al día de hoy, [la documentación de PHP sobre inyección SQL](http://www.php.net/manual/en/security.database.sql-injection.php) recomienda prácticas locas como checkeo de tipos, usando `sprintf` y `is_numeric`, manualmente usando `mysql_real_escape_string` en todos lados, o manualmente usar `addslashes` en todos lados (que ¡"puede ser útil"!). No hay mención de PDO o parametrización, excepto en los comentarios de los usuarios. Me quejé de este hecho específicamente a _un desarrollador de PHP_ al menos hace dos años, estaba alarmado, y la página nunca cambió.

#### Inseguro-por-defecto

- `register_globals`. Está desactivado por defecto desde hace un tiempo ya, y se fue en 5.4. No me importa. Es una _verg&uuml;enza_.
- `include` aceptando URLs HTTP. Igual.
- Comillas mágicas. Tan cerca a seguro-por-defecto y aún así tan lejos de comprender el concepto totalmente. E, igual.
- Puedes, digamos, [escanear una red](http://www.idontplaydarts.com/2011/02/scanning-the-internal-network-using-simplexml/) usando el soporte XML de PHP, y abusando su soporte ubicuo de nombres-de-archivos-como-URLs. Sólo `libxml_disable_entity_loader()` puede arreglar esto, y el problema sólo está mencionado en los comentarios del manual.

#### Núcleo

El intérprete de PHP mismo ha tenido algunos problemas de seguridad _fascinantes__._

- En 2007 el intérprete tuvo una vulnerabilidad de desbordamiento de enteros. El arreglo comenzó con if (size > INT_MAX) return NULL; y se fue [en picada desde allí](http://use.perl.org/use.perl.org/_Aristotle/journal/33448.html). (Para aquellos que no estén cómodos con el C: `INT_MAX` es el mayor entero que entrará en una variable, nunca. Espero que puedan darse cuenta del resto desde ahí.)
- Más recientemente, PHP 5.3.7 se las arregló para incluir una función crypt() que permitiría, en efecto, a [cualquiera loggearse sin un password](https://bugs.php.net/bug.php?id=55439).
- El servidor de desarrollo de PHP 5.4 es vulnerable a una denegación de servicio, porque toma el header `Content-Length` (que cualquiera puede setear a cualquier cosa) y trata de alocar eso en memoria. [Esto es una mala idea](http://www.exploit-db.com/exploits/18665/).

Podría seguir desenterrando más, pero el punto no es que hay X exploits -- el software siempre tiene bugs, pasa, no importa. La _naturaleza_ de estos es horripilante. Y no me puse a buscar estos; sólo aparecieron en mi puerta en los últimos meses.

---

## Conclusión

Algún comentarista ha correctamente señalado que no tengo una conclusión. Y, bueno, no tengo una conclusión. Si llegaste hasta aquí, asumo que estabas de acuerdo conmigo antes de haber comenzado. :)

Si sólo sabes PHP y estás curioso de aprender algo más, dale un intento al [tutorial de Python](http://docs.python.org/2/tutorial/) y trata con [Flask](http://flask.pocoo.org/) para la parte web. (No soy un fanático de su lenguaje de templates, pero cumple con su trabajo.) Desarma las piezas de tu aplicación, pero son aún las mismas piezas y deberían ser lo suficientemente familiares. Podría escribir un post real sobre esto más tarde; una intrducción remolino a un lenguaje entero y tecnologías web no pertenece aquí abajo.

Más tarde o para projectos más grandes podrías querer [Pyramid](http://www.pylonsproject.org/), que es nivel-medio, o [Django](https://www.djangoproject.com/), que es una monstruosidad compleja que trabaja muy bien para construir sitios como el de Django.

Si no eres un desarrollador para nada pero aún leiste esto por alguna razón, no estaré feliz hasta que cualquiera en el planeta haya pasado por [Aprender Python de la Manera Difícil](http://learnpythonthehardway.org/), así que ve a hacer eso.

Está también Ruby on Rails y algunos competidores que no he usado nunca, y Perl sigue vivo y coleando con Catalyst. Lee cosas, aprende cosas, construye cosas, vuélvete loco.

## Créditos

Gracias a los siguientes por la inspiración:

- [PHP Turtles](http://alokmenghrajani.github.io/wtf/php.html)
- [PHP Sadness](http://phpsadness.com/)
- [PHP WTF](http://www.phpwtf.org/)
- [YourLanguageSucks](https://wiki.theory.org/YourLanguageSucks#PHP_sucks_because%3A)
- [PHP in contrast to Perl](http://tnx.nl/php.html)
- [La densa, furiosa e inspiracional bronca de Pi](http://two-pi-r.livejournal.com/622760.html)
- [PHP is not an acceptable COBOL](http://tracks.ranea.org/post/13908062333/php-is-not-an-acceptable-cobol)
- [La documentación PHP](http://www.php.net/manual/en/index.php)
- un montón de fanáticos y contra-fanáticos PHP
- y, por supuesto, Rasmus Lerdorf por su salvaje mala interpretación de la mayoría de Perl

Háganme saber si tienen adiciones, o si estoy (¡con hechos!) equivocado sobre algo.
