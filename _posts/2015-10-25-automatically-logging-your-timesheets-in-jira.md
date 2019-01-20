---
layout: post
excerpt_separator: <!--more-->
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
---

![]({{ site.baseurl }}/assets/GCalToJira.png)

A while ago I explained [how I use Google Calendar as my time-tracking system]({{ site.baseUrl }}{% link _posts/2015-05-19-my-time-tracker-google-calendar.md %}). I did mention, but did not explain, how I made this into an automatic system of timesheets for JIRA, the system some companies I work for use for time tracking. It just involves Google Docs and a little bit of JavaScript.

<!--more-->

## Introduction

Before we start, there are a few things I should mention.

1. You will need access to Google Docs or Google Spreadsheets (which I like better) from the same organization on which you're using Google Calendar. This is for making the authentication process much easier.
1. This is made to work with JIRA's Tempo plugin, which is pretty much the standard for time tracking, but as far as I'm aware, not the only one.
1. This makes use of JIRA's/Tempo's public REST API. As such, that API will have to be publicly exposed to the internet for this to work.

## Setup

With that said, here's in detail how to setup the automated-timesheet filling.

### 1. Creating the spreadsheet / document

**Create a Google spreadsheet or a document** in the same company that's hosting your Google Calendar. If there's no company / domain for it, you can just use your own, if you also use your personal calendar.

Both documents and spreadsheets have everything needed to set this up, but I found it easier to do with spreadsheets since it's going to be simpler to get to the data we need to read from the document.

### 2. Setup your configuration spreadsheet

**Take the first spreadsheet and rename it to "Setup", then fill in the values below. **This will be the configuration that the script will use to know where to load data from, how to authenticate to JIRA, and where to log hours. It should end up looking something like this:

![]({{ site.baseurl }}/assets/TimetrackerSetupSheet.png)


This is what you'll enter in each of these cells:

#### Calendars and tickets

- A1: Just a title, can be anything. I used "Calendar Name".
- A2:A: The name of the calendars that you're using to track your time. It has to be the exact same name you used in Google Calendar when you created it, spaces and all. You can enter as many as you like, as our script will read all of the available rows. There has to be a same amount of rows here as the ticket IDs in column B.
- B1: Just a title, can be anything. I used "JIRA Ticket ID".
- B2:B: The ticket ID from the calendar that will pour its time into. It has to be a ticket to which you have access and to which you can log hours to. You can enter as many as you like, as our script will read all of the available rows. There needs to be a same amount of rows here as the calendars in column A.

#### Dates

- D1: Just a title, can be anything. I used "From"
- E1: A date. You can set its value to today for a first good default. Make sure to use the datetime format that shows the actual time, because it is important it starts at midnight, or you may end up losing hours.
- D2: Just a title, can be anything. I used "To"
- E2:A date. You can set its value to tomorrow for a first good default. Make sure to use the datetime format that shows the actual time, because it is important it starts at midnight, or you may end up losing hours.

#### JIRA configuration

- D3: Just a title, can be anything. I used "JIRA Location".
- E3: The base URL for your company's JIRA location. For example: `http://jira.example.com`. Do not enter a final slash as this may interfere with the scripts in their current form. (They can always be improved to be more flexible.) It doesn't matter if Google Spreadsheets shows it as a link, as long as the value of the cell is that URL it should work for us.
- D4: Just a title, can be anything. I used "JIRA Username"
- E4: Your JIRA username, the same value you use to log into the system.<sup>(1)</sup>
- D5: Just a title, can be anything. I used "JIRA Password"
- E5: Your JIRA password, the same value you use to log into the system. You can give the cell a custom number format of `"*****";"*****";"*****";"*****"` (including quotes) so it will show five asterisks no matter what you entered in the cell.<sup>(1)</sup>

#### Manual Triggers

- Create a rectangle and shape it like a button. I labeled it "< Use Today". This will be the button that resets the dates to today and tomorrow.
- Create another rectangle and also shape it like a button. I labeled it "Run >". This will be the button that runs the scripts manually, for our first tests and any adjustments we need.

#### <sup>(1)</sup>Disclaimer/note

You may have noted that what we're doing here is entering our JIRA credentials in plain text. While Google can be pretty secure, it is in no way recommended that you store passwords this way. However, we need them for JIRA authentication. Encrypting them beforehand will do no good since we're using Basic authentication, which just encodes them in Base64. JIRA supports basic, session and OAuth authentication. Basic and Session both require us to pass the credentials in plain text, OAuth can be more secure but that would make this small script become an app of its own, but it's definitely the safer option. You can read more about them in [JIRA's REST APIs documentation](https://developer.atlassian.com/jiradev/jira-apis/jira-rest-apis). Also, if you're using HTTP instead of HTTPS in your JIRA domain name, the communication between Google and your company servers will be in plain text and it will expose your password as well.

### 3. Code the scripts

Now we need to enter the scripts that will read this information, log into Google Calendar, and read the meetings that happened during the specified time, and for each of those, log into the appropriate ticket in JIRA.

On your spreadsheet, go to Tools &rarr; Script Editor and enter the following:

<script src="https://gist.github.com/AlphaGit/11253803388829d7d051.js"></script>

Save all of the changes and that's done.

### 4. Bind buttons to functions

With this code, we can already bind the proper functions to our "buttons" in the spreadsheet. Right click on them so that they'll show the edit options, and on the menu that pops up at the top right, select "Assign script".

For the "< Use Today" button, use `setDatesToToday`.

For the "Run >" button, use `logHours`.

With these buttons you can run a couple of tests and make sure everything works as it should. If it doesn't, the script editor allows you to run step by step, look at locals, etc. Everything you need for debugging. If an error occurs when you run this through the buttons, you should get an error message that shows some information helpful to troubleshoot.

You should know that while it runs, you don't get much feedback at all. It will just say "Running script" and nothing else. If you pick up a short timeframe, you may see then it will say "Script finished", or "Script error" if that happened. However, with longer timeframes or lots of submission to JIRA, it's going to take a while to run and it will not notify you much. I've found that testing whole days is a sensible time.

### 5. Running it automatically

Now that everything is in place and works, we can set it up to run automatically.

In the script editor, go to Resources &rarr; Current project triggers. Add a new one with the following information:

- Run: `logHoursForToday`
- Events: Time Driven, Day Timer, 7pm to 8pm
- Notifications
    - via email at youremail@example.com
    - daily
    - around 9pm

![]({{ site.baseurl }}/assets/triggers.png)


Of course, you can change the times up to a point where you'll be comfortable having the system run these scripts. If you have emails enabled in JIRA, you may as well be receiving notification of the logged times. If any error occurs, you should get an email, although it will not have much detail and it is up to you to find the problem.

Note that there's not a particular time of day when this will run, but rather a timeframe. I've noticed that even with that, it may go outside of that timeframe, so make sure that there's enough space between the time the event runs and the actual notifications of errors.

### 6. That's it! -- some limitations and considerations

With this, you should have your times being logged automatically into JIRA, assuming that the configuration on your spreadsheet is correct. You can always change it and the functions will pick up the new values the next time they run. There's no need for re-authentication here, unless you change your password, but you have to know about the security implications on that. (See disclaimer above.)

The code is quite simple, and can of course be made a lot better, I just haven't dedicated much more effort into it since it works fine. For example, you could have this log into multiple JIRA instances if you had to do that. Or you could have it parse the calendar entry name in order to detect the particular ticket where it needs to send the time. I've been thinking in having a "clear" button that would clear up a particular day in JIRA so that I can clear a day with wrong information and re-submit it it at once.

This code is free to use and distribute. I would just appreciate if you attributed it back to me, and if you make any improvements, that you let me know so I can improve mine as well.
