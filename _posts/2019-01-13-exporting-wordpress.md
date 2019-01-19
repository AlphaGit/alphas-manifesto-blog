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
excerpt_separator: <!--more-->
---

I just exported my Wordpress blog by using the [jekyll-import](https://import.jekyllrb.com/docs/wordpress/) tool. This is my first post in this new tool. I very much like the simplified approach of writing markdown and having a static site rather than running a server and a database on my own.

Not all things were entirely straightforward, so here's a quick list of the steps I took, which might be helfpul to others.

<!--more-->

## Docker

I didn't want to install and configure ruby just to perform this export, so I used Docker.

```bash
# Create the destination folder
mkdir ruby-output

# Need to use host network to connect to the MySQL server.
# Source: https://stackoverflow.com/a/24326540/147507
docker run --rm -it --network="host" -v `pwd`/ruby-output:/ruby-output ruby bash
```

This instruction will download the `ruby:latest` image if you don't have it already, start a `bash` process in it and attach your console to it. Note that we're using the `host` network, so that we can connect to the MySQL server running in the docker host, and that we're binding the `ruby-output` directory so we can write to it and keep its contents.

## Exporting

Now, inside the docker instsance, we can make sure everything is alright and perform the export.

```bash
cd /ruby-output

# Test connectivity to the MySQL Server.
pingtcp() { (echo >/dev/tcp/$1/$2) &>/dev/null && echo "$1:$2 Open" || echo "$1:$2 Closed"; }

pingtcp localhost 100

# Output should be:
# localhost:100 Closed

pingtcp localhost 3306

# Output should be:
# localhost:3306 Open

# Install necesary dependencies
gem install jekyll-import sequel unidecode htmlentities mysql2

# Get my posts!
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

With this, I was left with a bunch of `.md` files inside my `ruby-output/_posts` folder. Some of them require a little bit of retouching, but that's good enough for now.

You should know that even though the export is done with extension `md`, all the contents of the files are still pure HTML. That probably needs some manual review.

Note that one of the things that this will **not** retrieve are the featured images in each post. You can retrieve them with the following SQL snippet:

```sql
select m.post_id, p.guid
from wp_postmeta m
inner join wp_posts p on m.meta_value = p.id
where meta_key = '_thumbnail_id'
and p.post_type = 'attachment';
```

You can search for the `post_id` and you'll find the related post file, because that information is included in the front matter of each post.

Finally, because my previous theme (Alpha's Manifesto) stores a special field for the subtitle of the post, I also had to retrieve those manually:

```sql
select post_id, meta_value
from wp_postmeta
where meta_key = 'subtitle';
```