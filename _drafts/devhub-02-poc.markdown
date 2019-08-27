---
layout: article
title:  "DevHub PoC (Prove of Concept)"
date:   2019-08-24 23:34:00 +0200
categories: Posts
tags: [devhub, poc, project structure]
---

*In the beginning there are was a PoC.*

Before we start with actual and broad project structure, let's design Prove of Concept (PoC) project.

As a PoC we will be designing a very simple but working example of the desired application with very simple (and probably single) workflow.

## Goal of PoC

We are going to parse following URLs (which are software engineering blog) and extract URLs to articles. Here are list of the source links:

- https://labs.spotify.com/
- https://www.twilio.com/blog/
- https://hacks.mozilla.org
- https://engineering.linkedin.com
- https://code.fb.com/
- https://github.blog/
- https://eng.uber.com/
- https://medium.com/airbnb-engineering
- https://labs.spotify.com/
- https://blog.booking.com/
- https://blog.cloudera.com/
- https://medium.com/@Pinterest_Engineering
- https://news.ycombinator.com/
- http://highscalability.com/
- https://machinelearningmastery.com/blog/
- https://open.buffer.com/

Initial version of parser will be static. That means that we will have predefined rules to define is the given link an article or something else, like category links or about page. Example with pseudocode:

```
isArticle('https://example.com/post/python-is-cool') # should return True
isArticle('https://example.com/about') # should return False
```

To make a decision about which link is article and which are not we will keep JSON file with all rules for all source websites.

```
[{
    "website": "http://highscalability.com/",
    "article_regex": "<post regex for highscalability.com>"
}, {
    "website": "https://news.ycombinator.com/",
    "article_regex": "<post regex for news.ycombinator.com>"
}]
```

Technically `isArticle` will rely on the information provided from another function

```
getArticleRules('https://example.com')
```

this function will return RegEx from stored JSON file with all rules for all source websites.

## Structure

For the sake of PoC we will keep everythink in one [monorepo](google-monorepo):


- devhub-poc
    - devhub
    - devhub-api
    - devhub-web

`devhub-poc` is our repository. In the root of the repository we have 3 folder corresponding to backend, api communication and frontend web layers. As a database we will use **[MongoDB | Postgres]**,



[google-monorepo]: https://cacm.acm.org/magazines/2016/7/204032-why-google-stores-billions-of-lines-of-code-in-a-single-repository/fulltext
