---
layout: post
status: publish
published: true
title: How to create a good pull request
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5600
wordpress_url: https://blog.alphasmanifesto.com/?p=5600
date: '2016-07-11 22:33:07 +0000'
date_gmt: '2016-07-12 03:33:07 +0000'
categories:
- Projects
- Technology
tags:
- GitHub
- guidelines
- code review
- development
- code
- pull request
- BitBucket
- code quality
comments:
- id: 37599
  author: How to perform a good code review &#8211; Alpha&#039;s Manifesto
  author_email: ''
  author_url: https://blog.alphasmanifesto.com/2016/11/17/how-to-perform-a-good-code-review/
  date: '2016-11-17 14:23:39 +0000'
  date_gmt: '2016-11-17 20:23:39 +0000'
  content: "[&#8230;] recently wrote about how to create a good pull request, this
    is, how to make your code changes easy to review and discuss. Now we&#8217;re
    going to talk [&#8230;]"
---

![](/assets/CodeReviewFilter1.jpg)

A meta-guide for creating easy to review requests

<p style="text-align: justify;">This has been a common question and a subject of debate since everyone has their opinions on what <em>good code</em>&nbsp;is and what <em>bad code</em> is. Regardless, the pull request is not about the code itself but about the actions of reviewing, adjusting, discussing and assimilating (merging) code, which may be good or bad in itself.</p>
<p style="text-align: justify;">This will be later followed by a set of notes on <a href="https://blog.alphasmanifesto.com/2016/11/17/how-to-perform-a-good-code-review/"><em>how to perform a good code review</em></a>.</p>
<p style="text-align: justify;">Without further ado, let's start with what is going to be a long article about sending a good pull request.</p>
<p><!--more--></p>
<h2>1. Before submitting</h2>
<h3><strong>1.1. Decide on the goal for the pull request</strong></h3>
<p style="text-align: justify;">Most of the times, pull requests are to have code merged. But not always. Sometimes, the objective of a&nbsp;pull request is to&nbsp;just have feedback on a particular aspect of design or implementation.&nbsp;Sometimes, it's just to see if a particular feature will be accepted into the code you're&nbsp;contributing to. Indicate the objective in the&nbsp;pull request. Once that objective is reached, make sure the code is merged or the PR is closed. Don't leave unfinished PRs hanging around, since then what needs to be done with it is not clear.</p>
<table border="1">
<thead>
<tr>
<th style="width: 50%;">Bad&nbsp;examples</th>
<th>Good&nbsp;examples</th>
</tr>
</thead>
<tbody>
<tr>
<td>(No explanation.)</td>
<td>Please provide some feedback about this approach. Once decided how to proceed, we can merge or close.</td>
</tr>
<tr>
<td></td>
<td>I just need some feedback about the design of the XYZ class. It is not yet ready to merge.</td>
</tr>
<tr>
<td></td>
<td>Feature: preserving user data while offline.</td>
</tr>
</tbody>
</table>
<h3><strong>1.2. Make sure it compiles</strong></h3>
<p style="text-align: justify;">Needless to say, don't submit code that does not compile. This could maybe be acceptable if the objective is to have some feedback about part of the code, but it goes beyond saying that the submitted code&nbsp;will not be in a state of being integrated. If the repository/tool to submit pull requests also run tests, make sure they pass. Otherwise, you'll get a bunch of red lights or rejections for unnecessary reasons. Again, this can be an exception if you're just looking for feedback of a particular aspect and not code merging.</p>
<p style="text-align: justify;">This includes&nbsp;warnings if the approach in this project/team is not to allow them altogether. If that's the case and there's no way around it, you can always change the configuration of your tools to allow for exceptions to the rules. If you do that, make sure to document as closer to the exception as possible why this is unavoidable.</p>
<h3><strong>1.3. Make sure it can be merged to the destination branch</strong></h3>
<p style="text-align: justify;">Resolve conflicts before creating the PR. Make the necessary integration changes before creating the PR. Reading through conflicts is confusing and will just generate more questions or demands from the side of the reviewers.</p>
<h3><strong>1.4. Make sure all tests pass</strong></h3>
<p style="text-align: justify;">Having broken tests that will need to be fixed later will only create technical debt, or worse, hide real bugs, or stop the team from making progress if the test suite is broken. Fixing them while the PR is open will only generate more "back-and-forth"s with the reviewers, delaying the process and taking more time from everyone.</p>
<p style="text-align: justify;">Test your suite in your branch or your local environment before creating the PR.</p>
<h3><strong>1.5. Make sure all aspects of the original requirement were addressed</strong></h3>
<p style="text-align: justify;">Before submitting the PR, make sure it is complete with everything that you intended. If you have a requirement or project tracking system, review the tickets that the code&nbsp;was&nbsp;supposed to address. Review the design restrictions and make sure that the code being submitted complies to all of them. If you have a code style guide, make sure that the newly submitted code complies with the standards. If you have a UI style guide or branding guide, make sure UI changes conform to that before creating the PR.</p>
<p style="text-align: justify;">Possible exceptions to this rule may be point <em>3.1. Do not include garbage</em>, for when addressing all of these requirements lots of non-functional changes, or when the code itself is legacy or for some reason does not need to comply.</p>
<p style="text-align: justify;">Another exception may be point <em>3.3. Break it into manageable chunks</em>, if the requirement in itself is too big and can be broken down in pieces for better review, so you can address the particular refactors/UI changes in a separate PR.</p>
<h2>2. Data about&nbsp;the pull request itself</h2>
<h3><strong>2.1. Reference the tracking ticket you are using</strong></h3>
<p style="text-align: justify;">If you are using a requirement / project tracking system, indicate which ticket this code is solving or contributing to. If there is none for this, either request the team to have one created or indicate that no ticket has been created for it. This will properly communicate that you went through the effort of looking through the requirements, and avoid duplicates in the future. When a team manages multiple PRs, being able to go back and forth between the code repository and the tracking system helps in determining the status of the project.</p>
<p style="text-align: justify;">Some teams also prefer to have the distinction between the type of changes, like "bug", "feature", "refactor", "improvement", etc., visible in the PR. Find out what the approach is in this team and follow&nbsp;this convention too.</p>
<table border="1">
<thead>
<tr>
<th style="width: 50%;">Bad&nbsp;examples</th>
<th>Good&nbsp;examples</th>
</tr>
</thead>
<tbody>
<tr>
<td>Fixed user permissions when saving local data</td>
<td>[LS-102] Fixed user permissions when saving local data</td>
</tr>
<tr>
<td>[Several tickets] Fixed user permissions when saving local data</td>
<td>[Feature] Preserving user data while offline</td>
</tr>
<tr>
<td></td>
<td>Preserving user data (fixes #5, #6, #7)<sup>(1)</sup></td>
</tr>
<tr>
<td></td>
<td>[No ticket] Fixed favicon&nbsp;dimensions for modern browsers</td>
</tr>
</tbody>
</table>
<p style="text-align: justify;"><sup>(1)</sup>&nbsp;When the references to tickets are fixed in size (like the LS-102 example) I prefer them in the title. When they can vary a lot, (like the #5, #6, #7 example) I like them better in the body of the PR / commit. However, this is just personal preference. Follow whatever the team is doing.</p>
<h3><strong>2.2. Use a concise, yet descriptive title</strong></h3>
<p style="text-align: justify;">Make it short, make it obvious. What did you do? Don't explain the "why", don't explain the "what for". In a title, explain the "what".</p>
<p style="text-align: justify;">Since most repository hosts also will take the name of the branch or the message of the first commit, this should also follow the same guidelines as commit messages: do not exceed 80 characters, make it simple, make it concise. Use the contents of the message for the description, not the title.</p>
<table border="1">
<thead>
<tr>
<th style="width: 50%;">Bad&nbsp;examples</th>
<th>Good&nbsp;examples</th>
</tr>
</thead>
<tbody>
<tr>
<td>Adjusted&nbsp;permissions for saving local data for regular users (permissions: user-saving, localstorage-access)</td>
<td>Adjusted&nbsp;user permissions when saving local data</td>
</tr>
<tr>
<td>Several fixes</td>
<td>"My profile"&nbsp;UI design&nbsp;improvements</td>
</tr>
<tr>
<td>[LS-102] Users cannot save local data</td>
<td>[LS-102] Adjusted user permissions for saving local data</td>
</tr>
</tbody>
</table>
<h3><strong>2.3. Indicate changes and/or intentions</strong></h3>
<p style="text-align: justify;">In the description of the pull request, elaborate a little bit on what you did, and the "what for". Do not repeat the contents of the ticket you're trying to address. That adds no value. Rather than that, explain (if necessary) what changes you made to achieve that goal.</p>
<p style="text-align: justify;">It's important to indicate which are the changes that you made, instead of which are the changes that you&nbsp;intended&nbsp;to make. Any bugfix or further refinement would have the same message if you just copied and pasted the final result as you intended in the first try. And having multiple commits or PRs with the same name does not help much for tracking.</p>
<table border="1">
<thead>
<tr style="height: 57px;">
<th style="width: 50%; height: 57px;">Bad&nbsp;examples</th>
<th style="height: 57px;">Good&nbsp;examples</th>
</tr>
</thead>
<tbody>
<tr style="height: 81px;">
<td style="height: 81px;"><strong>Title:</strong> Adjusted&nbsp;permissions for saving local data for regular users (permissions: user-saving, localstorage-access)</p>
<p><strong>Description:</strong> (Empty)</td>
<td style="height: 81px;"><strong>Title:</strong> Adjusted&nbsp;user permissions when saving local data</p>
<p><strong>Description:</strong> Regular users were not granted the following required permissions</p>
<ul>
<li>user-saving</li>
<li>localstorage-access</li>
</ul>
<p>These permissions are now granted to all users, regardless of their access level.</td>
</tr>
<tr style="height: 73px;">
<td style="height: 73px;"><strong>Title:</strong> Several fixes</p>
<p><strong>Description:</strong></p>
<ul>
<li>Fixed favicon resolution for modern browsers</li>
<li>Adjusted permissions so that users can save their own data offline</li>
<li>Changed input types to&nbsp;HTML5 standard ones</li>
<li>Changed colors</li>
</ul>
</td>
<td style="height: 73px;"><strong>Title:</strong> "My profile"&nbsp;UI design&nbsp;improvements</p>
<p><strong>Description:</strong></p>
<ul>
<li>Fixed favicon resolution for modern browsers</li>
<li>Changed input types to&nbsp;HTML5 standard ones</li>
<li>Changed colors</li>
</ul>
<p>Note:&nbsp;The bug about users not being able to save local data&nbsp;will be included in a different PR, this one only addresses UI issues.</td>
</tr>
</tbody>
</table>
<h3><strong>2.4. Explain changes done</strong></h3>
<p style="text-align: justify;">If the changes require some understanding or some design, or some non-obvious decisions were taking, document them here. They will make reviewers lives easier, and in consequence, yours too.</p>
<p style="text-align: justify;">Any investigation and thought-process you did that made you arrive at non-obvious conclusions also help here. Prevent reviewers from falling into the same problems that you had already faced and explain why the most obvious solutions were discarded.</p>
<table border="1">
<thead>
<tr style="height: 57px;">
<th style="width: 50%; height: 57px;">Bad&nbsp;examples</th>
<th style="height: 57px;">Good&nbsp;examples</th>
</tr>
</thead>
<tbody>
<tr style="height: 81px;">
<td style="height: 81px;"><strong>Title:</strong> Adjusted&nbsp;user permissions when saving local data</p>
<p><strong>Description:</strong> Granted all users missing permissions.</td>
<td style="height: 81px;"><strong>Title:</strong> Adjusted&nbsp;user permissions when saving local data</p>
<p><strong>Description:</strong> Regular users were not granted the following required permissions</p>
<ul>
<li>user-saving</li>
<li>localstorage-access</li>
</ul>
<p>These permissions are now granted to all users, regardless of their access level.</p>
<p>It seems permissions were removed from all users in commit <code>12f3af3</code>, to fix LS-94.</td>
</tr>
<tr style="height: 73px;">
<td style="height: 73px;"><strong>Title:</strong> Adjusted&nbsp;user permissions when saving local data</p>
<p><strong>Description:</strong> Users did not have the required permissions. Now they have been given to them.</td>
<td style="height: 73px;"><strong>Title:</strong> Adjusted&nbsp;user permissions when saving local data</p>
<p><strong>Description:</strong>&nbsp;Users did not have the required permissions. Now they have been given to them.</p>
<p>Permissions are usually not granted at a global level. However, it&nbsp;is ok to give these permissions to a global level because all users should have access to these permissions, regardless of their access level.</p>
<p>Non-registered users will not have these permissions applied because they do not get an instance of <code>IUser</code> until they create an account.</td>
</tr>
</tbody>
</table>
<p style="text-align: justify;">In my current team, we came up with the following template (just use it as an example):</p>
<ul>
<li style="text-align: justify;"><strong>Background:</strong> explain what the problem was that you were trying to solve anyway. Indicate any investigation that you did to find the original problem instead of the symptom that it usually is found when talking about bugs.</li>
<li style="text-align: justify;"><strong>Changes done:</strong> explain any non-obvious changes that can be seen by reviewing the code. Why did you take a particular approach and not another? Why did you choose certain names for certain elements? Are you introducing new concepts to the system, and if so, which are those?</li>
<li style="text-align: justify;"><strong>Pending to be done:</strong> Technical debt you decided to leave (and why). Bugs that were introduced already identified (and why you left them). Shortcomings. Things out of scope that you think may get you asked "why didn't you fix it?" Things you'd like done but you thought "today's not the day".</li>
<li style="text-align: justify;"><strong>Notes:</strong> any miscellaneous stuff that reviewers should know about. (For example, is it better to review code in a certain way rather than looking at the diff linearly?)</li>
<li style="text-align: justify;"><strong>Reviewers:</strong> who in particular you want to review your code. Maybe they're experts in the area you're working. Maybe they're the leaders that coordinate your group. Maybe it's someone that will be directly affected by it.</li>
</ul>
<h2>3. Content of the pull request</h2>
<h3>3.1. Do not include garbage</h3>
<p style="text-align: justify;">I covered a little bit of this idea in my previous post,&nbsp;<a href="https://blog.alphasmanifesto.com/2016/02/28/taming-your-tools/">Taming your tools</a>. Every content of the pull request that is not helping to achieve the goal is helping to hide it. This usually goes against the&nbsp;tendency of opportunistic refactoring and adjusting styles.</p>
<p style="text-align: justify;">I personally prefer to leave them for subsequent PRs, but use your judgment. If your opportunistic refactor is a variable name change that affects only two lines, yeah, go ahead. If completely&nbsp;changes the design of an approach for greater flexibility, you may want to give it a PR of its own.</p>
<p style="text-align: justify;">Remember that the longer a pull request is, the less likely you're going to have it reviewed. Furthermore, if you're including a lot of changes, it is likely that people will miss changes that are more important when reviewing everything.</p>
<p style="text-align: justify;">One way to approach this is to make only the minimal-required changes for your approach to work. If you found refactors/improvements that you still want to make, you can branch them off and include those PRs later, or create a PR that goes against the branch of the first PR. Then the team may choose to approve those and merge them all together or merge them piece by piece in a reverse-cascade (more on this on point <em>3.3. Break it into manageable chunks</em>).</p>
<p style="text-align: justify;">The point is: have the changes being reviewed be the changes that you want reviewed. Don't mix them up or clutter them with unnecessary changes. Review each line before performing your PR, ask yourself: "Is this needed? Is this worth it to have in here?"</p>
<h3>3.2. Stay focused on the original intention of the change</h3>
<p style="text-align: justify;">This applies when deciding which changes should be part of the PR and when discussing feedback of the PR itself. Keep you mind focused on solving the original problem that you were trying to solve, and don't let it wander off too much. Don't include opportunistic fixes or "miscellaneous stuff". Not only it will make reviewing harder, but it will create difficulty in tracking changes in the future and it may actually delay your submission because those points will need to be discussed as well. You may be holding off merging an important feature or fix because you decided to also include a change to the wording in the UI.</p>
<p style="text-align: justify;">Importantly, decide on the scope of the changes that you're making. Sometimes a piece will require some other piece to be adjusted, and you don't want to start a cascade of changes thorough the whole code just to address a particular change.</p>
<h3>3.3. Break it into manageable chunks</h3>
<p style="text-align: justify;">The PR itself should be readable in a considerably short amount of time. You want your reviewer's full attention and if you're submitting way too many changes, it's very likely that won't happen. If the changes are just too many to make it a manageable PR, break it into chunks. You can always submit a module design even if that's not integrated with the other code. You can always submit changes to one class without including the changes to the others, as long as this does not break the system altogether. Think about the modularity of what you have done and take advantage of it.</p>
<p style="text-align: justify;">Depending on how your team manages this, they may want to review the whole feature before merging instead of merging it in chunks. If that's the case, create a branch on top of a branch and create nested PRs, like so:</p>
<ul>
<li><code>branch1</code> has as destination <code>main-branch</code> -- this is PR 1</li>
<li><code>branch2</code> has as destination <code>branch1</code> -- this is PR 2</li>
<li><code>branch3</code> has as destination branch2 -- this is PR 3</li>
</ul>
<p style="text-align: justify;">Once all three PRs had been accepted, you can then merge them in reverse order: PR 3, then PR 2, then PR 1. The set of changes will be the same that you had originally, but you allowed the team to review it in bite-size pieces.</p>
<p style="text-align: justify;">In order to keep this working, it is important each of the branches is coming out of the right place. See <em>4.2. Keep it updated to the destination branch</em>.</p>
<h3>3.4. Missing pieces: make them obvious and explain why</h3>
<p style="text-align: justify;">You may find parts that need to be fixed later but they are not relevant to the changes that you're making. Maybe a bug that came out of analyzing that portion of code. Maybe a possible risk that is not meant to be addressed right now. Maybe a refactor that will have to be done for readability. Maybe there are parts of the newly introduced code that are left to be completed or changes that need to be addressed in the future.</p>
<p style="text-align: justify;">Whatever it is, if you found it and decided not to make these changes right now, make it obvious to reviewers and future visitors of the code. I usually prefer to use <code>//TODO</code> comments, since most IDEs will recognize them as a set of pending tasks. Some others also recognize <code>//FIXME</code> and <code>//HACK</code>, with some of them even allowing to set priority levels for them. Regardless, make it obvious that there's a certain piece that you know it's missing, but it's not meant to be done between the changes that you're doing.</p>
<p style="text-align: justify;">When doing so, explain:</p>
<ul>
<li style="text-align: justify;">What change needs to be done and to achieve what purpose</li>
<li style="text-align: justify;">Why the change cannot be done right now</li>
<li style="text-align: justify;">If there's any tracking ticket associated to it, which is it</li>
</ul>
<table border="1">
<thead>
<tr style="height: 57px;">
<th style="width: 50%; height: 57px;">Bad&nbsp;examples</th>
<th style="height: 57px;">Good&nbsp;examples</th>
</tr>
</thead>
<tbody>
<tr style="height: 81px;">
<td style="height: 81px;"><code>//TODO fix this</code></td>
<td style="height: 81px;"><code>//TODO refactor this -- code is unreadable (but not a priority right now)</code></td>
</tr>
<tr style="height: 73px;">
<td style="height: 73px;"><code>//FIXME user permissions are wrong</code></td>
<td style="height: 73px;"><code>//TODO review given user permissions, they may be&nbsp;not allowing users of type "regularUser" to save data (LS-102)</code></td>
</tr>
<tr style="height: 73px;">
<td style="height: 73px;"></td>
<td style="height: 73px;"><code>//TODO rename this method to "saveUserData", as it explains better its purpose.</code></p>
<p><code>//Won't do that right now because the API depends on it and that involves major changes. (LS-105)</code></td>
</tr>
</tbody>
</table>
<h3>3.5. Different commits or one single commit?</h3>
<p style="text-align: justify;">Some teams or team members like to submit their changes in a single commit, while some others prefer to have small commits.</p>
<p style="text-align: justify;">For the purposes of code reviewing, different commits will only be relevant to reviewers if the changes in them are not overwritten by other commits in the same branch&nbsp;If that's the case, reviewing by commit may be useful for your reviewers, but most of the time, it's very likely they won't be reviewing a PR like this. If you think it is easier reviewing it like this because your changes in each commit are exclusive to each other, indicate so in the PR that you're submitting.</p>
<h2>4. Driving it to completion</h2>
<h3>4.1. Reach a decision on every piece of feedback received</h3>
<p style="text-align: justify;">Keep track of every piece of feedback and make sure that a decision has been agreed for each. The decision may be "change it as part of this PR submission", or "won't change it", or "to be decided later, will leave as it is". Whichever it is, make sure that the consequences of such decisions are understood so that your PR does not mean that the system cannot be released anymore.</p>
<p style="text-align: justify;">Answer all questions provided by reviewers, even if it's a "agreed" and you proceed to make the changes. This helps in communication and to make sure nothing is lost. Study the reviewing system you use to make sure nothing is lost. Setup email communications so even if updating the PR cleans up questions, you can still review them in your email. Heads up: GitHub shows historic questions in the main tab, BitBucket shows them in the activity tab or a the top right corner diff of the files (if they're referencing changed code).</p>
<p style="text-align: justify;">If there is a requirements tracking system, log these changes or these pending discussions, referencing the PR and indicating the reasons that gave place to the discussion in the first place.</p>
<h3>4.2. Keep it updated to the destination branch</h3>
<p style="text-align: justify;">While the PR is under review and changes are being discussed, it is possible that the destination branch will change. Needless to say, if this results in conflicts, they need to be fixed before any more review can be done on the PR itself.</p>
<p style="text-align: justify;">Regardless, it is a good idea to keep the branch updated. I usually prefer rebasing the branch so that it always starts from the most recent point of the destination branch. However, some others prefer just back-merging the destination branch to the feature branch.</p>
<h3>4.3. Don't let it sit stale for too long</h3>
<p style="text-align: justify;">If the PR is not getting attention from reviewers, or discussions are taking too long, there is more risk of the PR&nbsp;becoming stale. This means that the destination branch may advance more, making it likely that the code needs to be modified to accommodate these changes, or even that the changes being proposed do not make sense anymore, making the whole set of changes obsolete.</p>
<p style="text-align: justify;">On the reviewers side, they'll need to give reviews with appropriate timing (but we'll cover this in a future post). From the submitter's point of view, make sure that all the required changes and discussions are moving forward. Don't let suggestions or requests sit around waiting for feedback. Make changes as soon as you can and send them over to the PR.</p>
<p style="text-align: justify;">Make sure to (politely) request attention from reviewers if you still need them to review or merge your code. If you're in charge of merging it, make sure that you've got the approvals or reviews from whoever you need / want to.</p>
<h3>4.4. Keep&nbsp;changes small for the feedback received</h3>
<p style="text-align: justify;">Most of the changes that should be requested out of a PR should be small changes. From small things like typos and wordings to the steps of a particular method are acceptable, but if the design of a particular class or the approach to the problem themselves need to be changed, then this PR is unfit to be kept alive. This PR&nbsp;should be declined or closed and a new one should be presented with the new set of changes.</p>
<p style="text-align: justify;">This is because reviewers will likely understand that these changes will require a new structure of code, and then the rest of the code needs to be reviewed with that in mind, but with the code not being there. This will lead to confusions, omissions, and even discussions that don't really make sense until the code is right there to discuss about it. Also, when the changes are submitted to the same PR, they will undo most of what the original change had done, and so everyone will have to review again. For hosts like BitBucket where they allow reviewers to approve the PR, this should invalidate those approvals, but that doesn't happen, leading to more confusions. Was the code approved? Or was that before the refactor? Did you already review after the refactor?</p>
<p style="text-align: justify;">Avoid these problems altogether and keep only small changes as part of a PR.</p>
<h2>5. General interactions</h2>
<h3>5.1. Don't get personal or defensive</h3>
<p style="text-align: justify;">Yes, you thought of a great approach. Yes, you dedicated many hours. Yes, you did the hard work and somebody came over and by looking it just 30 seconds decided that it was wrong and you need to change stuff.</p>
<p style="text-align: justify;">Analyze the reasons for the feedback. Be analytical and think if the proposed change benefits the product, the project, or the future developers. If the answer is yes, then this is a worthy change, but doing it right now or not is a discussion about priorities that you should have with your team.</p>
<p style="text-align: justify;">If you still disagree, don't get emotional about it. Asks for reasons if they were not given.</p>
<p style="text-align: justify;">Don't let yourself be bullied, either. If they're not being appropriate with you, handle it in the most appropriate way. For an open source project, this may be reaching out in a more explanatory approach. For a closed team development, this may be reaching out to the team's authorities or HR.</p>
<p style="text-align: justify;">However, in no way you should get personal or defensive about a piece of code. It has no right to be like it is, if there is a zero-cost better version of itself.</p>
<h3>5.2. If you disagree, state why and the benefits of your approach</h3>
<p style="text-align: justify;">You may still reach a point in a discussion where it is just a matter of opinion, or when you and your reviewer neither have the right information to make a decision on whether a change should be made or not. If that's the case, explain the reasons that took you to this particular approach and the benefits that this will bring the product, the&nbsp;project or future developers. Some of those may be challenged, and that's perfect -- this is why you're having the discussion in the first place.</p>
<p style="text-align: justify;">Keep your discussion centered and on point. Identify and explain which part of your decisions are based on proven fact and which ones on personal opinion.</p>
<h3>5.3. On impasses, delegate decisions to authority</h3>
<p style="text-align: justify;">Sometimes you'll disagree with someone and you won't reach a nice middle ground. Sometimes you have really strong feelings about an approach and another person has others on it.</p>
<p style="text-align: justify;">If&nbsp;you report to this person, inform them of the shortcomings of their approach but if once inform, they still prefer it, make the changes they decide. If this person is a colleague but you don't report to each other, escalate the question to the person you report to. Simple approach is: have your boss decide for you.&nbsp;You want your boss to accept a particular risk if it needs to be done and to sign off on it. At the end of the day, it is important they know about it (so it's not a surprise), and if they take responsibility for it if something goes wrong, so you don't have to say "I told you so" (which is a bad situation to be in anyway).</p>
<p style="text-align: justify;">Similarly, if the changes are requested by somebody above your direct boss, make the changes but keep your boss informed about it.</p>
<p style="text-align: justify;">This all goes beyond development&nbsp;anyway.</p>
<h2>Meta-Notes</h2>
<ul>
<li style="text-align: justify;">This guide is numbered so that it can be extended and I can receive feedback with easy referencing of particular points.</li>
<li style="text-align: justify;">You're free to use this as a reference or to adapt it with proper attribution. I would still appreciate feedback.</li>
</ul>
