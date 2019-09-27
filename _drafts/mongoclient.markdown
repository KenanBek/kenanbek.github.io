---
layout: article
permalink: /mongocli-cli-client-for-mongodb-shell-ctl-in-go
title: "MongoCLI - CLI for MongoDB in Go (Golang)"
date: 2019-09-27 16:46:00 +0200
lastmod: 2019-09-27 16:46:00 +0200
categories: Posts
tags: [mongo, mongodb, mongocli, mongoctl, shell, terminal, client]
sitemap:
    priority: 1
    changefreq: weekly
comments: true
todo: [
    "include some RFC items",
]
---

## Overview

**MongoCLI** is a MongoDB CLI and client interface written in Golang and it does 2 things:

1. Provide command line interface (CLI) for MongoDB

    Example: `mongocli dbs` will list all database names or `mongocli list col1` will list most recet documents in collection `col1`

2. Easy to use API over `mongo-go-driver`

    Example:

    ```
    mc := mongo.New("localhost", 27017)

    names, err := mc.Dbs()
    if err != nil {
        fmt.Println(errors.Wrap(err, "Dbs command error"))
        os.Exit(1)
    }

    for _, name := range names {
        fmt.Println(name)
    }
    ```
