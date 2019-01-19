---
layout: post
status: publish
published: true
title: 'Link of the Day: Cassandra by example'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 2116
wordpress_url: http://blog.alphasmanifesto.com.ar/?p=2116
date: '2010-05-14 11:26:23 +0000'
date_gmt: '2010-05-14 13:26:23 +0000'
categories:
- Link del día
tags:
- Twitter
- databases
- educación
- NoSQL
---

In a past link of the day, I have already talked about some distributed [NoSQL systems](({{ site.baseUrl }}{% link _posts/2010-03-02-link-del-dia-nosql.md %})), and the benefits it could bring. I think now it's time to dive a little deeper in one of them, probably one of the most popular of these days, which is [Cassandra](http://cassandra.apache.org/).

But instead of going through a long, technical book, lets take this article from Eric Evans called [Cassandra By Example](http://www.rackspacecloud.com/blog/2010/05/12/cassandra-by-example/), where he gets off all of the theorization and technicisms about these systems, and instead, provides us with a nice example to start from scratch: Twitter. He first explains how would the relational approach should be, and then how the NoSQL approach would be, using Cassandra.

Not only that, we will see some code implementing Twitter features, which is not functional but totally understandable as an example. Then we'll be able to grasp concepts like keyspaces, column families, reversed columns and so on.

Also, remember that there are already a variety of implementations for [Thrift](http://incubator.apache.org/thrift/) (the client interface) and [lots of articles](http://wiki.apache.org/cassandra/ArticlesAndPresentations) to check out.

_I'm a little skunk by example._
