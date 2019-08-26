---
layout: article
title:  "DevHub "
date:   2019-08-24 23:34:00 +0200
categories: Posts
tags: [devhub, search engine, project structure, golang, python, javascript, front-end, back-end, design, concept]
---

**DevHub** is aimed to be search engine for nerds. It's bank of technical links indexed, weighted and organized for all kind of nerds. You can search, share and communicate around the link.

Another, and probably most interesting, part of **DevHub** - design, development, deployment, testing, etc. etc. planned to be fully open source.

I believe that it will help [newbie] developers from around the world to see the whole software development process in example of real world application and also use it.

---

In this particular article I will explain (mostly to myself :) how to structure a project with different parts in different programming languages including Golang for back-end, Python/Django REST for API and React/React Native for front-ends.

## High-level design

From perspective of high-level design, project DevHub will consist of following parts:

1. Data Layer
2. API Layer
3. Front-end Layer

**Data layer** is responsible for following tasks:

1. Retrieve data from external source
2. Process data based on the following aspects:
    1. Indexing based on title and content
    2. Rank based on source and references

**API layer** is responsible for the communication between data layer and front-end layer. It also includes user authentication and management. Example of API endpoints:

1. http://api.devhub.example.com/auth/
2. http://api.devhub.example.com/links/
3. http://api.devhub.example.com/links/1/
4. http://api.devhub.example.com/links/1/refs/
5. http://api.devhub.example.com/links/1/comments/
6. http://api.devhub.example.com/links/1/likes/

**Front-end layer** is a collection of front-end applications which expose functionality to end users. By end users we undersdand:

1. Internal tools for monitoring and management
2. External users (let's call them customers) of the application(s)

## User Flow

Basic user flow looks like following:

1. User enters the website: https://devhub.example.com/
2. User gets to the *list* page where he/she can:
    1. see ordered list of the recently processed links
    2. searche for a keyword or term
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
