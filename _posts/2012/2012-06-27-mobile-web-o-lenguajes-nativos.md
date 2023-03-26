---


title: 'Mobile:  ¿Web o lenguajes nativos?'
date: '2012-06-27 00:30:28 +0000'
date_gmt: '2012-06-27 05:30:28 +0000'
categories:
- Technology
tags:
- JavaScript
- HTML
- CSS
- HTML5
- desarrollo móvil
- CSS3
- decisión
- estrategia
subtitle: Sobre cómo elegir la tecnología correcta

---


Cuando una organización, por grande o pequeña que sea, quiere comenzar su presencia en el mercado mobile, hay una pregumta que siempre surge y que muchas veces no les resulta fácil resolver.  ¿Qué es más conveniente: utilizar tecnologías web y sus capabilidades para llegar a todos los dispositivos, o utilizar el framework propio de los dispositivos para utilizar todo el potencial que ellos ofrecen?

Está claro que una solución web puede hacer uso de todas las nuevas tecnologías, incluyendo HTML5, CSS3, las nuevas versiones de JavaScript y una variedad de trucos que muchos programadores conocen, pero utilizar el lenguaje nativo de los dispositivos hace que nada sea imposible. Entonces,  ¿cuál es la más apropiada?

Como siempre, **la respuesta correcta no es absoluta**, sino que varios factores juegan al momento de una desición estratégica. Primero, consideremos los beneficios y problemas de cada elección, lado a lado.

<table class="aligncenter" style="width: 100%;" border="1" cellpadding="10" align="center">
<thead>
<tr>
<td></td>
<td> Web (HTML, JS, CSS)</td>
<td> Lenguaje nativo</td>
</tr>
</thead>
<tbody>
<tr>
<td>A favor</td>
<td>
<ul>
- Cross-browser
- Curva de aprendizaje suave
- Estándares definidos
- Alto nivel
</ul>
</td>
<td>
<ul>
- Acceso a cualquier funcionalidad del dispositivo
- Mejor performance
- Look and feel consistente con otras apps
- Capacidad de reinventar el UI completamente
</ul>
</td>
</tr>
<tr>
<td>En contra</td>
<td>
<ul>
- No toda funcionalidad de dispositivo móvil está disponible
- Distintos niveles de implementación según el navegador
- Estándares todavía en desarrollo
- Requiere conectividad, al menos en algún punto
</ul>
</td>
<td>
<ul>
- Requiere instalación de una aplicación
- Diferentes según dispositivos, modelos y versiones
- Diferentes políticas de market
- Requiere de uso de licencias para algunos markets
- Requiere aprendizaje y especialización
- Los ciclos de vida los determina el market
</ul>
</td>
</tr>
</tbody>
</table>

Existe una tercera opción que he elegido no listar: los híbridos. Son compañías o frameworks que aseguran la llegada a una mayoría de dispositivos, solucionando la necesidad de aprender distintos lenguajes. Sin embargo, estas soluciones por lo general son tercerizadas (es decir, corren la aplicación por su cuenta), o son wrappers (es decir, toda nuestra aplicación corre dentro de otra aplicación que ellos proveen) o simplemente revierten a aplicaciones HTML sin demasiado poder. El mercado todavía está surgiendo para estos frameworks y hay resultados muy variados con ellos aún, razón por la cual he elegido dejarlos fuera de la consideración de hoy.

Tomar una decisión según cuál opción tenga más ítems de su lado puede parecer una solución fácil, pero realmente no es la más sabia. **La decisión debe alinearse con los objetivos estratégicos de la organización**, incluyendo el mercado destino, el tipo de usuario que se espera tener, los recursos disponibles para afrontar el desarrollo, y el tipo de llegada que la aplicación desea tener.

Como un buen ejemplo, muchas empresas grandes quieren entrar al mercado mobile, y deben hacer algo digno de su nombre, pero quieren tener presencia en todos los dispositivos. Al mismo tiempo, startups pequeñas quieren hacer una inversión pequeña para aproximarse al mercado. En estos casos la mejor opción será web, excepto que requieran capacidades especiales (como acceso a la red celular, o acceso USB, etcétera).

En los otros casos, o cuando el público destino es un conjunto de usuarios muy particular, las soluciones nativas pueden ser las más apropiadas. Por ejemplo, cuando el usuario serán oficiales de seguridad de una empresa, haciendo uso de la cámara o acelerómetro del teléfono, las organizaciones pueden decidir que tal o cuál marca de dispositivo con tal o cuál versión será la apropiada y reducir el desarrollo a un sólo lenguaje.
