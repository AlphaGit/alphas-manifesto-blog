---

title: 'Link del día: WPA Cracker'
date: '2009-12-18 14:24:22 +0000'
date_gmt: '2009-12-18 16:24:22 +0000'
categories:
- Link del día
- Technology
tags:
- descentralización
- ilegal
- performance
- web application
- WPA
- cracking
- wifi
- cloud computing
- rainbow tables
- hacking

---

Si mal no recuerdo creo que fue Nano quién me compartió por Google Reader [este artículo de Kabytes](http://www.kabytes.com/aplicaciones-online/crackear-contrasenas-wifi-con-cifrado-wpa/), en donde hablan de una aplicación web llamada [WPA Cracker](http://www.wpacracker.com/), una aplicación que tomando un archivo pcap de capturas de un wifi WPA, puede compararlo contra una enorme cantidad de palabras y combinaciones (gracias al cloud computing) y devolvernos el password en un pequeño tiempo.

El uso de esta aplicación es paga, no realmente mucho si es que tiene algún beneficio para nosotros la utilización de esa red, pero independientemente de eso, es una buena aproximación a la obtención de claves: no tiene por qué hacer todo el trabajo una sola máquina durante semanas, cuando varias máquinas alrededor del mundo pueden hacerlo en cuestión de horas o minutos.

Fuera de eso, la aplicación es interesante, también permite el crackeo por diccionario de archivos ZIP (sólo porque el público lo pidió), nuevamente también contra un diccionario enorme de palabras en inglés y en alemán.

Según cuenta el autor, es un esfuerzo mucho más grande pero mejor para resultar de esta forma porque utilizar rainbow tables (como las que tienen para bajar en [Curch of Wifi](http://www.churchofwifi.org/)) es un poco ineficiente, dado que para eso se necesita crear una serie de rainbow tables para cada ESSID de la red, con lo cual se vuelve impracticable la idea original del rainbow table: tener una solución pre-armada, por pesada que fuera.

El precio que se le pone al servicio es de 17 dólares si es que queremos utilizar el diccionario básico (136 millones de palabras) en modo half-cluster (es decir, la mitad de las máquinas disponibles trabajan), o 35 si queremos utilizar el clúster completo. Además, también se puede hacer una corrida contra un diccionario extendido (que no contiene al diccionario básico) con 284 millones de palabras. Realmente bastante como para que se haga en unos 20 minutos, verdad?

Cabe decir por último que este es otro de los trabajos de [Moxie Marlinspike](http://www.thoughtcrime.org/), un hacker que siempre interesado en la seguridad (y en la navegación [marina, no por internet], pero eso es otra cosa). Puede verse mucho más al respecto en su website, más personal que website, y más elegante que completo.

_Soy un zorrinito cracker._
