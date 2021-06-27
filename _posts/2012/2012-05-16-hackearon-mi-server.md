---

title: '"Hackearon mi server"'
date: '2012-05-16 09:47:32 +0000'
date_gmt: '2012-05-16 14:47:32 +0000'
categories:
- Miscelaneous
tags:
- internet
- datos
- privacidad
- hacking
- mantenimiento
- riesgo
- problema
- seguridad
- artículo
- administrador de sistemas
- procesos
- pregunta
- respuesta
- legal
- servidor
sub_title: ¿Y ahora qué hago?
---

Uno de los posts que causaron revuelo en las preguntas de Server Fault fue _[My server's been hacked EMERGENCY](http://serverfault.com/questions/218005/my-servers-been-hacked-emergency) (Hackearon mi server, EMERGENCIA)_, un post cuya respuesta fue totalmente inesperada para muchos y muy útil y planeada para situaciones tan sorpresa.

Me pareció tan útil que además de sólo linkear la pregunta y su respuesta, quise traducir la elongada explicación que [Robert Moir](https://twitter.com/#!/RobertoMoir), bajo el usuario de [DJ Pon3](http://serverfault.com/users/7783/dj-pon3) nos ha brindado. Esta traducción se basa en su respuesta pública, sin permiso explícito.

él nos explica cuáles son las medidas a tomar en un caso drástico como este, y muchas formas de reducir el riesgo de esto ocurriendo en el futuro. La explicación es larga pero muy clara y muy explícita sobre cada aspecto involucrado en la seguridad de un sistema.

A continuación, [su respuesta](http://serverfault.com/a/218011/90562):

---

Es difícil dar un consejo específico desde lo que has posteado aquí, pero tengo algunos consejos genéricos basados en un post que escribí mucho tiempo atrás cuando todavía podía molestarme en bloggear.

_Primero que nada, no hay "arreglos rápidos" más que recuperar tu sistema de una copia de seguridad tomada anteriormente a la intrusión, y esto tiene al menos dos problemas._

1. Es difícil identificar cuándo ocurrió la intrusión
1. No ayuda a cerrar el "agujero" que les permitió la entrada la última vez, ni lidiar con las consecuencias de cualquier "robo de datos" que pueda haber tomado lugar también.

Esta pregunta sigue siendo hecha repetidamente por las víctimas de los hackers que entran en su servidor web. Las respuestas cambian raramente, pero la gente sigue haciendo la misma pregunta. No estoy seguro de por qué. Quizá a la gente no le gustan las respuestas que han visto buscando por ayuda, o no pueden encontrar a alguien que confíen que les de consejo. O quizá la gente lee una respuesta a esta pregunta y se concentra demasiado en el 5% de por qué su caso es especial y diferente a las respuestas que pueden encontrar online y se pierden el 95% de las preguntas y respuestas en donde su caso es suficientemente cercano a ser el mismo al que leyeron online.

Eso me trae a la primera pepita de información. Realmente aprecio que eres un copo de nieve único muy especial. Aprecio que tu sitio también lo sea, ya que es un reflejo de tí y tu negocio, o en última instancia, tu trabajo duro en nombre de un empleador. Pero para alguien desde afuera mirando hacia adentro, ya sea una persona de seguridad de computadoras mirando al problema para tratar de ayudarte o incluso para el mismo atacante, es muy probable que tu problema sea al menos 95% idéntico a cualquier otro caso que ellos hayan visto.

No te tomes el ataque de forma personal, y no tomes las recomendaciones que siguen aquí y que te da otra gente de forma personal. Si estás leyendo esto inmediatamente luego de convertirte en la víctima de un hack en un website, entonces realmente lo siento mucho, y espero que puedas encontrar algo útil aquí, pero este no es el momento para dejar que tu ego se interponga en el camino de lo que tienes que hacer.

## Encontraste que tu(s) server(s) fueron hackeados.  ¿Ahora qué?

No entres en pánico. Absolutamente no actúes apurado, y absolutamente no intentes actuar como si las cosas nunca hubieran ocurrido y no tuvieras que hacer nada.

Primero: comprender que el desastre ya ocurrió. Este no es el momento para la negación; es el momento para aceptar lo que pasó, para ser realista al respecto, y para tomar pasos para controlar las consecuencias del impacto.

Algunos de estos pasos van a doler, y (a menos que tu website tenga una copia de mis datos), realmente no me importa si ignoras todos o algunos de estos pasos, pero hacerlos hará las cosas mejores al final. La medicina puede saber horrible pero a veces hay que quitarle importancia a eso si queremos que la cura funcione.

Detén el problema de volverse peor de lo que ya es:

1. La primera cosa que deberías hacer es desconectar los sistemas afectados de la internet. Cualquier otro problema que tengas, dejar el sistema conectado a la web sólo permitirá que el ataque continúe. Me refiero a esto de forma bastante literal; consigue a alguien que visite al server físicamente y desconecte los cables de red si eso es lo que hace falta, pero desconectar a la víctima de sus atracadores antes de que hagas cualquier otra cosa.
1. Cambia todos los passwords de todas las cuentas en todas las computadoras que están en la misma red que los sistemas comprometidos. No, en serio. Todas las cuentas. Todas las computadoras. Sí, tienes razón, esto podría ser demasiado; pero por el otro lado, puede que no. De todas formas no lo sabes,  ¿verdad?
1. Verifica tus otros sistemas. Pon atención especial a aquellos que tengan servicios que están expuestos a la internet, y a aquellos que tienen datos funancieros o cualquier otro dato comercialmente sensible.
1. Si el sistema mantiene los datos personales de alguien, haz una divulgación completa y sincera a cualquiera potencialmente afectado de una vez. Sé que esta es difícil. Sé que va a doler. Sé que muchos negocios quieren barrer este tipo de problemas debajo de la alfombra pero me temo que sólo tendrás que lidiar con él.

¿Todavía dudas si tomar este último paso? Lo entiendo, de verdad. Pero míralo de esta manera:

En algunos lugares podrías tener un requerimiento legal de informar a las autoridades y/o las víctimas de este tipo de brecha de privacidad. Por mucho que tus clientes se molesten teniéndote contándoles sobre un problema, estarían mucho más enojados si no les contaras, y sólo se enterarían por cuenta propia cuando alguien les cobre U$S 8.000 dólares en bienes usando los datos de tajeta de crédito que obtuvieron de tu sitio.

 ¿Recuerdas lo que dije antes? Lo malo ya ocurrió. La única pregunta ahora es qué tan bien vas a lidiar con ello.

### Comprende el problema completamente:

1. NO pongas a los sistemas afectados de vuelta online hasta que esta etapa esté completa, a menos que quieras que quieras ser la persona cuyo post fue la punta del iceberg que me hizo decidir escribir este artículo. No voy a linkear a ese post para que la gente pueda tener una risa barata, pero la tragedia real es cuando la gente falla en aprender de sus errores.
1. Examina los sistemas 'atacados' para comprender cómo los ataques tuvieron éxito en comprometer tu seguridad. Haz cada esfuerzo posible por averiguar de dónde "vinieron" los ataques, para que puedas comprender los problemas que tienes y que necesitas solucionar para que tu sistema esté seguro en el futuro.
1. Examina los sistemas 'atacados' nuevamente, esta vez para comprender a dónde fueron los ataques, para que entiendas qué sistemas fueron comprometidos en el ataque. Asegúrate de seguir cualquier pista que sugiera que otros sistemas comprometidos podrían convertirse en una plataforma para atacar más a tus sistemas.
1. Asegúrate de que los "gateways" usados en cada uno y todos los ataques estén completamente comprendidos, para que puedas comenzar a cerrarlos apropiadamente (por ejemplo, si tus sistemas fueron comprometidos por un ataque de SQL injection, entonces no sólo tienes que cerrar la línea de código particular que usaron para entrar, también querrías auditar todo tu código para ver si el mismo tipo de error ocurrió en algún otro punto).
1. Comprende que los ataques a veces tienen éxito por más de una falla. A veces, los ataques son exitosos no gracias a encontrar un gran bug en un sistema sino poniendo juntos varios problemas (muchas veces menores y triviales de por sí) para comprometer a un sistema. Por ejemplo, usar SQL injection para enviar comandos a un servidor de bases de datos, descubrir que el website/aplicación corre bajo el contexto de un usuario administrador y usar los derechos de esa cuenta como punto de partida para comprometer otras partes de un sistema. O como a los hackers les gusta decir: "otro día en la oficina aprovechándonos de los errores comunes que la gente hace".

###  ¿Por qué no simplemente "reparar" el exploit o rootkit que detectaste y poner los sistemas online de vuelta?

En situaciones como esta el problema es que ya no tienes control de ese sistema. Ya no es tu computadora.

La única forma de estar _seguro_ de que tienes control del sistema es reconstruir el sistema. Si bien hay mucho valor en encontrar y arreglar el exploit usado para entrar en el sistema, no puedes estar seguro sobre qué más ha ocurrido en el sistema una vez que los intrusos tomaron control (de hecho, se sabe de hackers que reclutan sistemas a una botnet para solucionar los exploits que ellos mismos usaron, para salvaguardar "su" computadora de otros hackers, y también instalar sus rootkits).

### Haz un plan de recuperación y para poner a tu sistema online de vuelta y no te desvíes de él:

Nadie quiere estar offline más de lo que tienen que estarlo. Eso está claro. Si este website es un mecanismo de generación de ganancias, entonces la presión para traerlo de vuelta online rápidamente va a ser intensa. Incluso si solo la cosa en juego es la reputación tuya / de tu compañía, esto va a generar todavía más presión para poner las cosas funcionando de vuelta rápidamente.

Sin embargo, no cedas a la tentación de volver online demasiado rápido. En lugar de eso, muévete tan rápido como puedas para comprender qué causó el problema y para solucionarlo antes de volver online, de de lo contrario muy sgeuramente caerás víctima de una intrusión nuevamente, y recuerda, "ser hackeado una vez puede ser clasificado como mala fortuna; ser hackeado de vuelta inmediatamente luego se ve como descuido" (con mis disculpas a Oscar Wilde).

1. Estoy asumiendo que has comprendido todos los problemas que llevaron a la intrusión exitosa en primer lugar antes de que siquiera comiences esta sección. No quiero sobre-enfatizar el caso pero si no has hecho eso primero, realmente deberías hacerlo. Lo siento.
1. Nunca juegues en modo extorsión / protección de dinero. Este es el signo de la presa fácil y no quisieras que se use esa frase nunca para describirte.
1. No te sientas tentado a poner el mismo server / los mismos servers de vuelta online sin una completa re-instalación. Debería ser más fácil construir una nueva computadora o "enviar una bomba atómica al server desde órbita y hacer una instalación limpia" en el hardware viejo que debería ser auditar cada esquina del viejo sistema para segurarse que está limpio antes de ponerlo de vuelta online. Si no estás de acuerdo con esto entonces probablemente no sepas lo que significa realmente asegurarse que un sistema esté realmente limpio, o tus procedimientos de instalación de websites son un desastre. Es de suponer que tienes backups y pruebas de instalación de tus sitios que puedes simplemente usar para construir el sitio en vivo, y si no entonces ser hackeado no es tu problema más grave.
1. Sé muy cuidadoso sobre usar datos como estaban "en vivo" en el sistema al momento del hackeo. No diré "nunca nunca lo hagas" porque simplemente me ignorarás, pero francamente creo que deberías considerar las consecuencias de mantener datos por ahí cuando sabes que no puedes garantizar su integridad. Idealmente, deberías traerlos de un backup hecho anteriormente al momento de la intrusión. Si no puedes o no lo vas a hacer, deberías ser muy cuidadoso con esos datos porque están contaminados. Deberías especialmente ser consciente de las consecuencias a otros si estos datos pertenencen a clientes o visitantes del sitio más que directamente a tí.
1. Monitorea los sistemas cuidadosamente. Deberías mantener esto como un proceso continuo en el futuro (más sobre esto abajo) pero deberías tomar cuidados extra para ser vigilante durante el periodo inmediatamente siguiente a tu sitio volviendo a estar online. Los intrusos muy seguramente volverán, y puedes verlos tratando de volver a entrar y deberías poder verificar rápidamente si realmente cerraste todos los agujeros que usaron más cualquier otro que hayan hecho ellos por cuenta propia, y puedes obtener información útil que puedes pasar a tus autoridades legales.

## Reducir el riesgo en el futuro

La primer cosa que debes comprender es que la seguridad es un proceso que debes aplicar por todo el ciclo de vida de diseño, instalación y mantenimiento en un sistema que tiene acceso a internet, no algo que puedes pegar como un par de capas sobre tu código luego como pintura barata. Para estar seguro apropiadamente, un servicio y una aplicación deben estar diseñados desde el comienzo con esto en mente como uno de los objetivos principales del proyecto. Me doy cuenta que es aburrido y que ya has escuchado todo esto antes, y que "no te das cuenta de la presión, hombre" de tener tu servicio web 2.0 beta (beta) en estado beta en la web, pero el hecho es que esto se sigue repitiendo porque fue verdad la primera vez que fue dicho y todavía no se ha convertido en mentira.

No puedes eliminar el riesgo. No deberías siquiera tratar de hacerlo. Lo que deberías hacer, sin embargo, es comprender cuáles riesgos de seguridad son importantes para tí, y comprender cómo manejar y reducir tanto el impacto del riesgo y la probabilidad de que el riesgo ocurra.

###  ¿Qué pasos puedes tomar para reducir la probabilidad de que un ataque sea exitoso?

Por ejemplo:

1.  ¿Cuál fue la falla que le permitió a la gente entrar a tu sitio, un bug en un código de teceros conocidos para el cual había un patch disponible? Si es así,  ¿deberías re-pensar tu aproximación a cómo patchear aplicaciones en tus servidores que ven la internet?
1.  ¿Fue la falla que le permitió a la gente entrar a tu sitio un bug desconocido en un código de teceros, para el cual no había un patch disponible? Yo ciertamente no abogo por cambiar de proveedor cuando algo como esto te muerde porque todos tienen sus problemas y te quedarás sin plataformas en un año si tomas esta aproximación. Sin embargo, si un sistema constantemente te decepciona, entonces deberías migrar a algo más robusto o como mínimo, re-arquitecturar tu sistema de forma que los componentes vulnerables estén envueltos en algodón y lo más lejos posible de ojos hostiles.
1.  ¿Fue la falla un bug en código desarrollado por tí (o un empleado trabajando para tí)? Si es así,  ¿deberías re-pensar tu aproximación a cómo aprobar código para instalarlo a tu sitio en vivo?  ¿Podría el bug haber sido detectado con un testeo de sistema mejorado, o con cambios en tu estándar de codificación? (Por ejemplo, si bien la tecnología no es una panacea, puedes reducir la probabilidad de un ataque de SQL Injectoin utilizando técnicas de codificación bien documentadas.)
1.  ¿Fue a falla debida a un problema en cómo el servidor o la aplicación fueron instalados? Si es así,  ¿estás usando procesos automatizados para construir e instalar servidores cuando es posible? Estos son una gran ayuda en mantener una "base" consistente en todos tus servidores, minimizando la cantidad de trabajo particular que debe ser hecho en cada uno y así minimizando la oportunidad de un error de ser cometido. Lo mismo ocurre con las instalaciones - si requieres algo "especial" de ser hecho para instalar la última versión de tu aplicación web entonces intenta automatizarlo y asegúrate que siempre se haga de una forma consistente.
1.  ¿Podría la intrusión haber sido detectada más tempranamente con mejor monitoreo de tus sistemas? Por supuesto, un sistema de monitoreo de 24 horas, o un sistema "on call" para tu personal podría no ser lo más efectivo en cuanto a costos, pero hay companías que pueden monitorear tus servicios web para tí y alertarte en el evento de un problema. Podrías decidir que no puedes pagar o no lo necesitas y estás bien... pero tómalo en consideración.
1. Utiliza herramientas como tripwire y nessus cuando sea apropiado - pero no las uses ciegamente porque yo lo digo. Tómate el tiempo de aprender cómo usar un buen par de herramientas de seguridad que sean apropiadas para tu entorno, mantiene estas herramientas actualizadas y utilízalas en períodos regulares.
1. Considera contratar expertos en seguridad para 'auditar' tu sitio en períodos regulares. Nuevamente, puedes decidir que no puedes pagarlo o que no lo necesitas y eso está bien... pero tómalo en consideración.

###  ¿Qué pasos puedes tomar para reducir las consecuencias de un ataque exitoso?

Si decides que el "riesgo" de que el piso bajo de tu casa se inunde es alto, pero no lo suficientemente alto como para mudarte por las dudas, deberías al menos mover las reliquias familiares irremplazables al piso superior.  ¿Verdad?

1.  ¿Puedes reducir la cantidad de servicios expuestos directamente a la internet?  ¿Puedes mantener algún tipo de brecha entre tus servicios internos y tus servicios externos a la Internet? Esto se asegura que incluso si tus sistemas externos están comprometidos, las posibilidades de usar esto como plataforma para atacar tus sistemas internos están limitadas.
1.  ¿Estás almacenando información que no necesitas almacenar?  ¿Estás almacenando información "online" cuando podría estar archivada en otro lugar? Hay dos puntos en esta parte; el obvio es que la gente no se puede robar información que no tienes, y el segundo es que mientras menos tengas, menos que tienes que mantener y codificar, y entonces hay menos chances de bugs apareciendo en tu código o tu diseño de sistemas.
1.  ¿Estás usando los principios de "acceso mínimo" para tus aplicaciones web? Si los usuarios sólo necesitan leer de una base de datos, asegúrate que la cuenta que la aplicación web utiliza para hacer esto sólo tenga permiso de lectura, no le permitas escribir y ciertamente no nivel de acceso a todo el sistema.
1. Si no estás muy experimentado a algo y no es central a tu negocio, considera tercerizarlo. En otras palabras, si mantienes un pequeño website que habla de escribir código para aplicaciones desktop y decides comenzar a vender aplicaciones desktop pequeñas desde tu sitio, considera "tercerizar" tu sistema de órdenes de tarjeta de crédito a alguien como Paypal.
1. Si es posible de alguna forma, haz la práctica de recuperación de sistemas comprometidos parte de tu plan de recuperación de desastres. Esto es discutiblemente otro "escenario de desastre" que podrías encontrar, simplemente uno con sus propios problemas y complicaciones que son distintos de los usuales 'la sala de servidores se incendió' / 'fue invadida por un servidor gigante comiendo furbies'.

## ...y finalmente

Probablemente no dejé cabo suelo entre las cosas que otros consideran importantes, pero los pasos de arriba deberían al menos ayudarte a comenzar a ordenar las cosas si tienes la mala suerte de convertirte una víctima de los hackers.

Sobre todo: no entres en pánico. Piensa antes de actuar. Actúa firmemente una vez que hayas tomado una decisión, y deja un comentario debajo si tienes algo que agregar a mi listado de pasos.

---

_Soy un zorrinito hackeado (gracias Julián!)_
