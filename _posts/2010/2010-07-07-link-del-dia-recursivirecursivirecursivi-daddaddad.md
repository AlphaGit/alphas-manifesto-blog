---


title: 'Link del día: Recursivi(recursivi(recursivi.dad)dad)dad'
date: '2010-07-07 14:13:37 +0000'
date_gmt: '2010-07-07 16:13:37 +0000'
categories:
- Link del día
tags:
- matemática
- blog
- creatividad
- recursividad
- programming
---


Probablemente conozcamos ya el concepto de recursividad. Si no lo conocen, para entenderlo van a tener que entender el concepto de recursividad. =P

La recursividad, según la define la [Wikipedia](http://en.wikipedia.org/wiki/Recursion), es un método de resolución de problemas que se basa en su propia definición. Para decirlo de forma más tangible, un problema se puede reducir a más de un problema de la misma naturaleza pero de más fácil resolución. (El típico ejemplo es el factorial: n! = 1 &times; 2 &times; 3 &times; ... &times; n puede resolverse como n &times; (n-1)!, que se puede resolver como n &times; (n-1) &times; (n-1-1)!, hasta que (n-...) = 1 y entonces 1! = 1, 2! = 2 &times; 1 = 2, 3! = 3 &times; 2 = 6, 4! = 4 &times; 6 = 24, etc.).

Lo curioso es que esto no solo aplica a la matemática, ni a la forma de programar algoritmos. Pensemos en una especie de recursividad conceptual. Por ejemplo, la definición de la palabra definición. O en un método para mostrar cómo se resuelve ese método.

Y ese último caso que queremos ver es el que trataremos hoy. [Russ Cox](http://swtch.com/~rsc/) publicó en su blog [research!rsc](http://research.swtch.com) un artículo llamado [Zip Files all the way down](http://research.swtch.com/2010/03/zip-files-all-way-down.html), en donde cuenta cómo generó un archivo zip que se contenía a sí mismo. (Por supuesto, está ahí para que lo bajemos y revisemos a gusto.) También cuenta cómo es que se embarcó en la empresa de generar un programa que escribiera su propio código fuente. Cómo lo hizo? Hay que leer el artículo. ;)

_Soy un zorrinito de zorrinito de zorrinito de zorrinito de ..._
