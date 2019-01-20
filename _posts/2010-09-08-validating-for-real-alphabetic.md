---
layout: post
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
---

Validation is an essential part of any application. We need to check that the data entered is in the range of the set of data we can handle. And not only security purposes, but also to make sure that is is into what we can process.

Not so long ago, I had to make a very common validation: Alphabetic Characters. Most of us developers would have just created a regular expression against the set A-Za-z or maybe using another set like \w. Well, this does not always gives us what we really want.

In my case, I had to validate for more than just A-Z. This is, my application should allow for different languages where the alphabet was extended from the basic Latin 26-letters.

## Accented vowels

Sure, I could add the accented vowels. á, é, í, ó, ú, á, é, í, ó, ú. Well, that's the acute accent. We have the grave one: &agrave;. We have the circumflex: &acirc;. Diaeresis: &auml;. Oh, wait. They're [even more](http://en.wikipedia.org/wiki/Diacritic). Suddenly, too much to remember or to manually write.

## Wait, there's more...

And not only vowels. It seems that consonants can also be accented. &yacute;. ñ. &scaron;. &ccedil;.

Oh, there are even more letters. In German, for example, the "ss" letter combination evolved to &szlig;. Those are ligatures: &oelig;. &thorn;. &aelig;.

These are all, believe it or not, part of the [Extended Latin Alphabet](http://en.wikipedia.org/wiki/Latin-derived_alphabet). So, if I wanted Johann Strau&szlig;, Kurt G&ouml;del or Maria Skłodowska (later known as Mrs. Curie) to have a user in my application, I needed to allow this type of entrances.

## Languages provide a tool for that

Some languages do provide a tool for that. For instance, Perl provides the \X operator. This matches any unicode character. Anyway, this is a little more than we want to actually achieve.

Other tool languages provide is the \p{} and \P{} operators. This goes for Perl and .NET. I think Java also does. More information on these special features can be read at the [Unicode section of Regex Tutorial](http://www.regular-expressions.info/unicode.html).

However, if you're trying to have a rich web 2.0 application, then you need to have this working in JavaScript too. Of course, server side validations need to be made, but still, a rich user experience demands that we do not wait to go to the server until we give the user a "Invalid name" message or something alike.

## What can we do in JavaScript?

JavaScript does provide support for the \uXXXX operator to match a specific unicode codepoint. Knowing that, I made a quick look trought the [Unicode Block Listing](http://www.fileformat.info/info/unicode/block/index.htm), and gathered all those points that where part of the Latin or extended Latin alphabet. Here's what I found:

- From block: [C0 controls and basic Latin](http://www.fileformat.info/info/unicode/block/basic_latin/index.htm) (U+0000&ndash;007F)<br />
\u0041-\u005A<br />
\u0061-\u007A
- From block: [Latin-1 Supplement](http://www.fileformat.info/info/unicode/block/latin_supplement/index.htm) (U+0080&ndash;00FF)<br />
\u00C0-\u00F6<br />
\u00F8-\u00FF
- From block: [Latin extended-A](http://www.fileformat.info/info/unicode/block/latin_extended_a/index.htm) (U+0100&ndash;017F), [Latin extended-B](http://www.fileformat.info/info/unicode/block/latin_extended_b/index.htm) (U+0180&ndash;024F), [IPA Extension](http://www.fileformat.info/info/unicode/block/ipa_extensions/index.htm) (U+0250-02AF)<br />
\u0100-\u02AF
- From block: [Latin extended additional](http://www.fileformat.info/info/unicode/block/latin_extended_additional/index.htm) (U+1E00&ndash;1EFF)<br />
\u1E00-\u1EFF
- From block: [Latin Extended-C](http://www.fileformat.info/info/unicode/block/latin_extended_c/index.htm) (U+2C60-2C7F)<br />
\u2C60-\u2C7F

In case you wonder why the range Latin-1 Supplement leaves out the \u00F7 codepoint, it's because it is a division symbol.

Ok. Making this all one RegExp (I added a space at the end, that is on purpose):

```javascript
var regex = new RegExp(/^[\u0041-\u005A\u0061-\u007A\u00C0-\u00F6\u00F8-\u00FF\u0100-\u02AF\u1E00-\u1EFF\u2C60-\u2C7F ]+$/);
```

Let's simplify it a little bit (\u00FF and \u0100 are consecutives, we can include them in one single range).

```javascript
var regex = new RegExp(/^[\u0041-\u005A\u0061-\u007A\u00C0-\u00F6\u00F8-\u02AF\u1E00-\u1EFF\u2C60-\u2C7F ]+$/);
```

And there it is! You can try it out at the [JavaScript Regular Expression Tester](http://www.regular-expressions.info/javascriptexample.html)!

By the way, this expression should work on other languages as well.
