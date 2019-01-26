---
layout: post
title: 'Ember.js: queueHttpResponder'
date: '2014-07-05 18:50:06 +0000'
date_gmt: '2014-07-05 23:50:06 +0000'
categories:
- Projects
- Technology
tags:
- proyecto
- JavaScript
- unit testing
- data binding
- test
- EmberJS
- fakehr
- Ember helpers
- automated testing
sub_title: Solucionando incompatibilidad entre httpResponder + Ember 1.4.0+
---

Hace un tiempo encontré una incompatibilidad bastante grande entre los sistemas de Ember.Testing y httpRespond, que impedían a muchos programadores testear sus sistemas de forma automática sin necesidad de un servidor de pruebas. Más adelante explicaré qué fue lo que generó este problema, por qué es un problema grave y el workaround que trabajamos con algunos colegas y algunos miembros del equipo de Ember.

<!--more-->

##  ¿Qué es Ember.Testing?

Ember.Testing es una parte del paquete de Ember que permite hacer testing automatizado sobre las aplicaciones. Este subpaquete ofrece varias utilidades que no permiten testear nuestra aplicación, tanto por partes (unit testing) o con tests de acceptación o de interacción de usuario.

Por supuesto, simular interacción por parte del usuario no es algo simple, y para eso Ember.Testing nos provee una serie de _helpers_. Estos nos permitirán llenar textos en campos, hacer click en distintos lugares, visitar partes de la aplicación, verificar el estado actual de la pantalla, et cetera.

Un test, por ejemplo, podría verse así:

<script src="https://gist.github.com/AlphaGit/2da8aeea06222df6bd93.js"></script>

Más información sobre los helpers en [la documentación de Ember](http://emberjs.com/guides/testing/test-helpers/).

## Helpers síncronos vs. helpers asíncronos

Cabe destacar que los helpers se dividen en dos grandes categorías: helpers síncronos o asíncronos. Hay una buena razón para esta distinción: el _Ember run loop_. Cuando una aplicación de Ember se está ejecutando, existe un tiempo de inactividad periódico que le permite al usuario interactuar con la aplicación, y tras eso, Ember verificará si no hay cambios o eventos a los cuales debe responder. Este es el famoso run-loop de Ember, que se encargará de actualizar propiedades computadas, bindings, disparar acciones, re-generar templates, etc.

Como tales, los helpers de un test pueden funcionar una de dos maneras:

- **Síncronos:** No respetan el run-loop. Harán lo que tengan que hacer de forma independiente de la aplicación y devolverán un resultado si es que fuera necesario. (Ejemplo: `find()`, busca un selector en el DOM y devuelve los resultados.)
- **Asíncronos:** Interactuando con la aplicación: esperarán a cierto momento y ejecutarán sus acciones, permitiéndole a la aplicación reaccionar ante esos cambios. Como esto no se puede hacer en el mismo momento de ejecución del test, generan una promesa y otros helpers asíncronos encadenarán sus acciones a la finalización de dicha promesa.

### Necesitamos ir más profundo

En este punto mis más ávidos lectores se habrán preguntado si esto es correcto, porque el run-loop de Ember se encuentra deshabilitado durante los tests.  ¿Cómo es esto posible entonces?

Ember.Testing posee su propio "run loop", que verifica lo siguiente antes de seguir ejecutando los tests luego de que cada helper haga su magia. Esto es también parte del helper de `wait()` que otros helpers llaman internamente: ([referencia en el código fuente](https://github.com/emberjs/ember.js/blob/071b4bb6aad44100dc74ef8e1c79562e57038e7d/packages/ember-testing/lib/helpers.js#L145))

1. Verifica que no haya transiciones activas (pendientes de terminar)
1. Verifica que no haya llamadas AJAX que falten ser resueltas
1. Verifica que no haya timers esperando ser ejecutados (`Ember.run.scheduleOnce`, `Ember.run.later`, etc.)
1. Verifica que la aplicación no esté actualmente ejecutando un runLoop
1. Verifica que todos los waiters registrados estén resueltos

Si cualquiera de estas condiciones no se cumple, Ember.Testing simplemente esperará 10 milisegundos más y volverá a evaluarlas. Si todas se cumplen, se ejecuta la resolución de la promesa y el test sigue adelante.

## httpRespond

[ember-testing-httpRespond](https://github.com/trek/ember-testing-httpRespond) es un paquete npm que nos permite reemplazar un servidor de respuestas AJAX por respuestas pre-definidas en JSON, de forma que no necesitemos implementar lógica de servidor para cada test. Esto es muy bueno, porque simplifica parte de lo que estamos testeando, permitiéndonos ajustar las respuestas que el servidor daría ante alguna situación particular, y verificando que nuestra aplicación de Ember se comporta de la forma que debería hacerlo en ese caso.

Además de ser más rápido que un servidor real, permite amoldar los datos resueltos según cada test particular. Esto es muy poderoso para el testing, y sin la necesidad de un backend, se puede tener más control sobre lo que cada test hace.

## El problema

Cuando Ember 1.4.0 fue publicado, uno de los arreglos que se encontraban en su código era solucionar un problema interno que impedía a la aplicación señalar que una transición estaba incompleta, haciendo que el helper de `wait()` no esperara todo lo que realmente debía esperar en una transición de rutas ([ember.js PR #4347](https://github.com/emberjs/ember.js/pull/4347)). Esto significaba que desde Ember 1.4.0, aquellos helpers o tests que ejecutaran `wait()` internamente debían esperar a que una transición (navegación) a una determinada ruta terminara antes de poder seguir ejecutando ([ember-testing-httpRespond, issue 10](https://github.com/trek/ember-testing-httpRespond/issues/10)).

Dado que httpRespond utilizaba tests asincrónicos para registrar sus respuestas, estas nunca llegaban a registrarse si la transición misma las estaba esperando (porque la llamada AJAX nunca se habría resuelto). Como una solución a ese problema, httpRespond introdujo un nuevo helper llamado `visitAndRespond()` que pretendía solventar el problema ([ember-testing-httpRespond PR #13](https://github.com/trek/ember-testing-httpRespond/pull/13)). Esta no era la mejor solución por una cantidad de razones:

- Ya no se podía confiar que evaluaciones síncronas del tests estaban ocurriendo en la mitad de una transición (de hecho, sólo se podrían hacer verificaciones al final de una transición)
- No permite responder a una transición que requiere múltiples respuestas AJAX para ser resueltas
- No resuelve el mismo problema para cualquier otro helper distinto de `visit()` y que ejecute una transición (por ejemplo, un `click()` en un link)

## La solución (por ahora)

Al día de hoy nos encontramos a la espera de Ember 1.6.0 que cambiará la forma en la que Ember permite la ejecución del loop de testing, y permitirá acomodar ember-testing-httpRespond para solucionar esta situación. Si bien estamos cerca de ello (Ember 1.6.0-beta está ya disponible), tendremos que esperar un poco más para que todo esté listo y lo suficientemente maduro como para ser utilizado.

### queueHttpResponder

En el tiempo que eso pasa, tenemos una solución alternativa, que, aunque no resuelve todos los problemas actuales, nos permité utilizar esta aproximación en conjunto con todos los helpers. Esta solución funciona de forma independiente a los helpers o a los runLoops de Ember o de Ember.Testing, permitiendo más control sobre las respuestas de servidor en cualquier punto.

Denominé a esta solución **queueHttpResponder**, que hace uso de fakehr de la misma forma que httpRespond lo hace, y cambia ligeramente la estrategia: en lugar de utilizar un helper asíncrono para devolver respuestas, utilizamos un helper síncrono (o una función) que las encolará y permitirá en su propio loop responderlas para que los helpers de Ember puedan ejecutarse con normalidad, como si tuviéramos un servidor disponible.

<script src="https://gist.github.com/AlphaGit/11225226.js"></script>

Nathan Palmer tomó esta solución, agregó unos ejemplos y convirtió las funciones en helpers que pueden utilizarse desde Ember.Testing:

<script src="https://gist.github.com/nathanpalmer/11258730.js"></script>

### Llevándolo más allá

En el proyecto en donde implementé estos cambios, agregué también un helper llamado `queueDefaultResponses()`, que hacía uso del helper `queueHttpResponse()` con todas las respuestas que la aplicación necesita por defecto para comenzar su ejecución, permitiendo a cada test simplemente registrar los cambios que necesita en su configuración para probar tal o cual situación.

Espero que esto sea de utilidad para quien se encuentren en el mismo problema.
