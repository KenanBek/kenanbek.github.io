---
layout: article
permalink: /devhub-real-world-project-go-python-javascript-react
title: "DevHub - real-world project with Go, Python and JavaScript (React)"
date: 2019-09-13 10:44:00 +0200
lastmod: 2019-09-13 13:38:00 +0200
categories: Posts
categories: [1. Highlighted Posts]
tags: [devhub, search engine, project structure, golang, python, javascript, front-end, back-end, design, concept, react, react-native, expo]
sitemap:
    priority: 1
    changefreq: weekly
comments: true
todo: [
    "monorepo",
    "add links (github, video1)"
]
---

## Overview

**DevHub** is aimed to be the search engine of technical links for nerds (like myself :). The plan is to build a website (and mobile) with a list of technical links indexed and weighted by popularity and value. You can search, share and communicate around the link.

Also, the whole development process of DevHub will be open-sourced and shared via YouTube videos and articles. Anyone can join and be a part of the project.

Since DevHub is not planned to be just a demo website but a valuable tool for developers, I believe that it will help [newbie] developers from around the world to see the whole software development process in the example of real-world application and also be the first users of it.

## Tech Stack

Shortly, the tech stack is as following: Golang for backend including data crawlers and data processing, Python for API and communication, React for the web and React Native for mobile (iOS and Android).

In this particular article, I will explain (mostly to myself :) how to structure a project with different parts in different programming languages and frameworks.

## Why Go, Python and JavaScript

Most of the questions about tech stack are related to the selection of these 3 languages. People wondering why 3 and why exactly these 3.

The answer is pretty simple: for learning and teaching purposes.

Learning part: I am personally very interested in learning these 3 languages. For the last 5 years, I primarily use Python. In my previous experience, I did a lot of .NET development with C# (WinForms, WPF, ASP.NET MVC), some Java, a little C++, and Assembler. But for the next 3 years, I want to dive into mostly Go. Also, very kin to get some mid-level knowledge on JavaScript and it's front-end frameworks like React and React Native. Since I use Python for mostly all current projects sometimes I also need to write/compile C code and wrap it with Python, but this is for another story :)

Sharing (teaching) part: No secret that these 3 languages are always in trends for the last few years. Hence, it is also interesting for my audience. And you can do a lot of interesting stuff by using them and related technologies (like API development with Python, CLI tools with Go or testing with Jest). So, that's my hope that we can have fun with these technologies.

## High-level design

From the perspective of high-level design, project DevHub will consist of the following parts:
 
1. Data Layer
2. API Layer
3. Front-end Layer

**Data layer** is responsible for the following tasks:

1. Retrieve data from an external source
2. Process data based on the following aspects:
 1. Indexing based on title and content
 2. Rank based on source and references

**API layer** is responsible for the communication between the data layer and front-end layer. It also includes user authentication and management. Example of API endpoints:

1. http://api.devhub.codervlogger.com/auth/
2. http://api.devhub.codervlogger.com/links/
3. http://api.devhub.codervlogger.com/links/1/
4. http://api.devhub.codervlogger.com/links/1/refs/
5. http://api.devhub.codervlogger.com/links/1/comments/
6. http://api.devhub.codervlogger.com/links/1/likes/

**Front-end layer** is a collection of front-end applications which expose functionality to end-users. By end-users we understand:

1. Internal tools for monitoring and management
2. External users (let's call them customers) of the application(s)

Also, there are will be a lot of tooling and infrastructure configuration. Like Docker and Docker Compose for containers, Kubernetes for deployments, metrics, logs, etc, etc.

## User Flow

Basic user flow looks like the following:

1. A user enters the website: https://devhub.codervlogger.com/
2. A user gets to the *list* page where he/she can:
 1. see an ordered list of the recently processed links
 2. search for a keyword or term
 3. click on the particular link to get to the *details* page
3. On *details* page, user can:
 1. read the whole article
 2. leave a comment
 3. recommend it
 4. share it
 5. see list of the similar links

## Project Structure

- `devhub-be` - back-end (spiders, parsers, indexer)
- `devhub-be-api` - RESTful API layer for back-end
- `devhub-fe` - front-end (generic placeholder, later shared components)
- `devhub-fe-web` - front-end (React for web application)
- `devhub-fe-mobile` - front-end (React Native for iOS and Android)

The current structure of the repository looks like this:

```
devhub: # git root directory
|-devhub-be # container for back-end
 |-devhub # go project
|-devhub-fe-web # container for front-end web
 |-devhub # react project
|-devhub-fe-mobile # container for front-end mobile
 |-devhub # expo/react native project
```

As you can see for each technology we have *devhub* as a root folder. This is done to keep naming (and at some point namespace) consistent. More on this we will discuss in our upcoming articles.

## Next

Checkout Wiki of DevHub repository for detailed information on the features of [Version 1](https://github.com/CoderVlogger/devhub/wiki/Backlog-for-Version-1).
