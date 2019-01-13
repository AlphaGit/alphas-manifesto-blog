---
layout: post
status: publish
published: true
title: Reducing size of Docker images
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 6533
wordpress_url: https://blog.alphasmanifesto.com/?p=6533
date: '2018-09-23 20:16:19 +0000'
date_gmt: '2018-09-24 00:16:19 +0000'
categories:
- Technology
tags:
- continuous integration
- docker
- python
- image
- efficiency
- build process
- ci
comments:
- id: 88114
  author: simplivllc
  author_email: simplivllc@gmail.com
  author_url: https://www.simpliv.com
  date: '2018-11-06 23:40:27 +0000'
  date_gmt: '2018-11-07 04:40:27 +0000'
  content: Well written and presented about Docker and the file system.Much informative
    too..
---

![](/assets/Docker-heavy.png)

<p><!-- wp:paragraph --></p>
<p>Most blogs and manuals will recommend you the simpler approaches to reducing the image of your docker image. We'll go a little further today but let's reiterate them anyway:</p>
<p><!-- /wp:paragraph --></p>
<p><!-- wp:list --></p>
<ul>
<li>Use the reduced version of base images (alpine usually recommended), avoid SDKs for final images</li>
<li>Use multistage build, do not copy over temporary files or sources</li>
<li>Take care of the .dockerignore, ignore as much as possible</li>
</ul>
<p><!-- /wp:list --></p>
<p><!-- wp:paragraph --></p>
<p>Having said that, it is possible that you'll still end up with a very huge docker image, and it's difficult to understand what the next step from here.</p>
<p><!-- /wp:paragraph --></p>
<p><!-- wp:paragraph --></p>
<p>This is where this post comes in.</p>
<p><!-- /wp:paragraph --></p>
<p><!-- wp:more --></p>
<p><!--more--></p>
<p><!-- /wp:more --></p>
<p><!-- wp:paragraph --></p>
<p>Once the image is constructed, we can inspect what different steps (commits) took place on it to identify what the major hog of space is:</p>
<p><!-- /wp:paragraph --></p>
<p><!-- wp:code --></p>
<pre class="wp-block-code"><code>docker history alphadock/screaming-bot:latest

IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
e90b021bcc11        5 minutes ago       /bin/sh -c #(nop)  VOLUME [/usr/src/app/text&hellip;   0B
f479a24b3b2f        5 minutes ago       /bin/sh -c #(nop)  VOLUME [/usr/src/app/sett&hellip;   0B
1f2647d86908        5 minutes ago       /bin/sh -c python -c "import nltk; nltk.down&hellip;   25MB
27d27678dd10        5 minutes ago       /bin/sh -c python -m spacy download en          45.1MB
6e37b83f7be5        6 minutes ago       /bin/sh -c pip install --no-cache-dir -r req&hellip;   463MB
c5e124630280        13 minutes ago      /bin/sh -c #(nop) COPY dir:414b0e689b3fdeac6&hellip;   18.6kB
b83ddc2b496c        2 months ago        /bin/sh -c #(nop) WORKDIR /usr/src/app          0B
746a826ed9d7        2 months ago        /bin/sh -c #(nop)  CMD ["python3"]              0B
<missing>           2 months ago        /bin/sh -c set -ex;   wget -O get-pip.py 'ht&hellip;   6MB
<missing>           2 months ago        /bin/sh -c #(nop)  ENV PYTHON_PIP_VERSION=10&hellip;   0B
<missing>           2 months ago        /bin/sh -c cd /usr/local/bin  &amp;&amp; ln -s idle3&hellip;   32B
<missing>           2 months ago        /bin/sh -c set -ex   &amp;&amp; wget -O python.tar.x&hellip;   69.9MB
<missing>           2 months ago        /bin/sh -c #(nop)  ENV PYTHON_VERSION=3.7.0     0B
<missing>           2 months ago        /bin/sh -c #(nop)  ENV GPG_KEY=0D96DF4D4110E&hellip;   0B
<missing>           2 months ago        /bin/sh -c apt-get update &amp;&amp; apt-get install&hellip;   16.8MB
<missing>           2 months ago        /bin/sh -c #(nop)  ENV LANG=C.UTF-8             0B
<missing>           2 months ago        /bin/sh -c #(nop)  ENV PATH=/usr/local/bin:/&hellip;   0B
<missing>           2 months ago        /bin/sh -c set -ex;  apt-get update;  apt-ge&hellip;   556MB
<missing>           2 months ago        /bin/sh -c apt-get update &amp;&amp; apt-get install&hellip;   142MB
<missing>           2 months ago        /bin/sh -c set -ex;  if ! command -v gpg > /&hellip;   7.8MB
<missing>           2 months ago        /bin/sh -c apt-get update &amp;&amp; apt-get install&hellip;   23.2MB
<missing>           2 months ago        /bin/sh -c #(nop)  CMD ["bash"]                 0B
<missing>           2 months ago        /bin/sh -c #(nop) ADD file:370028dca6e8ca9ed&hellip;   101MB</code></pre>
<p><!-- /wp:code --></p>
<p><!-- wp:paragraph --></p>
<p>As you can see from my example, there is one clear command that is taking all of the space: <code>pip install</code>. Makes sense -- this is probably generating a lot of temporary files and downloads that we don't need to keep.</p>
<p><!-- /wp:paragraph --></p>
<p><!-- wp:paragraph --></p>
<p>But what exactly are they?</p>
<p><!-- /wp:paragraph --></p>
<p><!-- wp:paragraph --></p>
<p>To find out, we can inspect the filesystem to see what was generated by that layer. Docker actually keeps layers as part of the filesystem so we can drive into that directory to check it out.</p>
<p><!-- /wp:paragraph --></p>
<p><!-- wp:paragraph --></p>
<p>To find out where is that layer stored, we can use the <code>inspect</code> command:</p>
<p><!-- /wp:paragraph --></p>
<p><!-- wp:code --></p>
<pre class="wp-block-code"><code>docker inspect 6e37b83f7be5

(lots of json output)</code></pre>
<p><!-- /wp:code --></p>
<p><!-- wp:paragraph --></p>
<p>Actually, we just care about the <code>GraphDriver</code> section, with the location specified in <code>Data.Workdir</code>. So, we can specify it in our command so that we get only that portion back:</p>
<p><!-- /wp:paragraph --></p>
<p><!-- wp:code --></p>
<pre class="wp-block-code"><code>docker inspect -f "{{.GraphDriver.Data.WorkDir}}" 6e37b83f7be5

/var/lib/docker/overlay2/ed87e8cb41e0f5d2f40e2205db550f2c9e888224fb6928f6a1c626176ad2beb3/work</code></pre>
<p><!-- /wp:code --></p>
<p><!-- wp:paragraph --></p>
<p>Nice!</p>
<p><!-- /wp:paragraph --></p>
<p><!-- wp:paragraph --></p>
<p>If you're working in a Linux computer you can just&nbsp;<em>cd</em> into that directory. But if you're in Windows, you won't find it -- it is stored in the Hypervisor Linux VM that Docker uses.</p>
<p><!-- /wp:paragraph --></p>
<p><!-- wp:paragraph --></p>
<p>This post suggest using this command to accessing it, all through the power of docker:</p>
<p><!-- /wp:paragraph --></p>
<p><!-- wp:code --></p>
<pre class="wp-block-code"><code>docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -i sh

# now inside the debian sh

cd /var/lib/docker/overlay2/ed87e8cb41e0f5d2f40e2205db550f2c9e888224fb6928f6a1c626176ad2beb3</code></pre>
<p><!-- /wp:code --></p>
<p><!-- wp:paragraph --></p>
<p>At this point we get to see the changes in the file system inside the <code>diff</code> directory. These are the particular changes that this layer introduced.&nbsp;We can explore it like we would with any other filesystem.</p>
<p><!-- /wp:paragraph --></p>
<p><!-- wp:paragraph --></p>
<p>I just executed <code>du -h .</code> and was able to find what were the major hogs in space, like the <code>__pycache__</code> directories and other temporary building files.</p>
<p><!-- /wp:paragraph --></p>
<p><!-- wp:paragraph --></p>
<p>By repeating this process and identifying the primary causes of large layers, you can trim down the final version of your image.</p>
<p><!-- /wp:paragraph --></p>
<p><!-- wp:paragraph --></p>
<p>Having said this, it is still possible that you cannot control what particular steps in your build process do. For instance, in my case, I could not avoid the creation of the&nbsp;<code>__pycache__</code> directories as part of the build process.</p>
<p><!-- /wp:paragraph --></p>
<p><!-- wp:paragraph --></p>
<p>This is where multistage builds come in.</p>
<p><!-- /wp:paragraph --></p>