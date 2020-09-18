---
layout: post
excerpt_separator: <!--more-->
title: Automatically logging your timesheets in JIRA
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
sub_title: Having the tedious work done for you
---

![]({{ site.baseurl }}/assets/GCalToJira.png)

A while ago I explained [how I use Google Calendar as my time-tracking system]({{ site.baseUrl }}{% link _posts/2015/2015-05-19-my-time-tracker-google-calendar.md %}). I did mention, but did not explain, how I made this into an automatic system of timesheets for JIRA, the system some companies I work for use for time tracking. It just involves Google Docs and a little bit of JavaScript.

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

**Take the first spreadsheet and rename it to "Setup", then fill in the values below.** This will be the configuration that the script will use to know where to load data from, how to authenticate to JIRA, and where to log hours. It should end up looking something like this:

![]({{ site.baseurl }}/assets/TimetrackerSetupSheet.png)

This is what you'll enter in each of these cells:

#### Calendars and tickets

- `A1`: Just a title, can be anything. I used _"Calendar Name"_.
- `A2:A`: The name of the calendars that you're using to track your time. It has to be the exact same name you used in Google Calendar when you created it, spaces and all. You can enter as many as you like, as our script will read all of the available rows. There has to be a same amount of rows here as the ticket IDs in column `B`.
- `B1`: Just a title, can be anything. I used _"JIRA Ticket ID"_.
- `B2:B`: The ticket ID from the calendar that will pour its time into. It has to be a ticket to which you have access and to which you can log hours to. You can enter as many as you like, as our script will read all of the available rows. There needs to be a same amount of rows here as the calendars in column A.

#### Dates

- `D1`: Just a title, can be anything. I used _"From"_.
- `E1`: A date. You can set its value to today for a first good default. Make sure to use the datetime format that shows the actual time, because it is important it starts at midnight, or you may end up losing hours.
- `D2`: Just a title, can be anything. I used _"To"_.
- `E2`: A date. You can set its value to tomorrow for a first good default. Make sure to use the datetime format that shows the actual time, because it is important it starts at midnight, or you may end up losing hours.

#### JIRA configuration

- `D3`: Just a title, can be anything. I used _"JIRA Location"_.
- `E3`: The base URL for your company's JIRA location. For example: `http://jira.example.com`. Do not enter a final slash as this may interfere with the scripts in their current form. (They can always be improved to be more flexible.) It doesn't matter if Google Spreadsheets shows it as a link, as long as the value of the cell is that URL it should work for us.
- `D4`: Just a title, can be anything. I used _"JIRA Username"_.
- `E4`: Your JIRA username, the same value you use to log into the system.<sup>(1)</sup>
- `D5`: Just a title, can be anything. I used _"JIRA Password"_.
- `E5`: Your JIRA password, the same value you use to log into the system. You can give the cell a custom number format of `"*****";"*****";"*****";"*****"` (including quotes) so it will show five asterisks no matter what you entered in the cell.<sup>(1)</sup>

#### Manual Triggers

- Create a rectangle and shape it like a button. I labeled it _"< Use Today"_. This will be the button that resets the dates to today and tomorrow.
- Create another rectangle and also shape it like a button. I labeled it _"Run >"_. This will be the button that runs the scripts manually, for our first tests and any adjustments we need.

#### <sup>(1)</sup>Disclaimer/note

You may have noted that what we're doing here is entering our JIRA credentials in plain text. While Google can be pretty secure, it is in no way recommended that you store passwords this way. However, we need them for JIRA authentication. Encrypting them beforehand will do no good since we're using Basic authentication, which just encodes them in Base64. JIRA supports basic, session and OAuth authentication. Basic and Session both require us to pass the credentials in plain text, OAuth can be more secure but that would make this small script become an app of its own, but it's definitely the safer option. You can read more about them in [JIRA's REST APIs documentation](https://developer.atlassian.com/jiradev/jira-apis/jira-rest-apis). Also, if you're using HTTP instead of HTTPS in your JIRA domain name, the communication between Google and your company servers will be in plain text and it will expose your password as well.

### 3. Code the scripts

Now we need to enter the scripts that will read this information, log into Google Calendar, and read the meetings that happened during the specified time, and for each of those, log into the appropriate ticket in JIRA.

On your spreadsheet, go to Tools &rarr; Script Editor and enter the following:

```js
function logHoursForToday() {
  setDatesToYesterday();
  var options = readOptions();
  logHours(options);
}

function setDatesToYesterday() {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName("Setup");

  // based on https://developers.google.com/adwords/scripts/docs/features/dates#creating_a_date_object_from_a_formatted_date_string
  var today = new Date();
  var timeZone = CalendarApp.getTimeZone();
  var endDate = Utilities.formatDate(today, timeZone, 'MMMM dd, yyyy 00:00:00 Z')
  
  var yesterday = new Date(today - (24 * 60 * 60 * 1000));
  var startDate = Utilities.formatDate(yesterday, timeZone, 'MMMM dd, yyyy 00:00:00 Z')
  
  sheet.getRange("E1").setValue(startDate);
  sheet.getRange("E2").setValue(endDate);
}

function arrayFilter(array, evaluator) {
  var newArray = [];
  
  for (var index = 0; index < array.length; index++) {
    var value = array[index];
    if (evaluator(value)) {
      newArray.push(value);
    }    
  }
  
  return newArray;
}

function logHours(options) {
  if (!options) {
    options = readOptions();
  }
  
  if (!validateOptions(options)) return;
  
  for (var counter = 0; counter < options.calendarNames.length; counter++) {
    var calendarName =  options.calendarNames[counter];
    var jiraTicketID = options.jiraTicketIDs[counter];
    
    var calendar = CalendarApp.getCalendarsByName(calendarName)[0];
    if (!calendar) continue;
    
    var calendarEvents = calendar.getEvents(options.dateFrom, options.dateTo);
    for (var calendarIndex = 0; calendarIndex < calendarEvents.length; calendarIndex++) {
      var calendarEvent = calendarEvents[calendarIndex];
      var title = calendarEvent.getTitle();
      var eventStartTime = calendarEvent.getStartTime();
      var eventEndTime = calendarEvent.getEndTime();
      var duration = ((eventEndTime - eventStartTime) / (1000 * 60)).toString() + "m";
      
      createWorklogInJIRA(options.jiraLocation, options.jiraUserName, options.jiraPassword, jiraTicketID, title, eventStartTime, duration);
    }
  }
}

function createWorklogInJIRA(baseUrl, userName, password, ticketId, worklogDescription, worklogStartTime, worklogDuration) {
  // JIRA REST APIs: https://docs.atlassian.com/jira/REST/latest/
  // from: https://developer.atlassian.com/jiradev/api-reference/jira-rest-apis/jira-rest-api-tutorials/jira-rest-api-example-basic-authentication
  var authorizationHeaderValue = "Basic " + Utilities.base64Encode(userName + ":" + password);
  
  var fullTicketUrl = baseUrl + "/rest/tempo-rest/1.0/worklogs/" + ticketId;
  
  var timeZone = CalendarApp.getTimeZone();
  var ansiWorklogDate = Utilities.formatDate(worklogStartTime, timeZone, 'yyyy-MM-dd');
  var tempoWorklogDate = Utilities.formatDate(worklogStartTime, timeZone, 'MMM/dd/yy');
  
  var payload = {
    planning: false,
    user: userName,
    issue: ticketId,
    ansidate: ansiWorklogDate,
    ansienddate: ansiWorklogDate,
    date: tempoWorklogDate,
    enddate: tempoWorklogDate,
    time: worklogDuration,
    remainingEstimate: 0,
    comment: worklogDescription
  };

  var response = UrlFetchApp.fetch(fullTicketUrl, {
    method: "post",
    headers: {
      Authorization: authorizationHeaderValue
    },
    muteHttpExceptions: true,
    payload: payload
  });
  var responseCode = response.getResponseCode();
  var responseContent = response.getContentText();
  if (responseCode >= 300 || responseCode < 200) {
    Browser.msgBox("Error executing script", "Something went wrong when calling: " + fullTicketUrl + ": " + responseContent, Browser.Buttons.OK);
    throw "Error while sending data to JIRA";
  }
  var xmlResponse = XmlService.parse(responseContent);
  if (xmlResponse.getRootElement().getAttribute("valid").getValue() !== "true") {
    Browser.msgBox("Error executing script", "Invalid Tempo-API submission: " + responseContent, Browser.Buttons.OK);
  }
}

function validateOptions(options) {
  var errors = [];
  
  if (!options.dateFrom) errors.push("Date from is required");
  if (!options.dateTo) errors.push("Date to is required");
  if (options.dateTo < options.dateFrom) errors.push("Date to must be equal or after date from");
  if (!options.jiraLocation) errors.push("JIRA Location is required");
  if (!options.calendarNames || !options.calendarNames.length) errors.push("At least one calendar name is required");
  if (!options.jiraTicketIDs || !options.jiraTicketIDs.length) errors.push("At leats one JIRA ticket is required");
  if (options.jiraTicketIDs.length !== options.calendarNames.length) errors.push("There must be a JIRA ticket ID for each calendar");
  if (!options.jiraUserName) errors.push("JIRA UserName is required");
  
  if (errors.length) {
    Browser.msgBox("Validation errors:\n\n" + errors.join("\n- "));
  }
  
  return !errors.length;
}

function readOptions() {
  var optionsSheet = SpreadsheetApp.getActive().getSheetByName("Setup");
  
  var allCalendarNames = optionsSheet.getRange("A2:A100").getValues().map(function (calendarRow) {
    return calendarRow[0];
  });
  var calendarNames = arrayFilter(allCalendarNames, function(c) { return !!c; });
  
  var allJiraTicketIDs = optionsSheet.getRange("B2:B100").getValues().map(function (jiraTicketsRow) {
    return jiraTicketsRow[0];
  });
  var jiraTicketIDs = arrayFilter(allJiraTicketIDs, function(j) { return !!j; });
  
  return {
    dateFrom: optionsSheet.getRange("E1").getValue(),
    dateTo: optionsSheet.getRange("E2").getValue(),
    jiraLocation: optionsSheet.getRange("E3").getValue(),
    jiraUserName: optionsSheet.getRange("E4").getValue(),
    jiraPassword: optionsSheet.getRange("E5").getValue(),
    calendarNames: calendarNames,
    jiraTicketIDs: jiraTicketIDs
  };
}
```

Save all of the changes and that's done.

### 4. Bind buttons to functions

With this code, we can already bind the proper functions to our "buttons" in the spreadsheet. Right click on them so that they'll show the edit options, and on the menu that pops up at the top right, select "Assign script".

For the _"< Use Today"_ button, use `setDatesToToday`.

For the _"Run >"_ button, use `logHours`.

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
