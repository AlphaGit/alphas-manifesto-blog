---
title: Alpha's Micrograd in Rust
subtitle: I ported Micrograd to Rust
categories:
  - Projects
  - AI
tags:
  - neural_networks
  - AI
  - project
header:
  image: assets/alpha/SkunkBalls.jpg
  image_description: Neural Network Nodes
description: Some design choices and new things I found out about the language.
excerpt_separator: <!--more-->
---

You might remember that I was doing small applications in Rust to try out the language, learn about it and eventually become a pro at it. That's... in progress. But in the meantime, I'll tell you about which things I'm finishing up and I'm learning.

I ported [Andrej Karpathy's Micrograd](https://github.com/karpathy/micrograd) into Rust, but then I took a few design choices of my own.

<!--more-->

## What is Micrograd?

First of all, Karpathy is an absolute master teacher, okay? He decided to teach how neural network works by just creating one from scratch, line of code by line of code, and explaining every little computation. He starts out with one or two python classes and guides you, line by line, into creating simple, then advanced concepts along with him.

<iframe width="560" height="315" src="https://www.youtube.com/embed/VMj-3S1tku0?si=L78IKab8WiplGak6" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

I thought a guided process like this would be cool to reproduce in Rust, and at the same time create something that I want to use later on in my own projects.

This video goes through the concepts of:

- Creating a class representing a value in a computation graph
- Creating the computation graph
- Calculating differential gradients (in other words: how much a particular value affected the final result)
- Creating special values that can learn and adapt
- Creating neurons out of those values
- Creating layers out of those neurons
- Calculating loss functions (in other words: how wrong the result is)
- Creating a training loop

All of that, from scratch, in an hour and a half.

## Doing it in Rust

It still took me like 2 months to get it done in Rust. Because I rewrote it like 5 times. No AI for this, no sir-ee. I need to learn.

It's not that Rust is difficult, it's that is very strict about its use of memory, and this project is what I needed to go through the so needed "aha!" moments that made me learn how to think in Rust.

### Challenge 1: Forcing no invalid states

The very first thing I struggled with is the definition of the Value, which I later ended up calling `Expr`. The problem with it is that it's meant to have one or two parents (or none), depending on how that value was created in the chain. A numerical value will have no parents. The result of a trigonometric function will have one input, so it will have one parent. A binary operation like addition will have two operands, hence two parents.

I went ahead and modelled three distinct types, and because they would all share the same code (how they could be chained up), I picked up the equivalent of interfaces: traits. I created a trait and applied it to all them and... my life was a mess.

I got stuck at several points in trying to reference this "generic" trait object. No, generics did not work as simple as promised because the type would have variable memory size. The `dyn` keyword required me to size the trait (but I said it was variable!). Unwrapping everything and reconstructing it was unusable because I was consuming every variable.

**Result:** I ended up creating a single model. Yeah, `Option`s everywhere. It's fine. It's technically possible my model has an inconsistent memory state. I compensated that with tests and asserts.

### Challenge 2: References to parents

Rust has this concept of references, which sounded right away like the right thing to use. After all, I'll just save a reference into the expression tree and continue working.

The first problem with it is that the ergonomics for using it would end up a bit weird. The code would end up looking like this:

```rust
let x1 = Expr::new_leaf(1.0, "x1");
let x2 = Expr::new_leaf(2.0, "x2");

// now to sum them!
// THIS IS WRONG, it consumes the values:
// let y = x1 + x2;
let y = &x1 + &x2;
```

Weird, but acceptable. In fact I rolled with this for 3 weeks of my work, but eventually I fell into the borrowing problem: I could construct a graph, but I could *never* mutate those values because references are read-only. And I absolutely need to mutate them if I want the network to learn.

I played around with a concept called **interior mutability**, which basically means: you store it in a container object that will allow you to borrow it for mutation, and you prevent the compiler from complaining, but you can risk panics if you do it wrong in runtime.

I did `Rc<Cell<Expr>>` and got bit by something around memory, can't recall exactly what. I tried `Rc<Expr>` and Rust yelled at me furious. (It was right.) I tried `Box<Rc<Expr>>` and I felt I was going to throw up.

Eventually I found this enlightening video that really explains how these work:

<iframe width="560" height="315" src="https://www.youtube.com/embed/CTTiaOo4cbY?si=a7CkxW80gsIZVsi_" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

**Result:** I ended up writing everything with `Option<Box<Expr>>` and using `.as_mut()`. It wasn't that bad. Multithreading might come to bite me back in the future, but that's future me problem.

This means that you do need to consume the values as you create the tree. You can't win them all.

But the good news is that because `Box<T>` is just a pointer, it's very easy to just setup `clone()` whenever you need one and bam -- moving forward.

Just in cases, I wrote down some tests to make sure that multiple clones are modifying the same underlying data. This indeed works and helps me further understand how Rust models memory.

### Challenge 3: Conversions and numeric types

I wanted users to be able to write some more amicable code, like so:

```rust
let x1 = Expr::new_leaf(1.5, "x1");
let x2 = x1 * 5.0;
```

For a while, I toyed around with the `Into` trait, and I settled with it for a few iterations, but instead my code ended up looking like this:

```rust
let x1 = Expr::new_leaf(1.5, "x1");
let x2 = x1 * 5.0.into();
```

It wasn't a big deal but it looked ugly and difficult to read. So instead I decided to implement the variant of operations traits that take numbers as a side. For example `impl Mul<f64> for Expr`, which would allow you to do it exactly like I wanted.

But these are the operations that have traits:
- `Add` for addition
- `Mul` for multiplication
- `Sub` for subtraction
- `Div` for division

For each, I would need to implement:
- `Trait for Expr` (e.g. `Expr + Expr`)
- `Trait<numericType> for Expr` (e.g. `Expr + number`)
- `Trait<Expr> for numericType` (e.g. `number + Expr`)

And for nice ergonomics I would probably have to do that for EVERY numeric type, integer and decimal.

Screw it. I didn't. Everything is `f64`. Convert your numbers yourself. We'll deal with quantization somewhere in the future.

I toyed around with creating macros for all of these conversions but macros is a whole another world and I don't intend to go into it just yet.

### Challenge 4: Documentation

As I was done, I said to myself: "it would be nice to publish this as a crate". And then I said to myself: "A crate should have documentation." Yes, I played myself into writing docs.

However, [The Rustdoc book](https://doc.rust-lang.org/rustdoc/what-is-rustdoc.html) is a very concise and simple reference to follow, and about in a couple of days I had written all the documentation and made sure it was functional.

Here's a very nice suprise: examples, which are independent programs that cargo can run as simple as:

```rust
cargo run --example backpropagation
```

And all you need to do is create an `examples/backpropagation.rs` file with a `fn main()` on it.

What's better, the documentation in the code allows easy markup and it has runnable examples. The examples in the comments are run by `cargo test`!! How freaking awesome is that?!

No more "the docs will get outdated" thing because if you change your code, the compiler will tell you! Even the ones in `README.md`!!!
## Changes

There are also some aspects that had nothing to do with Rust as a language, but instead had to do with my own preferences. It's my code after all. I do what I want.
### Lambas

At some point I had everything that Karpathy had done himself but I did not like how the code looked like. From the beginning I avoided his use of lambdas for backpropagation. While entirely possible (and would have been a great excuse to learn about `Fn`), it felt unnecessarily complex, and that makes my skin itch.

The only reason he uses lambdas is so he can capture intermediate values from the calculations in order to calculate gradients, but these values are trivial to calculate. Also, the parents are right there to use if needed, so it doesn't matter if we don't calculate things right on instance creation.

### Backpropagation ergonomics

Then, setting an initial gradient and backpropagating from there is one thing I decided to take away in the end. I don't want users to be thinking about gradients, I want them to take my neuron and yell at it: "learn! learn! learn!" so it does.

Indeed, this is the current backpropagation design I settled down for:

```rust
let mut loss = ...; // expression tree that calculates the loss

let learning_rate = 1e-04;
loss.learn(learning_rate);
loss.recalculate();
```

That's it. I then run this in a loop and I've got a readable training cycle.

### Labeling

Karpathy gives a label to every node so he can display it in a graph representation. For a long time I avoided that, but later on, as I needed to grab certain elements from the tree without traversing it step by step, I ended up creating a `find()` function, that takes, you guessed it, a label.

This made sense, I could mark a particular node with a name I want to retrieve later and then go find it.

At this point I really really wish Rust would allow function overloading. I'd love for there to be a version of my function that doesn't take a name (and it generates it), and another version that doesn't. Yes, I know  `Option<T>` is a thing, but calling `.pow(exponent, None)` looks awful. I made it mandatory, so the code is `.pow(exponent, "square_diff")` -- now you know what that's about.

## Publishing

This was the easy part. I just set up some options in `Cargo.toml`, run `cargo login`,  run `cargo publish` and voilà! A crate is public.

My crate is now happily sitting at [Alpha's Micrograd in Rust](https://crates.io/crates/alpha-micrograd-rust) crate, ready to be downloaded and used.

Please do download it and use it! I'd like feedback! Both on how I wrote the library and how usable it is, and how I used Rust.

All of the examples are runnable -- I suggest you start there so you see a couple of neurons learning something (not mine, ha!) and play around with it to build something more complex.

All in all, this was a great experiment, and even fun. I get why Rustaceans are crazy about this language -- and I've barely scratched the surface.