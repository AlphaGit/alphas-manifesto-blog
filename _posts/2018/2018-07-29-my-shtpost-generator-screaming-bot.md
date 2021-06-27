---
layout: single
excerpt_separator: <!--more-->
title: 'My sh*tpost generator: screaming-bot'
date: '2018-07-29 14:53:11 +0000'
date_gmt: '2018-07-29 18:53:11 +0000'
categories:
- Projects
- AI
tags:
- humor
- Tumblr
- bot
- text generation
- docker
- python
- nltk
- markov
- markov chain
- Tumblr API
- shitpost
sub_title: Text generation with nltk, markovify, Tumblr, docker
---

![]({{ site.baseurl }}/assets/20120227-robotthatscreams-1.png)

Text generation with nltk, markovify, Tumblr, docker

(Image used without permission from [Gunshow comic: Robot that screams](http://gunshowcomic.com/513).)

If the word offends you, below the fold I use it a lot, so you might not want to read this article. However, I think it's the most appropriate term.

<!--more-->

I wanted to try out a few text generation tools so I decided I would make a bot that would generate shitposts. Now, you might not be familiar enough with this term so let me give you a quick introduction to it.

Shitposting is, in spite of what Wikipedia says this time, a low quality post that might revolve around memes or occurrences. Usually bad or bizarre enough that they cannot even qualify as jokes, but become jokes because of the sheer absurdness of it. Without going further, let me give you an example:

![]({{ site.baseurl }}/assets/truth-1.jpg)


I find these hilarious but that is besides the point.

At this point, I wanted to generate some text that would contain enough grammatical conciseness to be considered a full correct sentence, while at the same time sometimes not making enough sense to be some of the shitposting quality that I enjoy so much.

## Tools

I instantly though in using some kind of Markov chain that would allow me to construct sentences including proper word usage and positioning. I thought of making the Markov chain, by word, from 5 to 6 words, but the graph would have become hugely memory intensive very soon, very fast. As such, I decided to keep it low, somewhere between the 2 and 3 word of of previous state for prediction. Going lower than that would render very low quality results, even lower than expected for these cases.

My modus operandi would be to read textposts from Tumblr, from a few select blogs/tags that have the quality I expect and want as example, store that text and generate new sentences.

With that, my entire toolset would look like this:

- **Docker**-ified application
- Runs (**Python** app)
- Reads text from Tumblr using the [**Tumblr API**](https://www.tumblr.com/docs/en/api/v2)
- Stores it in some kind of storage: a **text file**

With this, I have completed the first part of my challenge. As for the second part:

- **Docker**-ified application
- Runs (**Python** app)
- Reads text from storage (the **text file**)
- Creates a markov chain model (**[markovify](https://github.com/jsvine/markovify)**)
- Generates a new text
- Posts it in Tumblr using the **Tumblr API**

## Coding

Now, the main tool I used (markovify) is extensible enough that allowed me to play with different approaches to word splitting and positioning, so I actually mixed it up with some of the Gunterberg texts and the word classification functions from [**NLTK**](https://www.nltk.org/). Doing so was incredibly simple:

<script src="https://gist.github.com/AlphaGit/6f42eeccc3ee56ca39f3f73f74fde8fb.js"></script>

This was probably the hardest part, and as you can see, it was barely hard at all. Markovify's author Jeremy Singer-Vine did an incredible job at making these classes extensible and they are very well documented, something quite unusual in the Python environment. The tool is very memory-aware too, so it works incredibly quickly and does not consume lots of resources.

The only missing part is reading information from the blogs and to store it, which is as simple as you might imagine:

<script src="https://gist.github.com/AlphaGit/9f909745d7c573146e6102ad65cc8149.js"></script>

All that this code does is iterate through a bunch of blogs and gets a minimum of textposts from them. It then iterates on a bunch of tags and it reads a minimum of posts from them too. It then stores everything in a text file which is the same file the first script consumes.

Yes, there is definitely place to improve this: you can tell that I'm opening and closing the file too many times, and that there are zero-to-none validations on the text. I was going for a quick implementation and a barely functional bot. But let's talk about the text cleaning later on.

The Tumblr client was the easiest part of all:

<script src="https://gist.github.com/AlphaGit/b28cef117a4d0320486aeab4e984a86a.js"></script>

## Adjustments

After this was all done, the bot was ready to run, and indeed it ran.

However, the quality of the posts where a lot lower than I initially imagined. So here are a few post-considerations that I took in order to make it better:

- It's all about the input data! I cleared out links, user names, and strange characters that might confuse the word tagging.
- Along that lines, I ensured to keep line ends and spacing between words -- otherwise, I ended up with a lot more words together than it was comfortable to read. A few of them are ok, it creates the sense of urgency when the post was "written" (which is perfect for the genre of fine shitposting).
- I made sure to follow the right blogs and tags that provide this kind of posting. Following a tag like `#long post` felt like a good idea at the beginning, but quickly spiraled into a lot of fanfiction that was great for text generation, but a lot more narrative than I wanted to achieve.
- I setup cron jobs for my docker instances so that they run every once in a while. The objective is to not abuse the Tumblr API while at the same time being able to grab some fresh content every once in a while, that will make the text generation vary.
- The posts became very inconsistent very quickly, so I loaded the Gutenberg corpora and gave it half the weight in probabilities that the shitposting would get. This can be done through the great [combination model feature from markovify](https://github.com/jsvine/markovify#combining-models), and it would also be a nice idea to apply to other blogs/tags with the same pattern.

Finally, I did setup a docker image that encapsulated all of this and initialized it with the right contents. While I really wanted to use a python-alpine distribution, some of the libraries were having issues with it and I did not investigate that further.

<script src="https://gist.github.com/AlphaGit/fa4d4c12867df6b5c1fb799dfc63bbf0.js"></script>

## Final touches

After all of this, I already had a bot that generated a lot of nonsense. Instead of fighting against correct capitalization, I decided to make everything uppercase, as "shouting" might give it a more humorous effect (in the sense of yelling for something urgent yet nonsensical) and called it screaming-bot. I dressed it up as a tumblr account and I added some screams to it.

I had, indeed, created my own screaming robot. Why? Hm.

You can visit it here: [screaming-bot](https://screaming-bot.tumblr.com/). Don't expect much.

You cans see the full source code at its [repository in github](https://github.com/AlphaGit/screaming-bot).

## Thanks

- I want to thank Jeremy Singer-Vine for the wonderful implementation he did of a Markov chain for text generation
- I also want to thank Jesse Lee, because they created [Miraculous Lady Bot](https://github.com/veggiedefender/miraculousladybot), a bot that also based itself on markovify and tumblr posts, saving me the awkwardness of figuring out how the API needs to be parsed. Take a look at their approach for a clever idea on database storage.

## Examples

Let me delight you with some of the best creations of this bot.

<blockquote class="imgur-embed-pub" lang="en" data-id="a/qOPZgmt">
<a href="//imgur.com/qOPZgmt"></a></blockquote>

<script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>
