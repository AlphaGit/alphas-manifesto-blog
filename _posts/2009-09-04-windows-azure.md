---
layout: post
status: publish
published: true
title: Windows Azure
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 1469
wordpress_url: http://blog.alphasmanifesto.com.ar/?p=1469
date: '2009-09-04 22:01:57 +0000'
date_gmt: '2009-09-05 00:01:57 +0000'
categories:
- Technology
tags: []
comments: []
---

Varios de mis últimos proyectos han tenido que ver con <a href="http://www.microsoft.com/azure/windowsazure.mspx">Windows Azure</a>, la versión Microsoft de cloud computing. Azure se divide en algunas secciones básicas, que al comienzo pueden ser difíciles de entender pero luego se hacen bastante naturales.

Por un lado tenemos los servicios de almacenamiento de datos en Azure, storage services, que pueden dividirse en blobs (datos de tipo blog, divididos en blobs y blogs containers), queues (colas, un tipo de dato cualquiera que se encole en forma FIFO para su consumo por otro lado) y tables. El caso de table suele ser el más útil para el programador común, ya que permite mantener todo el esquema de datos para una aplicación completa en él. Desgraciadamente, el nombre de "table" (tabla) es algo confuso, ya que no existen tales cosas como tablas o menos aún, entidades relacionales. En realidad se trata de un conjunto de elementos estilo _property bags_, en donde cada entidad se identifica por algún campo que designemos como RowKey y se pueden ordenar (indizar) según algún campo o combinación de campos que indiquemos como PartitionKey. Hay que estar atentos al momento de diseñar la estructura de nuestra aplicación y tener en cuenta esto, ya que de otra forma podría caerse en fallas de performance por tener necesidad de tratamiento relacional entre datos.

Otro de los servicios ofrecidos en la plataforma de Azure son los servicios .NET. Los servicios .NET de Azure pueden comportarse equivalente a una aplicación. En este caso, es el tiempo de ejecución por lo que pagaremos, cuando antes, en el caso del storage, lo que pagábamos era por el almacenamiento y la transferencia de los datos. Los servicios .NET de Azure pueden funcionar como aplicaciones web con interfaces interactivas con usuarios (web roles), como también podrían funcionar como servicios en constante ejecución en background (worker role). También, por supuesto, podemos implementar web services.

Finalmente, el tercero de los pilares para Windows Azure es Live Services, que es una integración con los servicios de Live que Microsoft ha estado desarrollando (y continúa desarrollando) a lo largo de estos años. No he indagado prácticamente nada respecto de este tipo de servicios, pero parece ciertamente prometedor, siempre que uno pueda integrar su unidad de negocios a través de las redes de Live.

_Soy un zorrinito celeste._
