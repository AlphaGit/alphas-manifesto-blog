---
layout: post
status: publish
published: true
title: How to perform a good code review
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5613
wordpress_url: https://blog.alphasmanifesto.com/?p=5613
date: '2016-11-17 14:23:22 +0000'
date_gmt: '2016-11-17 20:23:22 +0000'
categories:
- Projects
- Technology
tags:
- code review
- code
- pull request
- code quality
- functional requirements
- requirements
- technical debt
comments:
- id: 37652
  author: Daniel Altamirano
  author_email: ndaltamirano@gmail.com
  author_url: ''
  date: '2016-11-18 06:45:09 +0000'
  date_gmt: '2016-11-18 12:45:09 +0000'
  content: Love it! Thanks!
- id: 37656
  author: Alpha
  author_email: alphagma@gmail.com
  author_url: http://www.alphasmanifesto.com/
  date: '2016-11-18 08:30:20 +0000'
  date_gmt: '2016-11-18 14:30:20 +0000'
  content: "??"
- id: 37775
  author: How to create a good pull request &#8211; Alpha&#039;s Manifesto
  author_email: ''
  author_url: https://blog.alphasmanifesto.com/2016/07/11/how-to-create-a-good-pull-request/
  date: '2016-11-20 17:09:36 +0000'
  date_gmt: '2016-11-20 23:09:36 +0000'
  content: "[&#8230;] This will be later followed by a set of notes on how to perform
    a good code review. [&#8230;]"
- id: 56243
  author: "★ Inclusive Python |"
  author_email: ''
  author_url: http://www.blogpresso.com/%e2%98%85-inclusive-python/
  date: '2017-05-30 12:55:23 +0000'
  date_gmt: '2017-05-30 17:55:23 +0000'
  content: "[&#8230;] good code review is a one that is both respectful and engaging.
    You can be inspired&nbsp;(cache) by a checklist&nbsp;(cache) but once again, don&rsquo;t
    take it too dogmatically. It&rsquo;s up on [&#8230;]"
- id: 57098
  author: How to perform a good code review &#8211; Mildly interesting things
  author_email: ''
  author_url: http://www.gamsjager.nl/?p=55
  date: '2017-06-08 09:59:05 +0000'
  date_gmt: '2017-06-08 14:59:05 +0000'
  content: "[&#8230;] found this post regarding code [&#8230;]"
---

![](/assets/CodeReviewFilter2.jpg)

<p style="text-align: justify;">I recently wrote about <a href="https://blog.alphasmanifesto.com/2016/07/11/how-to-create-a-good-pull-request/">how to create a good pull request</a>, this is, how to make your code changes easy to review and discuss. Now we're going to talk about the second part: reviewing someone else's code. This puts you on the reviewers side, and hopefully the person submitting code did follow our guidelines to make your life easier.</p>
<p style="text-align: justify;">There are several approaches you can take to review the code, but we're going to enumerate a checklist that you could use to minimize the usage of your time and the efficiency of the code review.</p>
<p style="text-align: justify;"><!--more--></p>
<h2>Disclaimer</h2>
<p style="text-align: justify;">Every code, every project every team is different. This is just a set of guidelines, not a set of rules that should be applied&nbsp;dogmatically.</p>
<p style="text-align: justify;">Also, note that code reviews are pretty much a matter of looking into code and of communicating what you found in a review. As such, most of what is mentioned here will circle around how the communication should be rather than how code should look like. Determining what is appropriate for the code in your project depends on your situation.</p>
<h2>1.&nbsp;Make the most involved person be the one answering questions</h2>
<p style="text-align: justify;">Assuming you're not the person that actually wrote the code (because you're reviewing it), you need to accept that you&nbsp;don't have all the context of what made it happen&nbsp;or what gave it its shape. With that, don't assume everything is a mistake, but it's ok to point out the difference with what you expected, and let the other person explain themselves.</p>
<p style="text-align: justify;">Keep this in mind as your approach to every question or detail:</p>
<ol>
<li style="text-align: justify;"><strong>If it's definitely a problem, point out why is it a problem.</strong>&nbsp;Explain what are the consequences of the change you find problematic. If you have a solution, propose it. If you don't but you have a guideline on how to approach the problem, mention it. If you think a particular design pattern would help, mention it. If you think there's another feature or portion of the code that already solves this problem, point it out. Whatever you can point to the solution will help the provided solution not deviate from what is acceptable to you.</li>
<li style="text-align: justify;"><strong>If it's not a problem, don't point it out like one.</strong>&nbsp;Make sure that your doubts and suggestions are perceived as that: doubts and suggestions. If the reviewed person thinks that something is a problem they'll go ahead and change it, maybe without previous discussion. This may, ironically, become a problem if the code keeps changing too much from what it was intended. Or worse, you could frustrate the reviewed person by requesting too many iterations on the same piece of code because you weren't completely clear&nbsp;on what needed to be done. Just be honest with yourself and&nbsp;identify what of the things you don't like are based on taste and which ones are real problems that should be fixed.</li>
<li style="text-align: justify;"><strong>Let&nbsp;questions be questions.</strong> Let the other person answer them, instead of hinting at an answer yourself. This is, don't make rhetoric questions, and don't corner the other person into providing the answer that you want them to give.</li>
<li style="text-align: justify;"><strong>Let them do the investigation.</strong> They're most comfortable with the code and they know it better than you. They'll know better and find the answer to the questions quicker that you probably will. However, there might be value in investigating yourself, if you want to prioritize understanding the code inner workings besides the time of the review itself.</li>
</ol>
<h3>Bad examples</h3>
<blockquote>
<p style="text-align: justify;">Please change this so it performs better.</p>
</blockquote>
<ol>
<li style="text-align: justify;">It assumes that there's something performing poorly.</li>
<li style="text-align: justify;">Even worse, it doesn't point out what&nbsp;<em>it</em> is, assuming that the reviewed person already knows what you're referring to.</li>
<li style="text-align: justify;">Why is it performing poorly? How should it be changed?</li>
<li style="text-align: justify;">Is performance even a problem? What is this impacting? (Mention it.)</li>
</ol>
<h3>Good examples</h3>
<blockquote><p>I believe that this SQL query has the correct result set, but I think it may be performing table scans or it may not be making a good use of indexes, but</p>
<p style="text-align: justify;">I'm not entirely sure. Can you check the execution plan and see if the performance in database can be improved in any way? Maybe we can change&nbsp;the query, maybe we can add indexes. Remember that users will be impacted each time they see the main listing.</p>
</blockquote>
<p style="text-align: justify;">It acknowledges what is right about this piece (the SQL result).</p>
<ol>
<li style="text-align: justify;">It mentions a reasonable doubt and expresses it as a doubt. ("I'm not sure")</li>
<li style="text-align: justify;">It indicates what may be the source of the problem ("table scans", "unused indexes")</li>
<li style="text-align: justify;">It suggests a course of action ("check the execution plan")</li>
<li style="text-align: justify;">Suggests possible corrections ("change the query", "add indexes").</li>
<li style="text-align: justify;">It indicates what the real-life impact of such a change will be ("users listings").</li>
</ol>
<h2>2. Always provide a reason</h2>
<p style="text-align: justify;">When you're suggesting changes or pointing out a problem, you need to specify what the reason there is behind it. The point of doing so is allowing the other people involved in the conversation search the right solution along with you or come up with solutions themselves.</p>
<p style="text-align: justify;">This is specially important when you don't mention explicitly what the intended approach should be, and so just pointing out a problem does not help them avoid the underlying reason.</p>
<h3>Bad examples</h3>
<blockquote>
<p style="text-align: justify;">Typo here.</p>
</blockquote>
<p style="text-align: justify;">This is a bad example because if the one that made the typo wasn't aware of it, it's likely that they won't be able to&nbsp;recognize it. Unless, of course, it's really&nbsp;<em>obvvvious.</em> Regardless, it's always a good idea to provide a good spelling.</p>
<blockquote>
<p style="text-align: justify;">Need to add authentication here.</p>
</blockquote>
<p style="text-align: justify;">"Here" is quite ambiguous, but still, unless the developer being reviewed is already in line to what the process of adding authentication to a part of the code means, it's likely that they will either end up replicating something that's close to this portion of code, or just trying to guess what the reviewer meant. Being specific about what you had in mind the code should have helps reviewed code come closer to what you want it to be.</p>
<h3>Good examples</h3>
<blockquote>
<p style="text-align: justify;">Here it&nbsp;spells "typ" but it should say "type".</p>
</blockquote>
<p style="text-align: justify;">Correction from the first bad example: it shows what the typo is, it should how it should be corrected.</p>
<blockquote>
<p style="text-align: justify;">This will allow any non-authenticated user to invoke this method. This could create a security problem where we have non-authenticated third parties changing the internal state of the system. Please add the authentication attribute to prevent this situation. You can follow the same pattern that we have in UserController.cs.</p>
</blockquote>
<p>Explains the problem, hopefully preventing further instances from occurring now that the developer understands the rationale behind it, and provides guidance into how to solve it.</p>
<h2>3. What to check for</h2>
<p style="text-align: justify;">Here is a long list that you should keep in mind when reviewing. For all of this, if the answer does not leave you comfortable, you found yourself a problem and you want to leave feedback to be corrected in that pull request.</p>
<p style="text-align: justify;">However, also remember that you should pick your battles and that being right about every little discussion&nbsp;is not really <em>that</em> important, but rather what you're balancing to have a good quality product. (Are you going to lose a good developer because you disagree on indentation? Hold your horses.)</p>
<p style="text-align: justify;">You may choose to review all the code for the first point, then the second and so on, or you may choose to use this as a checklist on every piece of code that you review. I have ordered them from most important to less important, in my personal opinion:</p>
<h3>3.1. Quick checklist</h3>
<ol>
<li style="text-align: justify;">Is the change introduced&nbsp;feasible?
<ol>
<li>Does it do what it's supposed to do? Maybe check with the original requirement, if it's written down somewhere.</li>
<li>Are&nbsp;the assumptions and constraints that it makes to work assumptions that can be taken in this system?</li>
<li>If it causes impact to users, is the impact acceptable? (E.g. a new large&nbsp;JavaScript library being added to a web app.)</li>
<li>Does the change avoid incurring into costs? (Servers, licenses, processor usage, etc.)</li>
<li>Is the change legal? (Does it avoid unpaid proprietary libraries, code taken from another source, incompatible licenses, unprotected data, etc.?)</li>
</ol>
</li>
<li style="text-align: justify;">Does it have the right technical direction?
<ol>
<li>Is the current design appropriate for the solution being sought?</li>
<li>Does it introduce the right amount of&nbsp;complexity for the&nbsp;change required?</li>
<li>Does it introduce the lowest amount of failure points possible?</li>
<li>Is it flexible?&nbsp;Is it flexible in the direction that the product will evolve?</li>
<li>Does it avoid introducing third-party libraries and code when a simpler or more appropriate&nbsp;solution will do?</li>
</ol>
</li>
<li style="text-align: justify;">Does it handle errors and exceptions appropriately?
<ol>
<li>If they should, are they logged?</li>
<li>If they should, are they shown to the user with the right message?</li>
<li>If they should, are they relayed back to the development team?</li>
<li>Are they handled? Are they handled in the right section of code?</li>
</ol>
</li>
<li style="text-align: justify;">Does it have the right amount of instrumentation?
<ol>
<li>Does it instrument meaningful data?</li>
</ol>
</li>
<li style="text-align: justify;">Is it secure?
<ol>
<li>Does it avoid disclosing any data that should be kept private?</li>
<li>Does it encrypt data that should not be plainly stored or transmitted?</li>
<li>Does it sanitize or validate inputs or third-party systems?</li>
</ol>
</li>
<li style="text-align: justify;">Does it avoid&nbsp;technical debt?
<ol>
<li>If not, are the debt items documented close to the code with their reason?</li>
<li>Are the reasons for not addressing them right now valid?</li>
<li>Is the technical debt introduced acceptable?</li>
</ol>
</li>
<li style="text-align: justify;">Is it tested?
<ol>
<li>Does it have validation/whitelisting/blacklisting for input data?</li>
<li>Does it use the right size of variables for data involved? (E.g.&nbsp;<em>short amountOfPeopleInStadium</em> probably won't suffice.)</li>
<li>Does it have unit tests? Are they good tests?</li>
<li>Does it have integration tests? Are they good tests?</li>
<li>Does it have automation tests? Are they good tests?</li>
<li>If fixing a bug, do the tests properly recreate the original bug?</li>
</ol>
</li>
<li style="text-align: justify;">Is it readable?
<ol>
<li>Does it have any spelling errors and typos?</li>
<li>Does it have&nbsp;any weird acronyms?</li>
<li>For written content, is it understandable and proper? (i.e., proper English or the language that you're using for documentation and comments)</li>
<li>Are comments meaningful and useful?</li>
</ol>
</li>
<li style="text-align: justify;">Is the code maintainable?
<ol>
<li>If it introduces any new "concepts" to the system, are they documented somewhere?</li>
<li>Does it avoid any weird code constructions? ("Clever code")</li>
<li>Does the naming of variables and methods align with their meaning? (Can you tell what it is based on its title?)</li>
</ol>
</li>
<li>Does it have the right coding style?
<ol>
<li style="text-align: justify;">Variable / method / class casing</li>
<li style="text-align: justify;">Indentation</li>
<li style="text-align: justify;">Bracing</li>
<li style="text-align: justify;">Commenting density</li>
</ol>
</li>
</ol>
<h2>4. Read the PR in the right way</h2>
<p style="text-align: justify;">Depending on the type of project and the nature of the change being introduced, it will make more sense that you go through those changes in a different way. Think of it like this: when you're looking for a particular piece of failed code, you usually debug mentally, reading the code from input down to processing, following the logic across its calls. Reading code like this gives you a good idea of the dependencies between components and how they interact, but very likely they cover one or two different scenarios.</p>
<p style="text-align: justify;">Reading the code top to bottom helps you think about the abstractions being made and if they make sense for flexible code that needs to support different scenarios, but they don't obviously tell you if the dependencies are redundant or sufficient or even lacking -- at least not right away.</p>
<p style="text-align: justify;">When you look at different modules or namespaces on their own, you'll have a good idea about the way that the subsystems interact and their organization, which will help you spot problems in the general design and architecture, but not so much about the details of the implementation.</p>
<p style="text-align: justify;">Make sure to think about this when looking at the reviewed code, and look at it under different eyes and different order. Just make sure to cover it all at least once.</p>
<h2>5. Give feedback in a way that it can be discussed without confusions</h2>
<p style="text-align: justify;">It's very likely that you'll give several feedback points to the original developer. Furthermore, some items may be quite specific while others may be open-ended or up to discussion. If your feedback is a single block of text, it'll be difficult to engage in a conversation without confusing different points.</p>
<p style="text-align: justify;">I actually like to take advantage of some service's features like GitHub and Bitbucket to comment on particular lines. That way, I provide a comment that is already in some context, and they allow for discussions particular to that one piece of feedback. Even better, if the files are changed (very likely because of the feedback given) the thread is hidden so that the outdated original feedback is not visible interrupting the code flow.</p>
<p style="text-align: justify;">GitHub has now adopted a code-review approach where you queue up all your messages and you send them all together as part of the review, that you can later approve or reject. Similar to what Microsoft&nbsp;did on TFS online. This is useful because you might be leaving comments about the code and later on realize that your comment would be better rephrased or plain wrong. If you do this, make sure to re-read all comments before sending.</p>
<p style="text-align: justify;">If you don't use those services, still, following that approach has its benefits. Write down on your own what the concern is and where, and when you finished reviewing the code, go to the relevant part and leave the comment.</p>
<h2>6. Avoid ping-pongs</h2>
<p style="text-align: justify;">Make sure to give the fullest review as possible, instead of providing each piece for the developer to go fix. Regardless if you provide it in a single block of text or in separate comments, try to give them all at the same time so that the developer (and you) can make the best use of both of your times. Coming back with a change to find out that something else needed to be fixed is not going to be funny to the developer and always having something else to check is going to be exhausting&nbsp;to you.</p>
<p style="text-align: justify;">Sometimes people will give code feedback by email. If that's the case, structure your email so that they can answer in line and you can start removing parts of the conversation as you reach conclusions.</p>
<h2>7. Be polite</h2>
<p style="text-align: justify;">When providing feedback, do not ever approach that communication&nbsp;from the vision of "this is wrong", even if it is. Always approach it from a "it could be improved / it should be improved". or even as a question, unless you're absolutely sure. Remember that, first of all, there's a person on the other side, and second, they're doing their best. Even if there are technological, knowledge, experience or time limitations that made the developer turn in non-acceptable code, remember that&nbsp;they're doing this for the best of the project.</p>
<p style="text-align: justify;"><a href="http://www.theregister.co.uk/2016/07/11/linus_torvalds_in_sweary_rant_about_punctuation_in_kernel_comments/">Linus Torvals-style rants</a> are pretty fun to read, but remember it's hurtful to be on the receiving end. Also, why make enemies if you don't need to?</p>