---
layout: post
excerpt_separator: <!--more-->
status: publish
published: true
title: How to find the problem
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5556
wordpress_url: http://blog.alphasmanifesto.com/?p=5556
date: '2016-01-12 22:36:05 +0000'
date_gmt: '2016-01-13 04:36:05 +0000'
categories:
- Projects
- Technology
tags:
- Technology
- development
- epiphany
- knowledge management
- learning
- bug
- bug fixing
- assumptions
- problems
- solutions
---

![]({{ site.baseurl }}/assets/chemistryskunk.png)

User minusSeven from the StackExchange community asked a seemingly uninteresting question that happens to be really deep and meaningful: [How do you learn programming when you're stuck and without access to the internet?](http://productivity.stackexchange.com/questions/4827) All the answers there are really good and useful, but I think there's an underlying theme worth discussing: how a methodical approach should be.

<!--more-->

The internet and good resources like the StackExchange community are really valuable tools to find information, and even better, confirmed and pragmatic information. You don't just find how a specific language is supposed to work, but you also, from real people, with real feedback, _how they actually work_. And this is priceless, because they provide you with workarounds to known bugs and to non-publicly-accepted platform issues. They are also focused on quality and maintainability. What more is there to ask for?

Really, internet today is like having a mentor on anything. And being alone with your thoughts can be really scary, but it can be made productive.

If you're cut off from the internet, what you have is a problem and no idea what the problem is. You probably have a solution in mind but it doesn't work like you expected it. After all, in your mind this approach works perfectly but you still have a problem to solve. So, this is where you'd go asking the internet what's wrong with your approach.

And asking yourself what's wrong is the best thing you can do.

## Applied skepticism is the key: a practical example

You've done something which is, to the best of your knowledge perfect. But it is not. Where are you wrong?

A while ago I made a post about knowledge management ("[Consejos para un no-programador](https://blog.alphasmanifesto.com/2013/06/22/consejos-para-un-no-programador/)", _Advice for a non-developer_, Spanish only for now). I mentioned that it is important to have and recognize levels of beliefs on your assumptions. Let's follow on an actual example:

<script src="https://gist.github.com/AlphaGit/5b7ca1d64d482ce7a472.js"></script>

As you can see, this code is as simple as it gets, and we somehow have a bug. `2 + 2 = 4`, `0.2 + 0.6 = 0.8`, but `0.2 + 0.7 &ne; 0.89999`. It's supposed to be `0.2 + 0.7 = 0.9`.

_Note:_ As the example is simple, you may know the problem here already. If you do, pretend you have no idea. We're to adopt the position of not knowing what the underlying problem is and methodically figure it out.

We review the code: the code seems correct. There are no suspicious tricks. There are no esoteric operators. There are no unknown constructs. It does what it needs to do and in most cases it works as expected.

Since we reviewed the code and found nothing wrong, but yet there _is_ something wrong, let's then review what we know about the code and our failing scenario:

- Line 1: We're declaring a new function.
- Line 2: `value1` is the first value passed by parameter (will not be read from any other scope)
- Line 2: `value2` is the second value passed by parameter (will not be read from any other scope)
- Line 2: `value1` is a number
- Line 2: `value2` is a number
- Line 2: `+` is used to sum numbers
- Line 2: `+` works correctly for integer numbers
- Line 2: `+` works correctly for decimal numbers
- Line 3: Bracing is correct and the body of the function is not overlapping or including unintended code.
- Lines 5-7: We're calling the same `sum` function that we declared (not other from other scope)
- Lines 5-7: We're passing literal values and not references to variables that contain other unexpected values
- ...
- Line 5: `2 + 2 = 4`
- Line 6: `0.2 + 0.6 = 0.8`
- Line 7: `0.2 + 0.7 &ne; 0.89999`, but rather `0.2 + 0.7 = 0.9`
- ...

You can probably come up with further assumptions, up to the point where you think that the world exists and you're actually there thinking in your existence. You probably didn't need to go that far, but its still a good exercise, unless you fear into doubting yourself into oblivion. Before you start defying existence to the next person you see, let's order this list.

Experience, practice and context will likely give you a level of certainty for each of these assumptions. Also, it will give you insight into more things you can doubt on, where you wouldn't even doubt before. Look at each of these in your list, and ask yourself: "How sure am I really about this?" Give it a number, from 0% being _"I have no idea"_ to 100% being _"The structure of reality depends on this"._ You'll find that for each of the items in the list your answers will have a different number.

Since you know that _the result is incorrect_ and that _if each of your assumptions was right would imply that the result would be correct_, the result being incorrect means that one or many of the assumptions is wrong. (This is pure deductive logic.) Pick the one you're the least certain about and fact-check it.

## Fact checking

This is where you'll get to find out what the source of your bug is and learn at the same time. Design tests that confirm or deny your assumptions. A good experienced developer will think of scenarios that tackle several of them at once and that allow you to break down the problem easily.

For example, running `0.2 + 0.7` on its own in a JavaScript console will give you `0.89999` as an answer, from which you can probably eliminate scoping, syntax, and data types as being the source of the problem, since you've reduced the problem to a much simpler scenario. Notice how I said "probably": if this were to be a dead end, you need to question the validity of this experiment, which is for now just a good assumption.

After several attempts you'll reduce your problem to either being a mistake you've made (in which case you'll know what the fix is), or a bug in the platform you're using.

Continuing with our example, we'd expect `0.2 + 0.7 = 0.9`, and since the platform will always give us `0.8999`, it looks like a bug. Well... it certainly looks like the expected result, but if you're willing to go deep, it's time for us to question if we really know what the platform is supposed to do. Which is just another assumption.

We know `2 + 2 = 4` because we've learned that since very young, but what we're doing is conceptual arithmetic and machines are not conceptual. They are electro-mechanical devices that operate taking input, processing and providing output. As such, `2 + 2` actually becomes the bits `0000 0010` which is then added in the CPU to `000 0010`, which will use a carry device to produce `0000 0100`, which is the 4 we expect.

So in the case of `0.2 +` ... oh! **Epiphany time.** This is the moment where you realize you're about to make sense of the world and defy yourself. Embrace this feeling and cherish it. It's going to be the rest of your career.

How is `0.2` represented in bits? Well, representing integers is easy, but decimals not so much. So now you realize that since JavaScript only has the data type `Number`, it is meant to represent both rational and integer numbers, so **your assumption on how `2 + 2` works is actually wrong**. Now you realize that the language/platform needs to have a way to represent numbers that may or may not fit into a particular memory representation.

### A moment of reflection

Up to this point, you haven't used the internet at all. Not even a reference manual. Not even asked a friend for help. Congratulate yourself for going so far.

At every point in this process is a good idea to look ahead where your train of thought is taking you, because every assumption defied may raise more questions, and answering them may take more time. Remember to use your time and brain resources wisely. Otherwise, you'll burn yourself out trying to figure out a problem.

In our example, you realize that you've reached the point where your next assumption needs to be how the platform in-memory representation of data types works. There are too many variations in here, so it is not a good idea to figure this out on your own. Of course, you could always reverse engineer it by performing tests, but it will not be a good use of your time. If you still don't have access to the internet but do have access to reference materials (like manuals, books or design specifications, which you should), this is the moment to consult them. If you do have access to the internet, this is the moment to look up: "JavaScript Number type in-memory representation".

## Reaching conclusions

No matter how you search, you should find in no time that `Number` is implemented with a floating point representation standard, which is known to have limitations. Reading in detail about it you can perform some more tests and confirm that it is in fact the problem you were looking for.

The greatest part about this is that now you have gained a new piece of knowledge: the way in which the `Number` type works internally. Depending on how deep you go into it you can also learn the full mechanics of _how_ it works. This does not only explain the `0.2 + 0.7` problem, but a whole type of problems that your code has related to using that data type. You can confirm and work on that type of problem.

Knowing and understanding the source of the problem allows you to fix the _type_ of problem instead of the specific symptom altogether, which is a great advantage.

As for you, you are now wiser and more prepared for future code. And you probably didn't even need the internet!

Methodical approach and knowledge management will be the best approaches to solving your problems and learning from them. Every mistake is an opportunity.

### PS: Fixing the problem

How to fix the problem is a completely different approach, to which I may discuss on a future post. However, on this specific example, I can say that the behavior is unavoidable, but the problem is solvable if we reconsider what we consider to be part of the problem. For example, are we using this to display the amount of people in a theater that bought and didn't buy tickets? We can restrict values to be integers, unless we can admit 0.2 people. Are we talking about money? Maybe rounding to 2 or 3 decimals will do, depending on your scenario. Are you working on a calculator? Set a precision limit and work with it, or look for libraries that re-implement data types. Solutions vary according to your needs.
