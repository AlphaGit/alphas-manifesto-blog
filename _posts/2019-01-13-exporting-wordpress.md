---
layout: post
title: Exporting from Wordpress to Jekyll
categories:
    - technology
tags:
    - wordpress
    - jekyll
    - import
    - export
    - html
    - docker
    - networking
---

I was able to export my Wordpress blog by using the [jekyll-import](https://import.jekyllrb.com/docs/wordpress/) tool.

However, not all things were entirely straightforward, so here's a quick list of the steps I took.

```console
mkdir ruby-output

# src: https://stackoverflow.com/a/24326540/147507
docker run --rm -it --network="host" -v `pwd`/ruby-output:/ruby-output --name ruby ruby bash

# ---
# Now Inside docker instance
# ---

cd /ruby-output

pingtcp() { (echo >/dev/tcp/$1/$2) &>/dev/null && echo "$1:$2 Open" || echo "$1:$2 Closed"; }

pingtcp localhost 100

# Should be:
# localhost:100 Closed

pingtcp localhost 3306

# Should be:
# localhost:3306 Open

gem install jekyll-import sequel unidecode htmlentities mysql2

ruby -r rubygems -e 'require "jekyll-import";
    JekyllImport::Importers::WordPress.run({
      "dbname"         => "[YOUR_DB_NAME]",
      "user"           => "[YOUR_DB_USER]",
      "password"       => "[YOUR_DB_PASS]",
      "host"           => "127.0.0.1",
      "port"           => "3306",
      "socket"         => nil,
      "table_prefix"   => "wp_",
      "clean_entities" => true,
      "comments"       => true,
      "categories"     => true,
      "tags"           => true,
      "more_excerpt"   => true,
      "more_anchor"    => true,
      "extension"      => "md",
      "status"         => ["publish"]
    })'
```

With this, I was left with a bunch of HTML files inside my `ruby-output/_posts` folder. Some of them require a little bit of retouching, but that's good enough for now.

You should know that even though the export is done with extension `md`, all the contents of the files are still pure HTML. That probably needs some manual review.