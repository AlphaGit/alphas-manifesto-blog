---
layout: post
status: publish
published: true
title: 'Link del día: NoSQL'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 1916
wordpress_url: http://blog.alphasmanifesto.com.ar/?p=1916
date: '2010-03-02 11:38:44 +0000'
date_gmt: '2010-03-02 13:38:44 +0000'
categories:
- Link del día
- Technology
tags:
- proyecto
- Google
- Twitter
- Facebook
- cloud computing
- MySQL
- SQL
- databases
---

Gracias a DG quien me compartió [este artículo](http://bitelia.com/2010/03/twitter-cambia-paradigma-mysql-nosql) en Google Reader, me enteré que Twitter va a estar migrando sus servidores de datos desde un modelo relacional (que en este caso se trata de MySQL) a un modelo no relacional, en este caso, un family-value non-relational database management system (digan eso cinco veces, bien rápido).

Básicamente de lo que se trata es que ya los datos no se encuentran "atados" por relaciones, o disgregados según los datos relacionados que poseen (lo cual se conoce como leyes de la normalización). Dejemos de _ser relacionales_ por un momento y pensemos las grandes ventajas que esto nos puede traer. Más allá de lo raro que se nos puede hacer, la escalabilidad que esto permite es impresionante.

Para que tengan una idea, este sistema en particular, llamado [Cassandra](http://wiki.apache.org/cassandra/), comenzó a desarrollarlo Facebook, lo compró Google y lo hizo Open Source. Está pensando especialmente para sistemas con muchísima información y para escalar y replicarse fácilmente, agregando, quitando, o moviendo nodos que formen parte de todo el sistema de almacenamiento.

Muchos de los sistemas bajo esta denominación de NoSQL cumplen con estas premisas, los invito a visitar el [artículo de Wikipedia sobre NoSQL](http://en.wikipedia.org/wiki/NoSQL) y ver lo que se dice de varios de estos.

_Soy un zorrinito no-relacional._
