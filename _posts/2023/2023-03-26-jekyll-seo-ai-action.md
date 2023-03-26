---
excerpt_separator: <!--more-->
title: Jekyll SEO AI Action
subtitle: Using OpenAI's for SEO optimization
categories:
  - Projects
tags:
  - OpenAI
  - GPT-3
  - SEO
  - GitHub Actions
  - Jekyll
  - JavaScript
header:
  image: assets/chemistryskunk.png
  image_description: Chemistry skunk
description: >-
  Exploring OpenAI's GPT-3 models to autogenerate blog post descriptions with
  GitHub Actions.
---


I wanted an excuse to try something with OpenAI's GPT-3 models, and while writing on this blog I realized that most of the pages could have a description autogenerated for them. This seemed like a good fit for a GitHub Action too, so here I explain how I set up my new project [Jekyll SEO AI Action](https://www.github.com/AlphaGit/jekyll-seo-ai-action).

<!--more-->

## OpenAI's GPT

You probably heard about it already, or you just came out from under your rock. If that's the case, welcome! The world is quite different now. There is this thing called Artificial Intelligence that has been becoming more and more powerful, and now can do lots of things that are disrupting society as we know it. There's more to come, so buckle up.

One of the things that they can do while amazing us is content generation, under instructions. One of the emergent properties of this text prediction is, among others, text summarization. As such, I thought of using it to generate a description for my blog posts.

### Natural Language as Input

Amazingly, the best way to instruct a language model to do something aligned with your desired is to... just tell it to do it. Of course, they are not perfect and require a bit of tuning for it to work correctly.

I quickly realized I could tell it something like this to generate descriptions for the blog posts:

> Generate a description to be used in the SEO meta tag for the page. Do not include HTML scripts, or markdown format, just plain text. Keep it under 160 characters. Make it a summarized version of a blog post, in the same language the blog post has. The blog post will be present in YAML and markdown format. For the language detection, ignore the front matter portion of the blogpost. The blog post is present below:
>
> {text of the blogpost}

This worked quite well, except that it did not correctly keep descriptions under 160 characters. [This post from the OpenAI community](https://community.openai.com/t/how-to-get-instruct-series-to-limit-the-output-length/6916) explains quite well the limitations of the model and a few tricks to get it to work.

**Lesson learned #1:** It is difficult to approach a model with a specific task. It is easy to get it close in the task that you want to achieve, but the fine tuning of your instructions is, so far, a trial-and-error process.

Also, having the model process the YAML front matter of the blog post did add a bit of noise into the output. Not only that, but it was innecessarily wasting token processing time (and money).

**Lesson learned #2:** If there's a chance to pre-process the input to the language model for it to be simpler, take it.

In the end, I ended up with this shorter version of the prompt, which worked better:

> Provide exactly 10 words summarizing a blog post provided in markdown format, in the same language as the post. Keep the response without formatting of any kind. 
> ---BLOG POST BEGIN---
> {text of the blogpost}
> ---BLOG POST END---
> 10 word summary:

**Lesson learned #3:** The latest parts of the model input have bigger priority and presence than the rest of the text provided. (Which makes sense, because it's a text completion model.)

All in all,  it makes you think about how Prompt Engineering _really_ is a complex work that needs a certain level of skill. However, it will be very fragile as different models are trained on different datasets, and they keep evolving and changing. My personal prediction is that as large language models keep becoming more powerful, being so specific in your prompt will not matter as much. As for not-so-powerful models, they'll need to provide structure on their prompts (like weights, negative prompts, etc.) to make the results more predictable.

I quickly made a PoC by using OpenAI's playground and its code generation, which also pointed me to the official SDKs to use.

## GitHub Actions

I thought I wanted my posts to be publised into my [blog repository](https://github.com/AlphaGit/alphas-manifesto-blog) as PRs, so that the GitHub actions could run automatically and provide the description completions. If I didn't like them, I could always tweak them before merging the PR and publishing.

After quickly reading through [GitHub Actions documentation](https://docs.github.com/en/actions/creating-actions), I learned that I could have one or two options for it to run natively, which would prevent me from having to setup a Docker container to run it. It also simplified the deploymnet for others, since I could just rely on a certain version of Node.js being available.

### Testing actions

I wrote another PoC in GitHub and was able to test it by setting up a test workflow in my own repository to test my own action. This is a really great way to test it without having to publish any version of it.

All that's needed is your action being defined:

```yaml
# action.yml
name: 'Jekyll SEO Generator'
runs:
  using: 'node16'
  main: 'dist/index.js'

inputs:
  openai-api-key:
    description: 'OpenAI API key'
    required: true
  github-token:
    description: 'GitHub token'
    required: true
```

And then a test workflow referencing the local action:

```yaml
# .github/workflows/test.yml
on: [pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    name: Test Content Generator for Jekyll Pages
    permissions:
      contents: write
      pull-requests: write
    steps:
      - name: Checkout
        uses: actions/checkout@v3
      - name: Run SEO Content AI Generator
        uses: ./
        with:
          openai-api-key: ${{ secrets.OPENAI_API_KEY }}
          github-token: ${{ secrets.GITHUB_TOKEN }}
```

So, all I needed to do was push a new version and update a test branch which was tied to a PR.

Unfortunately, I was not able to find an easy way to setup a test harness for GitHub actions.

### Gotchas

A few gotchas that made the work a bit more difficult than anticipated:

- In Node 16 you're supposed to have `import` and `export` statements, but the GitHub Actions runner does not support them. `require` statements did still give me issues.
- Using `@vercel/ncc` to bundle the code into a single file did not work, as it would not be able to find the dependencies, because it kept using a mixture of `import` and `require` statements. I ended up switching to `esbuild`.
- It took me a lot of effort to properly read the environment variables. It was easier to work with everything as an input and use the `core.getInput` function to read them. Also, I was quite never able to figure out why we have inputs and environment variables, and which is recommended to use for what.
- `jest` needed an experimental flag to work with EcmaScript modules, but that was quite easy to setup. However, mocking modules was a nightmare, and I did not want to setup a lot of dependency injection just for the purposes of testing. I got addicted to the simplicity of `patch` from Python, so unless the productive code actually needs type complexity, I will avoid it and test regardless. You can see how I finally set it up [here](https://github.com/AlphaGit/jekyll-seo-ai-action/blob/main/test/generator.test.js).

**Lesson learned #4:** It was a great idea to build this progressively. Make sure it works and then add the infrastructure pieces, like GitHub actions integration. Otherwise, it would have been very difficult to test I was on the right path.

**Lesson learned #5:** It is very important to design the interactions/situations that a GitHub action will have before developing it.

**Lesson learned #6:** GitHub tokens will allow you to do almost anything in a repository, given that you request the right permissions (action setup).

## Conclusion

I'm quite happy with the result. It's not perfect, but it's a good start. I'm sure I'll be able to improve it over time, and I will as I keep using it myself.

Feel free to look at it and provide any feedback you might have. I'm happy to make it useful to others: [jekyll-seo-ai-action](https://www.github.com/AlphaGit/jekyll-seo-ai-action).

PS: [Watch it in action here!](https://github.com/AlphaGit/alphas-manifesto-blog/pull/21)