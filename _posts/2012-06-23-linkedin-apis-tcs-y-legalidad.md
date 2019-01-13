---
layout: post
status: publish
published: true
title: LinkedIn APIs T&Cs y legalidad
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 4007
wordpress_url: http://blog.alphasmanifesto.com/?p=4007
date: '2012-06-23 18:20:28 +0000'
date_gmt: '2012-06-23 23:20:28 +0000'
categories:
- Miscelaneous
tags:
- desarrollo
- API
- legal
- LinkedIn
- t&eacute;rminos y condiciones
- integraci&oacute;n
comments: []
---

![](/assets/illegalfry.jpg)

<p style="text-align: justify;">Por un desarrollo propio me encuentro investigando las APIs de integraci&oacute;n a LinkedIn, espec&iacute;ficamente para buscar informaci&oacute;n de gente, publicar ofertas de trabajo y obtener informaci&oacute;n de las mismas. Por supuesto, me interesan las APIs porque la aplicaci&oacute;n que estoy desarrollando involucra m&aacute;s que solo esas partes, y por tanto, la informaci&oacute;n debe estar correlacionada. Suena razonable, &iquest;verdad?</p>
<p style="text-align: justify;">El departamento legal de LinkedIn parece opinar distinto.</p>
<p style="text-align: justify;">El &uacute;ltimo punto de mi registro de clave API son los T&amp;Cs (Terms &amp; Conditions), que especifica claramente qu&eacute; cosas se pueden y no se pueden hacer con la API. Veamos un poco de ellas. Los pueden acceder aqu&iacute;: <a href="http://developer.linkedin.com/documents/linkedin-apis-terms-use">LinkedIn API Terms of Use</a>.</p>
<blockquote>
<p style="text-align: justify;">LinkedIn reserves the right, from time to time, with or without notice to you, to change these Terms in our sole and absolute discretion. The most current version of these Terms can be reviewed on the LinkedIn developer portal at anytime and supersedes all previous versions. By using the LinkedIn APIs after changes are made to the Terms, you agree to be bound by such changes. Your only recourse if you disagree with the Terms, or changes to the Terms, is to discontinue your use of the APIs. Accordingly, we recommend you review these Terms periodically.</p>
</blockquote>
<p style="text-align: justify;">Este punto, en un primer&iacute;simo p&aacute;rrafo cinco (al 23 de Junio de 2012) ya es aberrante. &iquest;Qu&eacute; tan c&oacute;modos se sienten ustedes firmando cheques en blanco? Yo, sinceramente, nada. Esto es lo mismo: LinkedIn puede hacer uso de nuestra alma si les da la gana, y como nuestra aplicaci&oacute;n sigue haciendo uso de las APIs, ellos son due&ntilde;os de nuestro culo porque ese request HTTP signific&oacute; "acepto cualquier cosa que digan los T&amp;Cs". Para hacerlo m&aacute;s interesante, no hay fase de aceptaci&oacute;n, y pueden hacer cambios sin o sin notificaci&oacute;n.</p>
<p style="text-align: justify;">Como extra me causa gracia el "from time to time". Est&aacute; tan mal puesto en la frase que puede entenderse como "podemos cambiarlo de tanto en tanto", o como "nos reservamos el derecho de tanto en tanto". Me pregunto si este texto tuvo revisiones.</p>
<blockquote>
<p style="text-align: justify;"><strong>1.3 APIs License Grant.&nbsp;</strong>Subject to the terms and conditions in these Terms, we grant you a limited, non-exclusive, non-assignable or non-transferable license under LinkedIn's intellectual property rights during the Term to use the APIs to develop, test, and support your Application, and to distribute or allow access to your integration of the APIs within your Application to end users of your Application. You have no right to distribute or allow access to the stand-alone APIs.</p>
</blockquote>
<p style="text-align: justify;">En ning&uacute;n momento se define legalmente qui&eacute;n es "you", es decir que se entiende a la persona que est&aacute; firmando esto. Curiosamente, el formulario de registro habla de administradores de aplicaciones, desarrolladores y perfiles. &iquest;Significa esto que you somos "nosotros"? &iquest;O significa que por el hecho de sumar a una segunda persona ya estamos en falta? No importa realmente, si a LinkedIn le da por aclarar algo que a nosotros no nos convenga, ya firmamos nuestro cheque en blanco.</p>
<blockquote>
<p style="text-align: justify;"><strong>1.5 Restrictions.&nbsp;</strong>In addition to other restrictions contained in these Terms, you agree not to do any of the following, unless expressly permitted by LinkedIn in these Terms or in writing by LinkedIn:</p>
<p>(...)</p>
<p style="text-align: justify;"><strong>f.</strong>&nbsp;Require your users to obtain their own Access Code to use your Application.</p>
<p style="text-align: justify;"><strong>g.</strong>&nbsp;Use your Developer Account or Access Codes to build and/or distribute enterprise applications outside your own company (e.g. use the APIs to build an Application that you distribute to other companies).</p>
</blockquote>
<p style="text-align: justify;">&iexcl;Good bye open source! No podemos distribuir una aplicaci&oacute;n que tenga integraci&oacute;n con LinkedIn porque estamos forzando a usuarios a generar un c&oacute;digo de acceso a APIs. Sigamos el razonamiento: hacemos una aplicaci&oacute;n redistribu&iacute;ble que est&aacute; integrada a LinkedIn, pero no podemos dar nuestros c&oacute;digos por lo especificado en el punto <strong>1.3</strong>. Curiosamente, tampoco podemos pedir que alguien use su propio c&oacute;digo porque violamos la secci&oacute;n <strong>1.5.f-g</strong>. Way to go, LinkedIn.</p>
<blockquote>
<p style="text-align: justify;"><strong>h.&nbsp;</strong>Request or publish information impersonating a LinkedIn user, misrepresent any user or other third party in requesting or publishing information;</p>
</blockquote>
<p style="text-align: justify;">Definici&oacute;n muy vaga para ser legal: <em>misrepresenting</em>. Digamos que si a un usuario no le gust&oacute; la forma en que est&aacute; escrita una frase, &iquest;nos convierte a nosotros en violadores de los t&eacute;rminos y condiciones de LinkedIn? Por supuesto que podemos tener una confirmaci&oacute;n previa para que el usuario haga lo que le da la gana, pero si es as&iacute;, &iquest;qu&eacute; valor agregado tenemos? Y si no tenemos valor agregado... ya les digo qu&eacute; pasa.</p>
<blockquote>
<p style="text-align: justify;"><strong>m.&nbsp;</strong>Store LinkedIn user data other than the Member Token or OAuth Token for any LinkedIn user, with the exception of a user's profile data when given explicit permission by the owner of the profile as set forth in 3.4, below. User profile data obtained in accordance with this section and 3.4 below may not be updated without the user's subsequent consent;</p>
</blockquote>
<p style="text-align: justify;">Sooo, no hay correlaci&oacute;n de datos. Nuestra aplicaci&oacute;n no puede guardar nada de nuestro usuario, y nada de terceros si se necesitara, incluso informaci&oacute;n que fue dada en entornos p&uacute;blicos. Supongo que podr&iacute;amos escanear el sitio de LinkedIn sin hacer uso de la API, &iquest;verdad? Sigamos leyendo...</p>
<blockquote>
<p style="text-align: justify;"><strong>n.&nbsp;</strong>Use the APIs or Brand Features for any illegal, unauthorized or otherwise improper purposes,<em><strong> or in any manner that would violate these Terms</strong></em> (or any document incorporated into the Terms), or breach any laws or regulations, or violate any rights of third parties, or expose LinkedIn or its members to legal liability in your use of the APIs;</p>
</blockquote>
<p style="text-align: justify;">(&Eacute;nfasis m&iacute;o.) Los T&eacute;rminos y Condiciones de uso nos impiden violar los t&eacute;rminos y condiciones de uso. &iexcl;Muy inteligente, LinkedIn!</p>
<blockquote>
<p style="text-align: justify;"><strong>o.&nbsp;</strong>Combine content from the APIs with other LinkedIn data obtained through scraping or any other means outside the official LinkedIn APIs. This includes acquiring LinkedIn data from third parties;</p>
</blockquote>
<p style="text-align: justify;">Nope, no se puede usar el sitio. Tampoco se pueden combinar datos de las APIs con el resto de los datos. Estamos limitados a usar la API, pero no podemos almacenar lo que la API nos devuelve. Bueno, el requerimiento anterior dec&iacute;a "lo m&iacute;nimo posible para que la aplicaci&oacute;n funcione", quiz&aacute; yo estoy exagerando.</p>
<blockquote>
<p style="text-align: justify;"><strong>u.&nbsp;</strong>Use the Content for generating advertising, messages, promotions, offers, or for any other purpose other than, and solely to the extent necessary for, allowing end users to use the returned Content in your Application;</p>
</blockquote>
<p style="text-align: justify;">Oops, qu&eacute; l&aacute;stima que no se pueda publicar contenido. Una l&aacute;stima porque ya no s&eacute; qu&eacute; vamos a hacer con las APIs de publicaci&oacute;n de estados, de publicaci&oacute;n de trabajo o de compartir contenido. Una l&aacute;stima.</p>
<blockquote>
<p style="text-align: justify;"><strong>x.&nbsp;</strong>Use the APIs in an Application that competes with products or services offered by us;</p>
</blockquote>
<p style="text-align: justify;">Estoy sospechando a este punto que no podemos entonces desarrollar aplicaciones que hagan algo distinto de lo que hace LinkedIn (ver m&aacute;s adelante sobre las restricciones de uso de los datos), pero si hace lo mismo entonces tampoco est&aacute; permitido, porque estamos compitiendo. &iquest;Qu&eacute; opci&oacute;n nos deja LinkedIn? Ninguna, sea como sea que utilicemos esta API, estamos ligados a violar los t&eacute;rminos de uso (que tambi&eacute;n est&aacute; prohibido por los t&eacute;rminos de uso).</p>
<blockquote>
<p style="text-align: justify;"><strong>z.&nbsp;</strong>Use any robot, spider, site search/retrieval Application, or other device to retrieve or index any portion of LinkedIn services or collect information about users for any unauthorized purpose;</p>
</blockquote>
<p style="text-align: justify;">Como dec&iacute;amos, confirmando que no se puede obtener informaci&oacute;n del sitio.</p>
<blockquote>
<p style="text-align: justify;"><strong>1.6 Support and Modifications.&nbsp;</strong>We may provide you with support or modifications for the APIs in our sole discretion. We may terminate the provision of such support or modifications to you at any time without notice or liability to you. We may release subsequent versions of the APIs and require that you use such subsequent versions. Your continued use of the APIs following a subsequent release will be deemed your acceptance of modifications.</p>
</blockquote>
<p style="text-align: justify;">Traducci&oacute;n: "no garantizamos que funcionen en el futuro, nos importa poco lo que ustedes hayan hecho".</p>
<blockquote>
<p style="text-align: justify;"><strong>1.7 Fees.&nbsp;</strong>The APIs are currently provided for free, but LinkedIn reserves the right to charge for the APIs in the future. If we do charge a fee for use of the APIs or any developer tools and features, you do not have any obligation to continue to use the LinkedIn's developer resources.</p>
</blockquote>
<p style="text-align: justify;">Traducci&oacute;n: "no garantizamos que vayan a ser gratis".</p>
<blockquote>
<p style="text-align: justify;"><strong>1.9 Usage Limitations.&nbsp;</strong>LinkedIn may limit the number of network calls that your Application may make via the APIs, and/or the maximum Content that may be accessed, or anything else about the APIs and the Content it accesses as LinkedIn deems appropriate in its sole discretion. The usage limitations can be found in the LinkedIn developer portal at&nbsp;<a href="http://developer.linkedin.com/">http://developer.linkedin.com/</a>. LinkedIn may change such usage limits at any time. In addition to its other rights under these Terms, LinkedIn may utilize technical measures to prevent over-usage and/or stop usage of the APIs by an Application after any usage limitations are exceeded. If no limits are stated in the Platform Guidelines, you nevertheless agree to use the APIs in a manner that, as determined by us in our sole discretion, exceeds reasonable request volume or constitutes excessive or abusive usage.</p>
</blockquote>
<p style="text-align: justify;">Esto tiene dos partes. La primera, como ya habr&aacute;n le&iacute;do, aclara que ellos van a hacer lo que mejor les parezca con los l&iacute;mites de uso. La segunda, que me parece rid&iacute;culamente absurda en un contrato legal: "est&aacute;s de acuerdo en usar las APIs de una forma que nosotros queramos, pero no te diremos c&oacute;mo". Es realmente irrisorio que consideren esto parte de algo expuesto p&uacute;blicamente.</p>
<blockquote><p><strong>2 Proprietary Rights</strong></p>
<p style="text-align: justify;"><strong>2.1 LinkedIn Property.&nbsp;</strong>As between you and us, we own all rights, title, and interest, including without limitation all intellectual property rights, in and to, the (i) APIs, and all elements, components, and executables of the APIs; (ii) the Content available from the APIs; (iii) our Website; and (iv) our Brand Features (collectively, the "LinkedIn Materials"). Except for the express licenses granted in these Terms, LinkedIn does not grant you any right, title or interest in the LinkedIn Materials. You agree to take such actions, including, without limitation, execution of affidavits or other documents, as LinkedIn may reasonably request to effect, perfect or confirm LinkedIn's rights to the LinkedIn Materials.</p>
</blockquote>
<p style="text-align: justify;">&iquest;Significa esto que toda la informaci&oacute;n que recuperemos a trav&eacute;s de las APIs son propiedad de LinkedIn? S&iacute;. Incluyendo informaci&oacute;n de tu usuario, m&iacute; usuario, y la informaci&oacute;n que p&uacute;blicamente se encuentra disponible all&iacute;. Cabe aclarar que esta es una directa contradicci&oacute;n del <a href="http://www.linkedin.com/static?key=user_agreement">acuerdo de usuario</a>, en donde dice:</p>
<blockquote><p>2. License and warranty for your submissions to LinkedIn.</p>
<p style="text-align: justify;"><strong><em>You own the information</em></strong> you provide LinkedIn under this Agreement, and may request its deletion at any time, unless you have shared information or content with others and they have not deleted it, or it was copied or stored by other users. Additionally, you grant LinkedIn a nonexclusive, irrevocable, worldwide, perpetual, unlimited, assignable, <strong>sublicenseable</strong>, fully paid up and royalty-free right to us to copy, prepare derivative works of, improve, distribute, publish, remove, retain, add, process, analyze, use and commercialize, in any way now known or in the future discovered, any information you provide, directly or indirectly to LinkedIn, including, but not limited to, any user generated content, ideas, concepts, techniques or data to the services, you submit to LinkedIn, without any further consent, notice and/or compensation to you or to any third parties. Any information you submit to us is at your own risk of loss as noted in Sections 2 and 3 of this Agreement.</p>
</blockquote>
<p style="text-align: justify;">(&Eacute;nfasis m&iacute;o.) Cabe aclarar que cambiar el copyright por completo est&aacute; fuera de estos t&eacute;rminos. En fin, continuemos con el documento original:</p>
<blockquote><p><strong>3.4 Data Storage and Conversion Limits.</strong></p>
<p style="text-align: justify;"><strong>3.4.1 Prohibition on Copying and Storage.</strong>&nbsp;You may not copy, store or cache any Content returned or received through the APIs, including data about users, longer than the current usage session of the user for which it was obtained, except for the alphanumeric user IDs (Member Tokens) which we provide you for identifying users or any individual member's authentication token (OAuth Token) which we provide you&nbsp;when a LinkedIn user authenticates your Application to his LinkedIn account.</p>
<p>(...)</p>
<p style="text-align: justify;"><strong>3.4.3 Exception to Storage and Conversion Limits with User Consent.&nbsp;</strong>The restrictions of this section do not apply to user profile data received through a one-time call through the APIs that a user explicitly permits you to collect and store, provided that you obtain the user's consent through the technical and user-interface specifications provided by LinkedIn, and that any subsequent update to the profile data only be done with the user's explicit consent.&nbsp;<strong>PLEASE NOTE:</strong>&nbsp;a) User profile data does&nbsp;<strong>not</strong>&nbsp;include information about a user's connections, which may not be copied or stored; and b) you may only use stored profile data for the benefit of the LinkedIn user that granted you permission to access it.</p>
</blockquote>
<p style="text-align: justify;">Fuck! Nada, de NADA podemos hacer con las APIs. Nuestra aplicaci&oacute;n deber&iacute;a ser expl&iacute;citamente entonces una interfaz para usar LinkedIn. Pero, si analizamos, por los puntos de competencia, no podemos ofrecer servicios similares, y si no podemos correlacionar datos, entonces &iquest;qu&eacute; podemos hacer? Mostrar una interfaz distinta para hacer lo mismo que hace LinkedIn, pero entonces ser&iacute;amos competidores y eso tampoco est&aacute; permitido.</p>
<hr style="width: 75%;" width="75%" />
<p style="text-align: justify;">Haber le&iacute;do estos t&eacute;rminos y condiciones me decepciona mucho. Ten&iacute;a la esperanza de usar estas APIs para algo interesante y realmente parecen estar bien construidas, de forma que son simples de usar y tienen muchas opciones interesantes. Desafortunadamente, me encuentro en un hueco legal que no puedo evitar. Invito a abogados o a especialistas en el tema corregir cualquier error que yo haya podido cometer, pero mi interpretaci&oacute;n de esta licencia es que, haga lo que haga, voy a caer en una violaci&oacute;n de la misma.</p>
<p style="text-align: justify;">Me pregunto siquiera como empresas serias pueden considerar tener este tipo de acuerdos legales expuestos de forma p&uacute;blica. El concepto de protegerse de absolutamente todo y no dar ning&uacute;n tipo de garant&iacute;a deber&iacute;a espantarnos terriblemente a todos y negarnos a usar estas cosas hasta que el acuerdo sea razonable. Por supuesto, esto se torna monop&oacute;lico porque todos lo hacen y entonces les damos nuestra alma con tal de estar a la par con otras organizaciones que tienen integraciones con X cantidad de servicios.</p>
<p style="text-align: justify;">"&iexcl;Pero no pasa nada!", seguro algunos pensar&aacute;n. A ellos les pregunto: si se olvidan la tarjeta de cr&eacute;dito en un club en donde todos son muy buena onda y "nunca pasa nada", &iquest;la reportan como robada? Si la respuesta fue s&iacute;, entonces ya tienen su respuesta.</p>
<p style="text-align: justify;">Lo lamento LinkedIn, pero tu departamento legal me mantuvo alejado. Desmientan lo que digo, realmente quiero que me hagan ver que estoy equivocado.</p>
<p style="text-align: justify;"><em>Soy un zorrinito decepcionado.</em></p>
