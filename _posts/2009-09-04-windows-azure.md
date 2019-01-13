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
<p style="text-align: justify;">Varios de mis &uacute;ltimos proyectos han tenido que ver con&nbsp;<a href="http://www.microsoft.com/azure/windowsazure.mspx">Windows Azure</a>, la versi&oacute;n Microsoft de cloud computing. Azure se divide en algunas secciones b&aacute;sicas, que al comienzo pueden ser dif&iacute;ciles de entender pero luego se hacen bastante naturales.</p>
<p style="text-align: justify;">Por un lado tenemos los servicios de almacenamiento de datos en Azure, storage services, que pueden dividirse en blobs (datos de tipo blog, divididos en blobs y blogs containers), queues (colas, un tipo de dato cualquiera que se encole en forma FIFO para su consumo por otro lado) y tables. El caso de table suele ser el m&aacute;s &uacute;til para el programador com&uacute;n, ya que permite mantener todo el esquema de datos para una aplicaci&oacute;n completa en &eacute;l. Desgraciadamente, el nombre de "table" (tabla) es algo confuso, ya que no existen tales cosas como tablas o menos a&uacute;n, entidades relacionales. En realidad se trata de un conjunto de elementos estilo&nbsp;<em>property bags</em>, en donde cada entidad se identifica por alg&uacute;n campo que designemos como RowKey y se pueden ordenar (indizar) seg&uacute;n alg&uacute;n campo o combinaci&oacute;n de campos que indiquemos como PartitionKey. Hay que estar atentos al momento de dise&ntilde;ar la estructura de nuestra aplicaci&oacute;n y tener en cuenta esto, ya que de otra forma podr&iacute;a caerse en fallas de performance por tener necesidad de tratamiento relacional entre datos.</p>
<p style="text-align: justify;">Otro de los servicios ofrecidos en la plataforma de Azure son los servicios .NET. Los servicios .NET de Azure pueden comportarse equivalente a una aplicaci&oacute;n. En este caso, es el tiempo de ejecuci&oacute;n por lo que pagaremos, cuando antes, en el caso del storage, lo que pag&aacute;bamos era por el almacenamiento y la transferencia de los datos. Los servicios .NET de Azure pueden funcionar como aplicaciones web con interfaces interactivas con usuarios (web roles), como tambi&eacute;n podr&iacute;an funcionar como servicios en constante ejecuci&oacute;n en background (worker role). Tambi&eacute;n, por supuesto, podemos implementar web services.</p>
<p style="text-align: justify;">Finalmente, el tercero de los pilares para Windows Azure es Live Services, que es una integraci&oacute;n con los servicios de Live que Microsoft ha estado desarrollando (y contin&uacute;a desarrollando) a lo largo de estos a&ntilde;os. No he indagado pr&aacute;cticamente nada respecto de este tipo de servicios, pero parece ciertamente prometedor, siempre que uno pueda integrar su unidad de negocios a trav&eacute;s de las redes de Live.</p>
<p style="text-align: justify;"><em>Soy un zorrinito celeste.</em></p>
