---
layout: post
status: publish
published: true
title: Validating for real alphabetic
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 2506
wordpress_url: http://blog.alphasmanifesto.com/?p=2506
date: '2010-09-08 15:50:14 +0000'
date_gmt: '2010-09-08 17:50:14 +0000'
categories:
- Projects
- Technology
tags:
- JavaScript
- ".NET"
- Java
- validation
- user experience
- multilanguage
- Unicode
comments: []
---
<p>Validation is an&nbsp;essential&nbsp;part of any application. We need to check that the data entered is in the range of the set of data we can handle. And not only security purposes, but also to make sure that is is into what we can process.</p>
<p style="text-align: justify;">Not so long ago, I had to make a very common validation: Alphabetic Characters. Most of us developers would have just created a regular expression against the set A-Za-z&nbsp;or maybe using another set like \w. Well, this does not always gives us what we really want.</p>
<p style="text-align: justify;">In my case, I had to validate for more than just A-Z. This is, my application should allow for different languages where the alphabet was extended from the basic Latin 26-letters.</p>
<h2 style="text-align: justify;">Accented vowels</h2>
<p style="text-align: justify;">Sure, I could add the accented vowels. &Aacute;, &Eacute;, &Iacute;, &Oacute;, &Uacute;, &aacute;, &eacute;, &iacute;, &oacute;, &uacute;. Well, that's the acute accent. We have the grave one: &agrave;. We have the circumflex: &acirc;. Diaeresis: &auml;. Oh, wait. They're <a href="http://en.wikipedia.org/wiki/Diacritic">even more</a>. Suddenly, too much to remember or to manually write.</p>
<h2 style="text-align: justify;">Wait, there's more...</h2>
<p style="text-align: justify;">And not only vowels. It seems that consonants can also be accented. &yacute;. &ntilde;. &scaron;. &ccedil;.</p>
<p style="text-align: justify;">Oh, there are even more letters. In German, for example, the "ss" letter combination evolved to &szlig;. Those are ligatures: &oelig;. &thorn;. &aelig;.</p>
<p style="text-align: justify;">These are all, believe it or not, part of the <a href="http://en.wikipedia.org/wiki/Latin-derived_alphabet">Extended Latin Alphabet</a>. So, if I wanted Johann Strau&szlig;, Kurt G&ouml;del or Maria Skłodowska (later known as Mrs. Curie)&nbsp;to have a user in my application, I needed to allow this type of entrances.</p>
<h2 style="text-align: justify;">Languages provide a tool for that</h2>
<p style="text-align: justify;">Some languages do provide a tool for that. For instance, Perl provides the \X operator. This matches any unicode character. Anyway, this is a little more than we want to actually achieve.</p>
<p style="text-align: justify;">Other tool languages provide is the \p{} and \P{} operators. This goes for Perl and .NET. I think Java also does. More information on these special features can be read at the <a href="http://www.regular-expressions.info/unicode.html">Unicode section of Regex Tutorial</a>.</p>
<p style="text-align: justify;">However, if you're trying to have a rich web 2.0 application, then you need to have this working in JavaScript too. Of course, server side validations need to be made, but still, a rich user experience demands that we do not wait to go to the server until we give the user a "Invalid name" message or something alike.</p>
<h2 style="text-align: justify;">What can we do in JavaScript?</h2>
<p style="text-align: justify;">JavaScript does provide support for the \uXXXX operator to match a specific unicode codepoint. Knowing that, I made a quick look trought the <a href="http://www.fileformat.info/info/unicode/block/index.htm">Unicode Block Listing</a>, and gathered all those points that where part of the Latin or extended Latin alphabet. Here's what I found:</p>
<div id="_mcePaste" style="text-align: justify;">
<ul>
<li>From block: <a href="http://www.fileformat.info/info/unicode/block/basic_latin/index.htm">C0 controls and basic Latin</a> (U+0000&ndash;007F)<br />
\u0041-\u005A<br />
\u0061-\u007A</li>
<li>From block: <a href="http://www.fileformat.info/info/unicode/block/latin_supplement/index.htm">Latin-1 Supplement</a> (U+0080&ndash;00FF)<br />
\u00C0-\u00F6<br />
\u00F8-\u00FF</li>
<li>From block: <a href="http://www.fileformat.info/info/unicode/block/latin_extended_a/index.htm">Latin extended-A</a> (U+0100&ndash;017F), <a href="http://www.fileformat.info/info/unicode/block/latin_extended_b/index.htm">Latin extended-B</a> (U+0180&ndash;024F), <a href="http://www.fileformat.info/info/unicode/block/ipa_extensions/index.htm">IPA Extension</a> (U+0250-02AF)<br />
\u0100-\u02AF</li>
<li>From block: <a href="http://www.fileformat.info/info/unicode/block/latin_extended_additional/index.htm">Latin extended additional</a> (U+1E00&ndash;1EFF)<br />
\u1E00-\u1EFF</li>
<li>From block: <a href="http://www.fileformat.info/info/unicode/block/latin_extended_c/index.htm">Latin Extended-C</a> (U+2C60-2C7F)<br />
\u2C60-\u2C7F</li>
</ul>
</div>
<p style="text-align: justify;">In case you wonder why the range Latin-1 Supplement leaves out the \u00F7 codepoint, it's because it is a division symbol.</p>
<p style="text-align: justify;">Ok. Making this all one RegExp (I added a space at the end, that is on purpose):</p>
<p style="text-align: justify;"><code>var regex = new RegExp(/^[\u0041-\u005A\u0061-\u007A\u00C0-\u00F6\u00F8-\u00FF\u0100-\u02AF\u1E00-\u1EFF\u2C60-\u2C7F ]+$/);</code></p>
<p style="text-align: justify;">Let's simplify it a little bit (\u00FF and \u0100 are consecutives, we can include them in one single range).</p>
<p style="text-align: justify;"><code>var regex = new RegExp(/^[\u0041-\u005A\u0061-\u007A\u00C0-\u00F6\u00F8-\u02AF\u1E00-\u1EFF\u2C60-\u2C7F ]+$/);</code></p>
<p style="text-align: justify;">And there it is! You can try it out at the <a href="http://www.regular-expressions.info/javascriptexample.html">JavaScript Regular Expression Tester</a>!</p>
<p style="text-align: justify;">By the way, this expression should work on other languages as well.</p>
