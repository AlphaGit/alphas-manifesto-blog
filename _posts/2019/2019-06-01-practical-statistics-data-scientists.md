---

excerpt_separator: <!--more-->
title: Practical Statistics for data scientists
categories:
  - Books
tags:
  - data science
  - statistics
  - books
subtitle: Book review
description: >-
  A must-have book for data scientists & statisticians - Practical Statistics
  for Data Scientists by Peter & Andrew Bruce. Learn Exploratory Data Analysis,
  Data & Sampling Distributions, Statistical Experiments & Significance Testing,
  Regression & Prediction, Classification & more. Includes R examples & quick
  strategies for data cleanup.
---



![Practical Statistics for data Scientists]({{ site.baseurl }}/assets/practical-statistics-ds-cover.jpg)

I recently finished reading this amazing book by Peter and Andrew Bruce. It is definitely one of the must have books for the starter and middle-level data scientists, and so more for the starter statistician.

<!--more-->

The awesomeness of this book relies on it going straight to the point instead of giving lengthy introductions to subjects. This allows it to be very deep in the explanation of the subject itself without making the reader feel like they're wasting their time.

The first big section is all about _Exploratory Data Analysis_, which metrics can be used, their strengths and weaknesses. It then talks about variability, data distributions, variable correlations and how to work even with multiple types of variables.

The second sections digs a bit deeper into how to assess appropriately _Data and Sampling Distributions_, which has a lot of big "it depends". The book makes it perfectly clear what techniques might work in some situations and which pitfalls they have. They also give further reading and indications on how to go even deeper on those strategies, in case you need to assess if you're a victim to one of those pitfalls.

The third section is all about _Statistical Experiments and Significance Testing_. Based on the theoretical knowledge provided by the first chapters, this one gets more practical with decision making based on metrics and analysis on the data. This is where you'll find things like A/B testing and p-values. Remember that this is not a narrative book, so it won't lose the focus of being a good reference, meaning that it quickly moves to different concepts.

The fourth section tackles _Regression and Prediction_. At this point it's all about numeric regression, starting with Linear Regression and wrapping up with Splines.

Then the next one is about _Classification_, including Bayes, Logistic Regression and some of their relatives. Notice that while introducing the techniques, their evaluation metrics like ROC Curve, AOC and such are also presented, so it's very easy to come back to these sections to review these concepts.

The last two sections are about supervised learning (_Statistical Machine Learning_) and _Unsupervised Learning_. They briefly cover variable encodings and standarization, model strategies, trees and clustering algorithms.

Note that one aspect lacking is text input data or data manipulation. Also, not much about data cleanup techniques, although some quick strategies for this are scattered around the bias detection, imbalance detection and variation sections in the initial chapters.

During the book, it provides nice and concise examples in R to follow along, playing with a new default datasets that are available to use. This makes it really nice to follow along and experiment variations on our own while learning the concepts that the book presents.

All in all, it's a very good introductory book to the complexities of statistical work without losing you in a sea of theory, while being well written for becoming a quick-reference book.