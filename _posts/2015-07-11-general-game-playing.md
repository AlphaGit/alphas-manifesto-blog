---
layout: post
status: publish
published: true
title: General Game Playing
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5298
wordpress_url: http://blog.alphasmanifesto.com/?p=5298
date: '2015-07-11 15:41:41 +0000'
date_gmt: '2015-07-11 20:41:41 +0000'
categories:
- Juegos
- Projects
- Technology
tags:
- Stanford
- general game playing
- coursera
- course
- MOOC
- artificial intelligence
comments: []
---

![](/assets/mechaskunky.png)

Automatic players that don't complain when they lose

<p>I've recently taken and finished the course on <a href="https://www.coursera.org/course/ggp">General Game Playing</a>, by Stanford University. Let me tell you what it was about and what the experience was like.</p>
<p><!--more--></p>
<h2>Course contents</h2>
<p style="text-align: justify;"><em>General Game Playing</em> is a branch of Artificial Intelligence, particularly dedicated to game players. The difference with the single-purpose game players, is that the former&nbsp;will work on an abstraction for a language that defines a game's rules and logic, and based on that, it will play it. Of course, the tricky part is to get it to play it&nbsp;<em>well</em>. In short, it not a player for a single game, but a player for&nbsp;<em>any</em> game.</p>
<p style="text-align: justify;"><b>But how do you do that?</b> Well, the challenge here is to program a method that allows an agent to go through the possible actions that a game allows it to perform and determines which is the best course for it. Sometimes it will be able to pickup with of the moves makes it a winner, other times it will have to guess on arbitrary parameters that seem relevant (heuristics), some others some kind of memory will be built on it so that it can learn. Sometimes, it'll just have to guess and see what happens (and learn from that!).</p>
<p style="text-align: justify;">So, the real magical thing here is to:</p>
<ul>
<li style="text-align: justify;">Get your agent to understand what it can do in a game (language parsing, game memory representation, state machines, propositional networks, etc.)</li>
<li style="text-align: justify;">Get your agent to detect any possible&nbsp;<em>shortcuts&nbsp;</em>or&nbsp;<em>dead-ends</em> for the game, as to not waste resources investigating those</li>
<li style="text-align: justify;">Get your agent to make decisions in a reasonable amount of time (or get disqualified from making a move)</li>
</ul>
<p style="text-align: justify;">Along they course they told us several techniques for this, like different search methods in the action space, alpha-beta pruning, minimax, Monte Carlo searches. Meta-gaming heuristics, and even search-space reduction by deducting some of the&nbsp;dead ends that the rules of a game can create.</p>
<p style="text-align: justify;">It's a pity the last chapters on propositional networks and metagaming were just theoric and not exercise-oriented like the rest of the course, but they <i>did</i>&nbsp;say much of this stuff is currently under research. It's crazy-cool that we're allowed to learn and experiment with this field as it's being develop. If someone has the time and interest, they may even help expand it, since it's just picking up.</p>
<h2>Tiltyard competition</h2>
<p style="text-align: justify;">To make things even more interesting, by the end of the course all students were&nbsp;free to join the annual <strong>General Game Playing Competitions</strong> that Stanford hosts on a server called Tiltyard. I was planning to enter&nbsp;but could not make it for time reasons. All in all, besides being fun, it's also very challenging and helps push investigations forward.</p>
<h2>Conclusion</h2>
<p style="text-align: justify;">For anyone interested in AI and games, I definitely recommend this course for which you don't need much more than Java and a little bit of HTTP knowledge. Aside from that, just the will to have fun seeing your players learn and adapt by themselves, with the virtues and deficiencies of the strategies you bult on them (and sometimes even better: some strategies that you did <i>not</i>&nbsp;build into them).</p>
