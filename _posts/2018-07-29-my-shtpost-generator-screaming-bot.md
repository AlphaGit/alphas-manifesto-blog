---
layout: post
status: publish
published: true
title: 'My sh*tpost generator: screaming-bot'
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 6506
wordpress_url: https://blog.alphasmanifesto.com/?p=6506
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
comments: []
---

![](/assets/20120227-robotthatscreams-1.png)

Text generation with nltk, markovify, Tumblr, docker

<p style="text-align: justify;">(Image used without permission from <a href="http://gunshowcomic.com/513">Gunshow comic: Robot that screams</a>.)</p>
<p style="text-align: justify;">If the word offends you, below the fold I use it a lot, so you might not want to read this article. However, I think it's the most appropriate term.</p>
<p><!--more--></p>
<p style="text-align: justify;">I wanted to try out a few text generation tools so I decided I would make a bot that would generate shitposts. Now, you might not be familiar enough with this term so let me give you a quick introduction to it.</p>
<p style="text-align: justify;">Shitposting is, in spite of what Wikipedia says this time, a low quality post that might revolve around memes or occurrences. Usually bad or bizarre enough that they cannot even qualify as jokes, but become jokes because of the sheer absurdness of it. Without going further, let me give you an example:</p>

![](/assets/truth-1.jpg)

<p style="text-align: justify;">I find these hilarious but that is besides the point.</p>
<p style="text-align: justify;">At this point, I wanted to generate some text that would contain enough grammatical conciseness to be considered a full correct sentence, while at the same time sometimes not making enough sense to be some of the shitposting quality that I enjoy so much.</p>
<h2>Tools</h2>
<p style="text-align: justify;">I instantly though in using some kind of Markov chain that would allow me to construct sentences including proper word usage and positioning. I thought of making the Markov chain, by word, from 5 to 6 words, but the graph would have become hugely memory intensive very soon, very fast. As such, I decided to keep it low, somewhere between the 2 and 3 word of of previous state for prediction. Going lower than that would render very low quality results, even lower than expected for these cases.</p>
<p style="text-align: justify;">My modus operandi would be to read textposts from Tumblr, from a few select blogs/tags that have the quality I expect and want as example, store that text and generate new sentences.</p>
<p style="text-align: justify;">With that, my entire toolset would look like this:</p>
<ul>
<li style="text-align: justify;"><strong>Docker</strong>-ified application</li>
<li style="text-align: justify;">Runs (<strong>Python</strong> app)</li>
<li style="text-align: justify;">Reads text from Tumblr using the <a href="https://www.tumblr.com/docs/en/api/v2"><strong>Tumblr API</strong></a></li>
<li style="text-align: justify;">Stores it in some kind of storage: a <strong>text file</strong></li>
</ul>
<p style="text-align: justify;">With this, I have completed the first part of my challenge. As for the second part:</p>
<ul>
<li style="text-align: justify;"><strong>Docker</strong>-ified application</li>
<li style="text-align: justify;">Runs (<strong>Python</strong> app)</li>
<li style="text-align: justify;">Reads text from storage (the <strong>text file</strong>)</li>
<li style="text-align: justify;">Creates a markov chain model (<strong><a href="https://github.com/jsvine/markovify">markovify</a></strong>)</li>
<li style="text-align: justify;">Generates a new text</li>
<li style="text-align: justify;">Posts it in Tumblr using the <strong>Tumblr API</strong></li>
</ul>
<h2>Coding</h2>
<p style="text-align: justify;">Now, the main tool I used (markovify) is extensible enough that allowed me to play with different approaches to word splitting and positioning, so I actually mixed it up with some of the Gunterberg texts and the word classification functions from <a href="https://www.nltk.org/"><strong>NLTK</strong></a>. Doing so was incredibly simple:</p>
<p><script src="https://gist.github.com/AlphaGit/6f42eeccc3ee56ca39f3f73f74fde8fb.js"></script></p>
<p style="text-align: justify;">This was probably the hardest part, and as you can see, it was barely hard at all. Markovify's author Jeremy Singer-Vine did an incredible job at making these classes extensible and they are very well documented, something quite unusual in the Python environment. The tool is very memory-aware too, so it works incredibly quickly and does not consume lots of resources.</p>
<p style="text-align: justify;">The only missing part is reading information from the blogs and to store it, which is as simple as you might imagine:</p>
<p><script src="https://gist.github.com/AlphaGit/9f909745d7c573146e6102ad65cc8149.js"></script></p>
<p style="text-align: justify;">All that this code does is iterate through a bunch of blogs and gets a minimum of textposts from them. It then iterates on a bunch of tags and it reads a minimum of posts from them too. It then stores everything in a text file which is the same file the first script consumes.</p>
<p style="text-align: justify;">Yes, there is definitely place to improve this: you can tell that I'm opening and closing the file too many times, and that there are zero-to-none validations on the text. I was going for a quick implementation and a barely functional bot. But let's talk about the text cleaning later on.</p>
<p style="text-align: justify;">The Tumblr client was the easiest part of all:</p>
<p><script src="https://gist.github.com/AlphaGit/b28cef117a4d0320486aeab4e984a86a.js"></script></p>
<h2>Adjustments</h2>
<p style="text-align: justify;">After this was all done, the bot was ready to run, and indeed it ran.</p>
<p style="text-align: justify;">However, the quality of the posts where a lot lower than I initially imagined. So here are a few post-considerations that I took in order to make it better:</p>
<ul>
<li style="text-align: justify;">It's all about the input data! I cleared out links, user names, and strange characters that might confuse the word tagging.</li>
<li style="text-align: justify;">Along that lines, I ensured to keep line ends and spacing between words -- otherwise, I ended up with a lot more words together than it was comfortable to read. A few of them are ok, it creates the sense of urgency when the post was "written" (which is perfect for the genre of fine shitposting).</li>
<li style="text-align: justify;">I made sure to follow the right blogs and tags that provide this kind of posting. Following a tag like <code>#long post</code> felt like a good idea at the beginning, but quickly spiraled into a lot of fanfiction that was great for text generation, but a lot more narrative than I wanted to achieve.</li>
<li style="text-align: justify;">I setup cron jobs for my docker instances so that they run every once in a while. The objective is to not abuse the Tumblr API while at the same time being able to grab some fresh content every once in a while, that will make the text generation vary.</li>
<li style="text-align: justify;">The posts became very inconsistent very quickly, so I loaded the Gutenberg corpora and gave it half the weight in probabilities that the shitposting would get. This can be done through the great <a href="https://github.com/jsvine/markovify#combining-models">combination model feature from markovify</a>, and it would also be a nice idea to apply to other blogs/tags with the same pattern.</li>
</ul>
<p style="text-align: justify;">Finally, I did setup a docker image that encapsulated all of this and initialized it with the right contents. While I really wanted to use a python-alpine distribution, some of the libraries were having issues with it and I did not investigate that further.</p>
<p><script src="https://gist.github.com/AlphaGit/fa4d4c12867df6b5c1fb799dfc63bbf0.js"></script></p>
<h2>Final touches</h2>
<p style="text-align: justify;">After all of this, I already had a bot that generated a lot of nonsense. Instead of fighting against correct capitalization, I decided to make everything uppercase, as "shouting" might give it a more humorous effect (in the sense of yelling for something urgent yet nonsensical) and called it screaming-bot. I dressed it up as a tumblr account and I added some screams to it.</p>
<p style="text-align: justify;">I had, indeed, created my own screaming robot. Why? Hm.</p>
<p style="text-align: justify;">You can visit it here: <a href="https://screaming-bot.tumblr.com/">screaming-bot</a>. Don't expect much.</p>
<p>You cans see the full source code at its <a href="https://github.com/AlphaGit/screaming-bot">repository in github</a>.</p>
<h2>Thanks</h2>
<ul>
<li style="text-align: justify;">I want to thank Jeremy Singer-Vine for the wonderful implementation he did of a Markov chain for text generation</li>
<li style="text-align: justify;">I also want to thank Jesse Lee, because they created <a href="https://github.com/veggiedefender/miraculousladybot">Miraculous Lady Bot</a>, a bot that also based itself on markovify and tumblr posts, saving me the awkwardness of figuring out how the API needs to be parsed. Take a look at their approach for a clever idea on database storage.</li>
</ul>
<h2>Examples</h2>
<p style="text-align: justify;">Let me delight you with some of the best creations of this bot.</p>
<blockquote class="imgur-embed-pub" lang="en" data-id="a/qOPZgmt"><p><a href="//imgur.com/qOPZgmt"></a></p></blockquote>
<p><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script></p>
