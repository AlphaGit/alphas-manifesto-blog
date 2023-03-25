---

title: Condiciones OR en REST
date: '2013-08-08 17:42:13 +0000'
date_gmt: '2013-08-08 22:42:13 +0000'
categories:
- Projects
- Technology
tags:
- JSON
- REST
- HTTP
- estándares
- notación posfijo
- notación polaca inversa
- precedencia
- operaciones
- sintaxis
- GET
subtitle: Aplicando condiciones complejas a requests HTTP REST

---

![]({{ site.baseurl }}/assets/ToRestOrNotToRest.jpg)

Es muy común que en la especificación de condiciones a llamadas GET REST, la inclusión de diferentes parámetros indique una relación AND entre ambas condiciones.

Por ejemplo:

```
GET /clients?lastName=Smith&firstName=John
```

En una llamada así, está claro que los recursos que queremos obtener son aquellos que cumplen a la vez con ambas condiciones: tener lastName Smith y tener firstName John.

Ahora, qué pasaría si quisiéramos hacer una búsqueda de recursos en donde nuestro criterio no sea de necesaria inclusión de ambos parámetros. Por ejemplo, qué tal si quisiéramos que nuestros clientes cumplieran con cualquiera de esas dos condiciones? El problema no es la implementación, sino de qué forma podemos mantener la sintaxis de la llamada lo suficientemente limpia como para que tenga un sentido semántico. Cito (sección 3.4): "_El componente de query contiene datos no-jerárquicos que, junto con los datos en el componente de path (sección 3.3), sirve para identificar un recurso dentro del ámbito del esquema del URI y autoridad de nomenclatura (si la hubiera)._"

Quisiera escuchar opiniones al respecto, pero continuemos.

<!--more-->

## Expresar la sintaxis dependiendo del orden (no recomendado)

Esta aproximación nos permite, dependiendo solamente en el orden en que se presentan los parámetros, generar árboles de condiciones muy ricos en contenido. Cabe destacar que la aproximación es algo compleja, pero tiene la belleza de expresarse correctamente en la URL, sin necesidad de otra estructura que simplemente la asociación parámetro-valor que el protocolo HTTP propone.

Sin embargo, si hablamos de estándares y verificamos el [RFC 3986](http://tools.ietf.org/html/rfc3986), estamos parándonos sobre una línea gris. El estándar sobre URLs no dice demasiado sobre la semántica del _query string_, pero menciona que está destinado a _información no-jerárquica_, aunque el documento se encuentra en ese punto discutiendo la sintaxis y la naturaleza de su formato, más que su contenido aceptable.

### Operadores como parámetros

Una posible aproximación requiere que dependamos del orden en el que se reciben los parámetros, algo que no siempre es recomendable, y definitivamente no es una buena práctica. Pero suponiendo que podamos hacerlo, nuestra aproximación se hace muy simple:

```
GET /clients?lastName=Smith&operator=OR&firstName=John&operator=AND&age=25
```

Como vemos, depender del orden nos permite definir qué operadores queremos aplicar de izquierda a derecha. Por supuesto, podemos generar la cantidad de parámetros o hacer el request tan complejo como sea necesario para expresar nuestro deseo. Sin embargo, no es difícil que esto se vuelva complejo, puesto que en esta manera debemos ser muy explícitos en aquello que queremos identificar.

En nuestro ejemplo anterior, estamos verificando:

- Que el cliente se apellide Smith
- O que el cliente se llame John
- Y que su edad sea 25

### Operadores de precedencia

¿La edad debe ser 25 junto con cualquiera de ambas opciones, o solo si se cumple la segunda? Esto se presta a interpretación, y sólo reglas de precedencia lo resolverían. Otra forma es aplicar operadores de precedencia ( ¿paréntesis?) y podemos extender más aún la lógica de indicación de operadores para valores de comparación.

```
GET /clients?operator=STARTPRECEDENCE&field=lastName&operator=EQUALS&value=Smith&operator=OR&field=firstName&operator=EQUALS&value=John&operator=ENDPRECENDE&operator=AND&field=age&operator=GREATERTHAN&value=25
```

Nuestra nueva consulta entonces se puede traducir a:

```
(lastName = Smith OR firstName = John) AND age > 25
```

### Notación polaca inversa: evitando operadores de precedencia

Muchos no están familiarizados con la [Notación Polaca Inversa](http://es.wikipedia.org/wiki/Notaci%C3%B3n_polaca_inversa) (también llamada notación posfija), pero aplicada correctamente puede ser una herramienta muy poderosa. En nuestro caso, es particularmente útil porque asumiendo una sintaxis correcta y el orden de los parámetros podemos evitar usar operadores de precedencia. Y esto es algo que quisiéramos hacer, porque ya tenemos necesidad de aplicar esos dos supuestos por la forma en la que estamos recibiendo nuestra sintaxis.

La notación posfijo se trata de cambiar el orden de los operandos y los operadores para que el procesamiento se haga de izquierda a derecha, de forma que la precedencia está indicada por el orden y por los resultados intermedios, independientemente de los símbolos que vengan a continuación. Otra de las ventajas que esto significa es que se simplifica enormemente la implementación de parseo e incluso puede ejecutarse _on the fly_.

Por ejemplo, para calcular

```
1 + (4 + 3) * 2
```

Debemos identificar la precedencia, aplicarla primero, reemplazar el resultado parcial en nuestro árbol de ejecución y luego repetir. En nuestro ejemplo, esto sería:

```
1 + (4 + 3) * 2
1 + (7) * 2
1 + 7 * 2
1 + 14
15
```

La misma operación expresada en notación posfijo puede ejecutarse de izquierda a derecha, ignorando lo que continúe a la derecha de la expresión.

```
4 3 + 2 * 1 +
7 2 * 1 +
14 1 +
15
```

Noten cómo no hace falta paréntesis, porque los primeros dos elementos siempre serán los que se ejecutarán.

Volviendo a nuestro ejemplo de pedidos GET,

```
(lastName = Smith OR firstName = John) AND age > 25
```

podríamos expresarlo en notación posfija como:

```
lastName "Smith" EQUALS firstName "John" EQUALS OR age "25" GREATER AND
```

En esa cadena, podemos diferenciar nombres de campos por valores literales con el uso de comillas, pero volviendo al uso anterior de parámetros de campo, podríamos re-escribir esta condición de la siguiente forma:

```
lastName FIELD Smith VALUE EQUALS firstName FIELD John VALUE EQUALS OR age FIELD 25 VALUE GREATER AND
```

Con lo que nuestra llamada GET se reduciría a:

```
GET /clients?field=lastName&value=Smith&operator=EQUALS&field=firstName&value=John&operator=EQUALS&operator=OR&field=age&value=25&operator=GREATER&operator=AND
```

Notarán cómo valiéndonos más en el orden podemos ahorrar espacio sin utilizar los operadores de precedencia.

## Expresar la sintaxis como jerarquía (recomendado)

El punto anterior sufre de unos problemas muy característicos:

- Es primordial que los parámetros puedan procesarse en el orden correcto (y esto depende de la plataforma web sobre la que estemos trabajando)
- Con unas pocas condiciones complejas la cadena será exesivamente larga
- Son demasiado complejas

Está claro entonces que para hacer las cosas más simples, podríamos recurrir a estructuras que fueron pensadas para este tipo de información. En este caso, voy a hablar de JSON, que me agrada por la simplicidad de su sintaxis.

Volvamos a plantear nuestro ejemplo:

```
(lastName = Smith OR firstName = John) AND age > 25
```

Para expresarlo como jerarquía, supongamos que cada elemento de nuestro árbol de operaciones que respondería a la siguiente estructura (si saben leer gramáticas o [ABNF](http://en.wikipedia.org/wiki/Augmented_Backus%E2%80%93Naur_Form), esto les va a ser fácil):

```
S → operation
operation → operator operands
operator → "AND" | "OR" | "EQUALS" | "GREATER" | ...
operands → operand+
operand → operation | field | value
field → "lastName" | "firstName" | "age" | ...
value → (cualquier valor constante)
```

Nuestro árbol ya posee las precedencias expresadas en sus jerarquías, puesto que para resolver el árbol y llegar a un único valor, deben resolverse primero las hojas y reducirlas a nodos que serán nuevas hojas a ser resueltas. Así sucesivamente hasta llegar a un único valor.

Teniendo eso en cuenta, ahora expresemos nuestro ejemplo como una jerarquía de operaciones en formato JSON.

```
{
    operator: "AND",
    operands: [
    {
        operator: "OR",
        operands: [
            {
                operator: "EQUALS",
                operands: [
                    { field: "lastName" },
                    { value: "Smith" }
                ]
            },
            {
                operator: "EQUALS",
                operands: [
                    { field: "firstName" },
                    { value: "John" }
                ]
            }
        ]
     },
     {
         operator: "GREATER",
         operands: [
             { field: "age" },
             { value: "25" }
        ]
     }
}
```

Ahora, el problema con esto es que es excesivamente largo, pero dado que los nombres de los operadores van a ser identificables, podemos reducir el árbol haciendo un poco de trampa sintáctica y remover lo que más espacio nos cuesta: los identificadores de los campos.

```
{
    AND: [
    {
        OR: [
            {
                EQUALS: [
                    { field: "lastName" },
                    { value: "Smith" }
                ]
            },
            {
                EQUALS: [
                    { field: "firstName" },
                    { value: "John" }
                ]
            }
        ]
     },
     {
         GREATER: [
             { field: "age" },
             { value: "25" }
        ]
     }
}
```

Quitando espacios e identación:

```
{AND:[{OR:[{EQUALS:[{field:"lastName"},{value:"Smith"}]},{EQUALS:[{field:"firstName"},{value:"John"}]}]},{GREATER:[{field:"age"},{value:"25"}]}}
```

```
GET /clients?filter={AND:[{OR:[{EQUALS:[{field:"lastName"},{value:"Smith"}]},{EQUALS:[{field:"firstName"},{value:"John"}]}]},{GREATER:[{field:"age"},{value:"25"}]}}
```

Espero que esto haya sido de utilidad. Acepto sugerencias sobre otras aproximaciones, ventajas y desventajas de las aquí presentadas.
