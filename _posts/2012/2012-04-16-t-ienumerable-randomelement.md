---


title: T IEnumerable.RandomElement()
date: '2012-04-16 09:56:01 +0000'
date_gmt: '2012-04-16 14:56:01 +0000'
categories:
- Technology
tags:
- datos
- testing
- C#
- snippet
- unit testing
- objeto
subtitle: Seleccionar un elemento cualquiera de un conjunto

---


Otro de mis pequeños snippets, este es útil para unit testing.

Cuando tienen un repositorio de datos que en realidad es mockup, y algún objeto tiene que estar pre-populado, podrían querer que los tests sean independientes de los datos. Y con esto me refiero a ser independiente de los valores que esos objetos tienen. Para esos casos, utilizar un objeto al azar de un conjunto de objetos sería una buena aproximación. No es tan determinista, pero eso es algo deseable, e incluso más cerca a probar la aplicación real.

Para obtener un objeto al azar, este pequeño snippet ayuda:

<script src="https://gist.github.com/2399155.js?file=RandomElement.cs"></script>
