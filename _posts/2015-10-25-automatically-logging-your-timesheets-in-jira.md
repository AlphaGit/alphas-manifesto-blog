---
layout: post
status: publish
published: true
title: Automatically logging your timesheets in JIRA
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5360
wordpress_url: http://blog.alphasmanifesto.com/?p=5360
date: '2015-10-25 16:22:17 +0000'
date_gmt: '2015-10-25 21:22:17 +0000'
categories:
- Projects
tags:
- script
- Google Calendar
- JIRA
- timesheet
- automation
- Google Sheets
- ticket
comments: []
---

![](/assets/GCalToJira.png)

<p style="text-align: justify;">A while ago I explained <a href="https://blog.alphasmanifesto.com/2015/05/19/my-time-tracker-google-calendar/">how I use Google Calendar as my time-tracking system</a>. I did mention, but did not explain, how I made this into an automatic system of timesheets for JIRA, the system some companies I work for use for time tracking. It just involves Google Docs and a little bit of JavaScript.</p>
<p><!--more--></p>
<h2>Introduction</h2>
<p style="text-align: justify;">Before we start, there are a few things I should mention.</p>
<ol>
<li style="text-align: justify;">You will need access to Google Docs or Google Spreadsheets (which I like better) from the same organization on which you're using Google Calendar. This is for making the authentication process much easier.</li>
<li style="text-align: justify;">This is made to work with JIRA's Tempo plugin, which is pretty much the standard for time tracking, but as far as I'm aware, not the only one.</li>
<li style="text-align: justify;">This makes use of JIRA's/Tempo's public REST API. As such, that API will have to be publicly exposed to the internet for this to work.</li>
</ol>
<h2>Setup</h2>
<p>With that said, here's&nbsp;in detail&nbsp;how to setup the automated-timesheet filling.</p>
<h3>1. Creating the spreadsheet / document</h3>
<p style="text-align: justify;"><strong>Create a Google spreadsheet or a document</strong> in the same company that's hosting your Google Calendar. If there's no company / domain for it, you can just use your own, if you also use your personal calendar.</p>
<p style="text-align: justify;">Both documents and spreadsheets have everything needed to set this up, but I found it easier to do with spreadsheets since it's going to be simpler to get to the data we need to read from the document.</p>
<h3>2. Setup your&nbsp;configuration spreadsheet</h3>
<p style="text-align: justify;"><strong>Take the first spreadsheet and rename it to "Setup", then fill in the values below.&nbsp;</strong>This will be the configuration that the script will use to know where to load data from, how to authenticate to JIRA, and&nbsp;where to log hours. It should end up looking something like this:</p>

![](/assets/TimetrackerSetupSheet.png)

<p style="text-align: justify;">This is what you'll enter in each of these cells:</p>
<h4>Calendars and tickets</h4>
<ul>
<li>A1: Just a title, can be anything. I used "Calendar Name".</li>
<li>A2:A: The name of the calendars that you're using to track your time. It has to be the exact same name you used in Google Calendar when you created it, spaces and all. You can enter as many as you like, as our script will read all of the available rows. There has to be a same amount of rows here as the ticket IDs in column B.</li>
<li>B1: Just a title, can be anything. I used "JIRA Ticket ID".</li>
<li>B2:B: The ticket ID from the calendar that will pour its time into. It has to be a ticket to which you have access and to which you can log hours to. You can enter as many as you like, as our script will read all of the available rows. There needs to be a same amount of rows here as the calendars in column A.</li>
</ul>
<h4>Dates</h4>
<ul>
<li>D1: Just a title, can be anything. I used "From"</li>
<li>E1: A date. You can set its value to today for&nbsp;a first good default. Make sure to use the datetime format that shows the actual time, because it is important it starts at midnight, or you may end up losing hours.</li>
<li>D2: Just a title, can be anything. I used "To"</li>
<li>E2:A date. You can set its value to tomorrow for a first good default. Make sure to use the datetime format that shows the actual time, because it is important it starts at midnight, or you may end up losing hours.</li>
</ul>
<h4>JIRA configuration</h4>
<ul>
<li>D3: Just a title, can be anything. I used "JIRA Location".</li>
<li>E3: The base URL for your company's JIRA location. For example: <code>http://jira.example.com</code>. Do not enter a final slash as this may interfere with the scripts in their current form. (They can always be improved to be more flexible.) It doesn't matter if Google Spreadsheets shows it as a link, as long as the value of the cell is that URL it should work for us.</li>
<li>D4: Just a title, can be anything. I used "JIRA Username"</li>
<li>E4: Your JIRA&nbsp;username, the same value you use to log into the system.<sup>(1)</sup></li>
<li>D5: Just a title, can be anything. I used "JIRA Password"</li>
<li>E5: Your JIRA password, the same value you use to log into the system. You can give the cell a custom number format of&nbsp;<code>"*****";"*****";"*****";"*****"</code>&nbsp;(including quotes) so it will show five asterisks no matter what you entered in the cell.<sup>(1)</sup></li>
</ul>
<h4>Manual Triggers</h4>
<ul>
<li>Create a rectangle and shape it like a button. I labeled it "< Use Today". This will be the button that resets the dates to today and tomorrow.</li>
<li>Create another rectangle and also shape it like a button. I labeled it "Run >". This will be the button that runs the scripts manually, for our first tests and any adjustments we need.</li>
</ul>
<h4 style="text-align: justify;"><sup>(1)</sup>Disclaimer/note</h4>
<p style="text-align: justify;">You may have noted that what we're doing here is entering our JIRA credentials in plain text. While Google can be pretty secure, it is in no way recommended that you store passwords this way. However, we need them for JIRA authentication. Encrypting them beforehand will do no good since we're using Basic authentication, which just encodes them in Base64.&nbsp;JIRA supports basic, session and OAuth authentication. Basic and Session both require us to pass the credentials in plain text, OAuth can be more secure but that would make this small script become an app of its own, but it's definitely the safer option. You can read more about them&nbsp;in <a href="https://developer.atlassian.com/jiradev/jira-apis/jira-rest-apis">JIRA's REST APIs documentation</a>. Also, if you're using HTTP instead of HTTPS in your JIRA domain name, the communication between Google and your company servers will be in plain text and it will expose your password as well.</p>
<h3>3. Code the scripts</h3>
<p style="text-align: justify;">Now we need to enter the scripts that will read this information, log into Google Calendar, and read the meetings that happened during the specified time, and for each of those, log into the appropriate ticket in JIRA.</p>
<p style="text-align: justify;">On your spreadsheet, go to Tools &rarr;&nbsp;Script Editor and enter the following:</p>
<p><script src="https://gist.github.com/AlphaGit/11253803388829d7d051.js"></script></p>
<p style="text-align: justify;">Save all of the changes and that's done.</p>
<h3>4. Bind buttons to functions</h3>
<p style="text-align: justify;">With this code, we can already&nbsp;bind the proper functions to our "buttons" in the spreadsheet. Right click on them so that they'll show the edit options, and on the menu that pops up at the top right, select "Assign script".</p>
<p style="text-align: justify;">For the "< Use Today" button, use&nbsp;<code>setDatesToToday</code>.</p>
<p style="text-align: justify;">For the "Run >" button, use <code>logHours</code>.</p>
<p style="text-align: justify;">With these buttons you can run a couple of tests and make sure everything works as it should. If it doesn't, the script editor allows you to run step by step, look at locals, etc. Everything you need for debugging. If an error occurs when you run this through the buttons, you should get an error message that shows some information helpful to troubleshoot.</p>
<p style="text-align: justify;">You should know that while it runs, you don't get much feedback at all. It will just say "Running script" and nothing else. If you pick up a&nbsp;short timeframe, you may see then it will say "Script finished", or "Script error" if that happened. However, with longer timeframes or lots of submission to JIRA, it's going to take a while to run and it will not notify you much. I've found that testing whole days is a sensible time.</p>
<h3>5. Running it&nbsp;automatically</h3>
<p style="text-align: justify;">Now that everything is in place and works, we can set it up to run automatically.</p>
<p style="text-align: justify;">In the script editor, go to Resources &rarr;&nbsp;Current project triggers. Add a new one with the following information:</p>
<ul>
<li style="text-align: justify;">Run: <code>logHoursForToday</code></li>
<li style="text-align: justify;">Events: Time Driven, Day Timer, 7pm to 8pm</li>
<li>Notifications
<ul>
<li style="text-align: justify;">via email at youremail@example.com</li>
<li style="text-align: justify;">daily</li>
<li style="text-align: justify;">around 9pm</li>
</ul>
</li>
</ul>

![](/assets/triggers.png)

<p style="text-align: justify;">Of course, you can change the times up to a point where you'll be comfortable having the system run these scripts. If you have emails enabled in JIRA, you may as well be receiving notification of the logged times. If any error occurs, you should get an email, although it will not have much detail and it is up to you to find the problem.</p>
<p style="text-align: justify;">Note that there's not a particular time of day when this will run, but rather a timeframe. I've noticed that even with that, it may go outside of that timeframe, so make sure that there's enough space between the time the event runs and the actual notifications of errors.</p>
<h3>6. That's it! -- some limitations and considerations</h3>
<p style="text-align: justify;">With this, you should have your times being logged automatically into JIRA, assuming that the configuration on your spreadsheet is correct. You can always change it and the functions will pick up the new values the next time they run. There's no need for re-authentication here, unless you change your password, but you have to know about the security implications on that. (See disclaimer above.)</p>
<p style="text-align: justify;">The code is quite simple, and can of course be made a lot better, I just haven't dedicated much more effort into it since it works fine.&nbsp;For example, you could have this log into multiple JIRA instances if you had to do that. Or you could have it parse the calendar entry name in order to detect the particular ticket where it needs to send the time. I've been thinking in having a "clear" button that would clear up a particular day in JIRA so that I can clear a day with wrong information and re-submit it it at once.</p>
<p style="text-align: justify;">This code is free to use and distribute. I would just appreciate if you attributed it back to me, and if you make any improvements, that you let me know so I can improve mine as well.</p>
