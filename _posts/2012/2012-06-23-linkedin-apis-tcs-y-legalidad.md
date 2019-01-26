---
layout: post
title: LinkedIn APIs T&Cs y legalidad
date: '2012-06-23 18:20:28 +0000'
date_gmt: '2012-06-23 23:20:28 +0000'
categories:
- Miscelaneous
tags:
- desarrollo
- API
- legal
- LinkedIn
- términos y condiciones
- integración
sub_title: O "shenanigams para que nadie use nuestro sistema"
---

![]({{ site.baseurl }}/assets/illegalfry.jpg)

Por un desarrollo propio me encuentro investigando las APIs de integración a LinkedIn, específicamente para buscar información de gente, publicar ofertas de trabajo y obtener información de las mismas. Por supuesto, me interesan las APIs porque la aplicación que estoy desarrollando involucra más que solo esas partes, y por tanto, la información debe estar correlacionada. Suena razonable,  ¿verdad?

El departamento legal de LinkedIn parece opinar distinto.

El último punto de mi registro de clave API son los T&amp;Cs (Terms &amp; Conditions), que especifica claramente qué cosas se pueden y no se pueden hacer con la API. Veamos un poco de ellas. Los pueden acceder aquí: [LinkedIn API Terms of Use](http://developer.linkedin.com/documents/linkedin-apis-terms-use).

> LinkedIn reserves the right, from time to time, with or without notice to you, to change these Terms in our sole and absolute discretion. The most current version of these Terms can be reviewed on the LinkedIn developer portal at anytime and supersedes all previous versions. By using the LinkedIn APIs after changes are made to the Terms, you agree to be bound by such changes. Your only recourse if you disagree with the Terms, or changes to the Terms, is to discontinue your use of the APIs. Accordingly, we recommend you review these Terms periodically.

Este punto, en un primerísimo párrafo cinco (al 23 de Junio de 2012) ya es aberrante.  ¿Qué tan cómodos se sienten ustedes firmando cheques en blanco? Yo, sinceramente, nada. Esto es lo mismo: LinkedIn puede hacer uso de nuestra alma si les da la gana, y como nuestra aplicación sigue haciendo uso de las APIs, ellos son dueños de nuestro culo porque ese request HTTP significó "acepto cualquier cosa que digan los T&amp;Cs". Para hacerlo más interesante, no hay fase de aceptación, y pueden hacer cambios sin o sin notificación.

Como extra me causa gracia el "from time to time". Está tan mal puesto en la frase que puede entenderse como "podemos cambiarlo de tanto en tanto", o como "nos reservamos el derecho de tanto en tanto". Me pregunto si este texto tuvo revisiones.

> **1.3 APIs License Grant.** Subject to the terms and conditions in these Terms, we grant you a limited, non-exclusive, non-assignable or non-transferable license under LinkedIn's intellectual property rights during the Term to use the APIs to develop, test, and support your Application, and to distribute or allow access to your integration of the APIs within your Application to end users of your Application. You have no right to distribute or allow access to the stand-alone APIs.

En ningún momento se define legalmente quién es "you", es decir que se entiende a la persona que está firmando esto. Curiosamente, el formulario de registro habla de administradores de aplicaciones, desarrolladores y perfiles.  ¿Significa esto que you somos "nosotros"?  ¿O significa que por el hecho de sumar a una segunda persona ya estamos en falta? No importa realmente, si a LinkedIn le da por aclarar algo que a nosotros no nos convenga, ya firmamos nuestro cheque en blanco.

> **1.5 Restrictions.** In addition to other restrictions contained in these Terms, you agree not to do any of the following, unless expressly permitted by LinkedIn in these Terms or in writing by LinkedIn:
> 
> (...)
> 
> **f.** Require your users to obtain their own Access Code to use your Application.
> 
> **g.** Use your Developer Account or Access Codes to build and/or distribute enterprise applications outside your own company (e.g. use the APIs to build an Application that you distribute to other companies).

¡Good bye open source! No podemos distribuir una aplicación que tenga integración con LinkedIn porque estamos forzando a usuarios a generar un código de acceso a APIs. Sigamos el razonamiento: hacemos una aplicación redistribuíble que está integrada a LinkedIn, pero no podemos dar nuestros códigos por lo especificado en el punto **1.3**. Curiosamente, tampoco podemos pedir que alguien use su propio código porque violamos la sección **1.5.f-g**. Way to go, LinkedIn.

> **h.** Request or publish information impersonating a LinkedIn user, misrepresent any user or other third party in requesting or publishing information;

Definición muy vaga para ser legal: _misrepresenting_. Digamos que si a un usuario no le gustó la forma en que está escrita una frase,  ¿nos convierte a nosotros en violadores de los términos y condiciones de LinkedIn? Por supuesto que podemos tener una confirmación previa para que el usuario haga lo que le da la gana, pero si es así,  ¿qué valor agregado tenemos? Y si no tenemos valor agregado... ya les digo qué pasa.

> **m.** Store LinkedIn user data other than the Member Token or OAuth Token for any LinkedIn user, with the exception of a user's profile data when given explicit permission by the owner of the profile as set forth in 3.4, below. User profile data obtained in accordance with this section and 3.4 below may not be updated without the user's subsequent consent;

Sooo, no hay correlación de datos. Nuestra aplicación no puede guardar nada de nuestro usuario, y nada de terceros si se necesitara, incluso información que fue dada en entornos públicos. Supongo que podríamos escanear el sitio de LinkedIn sin hacer uso de la API,  ¿verdad? Sigamos leyendo...

> **n.** Use the APIs or Brand Features for any illegal, unauthorized or otherwise improper purposes,_** or in any manner that would violate these Terms**_ (or any document incorporated into the Terms), or breach any laws or regulations, or violate any rights of third parties, or expose LinkedIn or its members to legal liability in your use of the APIs;

(énfasis mío.) Los Términos y Condiciones de uso nos impiden violar los términos y condiciones de uso. ¡Muy inteligente, LinkedIn!

> **o.** Combine content from the APIs with other LinkedIn data obtained through scraping or any other means outside the official LinkedIn APIs. This includes acquiring LinkedIn data from third parties;

Nope, no se puede usar el sitio. Tampoco se pueden combinar datos de las APIs con el resto de los datos. Estamos limitados a usar la API, pero no podemos almacenar lo que la API nos devuelve. Bueno, el requerimiento anterior decía "lo mínimo posible para que la aplicación funcione", quizá yo estoy exagerando.

> **u.** Use the Content for generating advertising, messages, promotions, offers, or for any other purpose other than, and solely to the extent necessary for, allowing end users to use the returned Content in your Application;

Oops, qué lástima que no se pueda publicar contenido. Una lástima porque ya no sé qué vamos a hacer con las APIs de publicación de estados, de publicación de trabajo o de compartir contenido. Una lástima.

> **x.** Use the APIs in an Application that competes with products or services offered by us;

Estoy sospechando a este punto que no podemos entonces desarrollar aplicaciones que hagan algo distinto de lo que hace LinkedIn (ver más adelante sobre las restricciones de uso de los datos), pero si hace lo mismo entonces tampoco está permitido, porque estamos compitiendo.  ¿Qué opción nos deja LinkedIn? Ninguna, sea como sea que utilicemos esta API, estamos ligados a violar los términos de uso (que también está prohibido por los términos de uso).

> **z.** Use any robot, spider, site search/retrieval Application, or other device to retrieve or index any portion of LinkedIn services or collect information about users for any unauthorized purpose;

Como decíamos, confirmando que no se puede obtener información del sitio.

> **1.6 Support and Modifications.** We may provide you with support or modifications for the APIs in our sole discretion. We may terminate the provision of such support or modifications to you at any time without notice or liability to you. We may release subsequent versions of the APIs and require that you use such subsequent versions. Your continued use of the APIs following a subsequent release will be deemed your acceptance of modifications.

Traducción: "no garantizamos que funcionen en el futuro, nos importa poco lo que ustedes hayan hecho".

> **1.7 Fees.** The APIs are currently provided for free, but LinkedIn reserves the right to charge for the APIs in the future. If we do charge a fee for use of the APIs or any developer tools and features, you do not have any obligation to continue to use the LinkedIn's developer resources.

Traducción: "no garantizamos que vayan a ser gratis".

> **1.9 Usage Limitations.** LinkedIn may limit the number of network calls that your Application may make via the APIs, and/or the maximum Content that may be accessed, or anything else about the APIs and the Content it accesses as LinkedIn deems appropriate in its sole discretion. The usage limitations can be found in the LinkedIn developer portal at [http://developer.linkedin.com/](http://developer.linkedin.com/). LinkedIn may change such usage limits at any time. In addition to its other rights under these Terms, LinkedIn may utilize technical measures to prevent over-usage and/or stop usage of the APIs by an Application after any usage limitations are exceeded. If no limits are stated in the Platform Guidelines, you nevertheless agree to use the APIs in a manner that, as determined by us in our sole discretion, exceeds reasonable request volume or constitutes excessive or abusive usage.

Esto tiene dos partes. La primera, como ya habrán leído, aclara que ellos van a hacer lo que mejor les parezca con los límites de uso. La segunda, que me parece ridículamente absurda en un contrato legal: "estás de acuerdo en usar las APIs de una forma que nosotros queramos, pero no te diremos cómo". Es realmente irrisorio que consideren esto parte de algo expuesto públicamente.

> **2 Proprietary Rights**
> 
> **2.1 LinkedIn Property.** As between you and us, we own all rights, title, and interest, including without limitation all intellectual property rights, in and to, the (i) APIs, and all elements, components, and executables of the APIs; (ii) the Content available from the APIs; (iii) our Website; and (iv) our Brand Features (collectively, the "LinkedIn Materials"). Except for the express licenses granted in these Terms, LinkedIn does not grant you any right, title or interest in the LinkedIn Materials. You agree to take such actions, including, without limitation, execution of affidavits or other documents, as LinkedIn may reasonably request to effect, perfect or confirm LinkedIn's rights to the LinkedIn Materials.

¿Significa esto que toda la información que recuperemos a través de las APIs son propiedad de LinkedIn? Sí. Incluyendo información de tu usuario, mí usuario, y la información que públicamente se encuentra disponible allí. Cabe aclarar que esta es una directa contradicción del [acuerdo de usuario](http://www.linkedin.com/static?key=user_agreement), en donde dice:

> 2. License and warranty for your submissions to LinkedIn.
> 
> ***You own the information*** you provide LinkedIn under this Agreement, and may request its deletion at any time, unless you have shared information or content with others and they have not deleted it, or it was copied or stored by other users. Additionally, you grant LinkedIn a nonexclusive, irrevocable, worldwide, perpetual, unlimited, assignable, **sublicenseable**, fully paid up and royalty-free right to us to copy, prepare derivative works of, improve, distribute, publish, remove, retain, add, process, analyze, use and commercialize, in any way now known or in the future discovered, any information you provide, directly or indirectly to LinkedIn, including, but not limited to, any user generated content, ideas, concepts, techniques or data to the services, you submit to LinkedIn, without any further consent, notice and/or compensation to you or to any third parties. Any information you submit to us is at your own risk of loss as noted in Sections 2 and 3 of this Agreement.

(énfasis mío.) Cabe aclarar que cambiar el copyright por completo está fuera de estos términos. En fin, continuemos con el documento original:

> **3.4 Data Storage and Conversion Limits.**
> 
> **3.4.1 Prohibition on Copying and Storage.** You may not copy, store or cache any Content returned or received through the APIs, including data about users, longer than the current usage session of the user for which it was obtained, except for the alphanumeric user IDs (Member Tokens) which we provide you for identifying users or any individual member's authentication token (OAuth Token) which we provide you when a LinkedIn user authenticates your Application to his LinkedIn account.
> 
> (...)
> 
> **3.4.3 Exception to Storage and Conversion Limits with User Consent.** The restrictions of this section do not apply to user profile data received through a one-time call through the APIs that a user explicitly permits you to collect and store, provided that you obtain the user's consent through the technical and user-interface specifications provided by LinkedIn, and that any subsequent update to the profile data only be done with the user's explicit consent. **PLEASE NOTE:** a) User profile data does **not** include information about a user's connections, which may not be copied or stored; and b) you may only use stored profile data for the benefit of the LinkedIn user that granted you permission to access it.

Fuck! Nada, de NADA podemos hacer con las APIs. Nuestra aplicación debería ser explícitamente entonces una interfaz para usar LinkedIn. Pero, si analizamos, por los puntos de competencia, no podemos ofrecer servicios similares, y si no podemos correlacionar datos, entonces  ¿qué podemos hacer? Mostrar una interfaz distinta para hacer lo mismo que hace LinkedIn, pero entonces seríamos competidores y eso tampoco está permitido.

---

Haber leído estos términos y condiciones me decepciona mucho. Tenía la esperanza de usar estas APIs para algo interesante y realmente parecen estar bien construidas, de forma que son simples de usar y tienen muchas opciones interesantes. Desafortunadamente, me encuentro en un hueco legal que no puedo evitar. Invito a abogados o a especialistas en el tema corregir cualquier error que yo haya podido cometer, pero mi interpretación de esta licencia es que, haga lo que haga, voy a caer en una violación de la misma.

Me pregunto siquiera como empresas serias pueden considerar tener este tipo de acuerdos legales expuestos de forma pública. El concepto de protegerse de absolutamente todo y no dar ningún tipo de garantía debería espantarnos terriblemente a todos y negarnos a usar estas cosas hasta que el acuerdo sea razonable. Por supuesto, esto se torna monopólico porque todos lo hacen y entonces les damos nuestra alma con tal de estar a la par con otras organizaciones que tienen integraciones con X cantidad de servicios.

"¡Pero no pasa nada!", seguro algunos pensarán. A ellos les pregunto: si se olvidan la tarjeta de crédito en un club en donde todos son muy buena onda y "nunca pasa nada",  ¿la reportan como robada? Si la respuesta fue sí, entonces ya tienen su respuesta.

Lo lamento LinkedIn, pero tu departamento legal me mantuvo alejado. Desmientan lo que digo, realmente quiero que me hagan ver que estoy equivocado.

_Soy un zorrinito decepcionado._
