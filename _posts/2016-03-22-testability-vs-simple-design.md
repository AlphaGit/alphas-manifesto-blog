---
layout: post
status: publish
published: true
title: Testability vs. simple design
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5574
wordpress_url: https://blog.alphasmanifesto.com/?p=5574
date: '2016-03-22 20:21:31 +0000'
date_gmt: '2016-03-23 01:21:31 +0000'
categories:
- Technology
tags:
- testing
- ".NET"
- C#
- Microsoft
- design
- unit testing
- dependencies
- classes
- coupling
- Fakes Assemblies
- MSTest
comments:
- id: 29294
  author: Mariano Ravinale
  author_email: mravinale@gmail.com
  author_url: ''
  date: '2016-03-23 06:46:31 +0000'
  date_gmt: '2016-03-23 11:46:31 +0000'
  content: "Thanks for sharing!\r\n\r\nIn my humble oppinion good code following SOLID
    principles rarely needs to use this kind of tools.\r\nIn special occasions when
    you have bad design and/or coupled objects and you need a refactor (and cover
    your back), you'll need to do integration tests or make use of special tools like
    you mentioned\r\n\r\n it reminds me when I had to test an assembly with static
    clases :( I needed special tool for doing that since static clases are enemies
    as well of uni testing more info: http://programmers.stackexchange.com/questions/5757/is-static-universally-evil-for-unit-testing-and-if-so-why-does-resharper-recom"
- id: 29298
  author: Alpha
  author_email: alphagma@gmail.com
  author_url: http://www.alphasmanifesto.com/
  date: '2016-03-23 07:01:54 +0000'
  date_gmt: '2016-03-23 12:01:54 +0000'
  content: "Great feedback, thanks!\r\n\r\nI had only personally heard about JustMock,
    but as the question says, this is not a free tool and that can sometimes impede
    progress towards that direction.\r\n\r\nI also agree with you that the design
    should allow for tests. Again, I think tests are still part of your requirements
    (even if not functional) and they should be considered part of the design.\r\n\r\nThanks!"
---

![]({{ site.baseurl }}/assets/arrow.jpg)

Testing requires decoupling


You may know I'm a proponent for simplicity. I believe that if a particular feature can be achieved with a single `if` statement, then that's all that needs to be done. I'm also a proponent of testability, that all code should be easily testable so that we can make sure that it works. As it turns out, these two don't usually go hand in hand. (Spoiler alert: that's not true.)

<!--more-->

What's wrong with this code? (Aside from the poor naming.)

### Example 1: Coupled classes

<script src="https://gist.github.com/AlphaGit/303e5763c6d2f6f03dce.js"></script>

If you said "coupling", you're onto it. (But don't give yourself too much credit -- I saw you read it from the title.) However, that makes the code simple, doesn't it? It is clear what class is being used. It is clear what's doing with the data, and furthermore, it is clear which is the scope of the values that `Producer` generates. Really, this is as simple as it could be. And this is good!

But then, how do you test this class? `Producer` is very coupled to `Consumer`. This means that every time that you use `Consumer`, even in unit tests, it'll come attached to a instance of the `Producer` class.

Let's go ahead and decouple them:

### Example 2: Decoupled classess

<script src="https://gist.github.com/AlphaGit/3012634ea3085fe80ccc.js"></script>

The changes in `Producer` are almost none. That's good. There is a new interface lying around.  Now we can test with mocks instead of the actual `Producer` class, and we have full control of the environment in which `Consumer` is executed. Plus, we decreased decoupling, which means that further changes to this system are more flexible. Good, pat yourself on the back.

## Did you spot the difference?

There's a huge difference between the first and the second example. They are not functionally equivalent.

In the first one, the method always creates a new instance of the `Producer` class, while in the second, the injection preserves an instance and reuses it. This could be a problem if the instance is meant to be discarded, or disposed.

Let's make the code in a functionally equivalent approach. Since we don't need an instance, what we need is a reference to the class, i.e., a type.

### Example 3:Decoupled by types

<script src="https://gist.github.com/AlphaGit/11fc6d69a1d20b30fa2e.js"></script>

Ok, so now the code is functionally equivalent. But the design doesn't properly reflect that you can only pass a `Producer` type, but it rather checks it at runtime. That usually is poor design. Then,  you need to activate instances, which is not a big deal, but it does require strange code compared to a simple `new`. And finally, it looks awful. It's a lot of code for what was before just 3 lines.

## Points of view: YAGNI

Most people will say "YAGNI", which stands for "You ain't gonna need it". This is a usual principle that when applied, means that you should not over-engineer something for the sake of some feature or flexibility you're not using. In this case, our flexibility to pass different types, since we only need one.

However, you could say that we _do need_ that flexibility, for testing. It may not be a functional requirement, but testing may be considered a non-functional requirement, or even a development requirement in which you need to be able to test different behaviors for your classes' dependencies.

## Points of view: KISS

Another famous acronym: KISS ("Keep it simple, stupid"). Yup, you should go for the simplest one that you need.

But if you need to test, then should you go for the third option? How's that simple? Or maybe, that just as simple as it needs to be?

## Points of view: tests are still code

The point of a design is to allow code to play together and create the results that we want them too. The initial coupling that we had in example 1 was nice for a simple implementation. But if you try to test it, we come down this path of discussion.

But **tests are still part of your codebase**, and you need to account for them in your design. This becomes increasingly important when you actually need your tests to perform changes, to fix bugs, or to verify how something works. Really, <a href="https://blog.alphasmanifesto.com/2015/03/30/how-tdd-pays-off/">it pays off</a>.

## An approach: Microsoft Fakes Assemblies

Let's say that you want to keep example 1, for its simplicity and easiness of maintenance. Or maybe you can't change it at all because it's legacy code. How would you test it? Microsoft came up with something called **Fake Assemblies**. This is how you would use it to test this.

<script src="https://gist.github.com/AlphaGit/0a9f0fcfc2a947e8a481.js"></script>

Microsoft Fakes Aseemblies allows you to control instantiation, invocation and even internal behavior of the classes of a particular assembly. You can reference any assembly, and it gives you a bunch of `Shim` classes to control them.

This is completely violating encapsulation and inheritance principles. You shouldn't be able to do this in a program design. But this is test design, right? Maybe this is forgivable?

### Is it forgivable?

Nah, not really. It is understandable if you can't use another approach. Maybe the code is not yours. Maybe changing it is risky. Maybe you don't even have access to the code. (`DateTime.Now` messing up unit tests is the best example I can think so far.)

So this is and will always be an option, but I err on the side of a good, decoupled design.

> With great power, comes great responsibility.
> -- A spider's uncle

This kind of approach would allow you to test your code and still create a highly coupled, dependent, and even spaghetti code. You would be able to test even the worst of codes, by just breaking it into pieces and then unit testing even its private members. While this is definitely something helpful, it also could become a louse excuse to write messy code in the first place. Be wary about this power.

Let me know what you think! Do you agree with me? If you don't, tell me why.
