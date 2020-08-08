---
layout: post
excerpt_separator: <!--more-->
title: FastAI quick test: LeafSnap
categories:
    - AI
tags:
    - FastAI
    - DataSets
#image:
#    path: /assets/2020-05-10-SQL-Performance-Explained/book-cover.jpg
#    thumbnail: /assets/2020-05-10-SQL-Performance-Explained/book-cover.jpg
#    caption: SQL Performance explained
sub_title: Testing the quick AI Framework and its results
---

(TODO: DAIN Link)

After my tests with [DAIN](), I decided to go back and test the new set of frameworks that we have available for AI and DataScience. While Tensorflow 2 and PyTorch are the ones that are in everyone's mouths lately, I decided to give FastAI a test drive, and it's incredibly easy to use.

<!--more-->

## FastAI

FastAI is a AI framework that sits on top of PyTorch and allows users to quickly whip up a model to run experiments against a dataset. Interestingly enough, FastAI gained recognition because of the MOOCs they offer, which take a new approach to AI learning. They propose that instead of learning the algebraic and algorithm basics, like every other course on artificial intelligence does, they just take you to run a few lines of code, see your results working, and then go deeper bit by bit on the concepts involved.

The framework itself follows the same philosophy, even to the point were it its not entirely fit for all cases that you might run into, but rather to the vast majority of the. For example, my second test with it required me to download and extract a `.tar` file, but the [`untar_data`](https://docs.fast.ai/datasets.html#untar_data) function only gives support for `.tar.gz` files. Not a big deal really, and all of the cases that you might encouter are likely going to be easily replaced by a few other lines of standard code with pandas or the `os` library.

That being said, most of the defaults and internal settings **do** indeed give very good results, allowing almost anyone, with a very basic knowledge of AI, to come up with very good models.

