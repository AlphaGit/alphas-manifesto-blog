---
layout: post
excerpt_separator: <!--more-->
title: Running OpenAI's GPT-2
categories:
    - AI
tags:
    - AI
    - OpenAI
sub_title: Play with the most powerful text generator so far
---

![GPT-2]({{ site.baseurl }}/assets/gpt2.jpg)

There has been a lot of controversy around OpenAI not releasing the full model for GPT-2. However, leaving that aside, they _did_ publish the 117M model version, which is a small subset of the model that still works. And it works really nicely.

So let's dive and see how we can run it for ourselves.

<!--more-->

## The easiest version

Max Woolf ([@minimaxir](https://twitter.com/minimaxir)) has already done most of the work for us. He created a Google Colaboratory notebook that you can use to download, fine-tune, save checkpoints and generate text both with and without initial seeds. All you have to do is follow the steps detailed there. It will ask you to connect your Google Drive so it can read, fine-tunning source texts and save the output.

Everything that it does on the background is detailed on his [GitHub repository](https://github.com/minimaxir/gpt-2-simple), which is wonderfully coded and really easy to follow. You can even check the [examples he created with source texts from `/r/legaladvice`](https://github.com/minimaxir/legaladvice-gpt2). It's interesting to check there how the source texts are formatted for fine tuning the text -- important if you want to do your own.

Just copy the notebook to your drive, follow the steps executing the cells and enjoy!

## The local version

The developers of OpenAI had done a wonderful job at automating the steps to execute this model.

Clone the repository to your computer/server:

```console
git clone https://github.com/openai/gpt-2.git
```

This will, by default, create a `gpt-2` folder in the directory you're in. Access it by executing:

```console
cd gpt-2
```

At this point, you can build and download the model in a single line regardless of the Python version you have running, thanks to Docker (my favorite!):

```console
docker build --tag gpt-2 -f Dockerfile.cpu .
```

If you want to use GPU power (not really needed, it runs fairly fast with the current model), use `Dockerfile.gpu` instead.

At this point you'll have a docker image in your system called `gpt-2`.

Jump into it!

```console
docker run -it gpt-2 bash
```

At this point you should be able to browse around, but the interesting parts are in the `src` folder.

For conditional samples you will be asked about some input to the model. This is what gives an initial seed to start the generation. Give it a long text, a news-like paragraph and you'll be amazed at what comes out of it.

```console
python3 src/interactive_conditional_samples.py --top_k 40
```

For unconditional samples there is no input to it, it will just spit out some examples:

```console
python3 src/generate_unconditional_samples.py --top_k 40 --temperature 0.7
```

Here are a few arguments that the model supports, that you can use to play around and see how the output changes. It applies for both cases:

| Parameter | Meaning |
| --------- | ------- |
| `seed` | An integer number that indicates the random seed to use. If you give this a specific number, the generations will always be the same (useful for testing and reproducing results). | 
| `nsamples` | The amount of examples (documents) to produce. By default it will just keep generating them forever, so you'll have to kill the process. |
| `batch_size` | For internal processing. Does not change the results, but may affect speed and memory consumption. |
| `length` | Word limit for the text. By default it will just continue until it decides to stop. | 
| `temperature` | Floating point value. How "random" the text generation gets. Closer to 1 will be really varied. Closer to 0 will be fairly close to the source text. |
| `top_k` | How many words are considered for each step (token generation, word generation). Researchers found `40` is a good value to use. (Default is `0`, no restrictions.) |

Now, if you wanted to fine-tune these models, you'll have to write some wrapper functions around the `model.py` and `encoder.py` files. Fortunately enough, you can base yourself on [this example source code from Max Woolf](https://github.com/minimaxir/gpt-2-simple/blob/afaf43fc6a52bba9542e62f21dfc7919848531b5/gpt_2_simple/gpt_2.py#L230-L239).