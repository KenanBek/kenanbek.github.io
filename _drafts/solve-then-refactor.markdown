---
layout: article
title:  "Solve then refactor"
date:   2019-09-04 16:20:12 +0200
categories: Posts
tags: [programming, code, decision making, refactor]
---

"What is your weaknes?" - sometimes you got asked during the interview. And here is my answer: I try to write best possible code ever from the first line of the code. With perfect names, ideal structure and documentation friendly comments. And I like it.

But most of the time I find myself spending endless time on variable names, reading about "perfect code" and etc. etc. Basically, every aspect of the code requires some kind of "reasearch". And it sucks! Especially when you start with a new language (Golang in my case) and instead of delivering feature you spend time on basic principles.

Of course, you should how to write "good code". And of course it is important that the final result meets standards of your domain.

The simple solution I found out and which works pretty well is as following:

As an example we will consider let's say "generic data source parser" with possible data input channels like JSON file or database storage. Initial implementation should be with JSON.

1. You try to solve the given task with most shortest possible path

For our task, let's say we put all piece of the code in cmd/parser with initial implementation for JSON.

2. Once you have a working code, you start refactoring:

    1. Try to find out different parts and try to split them
    2. Define correct hiearchy and dependencies (for example define types and interfaces to work them)
    3. Move 