---
layout: post
status: publish
published: true
title: 'ATPS: Angular, Protractor, Travis, SauceLabs'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5322
wordpress_url: http://blog.alphasmanifesto.com/?p=5322
date: '2015-09-06 14:01:23 +0000'
date_gmt: '2015-09-06 19:01:23 +0000'
categories:
- Projects
- Technology
tags:
- AngularJS
- npm
- Travis CI
- automated testing
- development
- Protractor
- SauceLabs
- web development
- Selenium
- continuous integration
comments:
- id: 43672
  author: Andres
  author_email: notengo@notengo.com
  author_url: ''
  date: '2017-02-03 08:47:31 +0000'
  date_gmt: '2017-02-03 14:47:31 +0000'
  content: 'The link to "StackOverflow: Protractor and Travis, cross-platform scripts
    (and other horror stories)." is broken'
- id: 44618
  author: Alpha
  author_email: alphagma@gmail.com
  author_url: http://www.alphasmanifesto.com/
  date: '2017-02-12 20:21:05 +0000'
  date_gmt: '2017-02-13 02:21:05 +0000'
  content: Thanks for letting me know! The question received no activity over 1 year
    so it was deleted as an abandoned question. I updated the link to point to a gist
    that has a copy of it.
---

![](/assets/juggling.png)

<p style="text-align: justify;">A few days ago I got the combination of Angular + Protractor + TravisCI + SauceLabs working together. There are a few quirks into making this work, but nowhere I found a comprehensive description to jump all the obstacles. Here I'll describe what I did to get there.</p>
<p><!--more--></p>
<h2>First of all, the reasons</h2>
<p style="text-align: justify;">As you may remember, I have a project which is an Angular directive called <a href="https://github.com/AlphaGit/ng-pattern-restrict/">ng-pattern-restrict</a>, and while unit test did cover a lot of what I wanted the directive to cover, this directive is special in which it actually tries to modify what the user experience is like, going deep into browser API and input value control. As such, unit tests did cover that my logic was correct, but it did not cover what browsers actually would do. This is why I wanted to change to an automation framework, to actually measure what a final user would see and make sure that it matches exactly what I wanted.</p>
<h2>Tools required</h2>
<p style="text-align: justify;">For this recipe, you're going to need the following tools:</p>
<ul>
<li style="text-align: justify;">grunt: to run the tasks (see below)</li>
<li style="text-align: justify;">grunt-contrib-connect: to serve your test pages</li>
<li style="text-align: justify;">grunt-protractor-runner</li>
<li style="text-align: justify;">grunt-protractor-webdriver</li>
<li style="text-align: justify;">protractor</li>
</ul>
<h3>A note about grunt</h3>
<p style="text-align: justify;">I actually wanted to make this work without grunt at all, for a few reasons. First, I could get more control over the details of what was being ran. Second, I would be able to limit the amount of dependencies required for my project and the simplicity for another developer to grasp it. While I love the idea, it proved to be a lot more complicated that I originally envisioned, but I cannot understand (yet) what the exact reason is for that. If you're interested in the details of my journey and my numerous failures, check my question in StackOverflow: <a href="https://gist.github.com/AlphaGit/d4564d5103c1a2b452c99d4bd5940d21">Protractor and Travis, cross-platform scripts (and other horror stories)</a>.</p>
<h2>Getting Protractor to run locally</h2>
<p style="text-align: justify;">Achieving this part is actually pretty easy. Not only the guides in Protractor are quite accurate (and simple at the same time!), but also there's a huge community that will help you with the most common issues that you may find. Most of these would be around the web-driver and interaction with the browser themselves, which is more closely to the realm of Selenium.</p>
<p><script src="https://gist.github.com/AlphaGit/176a7eede22fd1e5a77c.js"></script></p>
<p style="text-align: justify;">That's all that it takes. This is how it works:</p>
<ol style="text-align: justify;">
<li>Run <code>npm install</code>. This will download the dependencies needed for your project.</li>
<li style="text-align: left;">Run <code>./node_modules/protractor/bin/webdriver update</code>. This is a standard procedure to getting the webdriver installed into your system.</li>
<li>Run <code>npm test</code>. This will execute our command&nbsp;registered in package.json for the test script.
<ol>
<li>This will start our grunt test task
<ol>
<li>In turn, this will start grunt:connect with the current base directory for the project as the base, hosting it under <code>http://localhost:9001/</code></li>
<li>It will also startup the grunt&nbsp;<code>protractor_webdriver</code> task with the <code>webDriverStart</code> options that we gave it, which will start up an instance of the Selenium webdriver.</li>
<li>It will then start the protractor engine with the test options that we gave it to it.
<ol>
<li>Protractor will then test the site at <code>http://localhost:9001/</code> with the tests specified in the test folder with <code>.js</code> extension and will use FireFox as its browser engine.</li>
</ol>
</li>
</ol>
</li>
</ol>
</li>
</ol>
<p style="text-align: justify;">I believe that this step is necessary: you first want to make sure that everything works as expected in as many browsers as you can verify before going out to Sauce Labs. In doing so, you can be sure that everything that fails while executing on their platform has to do with the integration process and not with the test or functionality itself. Also, it is very handy to be able to test yourself before going out to SauceLabs.</p>
<h3>Why Firefox?</h3>
<p style="text-align: justify;">I found it to be the easiest browser to run locally. Chrome is also an option. Opera does not support webdrivers and internet explorer requires some extra configurations to get it running, but it is possible. Safari, I honestly have no idea. Let me know in the comments if you know what's needed to get Safari to run locally with the Selenium webdrivers.</p>
<h2 style="text-align: justify;">Going live to SauceLabs</h2>
<p style="text-align: justify;">We'll only perform additions to our files so that we can execute both local and SauceLabs tests.</p>
<p><script src="https://gist.github.com/AlphaGit/0f9e8bb35dd32a927477.js"></script></p>
<p style="text-align: justify;">Don't be scared by its size, it is pretty much what we did for our local configurations with a few additions:</p>
<ul style="text-align: justify;">
<li>We included the <code>SAUCE_USERNAME</code>&nbsp;and&nbsp;<code>SAUCE_ACCESS_KEY</code> environment variables in the <code>.travis.yml</code> configuration file. These are encrypted with the repository public key, so it's&nbsp;no biggie to&nbsp;have them commited to the repo.</li>
<li>We specified <code>sauceUser</code> and <code>sauceKey</code> in our <code>protractor-travis-conf.js</code>, a new configuration file which will read from the environment variables we just created.</li>
<li>We added some more options to have SauceLabs run our tests in different browsers. To make sure everything runs smoothly, we specified the following options in each of them:
<ul>
<li><code>tunnel-identifier</code>: so that we can identify each connection to SauceLabs independently. We bound it to the Travis Job number so that each run gets its own number.</li>
<li><code>build</code>: for bookkeeping purposes, this will be our Travis build number, so we can correlate.</li>
<li><code>name</code>: name of the test. Serves no functional purpose other&nbsp;than us seeing it, so make sure it makes sense to whoever will see these runs on SauceLabs.</li>
<li><code>browserName</code>: the browser that we want to test on</li>
<li><code>shardTestFiles</code>: whether we want to run separate instances for each&nbsp;test file.&nbsp;This is great for parallelization.</li>
<li><code>maxInstances</code>: how many instances to keep running at a time. If you have a paid account, you may want to check this number so your billing doesn't go through the roof.</li>
<li><code>seleniumVersion</code>: which version of the Selenium WebDriver to use. Keep in mind that SauceLabs will not be using the latest one by default.</li>
</ul>
</li>
<li>We add a new task in our GruntFile so that <code>test:travis</code> will start our server and start protractor with a new set of protractor&nbsp;options, which uses the new protractor configuration file which we just introduced.</li>
<li>Finally, we add <code>npm run test-travis</code>&nbsp;in our script section so that Travis runs this set of tests, and the link to our grunt task through the&nbsp;npm <code>package.json</code> file, just to keep everything&nbsp;clean.</li>
</ul>
<p style="text-align: justify;">At this point, SauceLabs will correctly execute our tests and provide feedback back to Travis.</p>

![](/assets/sauceLabsRun.png)

<p>Now, getting your stuff to pass all the tests is up to you. ;)</p>
