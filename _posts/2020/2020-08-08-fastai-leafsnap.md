---
layout: single
excerpt_separator: <!--more-->
title: FastAI quick test / LeafSnap
categories:
    - AI
tags:
    - FastAI
    - DataSets
    - Tools
    - AI
    - Data Science
    - LeafSnap
    - PyTorch
    - Computer Vision
image:
    path: /assets/fastai-leafsnap/cover.jpg
    thumbnail: /assets/fastai-leafsnap/cover.jpg
    caption: 
sub_title: Testing the quick AI Framework and its results
---

After my tests with [DAIN][DAIN Post], I decided to go back and test the new set of frameworks that we have available for AI and DataScience. While Tensorflow 2 and PyTorch are the ones everyone mentions lately, I decided to give [FastAI][] a test drive, and it's incredibly easy to use.

[DAIN Post]: {{ site.baseUrl }}{% link _posts/2020/2020-03-22-DAIN.md %}
[FastAI]: https://www.fast.ai/

<!--more-->

## FastAI

FastAI is an AI framework that sits on top of PyTorch and allows users to quickly whip up a model to run experiments against a dataset. Interestingly enough, FastAI gained recognition because of the MOOCs they offer, which take a new approach to AI learning. They propose that instead of learning the algebraic and algorithm basics, like in every other course on artificial intelligence, you should just dive in, run a few lines of code, see your results working, and then go deeper bit by bit on the concepts involved.

The approach does make a lot of sense, specially with the allegory they provide. When you learn to play soccer, you don't stop to learn about the physics of elastic collision, and the equations on parabollas and gravity. Instead, you play, and as you get better at it, you're ready to learn about some concepts that help.

The framework itself follows the same philosophy, even to the point were it its not entirely fit for all cases that you might run into. And this is by design: it's not meant to be a solution-to-end-all-solutions, but rather a quick start into everything else.

As a quick example, a test I ran with it required me to download and extract a `.tar` file, but the [`untar_data`](https://docs.fast.ai/datasets.html#untar_data) function only gives support for `.tar.gz` files. Not a big deal really, but it illustrates the point.

That being said, most of the defaults and internal settings **do** indeed give very good results, allowing almost anyone, with a very basic knowledge of AI, to come up with very good models.

## Leafsnap

While looking for a good experiment to run, I came across [Leafsnap](http://leafsnap.com/), a database of 185 tree species in the North-Eastern US, that classifies them based on photographs of their seeds, leaves and fruits. What's more, the dataset is divided into lab-controlled images and field-taken images with regular phones. And if that wasn't good enough, they even provided images with the pre-processing done on the source photographs, based on the [original 2012 LeafSnap study](https://www.slideshare.net/3awady/leafsnap-classification).

![Segmentation]({{ site.baseurl }}/assets/fastai-leafsnap/segmented.jpg)

However, just to test the power of FastAI, I went in blind and tested the whole set of raw photographs. At least a decent CNN classifier would be able to work around the noise around it, right?

## Code

This is one of the most impressive takeaways from my FastAI experiment. This is all the code it took me to get a whopping 94% accuracy (mind you, the 2012 study claims a 70% accuracy).

```python
from fastai.vision import *
from fastai.metrics import error_rate

data = ImageDataBunch.from_df(base_path, train_dataset_df, size=224, bs=64).normalize()

model_rn34 = cnn_learner(data, models.resnet34, metrics=error_rate)
model_rn34.fit_one_cycle(4)
```

That's it. At this point, my model had already achieved 94% accuracy, considering a self-constructed internal validation set.

As I was explaining before, you can easily tell how working with FastAI is meant to be, well, fast. You can quickly run iterations and focus on the approach to learning instead of dealing with internals, such as hyperparameter exploration, network depth and regularization methods, etc.

However, there is more to it.

Here's how you evaluate some of the mistakes that the model made:

```python
interp = ClassificationInterpretation.from_learner(model_rn34)

# shows the worst offending mistakes, along with pictures
interp.plot_top_losses(9, figsize=(15,11))

# shows a full confusion matrix
interp.plot_confusion_matrix(figsize=(12,12), dpi=60)

# returns the confusion matrix as a list
interp.most_confused(min_val=5)
```

This is what it takes to evaluate different learning rates. It will display a graph of the varying loss with different learning rates applied to the model learning process.

```python
model_rn34.lr_find()
model_rn34.recorder.plot()
```

This is what it takes to export the model into a pickle file which includes the model structure, weights and classes.

```python
model_rn34.export(file=drive_path/'leafsnap-rn34-4e-ft1-ft8.pkl')
```

This is what it takes to load it again and run a prediction:

```python
# load model
model_rn34 = load_learner(drive_path, 'leafsnap-rn34-4e-ft1-ft8.pkl')

# load image for prediction
img = open_image(drive_path/'maple.jpg')

# run prediction
pred_class, pred_idx, outputs = model_rn34.predict(img)
```

As you can see, it is **extremely easy** to operate with it.

## Results

I went further, and instead of making the model identify the specific species, I simplified that list to one of generic common species names. So, for instance, instead of identifying an _Acer campestre_  or a _Acer griseum_, the model would tell me it was a maple tree. This reduced the amount of specific species to 72 generic species.

I also ran predictions with photos from my own backward. I did happen to know I had a maple tree and a currant* tree, and another few more I wasn't entirely sure what they were. I don't fully trust the results I got, but I am sure how I could work on fully trusting them, without a lot of effort.

(*) I was convinced I actually had a currant tree, but after running it against this model I realized that it was, indeed a Lilac. What I thought was a misclassification was indeed the model teaching me!

Mind you, all this work was done with Google Colab, and the quick training sessions took about 10 minutes. The long training sessions took about 4 hours. This was all completely for free, and I did this all in the cheapest Chromebook in the market.

Check out my notebooks with the results I got:

- [ResNet34 / ResNet50 training]({{ site.baseurl }}/assets/fastai-leafsnap/fastai-leafsnap-notebook.html), where I achieved 98.5% accuracy with ResNet34, and 98.1% accuracy with ResNet50.
  - Download model: [leafsnap-rn34-4e-ft1-ft8.pkl]({{ site.baseurl }}/assets/fastai-leafsnap/leafsnap-rn34-4e-ft1-ft8.pkl) (~84 MBs)
  - Download model: [leafsnap-rn50-8e.pkl]({{ site.baseurl }}/assets/fastai-leafsnap/leafsnap-rn50-8e.pkl) (~99 MBs)
- [Loading ResNet34 model and running predictions]({{ site.baseurl }}/assets/fastai-leafsnap/fastai-leafsnap-test-notebook.html)

Again, I don't fully trust the results (because I did not construct a good test dataset), but here's what you should consider:

- I did zero treatment on the dataset itself.
- I did not have to split train/validation datasets.
- I did not have to initialize NNs and construct them manually.
- I did not have to add regularization methods.
- I did not have to do hyperparameter search (aside from the learning rate).

All in all, the value that FastAI gives is very easy to appreciate, and I do look forward to using it more in the future.