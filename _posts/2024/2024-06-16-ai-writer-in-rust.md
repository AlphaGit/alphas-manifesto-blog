---
title: I wrote an automated blog post writer in Rust
subtitle: Who needs to write anyway
categories:
  - Projects
tags:
  - Projects
  - AI
  - Rust
  - Automation
header:
  image: assets/alpha/commonPartsWide.png
  image_description: Alpha assembling something
description: >-
  Creating an automated blog writer as an excuse to try Rust.
excerpt_separator: <!--more-->
---


I learned Rust and I decided to make something to automate blog post creation with GPT-4o. I'll tell you a bit how that worked out.

<!--more-->

## Disclaimer

No, this blog post is not written with the automatic writer. I might not even use it. While it works and gets good results, I think the effort of editing and adjusting the voice is not worth it. I'd rather write the blog posts myself.

I have tried finetunning without good results so far, but that's a story for another time.

## The objective

On the one hand, I've been learning and experimenting with Rust and wanted something non-trivial to try. Trying this little project helped me use:

- Multiple modules
- Hardcoded `&str` and mutable `String` types
- `async`/`.await` and futures
- Async management with `tokio`
- Logging with `log4rs`
- `dotenvy` for configuration and environment variables
- `cargo` as a build tool (I loved it so far!)

Also, I didn't have any real experience with Rust, and I knew that the compiler rules were a bit more strict than other languages. I wanted to see how that would work out.

## The idea

My writing process is not that impressive. I have a few ideas and a few points that I want to correlate, usually a few different things that I find interesting when put together. What's next is just coming up with a structure that explores those and a conclusion.

It's more or less the same, so I thought it could be automated. The process, automated by a LLM, would be something like this:

- Provide it with a context of the different ideas that I want to explore
- Have it come up with a structure that explores those ideas
- Complete the structure creating titles and paragraphs
- "Edit" the text to create a certain voice: friendly, or detailed, avoiding certain subjects, etc.

## The implementation

The final work is available in my repository: [rust-ai-writer](https://github.com/AlphaGit/rust-ai-writer).

Here's a small overview of its different parts:

- Dependencies
    - `chrono`: just so that I could write a nice timestamp in the resulting file
    - `dotenv`: to load the configuration values from a `.env` file
    - `log` and `log4rs`: for logging
    - `edit`: a small crate that invokes a text editor to edit a string, useful for requesting user feedback (I was _really_ close to getting this to work for myself, but then I found it was implemented as a crate and it was way better than my version.)
    - `openai`: a small crate that wraps the OpenAI API, so I don't have to write the HTTP requests myself
    - `tokio`: for async management
- Modules
    - `config`: loads and exposes configuration values to the rest of the application
    - `input_reader`: reads the input from the user, providing appropriate guidance for each step
    - `openai_client`: small utility to get completions from the OpenAI API
    - `prompt_builder`: builds the prompts for the LLMs, based on the user input
    - `output_writer`: writes the output to a file

## Things I've learned

Working with Rust is enjoyable. Sure, types and the owning of variables are a bit tricky for beginners, but the compiler is helpful and the error messages are really good. Once it works, everything's smooth.

I noticed that most crates are well-documented, and having Rust's guarantee of safety is nice. However, most of them seem to be in a precarious state, like everything is 0.1 or 0.0.1. However, they work quite well, so I'm not complaining.

I'm surprised that there is very little that doesn't require an external crate. However, this might be inexperience on my part. Say, async management, logging, or even reading environment variables. I imagine these can be done with the standard library, but the work involved is not worth it.

## Pending to try

I want to pay more attention to these in my next Rust experiments:

- Modelling only valid scenarios in the code, having the compiler prevent invalid states altogether.
- Using `Result` and `Option` types more effectively, and not just unwrapping them.
- Using `async`/`.await` more effectively. I don't think I did it quite well.
- Testing.

## The result

It works. Meh. I got to use Rust. Yay!

I know I did not make the best code but keep in mind it's my first try with Rust. For any rustaceans that are already experienced, I'd appreciate any feedback. Remember that you can find the code in my repository: [rust-ai-writer](https://github.com/AlphaGit/rust-ai-writer).

## Final notes

No, I don't think automating writing is a good idea. Sure, you can use it as a tool to get started, but what gives your voice and your style is only yours. Write. Write good, or bad, doesn't matter. Don't delegate that to a machine because it takes away the part that makes your writing unique.