---
layout: post
status: publish
published: true
title: Worklogger
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 6419
wordpress_url: https://blog.alphasmanifesto.com/?p=6419
date: '2017-11-11 10:39:02 +0000'
date_gmt: '2017-11-11 16:39:02 +0000'
categories:
- Projects
- Technology
tags:
- open source
- time tracking
- timesheet
- automation
- task automation
- project
- worklogger
comments: []
---
<p style="text-align: justify;">As you may know, part of the daily responsibilities of the software-workers is to log their time. (And many other professions too, I'm sure.) This implies reporting time with a certain level of detail so that our managers (sometimes, ourselves) can properly bill each customer for the work done.</p>
<p style="text-align: justify;">The problem with this is that it is a pretty repetitive task, and not only that, each customer will have requirements of their own, like using their own system for time tracking, to separate the work in tickets, to receive a summary by email, etc.</p>
<p style="text-align: justify;">I created <a href="https://github.com/AlphaGit/worklogger">Worklogger</a> to be a swiss-army-knife solution to these variables.</p>
<p><!--more--></p>
<h2>Some background</h2>
<p style="text-align: justify;">I've always been a fan of automating these menial tasks -- I don't want them to distract me from my daily activities. And furthermore, at some point, I was logging the same work four times because our different customers wanted different systems. It became a task that would take, in average, about 2 hours a week. A lot can be done in 2 hours, but there I was, filling in timesheets.</p>
<p style="text-align: justify;">I decided to create <a href="https://github.com/AlphaGit/worklogger">Worklogger</a> in a configurable fashion, so that not only it was useful to me, but to others who might be in a similar situation. You can check <a href="https://github.com/AlphaGit/worklogger/blob/master/docs/configuration.md">a draft of the configuration in here</a>.</p>
<h2>How it works</h2>
<p style="text-align: justify;">If you know Zappier or IFTTT, you probably already have an idea. It's an input-transformation-output approach, with a few extra additions. Here is a very high-level pseudocode of what the application does:</p>
<pre>// reads worklogs from configured inputs
var worklogs = readWorklogsFrom(configuredInputs);

// applies transformations if the condition for them is met
foreach (var transformation in configuredTransformations) {
&nbsp; &nbsp; foreach (var worklog in worklogs) {
&nbsp; &nbsp; &nbsp; &nbsp; if (transformation.configuredCondition.isSatisfiedBy(worklog) {
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; transformation.applyTo(worklog);
&nbsp; &nbsp; &nbsp; &nbsp; }
&nbsp; &nbsp; }
}

// sends the worklogs to their outputs if the condition for them is met
foreach (var output in configuredOutputs) {
&nbsp; &nbsp; foreach (var worklog in worklogs) {
&nbsp; &nbsp; &nbsp; &nbsp; if (output.configuredCondition.isSatisfiedBy(worklog) {
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; output.send(worklog);
&nbsp; &nbsp; &nbsp; &nbsp; }
&nbsp; &nbsp; }
}</pre>
<p style="text-align: justify;">If you could read this, you've already been introduced to several concepts that the system uses. Still, an explanation is useful:</p>
<h3>Inputs</h3>
<p style="text-align: justify;">Inputs are where the worklogs originate&nbsp;from. After all, you need to start somewhere, right? It might be a JIRA worklog, a timetracker output file, or a manual input. I currently use <a href="https://blog.alphasmanifesto.com/2015/05/19/my-time-tracker-google-calendar/">Google Calendar as my timetracker</a>, and that is supported too.</p>
<p style="text-align: justify;">Currently supported:</p>
<ul>
<li style="text-align: justify;"><strong>Google Calendar</strong>: reads entries from a Google account, supporting several calendars at a time</li>
</ul>
<h3>Conditions</h3>
<p style="text-align: justify;">Conditions are just filters, because sometimes you don't want everything to go to the same place. This makes sense: you may be working for different customers and the billing information for one has nothing to do with the second customer. Conditions will allow you to apply transformations or send worklogs to outputs only if they match the condition.</p>
<p style="text-align: justify;">Currently supported:</p>
<ul>
<li style="text-align: justify;"><strong>true</strong>: Mostly used internally, but this condition will evaluate to true for all worklogs. It means it won't be filtering anything.</li>
<li><strong>hasTag</strong>: Used to filter worklogs that have a particular tag, or for which the tag has a certain value.</li>
</ul>
<h3>Transformations</h3>
<p style="text-align: justify;">Transformations will mostly modify worklogs, which will allow you to properly filter them in the outputs. Think of transformations as any massaging you need to do to the data before it goes out.</p>
<p style="text-align: justify;">Currently supported:</p>
<ul>
<li style="text-align: justify;"><strong>addTags</strong>: will add tags to the worklogs, with a fixed value or extracting some text from the worklog text</li>
</ul>
<h3>Outputs</h3>
<p style="text-align: justify;">Outputs will send your resulting worklogs to wherever you need them. Of course, they can be filtered too. Outputs may be tied to several formatters too -- formatters will prepare the worklogs in a way that the output can use it. For instance, you may think of email as an output, but different formats for the email (like summary or detail) being generated by different formatters.</p>
<p style="text-align: justify;">Currently supported:</p>
<ul>
<li style="text-align: justify;"><strong>TextFile:</strong> sends details for the worklogs to a text file.
<ul>
<li><strong>SummaryTextFileFormatter:</strong> generates a summary of the worklogs, and can group them by several levels and generate totals</li>
</ul>
</li>
<li style="text-align: justify;"><strong>HarvestApp:</strong> sends worklogs as time entries in <a href="https://harvestapp.com/">HarvestApp.com</a></li>
<li style="text-align: justify;"><strong>JiraWorklog:</strong> sends worklogs as ... well, worklogs (they use the same name too) in JIRA. Notice this is slightly different as what the JIRA Tempo plugin uses.</li>
<li style="text-align: justify;"><strong>Logger:</strong> will output the contents to the logger, in whatever way it is configured (useful for debugging and an output of the execution)</li>
</ul>
<h2>How I use it</h2>
<p style="text-align: justify;">I've got two customers. One of them wants the information in HarvestApp and the other one wants, in addition, worklogs sent to their own JIRA instance. At the same time, I want an output of what was sent (to ensure everything works fine) and I want to get a summary for my whole month, so I can bill these customers.</p>
<p>As such, I have two configuration files: one that is used daily to send the worklogs to their destination, and one that runs monthly to get the summary to me. I execute them with a cron job like so:</p>
<p><script src="https://gist.github.com/AlphaGit/1ea8316e6f585ba42a73d8b4444a148d.js"></script></p>
<p style="text-align: justify;">This will:</p>
<ul>
<li style="text-align: justify;">Log hours each day at noon, so that I have enough time from the day before and during this day to adjust the calendar in the right way
<ul>
<li>Send Client1 hours to their JIRA instance, using the JiraTicket tag, that I extract from the description. So a calendar entry "[ABC-123] Working" with half an hour duration becomes a half an hour worklog in ticket ABC-123. I filter this output to only those entries that have the client tag set to Client1.</li>
<li>Send Client2 + Client1 entries to Harvest, so no filter there. I use the HarvestProject and HarvestTask tags to set the right project and task assigned to me.</li>
<li>I also use the logger output because the results of the execution are sent to me by email, so I can properly double check what was generated.</li>
</ul>
</li>
<li>Log hours every month's first day at 8 AM.
<ul>
<li style="text-align: justify;">It also uses the Logger output so I can see the results in my email.</li>
<li style="text-align: justify;">It uses a TextFile output (should be email really, but I haven't coded that yet) that will summarize the results and aggregate totals by client, project and JIRA ticket.</li>
</ul>
</li>
</ul>
<h2>Future of Worklogger</h2>
<p style="text-align: justify;">Since I've got the basics of what I personally needed, I do not plan on working heavily on it anymore. However, pressure from the community or might change that (I love to help). Also, I designed it in a way so that it can be adapted to new scenarios, so I plan on continuing usage for it and modifying it as I need it.</p>
<p style="text-align: justify;">Most of my ideas that didn't make it into my very-basic version are in the <a href="https://github.com/AlphaGit/worklogger/issues">issues listing for the project</a>. Of course, contributions are heartwarmingly welcome. I did mark which issues could be easier for newcomers (<a href="https://github.com/AlphaGit/worklogger/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22">good-first-issue</a> and <a href="https://github.com/AlphaGit/worklogger/issues?q=is%3Aissue+is%3Aopen+label%3A%22help+wanted%22">help-wanted</a>&nbsp;tags), and I have also marked which items should be more important for an official 1.0 release (<a href="https://github.com/AlphaGit/worklogger/milestone/1">v1.0</a> milestone).</p>
<p style="text-align: justify;">Feel free to look around and leave questions, ideas, suggestions or complaints.</p>
