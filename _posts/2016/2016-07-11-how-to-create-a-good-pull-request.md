---
layout: post
excerpt_separator: <!--more-->
title: How to create a good pull request
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
sub_title: A meta-guide for creating easy to review requests
---

![]({{ site.baseurl }}/assets/CodeReviewFilter1.jpg)

This has been a common question and a subject of debate since everyone has their opinions on what _good code_ is and what _bad code_ is. Regardless, the pull request is not about the code itself but about the actions of reviewing, adjusting, discussing and assimilating (merging) code, which may be good or bad in itself.

This will be later followed by a set of notes on [_how to perform a good code review_](https://blog.alphasmanifesto.com/2016/11/17/how-to-perform-a-good-code-review/).

Without further ado, let's start with what is going to be a long article about sending a good pull request.

<!--more-->

## 1. Before submitting

### 1.1. Decide on the goal for the pull request

Most of the times, pull requests are to have code merged. But not always. Sometimes, the objective of a pull request is to just have feedback on a particular aspect of design or implementation. Sometimes, it's just to see if a particular feature will be accepted into the code you're contributing to. Indicate the objective in the pull request. Once that objective is reached, make sure the code is merged or the PR is closed. Don't leave unfinished PRs hanging around, since then what needs to be done with it is not clear.

| Bad examples | Good Examples |
| --- | --- |
| (No explanation.) | Please provide some feedback about this approach. Once decided how to proceed, we can merge or close. |
| | I just need some feedback about the design of the XYZ class. It is not yet ready to merge. 
| | Feature: preserving user data while offline. |

### 1.2. Make sure it compiles

Needless to say, don't submit code that does not compile. This could maybe be acceptable if the objective is to have some feedback about part of the code, but it goes beyond saying that the submitted code will not be in a state of being integrated. If the repository/tool to submit pull requests also run tests, make sure they pass. Otherwise, you'll get a bunch of red lights or rejections for unnecessary reasons. Again, this can be an exception if you're just looking for feedback of a particular aspect and not code merging.

This includes warnings if the approach in this project/team is not to allow them altogether. If that's the case and there's no way around it, you can always change the configuration of your tools to allow for exceptions to the rules. If you do that, make sure to document as closer to the exception as possible why this is unavoidable.

### 1.3. Make sure it can be merged to the destination branch

Resolve conflicts before creating the PR. Make the necessary integration changes before creating the PR. Reading through conflicts is confusing and will just generate more questions or demands from the side of the reviewers.

### 1.4. Make sure all tests pass

Having broken tests that will need to be fixed later will only create technical debt, or worse, hide real bugs, or stop the team from making progress if the test suite is broken. Fixing them while the PR is open will only generate more "back-and-forth"s with the reviewers, delaying the process and taking more time from everyone.

Test your suite in your branch or your local environment before creating the PR.

### 1.5. Make sure all aspects of the original requirement were addressed

Before submitting the PR, make sure it is complete with everything that you intended. If you have a requirement or project tracking system, review the tickets that the code was supposed to address. Review the design restrictions and make sure that the code being submitted complies to all of them. If you have a code style guide, make sure that the newly submitted code complies with the standards. If you have a UI style guide or branding guide, make sure UI changes conform to that before creating the PR.

Possible exceptions to this rule may be point _3.1. Do not include garbage_, for when addressing all of these requirements lots of non-functional changes, or when the code itself is legacy or for some reason does not need to comply.

Another exception may be point _3.3. Break it into manageable chunks_, if the requirement in itself is too big and can be broken down in pieces for better review, so you can address the particular refactors/UI changes in a separate PR.

## 2. Data about the pull request itself

### 2.1. Reference the tracking ticket you are using

If you are using a requirement / project tracking system, indicate which ticket this code is solving or contributing to. If there is none for this, either request the team to have one created or indicate that no ticket has been created for it. This will properly communicate that you went through the effort of looking through the requirements, and avoid duplicates in the future. When a team manages multiple PRs, being able to go back and forth between the code repository and the tracking system helps in determining the status of the project.

Some teams also prefer to have the distinction between the type of changes, like "bug", "feature", "refactor", "improvement", etc., visible in the PR. Find out what the approach is in this team and follow this convention too.

| Bad examples | Good examples |
| --- | --- |
| Fixed user permissions when saving local data | [LS-102] Fixed user permissions when saving local data |
| [Several tickets] Fixed user permissions when saving local data | [Feature] Preserving user data while offline |
| | Preserving user data (fixes #5, #6, #7)<sup>(1)</sup> |
| | [No ticket] Fixed favicon dimensions for modern browsers |

<sup>(1)</sup> When the references to tickets are fixed in size (like the LS-102 example) I prefer them in the title. When they can vary a lot, (like the #5, #6, #7 example) I like them better in the body of the PR / commit. However, this is just personal preference. Follow whatever the team is doing.

### 2.2. Use a concise, yet descriptive title

Make it short, make it obvious. What did you do? Don't explain the "why", don't explain the "what for". In a title, explain the "what".

Since most repository hosts also will take the name of the branch or the message of the first commit, this should also follow the same guidelines as commit messages: do not exceed 80 characters, make it simple, make it concise. Use the contents of the message for the description, not the title.

| Bad examples | Good examples |
| --- | --- |
| Adjusted permissions for saving local data for regular users (permissions: user-saving, localstorage-access) | Adjusted user permissions when saving local data |
| Several fixes | "My profile" UI design improvements |
| [LS-102] Users cannot save local data | [LS-102] Adjusted user permissions for saving local data |

### 2.3. Indicate changes and/or intentions

In the description of the pull request, elaborate a little bit on what you did, and the "what for". Do not repeat the contents of the ticket you're trying to address. That adds no value. Rather than that, explain (if necessary) what changes you made to achieve that goal.

It's important to indicate which are the changes that you made, instead of which are the changes that you intended to make. Any bugfix or further refinement would have the same message if you just copied and pasted the final result as you intended in the first try. And having multiple commits or PRs with the same name does not help much for tracking.

<table>
    <thead>
        <tr>
            <th>Bad examples</th>
            <th>Good examples</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <p><strong>Title:</strong> Adjusted permissions for saving local data for regular users (permissions: user-saving, localstorage-access)</p>
                <p><strong>Description:</strong> (Empty)</p>
            </td>
            <td>
                <p><strong>Title:</strong> Adjusted user permissions when saving local data</p>
                <p><strong>Description:</strong> Regular users were not granted the following required permissions</p>
                <ul>
                    <li>user-saving</li>
                    <li>localstorage-access</li>
                </ul>
                <p>These permissions are now granted to all users, regardless of their access level.</p>
            </td>
        </tr>
        <tr>
            <td>
                <p><strong>Title:</strong> Several fixes</p>
                <p><strong>Description:</strong></p>
                <ul>
                    <li>Fixed favicon resolution for modern browsers</li>
                    <li>Adjusted permissions so that users can save their own data offline</li>
                    <li>Changed input types to HTML5 standard ones</li>
                    <li>Changed colors</li>
                </ul>
            </td>
            <td>
                <p><strong>Title:</strong> "My profile" UI design improvements</p>
                <p><strong>Description:</strong></p>
                <ul>
                    <li>Fixed favicon resolution for modern browsers</li>
                    <li>Changed input types to HTML5 standard ones</li>
                    <li>Changed colors</li>
                </ul>
                <p>Note: The bug about users not being able to save local data will be included in a different PR, this one only addresses UI issues.</p>
            </td>
        </tr>
    </tbody>
</table>

### 2.4. Explain changes done

If the changes require some understanding or some design, or some non-obvious decisions were taking, document them here. They will make reviewers lives easier, and in consequence, yours too.

Any investigation and thought-process you did that made you arrive at non-obvious conclusions also help here. Prevent reviewers from falling into the same problems that you had already faced and explain why the most obvious solutions were discarded.

<table>
    <thead>
        <tr>
            <th>Bad examples</th>
            <th>Good examples</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <p><strong>Title:</strong> Adjusted user permissions when saving local data</p>
                <p><strong>Description:</strong> Granted all users missing permissions.</p>
            </td>
            <td>
                <p><strong>Title:</strong> Adjusted user permissions when saving local data</p>
                <p><strong>Description:</strong> Regular users were not granted the following required permissions</p>
                <ul>
                    <li>user-saving</li>
                    <li>localstorage-access</li>
                </ul>
                <p>These permissions are now granted to all users, regardless of their access level.</p>
                <p>It seems permissions were removed from all users in commit <code>12f3af3</code>, to fix LS-94.</p>
            </td>
        </tr>
        <tr>
            <td>
                <p><strong>Title:</strong> Adjusted user permissions when saving local data</p>
                <p><strong>Description:</strong> Users did not have the required permissions. Now they have been given to them.</p>
            </td>
            <td>
                <p><strong>Title:</strong> Adjusted user permissions when saving local data</p>
                <p><strong>Description:</strong> Users did not have the required permissions. Now they have been given to them.</p>
                <p>Permissions are usually not granted at a global level. However, it is ok to give these permissions to a global level because all users should have access to these permissions, regardless of their access level.</p>
                <p>Non-registered users will not have these permissions applied because they do not get an instance of <code>IUser</code> until they create an account.</p>
            </td>
        </tr>
    </tbody>
</table>

In my current team, we came up with the following template (just use it as an example):

- **Background:** explain what the problem was that you were trying to solve anyway. Indicate any investigation that you did to find the original problem instead of the symptom that it usually is found when talking about bugs.
- **Changes done:** explain any non-obvious changes that can be seen by reviewing the code. Why did you take a particular approach and not another? Why did you choose certain names for certain elements? Are you introducing new concepts to the system, and if so, which are those?
- **Pending to be done:** Technical debt you decided to leave (and why). Bugs that were introduced already identified (and why you left them). Shortcomings. Things out of scope that you think may get you asked "why didn't you fix it?" Things you'd like done but you thought "today's not the day".
- **Notes:** any miscellaneous stuff that reviewers should know about. (For example, is it better to review code in a certain way rather than looking at the diff linearly?)
- **Reviewers:** who in particular you want to review your code. Maybe they're experts in the area you're working. Maybe they're the leaders that coordinate your group. Maybe it's someone that will be directly affected by it.

## 3. Content of the pull request

### 3.1. Do not include garbage

I covered a little bit of this idea in my previous post, [Taming your tools](https://blog.alphasmanifesto.com/2016/02/28/taming-your-tools/). Every content of the pull request that is not helping to achieve the goal is helping to hide it. This usually goes against the tendency of opportunistic refactoring and adjusting styles.

I personally prefer to leave them for subsequent PRs, but use your judgment. If your opportunistic refactor is a variable name change that affects only two lines, yeah, go ahead. If completely changes the design of an approach for greater flexibility, you may want to give it a PR of its own.

Remember that the longer a pull request is, the less likely you're going to have it reviewed. Furthermore, if you're including a lot of changes, it is likely that people will miss changes that are more important when reviewing everything.

One way to approach this is to make only the minimal-required changes for your approach to work. If you found refactors/improvements that you still want to make, you can branch them off and include those PRs later, or create a PR that goes against the branch of the first PR. Then the team may choose to approve those and merge them all together or merge them piece by piece in a reverse-cascade (more on this on point _3.3. Break it into manageable chunks_).

The point is: have the changes being reviewed be the changes that you want reviewed. Don't mix them up or clutter them with unnecessary changes. Review each line before performing your PR, ask yourself: "Is this needed? Is this worth it to have in here?"

### 3.2. Stay focused on the original intention of the change

This applies when deciding which changes should be part of the PR and when discussing feedback of the PR itself. Keep you mind focused on solving the original problem that you were trying to solve, and don't let it wander off too much. Don't include opportunistic fixes or "miscellaneous stuff". Not only it will make reviewing harder, but it will create difficulty in tracking changes in the future and it may actually delay your submission because those points will need to be discussed as well. You may be holding off merging an important feature or fix because you decided to also include a change to the wording in the UI.

Importantly, decide on the scope of the changes that you're making. Sometimes a piece will require some other piece to be adjusted, and you don't want to start a cascade of changes thorough the whole code just to address a particular change.

### 3.3. Break it into manageable chunks

The PR itself should be readable in a considerably short amount of time. You want your reviewer's full attention and if you're submitting way too many changes, it's very likely that won't happen. If the changes are just too many to make it a manageable PR, break it into chunks. You can always submit a module design even if that's not integrated with the other code. You can always submit changes to one class without including the changes to the others, as long as this does not break the system altogether. Think about the modularity of what you have done and take advantage of it.

Depending on how your team manages this, they may want to review the whole feature before merging instead of merging it in chunks. If that's the case, create a branch on top of a branch and create nested PRs, like so:

- `branch1` has as destination `main-branch` -- this is PR 1
- `branch2` has as destination `branch1` -- this is PR 2
- `branch3` has as destination branch2 -- this is PR 3

Once all three PRs had been accepted, you can then merge them in reverse order: PR 3, then PR 2, then PR 1. The set of changes will be the same that you had originally, but you allowed the team to review it in bite-size pieces.

In order to keep this working, it is important each of the branches is coming out of the right place. See _4.2. Keep it updated to the destination branch_.

### 3.4. Missing pieces: make them obvious and explain why

You may find parts that need to be fixed later but they are not relevant to the changes that you're making. Maybe a bug that came out of analyzing that portion of code. Maybe a possible risk that is not meant to be addressed right now. Maybe a refactor that will have to be done for readability. Maybe there are parts of the newly introduced code that are left to be completed or changes that need to be addressed in the future.

Whatever it is, if you found it and decided not to make these changes right now, make it obvious to reviewers and future visitors of the code. I usually prefer to use `//TODO` comments, since most IDEs will recognize them as a set of pending tasks. Some others also recognize `//FIXME` and `//HACK`, with some of them even allowing to set priority levels for them. Regardless, make it obvious that there's a certain piece that you know it's missing, but it's not meant to be done between the changes that you're doing.

When doing so, explain:

- What change needs to be done and to achieve what purpose
- Why the change cannot be done right now
- If there's any tracking ticket associated to it, which is it

<table>
<thead>
<tr>
<th>Bad examples</th>
<th>Good examples</th>
</tr>
</thead>
<tbody>
<tr>
<td><pre>//TODO fix this</pre></td>
<td><pre>//TODO refactor this -- code is unreadable (but not a priority right now)</pre></td>
</tr>
<tr>
<td><pre>//FIXME user permissions are wrong</pre></td>
<td><pre>//TODO review given user permissions, they may be not allowing users of type "regularUser" to save data (LS-102)</pre></td>
</tr>
<tr>
<td></td>
<td><pre>/*TODO rename this method to "saveUserData", as it explains better its purpose.
  Won't do that right now because the API depends on it and that involves
  major changes. (LS-105)</pre></td>
</tr>
</tbody>
</table>

### 3.5. Different commits or one single commit?

Some teams or team members like to submit their changes in a single commit, while some others prefer to have small commits.

For the purposes of code reviewing, different commits will only be relevant to reviewers if the changes in them are not overwritten by other commits in the same branch If that's the case, reviewing by commit may be useful for your reviewers, but most of the time, it's very likely they won't be reviewing a PR like this. If you think it is easier reviewing it like this because your changes in each commit are exclusive to each other, indicate so in the PR that you're submitting.

## 4. Driving it to completion

### 4.1. Reach a decision on every piece of feedback received

Keep track of every piece of feedback and make sure that a decision has been agreed for each. The decision may be "change it as part of this PR submission", or "won't change it", or "to be decided later, will leave as it is". Whichever it is, make sure that the consequences of such decisions are understood so that your PR does not mean that the system cannot be released anymore.

Answer all questions provided by reviewers, even if it's a "agreed" and you proceed to make the changes. This helps in communication and to make sure nothing is lost. Study the reviewing system you use to make sure nothing is lost. Setup email communications so even if updating the PR cleans up questions, you can still review them in your email. Heads up: GitHub shows historic questions in the main tab, BitBucket shows them in the activity tab or a the top right corner diff of the files (if they're referencing changed code).

If there is a requirements tracking system, log these changes or these pending discussions, referencing the PR and indicating the reasons that gave place to the discussion in the first place.

### 4.2. Keep it updated to the destination branch

While the PR is under review and changes are being discussed, it is possible that the destination branch will change. Needless to say, if this results in conflicts, they need to be fixed before any more review can be done on the PR itself.

Regardless, it is a good idea to keep the branch updated. I usually prefer rebasing the branch so that it always starts from the most recent point of the destination branch. However, some others prefer just back-merging the destination branch to the feature branch.

### 4.3. Don't let it sit stale for too long

If the PR is not getting attention from reviewers, or discussions are taking too long, there is more risk of the PR becoming stale. This means that the destination branch may advance more, making it likely that the code needs to be modified to accommodate these changes, or even that the changes being proposed do not make sense anymore, making the whole set of changes obsolete.

On the reviewers side, they'll need to give reviews with appropriate timing (but we'll cover this in a future post). From the submitter's point of view, make sure that all the required changes and discussions are moving forward. Don't let suggestions or requests sit around waiting for feedback. Make changes as soon as you can and send them over to the PR.

Make sure to (politely) request attention from reviewers if you still need them to review or merge your code. If you're in charge of merging it, make sure that you've got the approvals or reviews from whoever you need / want to.

### 4.4. Keep changes small for the feedback received

Most of the changes that should be requested out of a PR should be small changes. From small things like typos and wordings to the steps of a particular method are acceptable, but if the design of a particular class or the approach to the problem themselves need to be changed, then this PR is unfit to be kept alive. This PR should be declined or closed and a new one should be presented with the new set of changes.

This is because reviewers will likely understand that these changes will require a new structure of code, and then the rest of the code needs to be reviewed with that in mind, but with the code not being there. This will lead to confusions, omissions, and even discussions that don't really make sense until the code is right there to discuss about it. Also, when the changes are submitted to the same PR, they will undo most of what the original change had done, and so everyone will have to review again. For hosts like BitBucket where they allow reviewers to approve the PR, this should invalidate those approvals, but that doesn't happen, leading to more confusions. Was the code approved? Or was that before the refactor? Did you already review after the refactor?

Avoid these problems altogether and keep only small changes as part of a PR.

## 5. General interactions

### 5.1. Don't get personal or defensive

Yes, you thought of a great approach. Yes, you dedicated many hours. Yes, you did the hard work and somebody came over and by looking it just 30 seconds decided that it was wrong and you need to change stuff.

Analyze the reasons for the feedback. Be analytical and think if the proposed change benefits the product, the project, or the future developers. If the answer is yes, then this is a worthy change, but doing it right now or not is a discussion about priorities that you should have with your team.

If you still disagree, don't get emotional about it. Asks for reasons if they were not given.

Don't let yourself be bullied, either. If they're not being appropriate with you, handle it in the most appropriate way. For an open source project, this may be reaching out in a more explanatory approach. For a closed team development, this may be reaching out to the team's authorities or HR.

However, in no way you should get personal or defensive about a piece of code. It has no right to be like it is, if there is a zero-cost better version of itself.

### 5.2. If you disagree, state why and the benefits of your approach

You may still reach a point in a discussion where it is just a matter of opinion, or when you and your reviewer neither have the right information to make a decision on whether a change should be made or not. If that's the case, explain the reasons that took you to this particular approach and the benefits that this will bring the product, the project or future developers. Some of those may be challenged, and that's perfect -- this is why you're having the discussion in the first place.

Keep your discussion centered and on point. Identify and explain which part of your decisions are based on proven fact and which ones on personal opinion.

### 5.3. On impasses, delegate decisions to authority

Sometimes you'll disagree with someone and you won't reach a nice middle ground. Sometimes you have really strong feelings about an approach and another person has others on it.

If you report to this person, inform them of the shortcomings of their approach but if once inform, they still prefer it, make the changes they decide. If this person is a colleague but you don't report to each other, escalate the question to the person you report to. Simple approach is: have your boss decide for you. You want your boss to accept a particular risk if it needs to be done and to sign off on it. At the end of the day, it is important they know about it (so it's not a surprise), and if they take responsibility for it if something goes wrong, so you don't have to say "I told you so" (which is a bad situation to be in anyway).

Similarly, if the changes are requested by somebody above your direct boss, make the changes but keep your boss informed about it.

This all goes beyond development anyway.

## Meta-Notes

- This guide is numbered so that it can be extended and I can receive feedback with easy referencing of particular points.
- You're free to use this as a reference or to adapt it with proper attribution. I would still appreciate feedback.
