---
title: 5 things we can learn from OpenAI's use of tools
subtitle: A new leak tells us about how to properly code agents
categories:
  - AI
tags:
  - artificial intelligence
  - projects
  - agentic AI
  - best practices
  - tools
  - MCP
  - OpenAI
  - ChatGPT
header:
  image: assets/alpha/Inbox.png
  image_description: Delivery!
description: A new leak tells us about how to properly code agents
excerpt_separator: <!--more-->
---

On December 12th 2025, a tweet demonstrated that ChatGPT would deliver files from its home directory when asked.

Beyond security concerns, what does this reveal about OpenAI's use of tools and agents for GPT 5.2 Thinking?

---

## What was leaked?

The original tweet:

<blockquote class="twitter-tweet" data-dnt="true"><p lang="en" dir="ltr">cool <a href="https://t.co/gBY1fLJt8y">pic.twitter.com/gBY1fLJt8y</a></p>&mdash; vas (@vasuman) <a href="https://twitter.com/vasuman/status/1999551563484762449?ref_src=twsrc%5Etfw">December 12, 2025</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

Related: [Hijacking OpenAI’s Browsing Agent via the Chrome URL Bar](https://almogshoshan.dev/security/openai-browsing-agent/), where they also gain access to the filesystem through the “Take it from here" feature.

Along with this, we’ve got the extracted GPT 5.2 system prompt:

<blockquote class="twitter-tweet" data-dnt="true"><p lang="en" dir="ltr">GPT-5.2-Thinking system prompt (excl Tools)<br><br>I'm reasonably confident that this is about 90-95% accurate as different prompts give me the same answer with minor wording changes.<br><br>---<br>You are ChatGPT, a large language model trained by OpenAI.<br>Knowledge cutoff: 2025-08<br>Current… <a href="https://t.co/onxM7moOkH">pic.twitter.com/onxM7moOkH</a></p>— Wyatt Walls (@lefthanddraft) <a href="https://twitter.com/lefthanddraft/status/1999665144071356812?ref_src=twsrc%5Etfw">December 13, 2025</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

The exploit is real, and I have confirmed it personally ([proof](https://chatgpt.com/share/694ff820-bb18-8005-bf16-ad24fbfebe98)). For the moment, I will not be distributing those contents (I'm unsure where that sits legally), but you're free to take the same steps if you'd like to review its contents.

The tools included in that folder are:

- `share/slides` directory, with tools to work with presentations, including [pptxgenjs](https://gitbrent.github.io/PptxGenJS/), an open source library to build power point presentations with JavaScript instrumentation, and several custom-developed python scripts to create montage of multiple images, to extract PNG files from different image formats, or even PDFs, to extract PNG files from PowerPoint presentations, sometimes through PDF fallback using LibreOffice and pdf2image, and to detect content overflow in PowerPoint presentations, outputting the result as readable text in the terminal.
- A `skills` directory that allows skills and tools to work with documents, PDFs and spreadsheets:
    - `docs`: A directory including a Python script that can translate docx documents into PNG files and a skill.md markdown file explaining how to use that tool. It indicates to use soffice to convert DOCX to PDF, then pdftoppm to convert PDF to PNG, to use python-docx to create document files, and then go back to PDF→PNG to inspect the result.
    - `pdfs`: A directory with a skill.md markdown file explaining what tools to use for PDF manipulation. Most of it talks about going back to PNG files for inspection, and then using [pdfplumber](https://github.com/jsvine/pdfplumber), [reportlab](https://www.reportlab.com/), [pypdf](https://github.com/py-pdf/pypdf), and [pyMuPDF](https://pymupdf.readthedocs.io/en/latest/) for constructing and manipulating them.
    - `spreadsheets`: A directory with a skill for constructing and manipulating spreadsheets. This one is more convoluted, as it contains a description of formulas available and how to use them, how to use the artifact_tool (which I couldn’t find publicly) to create them programatically, and several labelled examples of how to create spreadsheets (using that tool) with various specifications.

## What can we learn from OpenAI?

Here’s the approach to independent thinking agents and their tool usage:

### 1. Rely on a good, known and controlled tool

In this case, it’s the model that can inspect PNG files and extract knowledge from them. Most of the inspections, both for text and for visual presentations, are put into the capacity of such a model to understand those inspections and provide a text version of things that need to be fixed.

This is why all of the tools provide a way to bring back their main “asset” to PNG (even if it takes multiple steps) so that it can be later inspected.

Of course, this approach works in a loop: make modifications, then inspect the results, create feedback to fix any issues, re-do changes, re-do inspections, etc, until it all reaches a point where the “reviewer” is happy with the result.

### 2. Separate skills into documented, exemplified subsystems

Each “tool” or skill has to have a fully documented process on how to work with that. This is the approach taken for document, spreadsheet, powerpoint and PDF modifications. Each of them explain how to make the desired changes, and how to wrap up those changes to go back to the original tool.

In the case of spreadsheets, even pre-built examples were present, because of the multiple combinations of capabilities, but mostly so that the agent doesn’t have to reason from scratch how to do common tasks. Examples that were present included the creation of charts, changing fonts, setting borders, etc.

A similar approach is in the PDF modification section, where the document specifies not only which tool to use, but actually how to call it, including command line parameters and everything. Which leads me to…

### 3. Avoid having the agent think in low-level details (tools, again)

If possible, avoid having the agent think about every little detail. Instead, have pre-built tools that the agent can invoke with desired outcomes, and the tool operates by itself. These tools do not need to be sophisticated – Python scripts, bash scripts (related post: [What if you don’t need MCP at all?](https://mariozechner.at/posts/2025-11-02-what-if-you-dont-need-mcp/)). They just need to be flexible so that the command line is enough to operate them.

Related to this, in the prompt specify when the tools should be used, and what the limitations of these tools are. The agent should know correctly when to call them and for what.

### 4. Discourage the agent from using intuition

The agent becomes an intelligent orchestrator of the available tools. The prompt very much tells it to be careful with interpretations, prevent responses from memory and instead use tools to verify the answers before outputting them.

### 5. Always work in iterations, include a final verification round

The agent is going to be “tempted” to make a last final modification (even if not small) and call the effort done. After all, why would it doubt itself? This means that the result might be entirely wrong due to a mistake, so there must always be a final verification round before the agent can finally deliver the finished task.

But also, the agent should not try to finish the task in a single pass. Rather, it should create and execute a plan which can be divided into multiple subtasks. This is because each subtask can then be executed and verified before moving forward, reducing the possibility of huge drift in mistakes.

## Conclusion

Code your agents like people who can “do”, but they don’t “know”. Give them tools, give them resources, let them iterate.
