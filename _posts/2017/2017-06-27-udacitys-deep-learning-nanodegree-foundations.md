---
excerpt_separator: <!--more-->
title: Udacity's Deep Learning Nanodegree Foundations
date: 2017-06-27 20:28:32 +0000
date_gmt: 2017-06-28 01:28:32 +0000
categories:
  - AI
tags:
  - udacity
  - course
  - MOOC
  - tensorflow
  - AI
  - deep-learning
  - machine-learning
subtitle: Course contents and structure
description: Graduated Udacity Deep Learning Nanodegree, five projects, tools, community, content covered, worth it.
---


![]({{ site.baseurl }}/assets/nd101.png)

A few weeks ago I graduated from Udacity's Deep Learning Foundations Nanodegree program. It was an introduction to all things deep learning, from the very basics to state of the art techniques. Let me tell you a little bit about it.

<!--more-->

## The course itself

As Udacity advertises it, the course is slow-paced, only requiring about 3 hours of dedication per week. I found this not so certain, specially for the first weeks. Sure, you can stretch your efforts and be done with the very basics in 3 hours per week, but the truth is that it will work a lot better if you dedicate somewhere between 5 and 10 hours per week. Projects take somewhere between 2 hours and 10 hours, depending on how comfortable you are with the tools and the content. If you were already well versed in this subject and tools, they would probable take you around 10 to 30 minutes.

### Projects

The course has five projects that you need to complete in order to graduate. They are:

- Feed-forward Neural Networks: Predict a shop's future sales
- Convolutional Neural Networks: Identify objects in the [CIFAR-10 image dataset](https://www.cs.toronto.edu/~kriz/cifar.html)
- Recurrent Neural Networks: Generate a TV script for a scene in The Simpsons
- Recurrent Neural Networks: Build an English-to-French translator
- Generative Adversarial Neural Networks: Generate fake images of handwritten digits and faces

The projects do still contain a good amount of practice and they are guided, where you fill in the blank some method implementations. It's really fun to see the results actually happening as you work on them!

### Tools

The following tools are used in the project, and you need to either know them before hand or be ready to learn quickly. You can have a novice level of expertise in all of them, but at the very least, you should be able to make your path through the very basics.

- Tensorflow: this will be taught during the entirety of the course, so this is the exception and you can not know anything about it.
- AWS: You will benefit from knowing how to launch an EC2 instance from an image, how to SSH into it and how to expose ports from it.
- GitHub: The very basic. Clone a repo, make changes, commit and push to them. Pull changes from upstream repo, integrate with yours.
- FloydHub: You will not _need_ FloydHub, but it's good a simple replacement for AWS EC2, since all that we're doing is using GPU instances. You will benefit from creating and running experiments, most usually in a Jupyter Notebook mode.
- Python: you'll need to know the very basics of the syntax. It is assumed you know them, but the instructors take it really slow so it's actually easy to catch up.
- Anaconda, Jupyter Notebook: You will need to know how to install them and make them run, if you want to run notebooks and experiment locally. Otherwise, you can use FloydHub or AWS EC2 for all of this -- however, know that you'll be charged for the time on them. Udacity's course actually offers a credit of 100 USD for AWS. FloydHub offers 100 hours for free once you sign up. They should be enough but keep it in consideration if you want to spend some time testing and understanding the concepts.
- Calculus: You will need a very basic set of skills from calculus. You will need to have fresh in mind what derivatives are and how matrix operations work.

### Community

The community was far more involved than I actually expected. First of all, there's a group of mentors that are mostly always available to answer questions and guide with difficulties. There is a slack group where everyone participates, and people are always interested in learning, discussing more, creating study groups, meeting up, pursuing more, helping with problems, etc.

Instructors are also involved as mentors, and they will be very open to feedback from the community. They will held regular office hours for any kind of questions. They will address issues with the content and improve on it. They will notify students of changes in both dates, requirements and possibilities.

## Course contents

This was the first time the course opened, so some of the contents feel a little bit crude at first, but just over the span of a few months it was improved drastically. I can only imagine that as time passes, the course will only get better and better.

The course starts with a very basic idea of how a neuron and linear regression works until adding activation methods and building a neural network fairly quickly. They ask you to do this manually so the concepts stick with you (and they do!), and as soon as you blinked, you're already working on the first project. Neural networks, forward-propagation, back-propagation, activation functions.

Then they expand on those concepts adding on strategies for learning. Testing, validation sets. Data preparation. Data normalization. Tensorflow. Network hyperparameters. Batching. Loss functions. Accuracy measurements.

Convolutional networks, and the very basics for image classification. Convolutions, kernels, filters, channels, padding. More hyperparameters.

Recurrent neural networks. Memory cells, LSTM cells. Variations on network architectures. More hyperparameters. Text data preparation: word2vec, embeddings, bag of words. FloydHub. Weight initialization. Transfer learning. Sequence-to-sequence models. Reinforcement learning. Autoencoders.

Generative adversarial networks (taught by Ian Goodfellow, the inventor himself). One shot learning. More hyperparameters, techniques on taming them. Convolutional GANs. Semi-supervised learning with GANs. Minibatching.

## Conclusion

Totally worth it. I know it's a little bit more expensive now (it wasn't when it first launched, so I got lucky). It was a great structured introduction to a lot of topics from which now I can move on from basic understanding to continuing my education.

You can [visit this course page in Udacity](https://www.udacity.com/course/deep-learning-nanodegree-foundation--nd101) and decide if it's worth for you. There is also a free self-paced course by Google on a subset of these contents: [Deep Learning by Google](https://www.udacity.com/course/deep-learning--ud730). I haven't checked that one out yet. Also, there are tons of tutorials and guides everywhere -- just google "deep learning" and you'll find them.

I will be talking more on each of these concepts, as I try to make them more approachable and as I try to go deeper in them.
