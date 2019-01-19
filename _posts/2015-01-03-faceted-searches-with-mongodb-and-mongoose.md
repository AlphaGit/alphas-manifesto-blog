---
layout: post
status: publish
published: true
title: Faceted searches with MongoDB and mongoose
author:
  display_name: Alpha
  login: Alpha
  email: alphagma@gmail.com
  url: http://www.alphasmanifesto.com/
author_login: Alpha
author_email: alphagma@gmail.com
author_url: http://www.alphasmanifesto.com/
wordpress_id: 5224
wordpress_url: http://blog.alphasmanifesto.com/?p=5224
date: '2015-01-03 17:13:04 +0000'
date_gmt: '2015-01-03 23:13:04 +0000'
categories:
- Projects
- Technology
tags:
- design
- search
- patterns
- MongoDB
- faceted search
- design patterns
- filters
comments:
- id: 25301
  author: How TDD pays off | Alpha&#039;s Manifesto
  author_email: ''
  author_url: http://blog.alphasmanifesto.com/2015/03/30/how-tdd-pays-off/
  date: '2015-03-30 22:36:48 +0000'
  date_gmt: '2015-03-31 03:36:48 +0000'
  content: "[&#8230;] Do you remember my side-project, mongo-faceted? If not, you
    can read about it here. [&#8230;]"
---

![]({{ site.baseurl }}/assets/mongo-faceted-logo-300x290.png)

Generating facet search results


Some people in Latin-America may remember an old _Yupi_ ad where a woman was complaining on how difficult using the internet was. "_It's so difficult. So complicated! There must be something better._" (In Spanish, of course.) Cheesy as it sounds, H&auml;ndel Messiah's "Hallelujah" sonorously invaded the screen. Don't believe me? <a href="https://www.youtube.com/watch?v=oI1Tjeh4_D8">See for yourself</a>.

That's how I felt when I was investigating what's the best approach to achieve faceted searches in MongoDB. But I found something better. Let me show it to you.

<!--more-->

 For a project that I had been assisting with for a while already, the need for performing faceted searches came up. I haven't done this before with MongoDB but -- how hard could it be, right? I went out searching for the best practices on the subject, only to find contrived examples and approximations that didn't account for all situations. Most solutions had limitations here and there. Not only downsides, but straight down cases that would not work, and some others weren't even worth the effort for the maintainability nightmare that they would have caused. Some other solutions for that were already part of paid products, which is not something that we could use for this project (you know, small pet projects and so on).

So I stepped onto it and came up with a simple and reusable solution: <a href="https://github.com/AlphaGit/mongo-faceted">mongo-faceted.</a>

## What is faceted search?

If you reached here and don't know what faceted search is, don't worry my friend, I can deliver that to you in a painless simple explanation. Think of it as "intelligent filters", although there is a little bit more to them, conceptually.

When you search google for "cars", you will get a list of results. You can think on this search as performing a filter: you're telling Google to give you, from the set of all the results that it could provide, only those that are related with cars. You just performed a filter. (Congratulate yourself quickly and keep reading.)

When you switch to Google Images, you have performed yet another filter: you're telling Google to provide results related with cars AND those that happen to be images. Before you can congratulate yourself again, you may have noticed that the toolbar can help you find what you're looking for, with options that seem to be a little more intelligent: options that make sense for images, for example, their color.

![]({{ site.baseurl }}/assets/googlecars.png)


This type of filter makes no sense for things that are not images.

You may have noticed this pattern already: if you enter the computer departments in Amazon, the filters may show something like the processor type or the screen size. And furthermore, it gives you the options that are available. **This is called faceted search:** the system gives you the available attributes and the possible set of values for those attributes. These are called facets.

If the system is intelligent enough, it will help you in not making combinations that will return nothing, because that's useless to you, seeing an empty page is not probably what you were looking for.

If you're interested in this pattern and its best practices, I suggest you stop searching for cars in Google and read these great articles:

- <a href="http://alistapart.com/article/design-patterns-faceted-navigation">Design Patterns: Faceted Navigation</a>, from A List Apart
- <a href="http://www.nngroup.com/articles/filters-vs-facets/">Filters vs. Facets: Definitions</a>, Norman Nielsen Group
- <a href="http://www.welie.com/patterns/showPattern.php?patternID=faceted-navigation">Faceted Navigation</a>, Patterns in Interaction Design (Wellie.com)
- <a href="http://en.wikipedia.org/wiki/Faceted_search">Faceted Search</a>, Wikipedia

## Using mongo-faceted

mongo-faceted is a library that you can incorporate in your own code which allows you to perform faceted searches and get results on what that search allows to filter.

Here you can see an example of how it can be used:

<script src="https://gist.github.com/AlphaGit/3e48471ef1a4c0565211.js"></script>

As you may have already guessed, mongo-faceted performs two slight modifications:

- It adds the `searchWithFacets` method as a static method to the model you were defining. All other methods are left untouched and will work as usual.
- When calling `searchWithFacets` it will return the usual results and also include a property called `facets`.  This property will include all available facets and their values.

mongo-faceted will detect the structure of your schema and add the proper logic to your model. Invoking this functionality is just one line: `mongoFacets(modelName, schema)`.

If you happen to find any issues or limitations, feel free to <a href="https://github.com/AlphaGit/mongo-faceted/issues/new">report an issue</a> on the repository, or submit pull requests (definitely welcome!).

## How it works

mongo-faceted works a very simple way: it performs a search, and then performs a second search aggregating results. This is a linear approach to the generally recommended approach of performing a single call for every property in the schema, facilitated by MongoDB's aggregation framework.

The aggregation call has basically this structure:

- `$match`: _`originalSearchFilters`_, so that it applies on the same set of results
- `$unwind`: one `$unwind` step for every array property in the schema, so that they can be reported together
- `$group`: `$addToSet` for every property, so that all possible non-duplicate values are reported as available for a specific property

You can also <a href="https://github.com/AlphaGit/mongo-faceted/blob/01b6ac37e0c8b5e8bba4bb864c1b805e7b9e8157/poc/ImageModel.js">see how the approach can be applied without the library</a>, which was basically a proof-of-concept that I worked on before making this reusable as a library.
