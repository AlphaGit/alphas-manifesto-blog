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

![]({{ site.url }}/assets/juggling.png)

Quick guide to get these bad boys cooperating


A few days ago I got the combination of Angular + Protractor + TravisCI + SauceLabs working together. There are a few quirks into making this work, but nowhere I found a comprehensive description to jump all the obstacles. Here I'll describe what I did to get there.

<!--more-->

## First of all, the reasons

As you may remember, I have a project which is an Angular directive called <a href="https://github.com/AlphaGit/ng-pattern-restrict/">ng-pattern-restrict</a>, and while unit test did cover a lot of what I wanted the directive to cover, this directive is special in which it actually tries to modify what the user experience is like, going deep into browser API and input value control. As such, unit tests did cover that my logic was correct, but it did not cover what browsers actually would do. This is why I wanted to change to an automation framework, to actually measure what a final user would see and make sure that it matches exactly what I wanted.

## Tools required

For this recipe, you're going to need the following tools:

- grunt: to run the tasks (see below)
- grunt-contrib-connect: to serve your test pages
- grunt-protractor-runner
- grunt-protractor-webdriver
- protractor

### A note about grunt

I actually wanted to make this work without grunt at all, for a few reasons. First, I could get more control over the details of what was being ran. Second, I would be able to limit the amount of dependencies required for my project and the simplicity for another developer to grasp it. While I love the idea, it proved to be a lot more complicated that I originally envisioned, but I cannot understand (yet) what the exact reason is for that. If you're interested in the details of my journey and my numerous failures, check my question in StackOverflow: <a href="https://gist.github.com/AlphaGit/d4564d5103c1a2b452c99d4bd5940d21">Protractor and Travis, cross-platform scripts (and other horror stories)</a>.

## Getting Protractor to run locally

Achieving this part is actually pretty easy. Not only the guides in Protractor are quite accurate (and simple at the same time!), but also there's a huge community that will help you with the most common issues that you may find. Most of these would be around the web-driver and interaction with the browser themselves, which is more closely to the realm of Selenium.

<script src="https://gist.github.com/AlphaGit/176a7eede22fd1e5a77c.js"></script>

That's all that it takes. This is how it works:

1. Run `npm install`. This will download the dependencies needed for your project.
1. Run `./node_modules/protractor/bin/webdriver update`. This is a standard procedure to getting the webdriver installed into your system.
1. Run `npm test`. This will execute our command registered in package.json for the test script.
    1. This will start our grunt test task
        1. In turn, this will start grunt:connect with the current base directory for the project as the base, hosting it under `http://localhost:9001/`
        1. It will also startup the grunt `protractor_webdriver` task with the `webDriverStart` options that we gave it, which will start up an instance of the Selenium webdriver.
        1. It will then start the protractor engine with the test options that we gave it to it.
            1. Protractor will then test the site at `http://localhost:9001/` with the tests specified in the test folder with `.js` extension and will use FireFox as its browser engine.

I believe that this step is necessary: you first want to make sure that everything works as expected in as many browsers as you can verify before going out to Sauce Labs. In doing so, you can be sure that everything that fails while executing on their platform has to do with the integration process and not with the test or functionality itself. Also, it is very handy to be able to test yourself before going out to SauceLabs.

### Why Firefox?

I found it to be the easiest browser to run locally. Chrome is also an option. Opera does not support webdrivers and internet explorer requires some extra configurations to get it running, but it is possible. Safari, I honestly have no idea. Let me know in the comments if you know what's needed to get Safari to run locally with the Selenium webdrivers.

## Going live to SauceLabs

We'll only perform additions to our files so that we can execute both local and SauceLabs tests.

<script src="https://gist.github.com/AlphaGit/0f9e8bb35dd32a927477.js"></script>

Don't be scared by its size, it is pretty much what we did for our local configurations with a few additions:


- We included the `SAUCE_USERNAME` and `SAUCE_ACCESS_KEY` environment variables in the `.travis.yml` configuration file. These are encrypted with the repository public key, so it's no biggie to have them commited to the repo.
- We specified `sauceUser` and `sauceKey` in our `protractor-travis-conf.js`, a new configuration file which will read from the environment variables we just created.
- We added some more options to have SauceLabs run our tests in different browsers. To make sure everything runs smoothly, we specified the following options in each of them:
    - `tunnel-identifier`: so that we can identify each connection to SauceLabs independently. We bound it to the Travis Job number so that each run gets its own number.
    - `build`: for bookkeeping purposes, this will be our Travis build number, so we can correlate.
    - `name`: name of the test. Serves no functional purpose other than us seeing it, so make sure it makes sense to whoever will see these runs on SauceLabs.
    - `browserName`: the browser that we want to test on
    - `shardTestFiles`: whether we want to run separate instances for each test file. This is great for parallelization.
    - `maxInstances`: how many instances to keep running at a time. If you have a paid account, you may want to check this number so your billing doesn't go through the roof.
    - `seleniumVersion`: which version of the Selenium WebDriver to use. Keep in mind that SauceLabs will not be using the latest one by default.
- We add a new task in our GruntFile so that `test:travis` will start our server and start protractor with a new set of protractor options, which uses the new protractor configuration file which we just introduced.
- Finally, we add `npm run test-travis` in our script section so that Travis runs this set of tests, and the link to our grunt task through the npm `package.json` file, just to keep everything clean.

At this point, SauceLabs will correctly execute our tests and provide feedback back to Travis.

![]({{ site.url }}/assets/sauceLabsRun.png)


Now, getting your stuff to pass all the tests is up to you. ;)
