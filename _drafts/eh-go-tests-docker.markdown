---
layout: article
permalink: /golang-docker-tests
title:  "Use Docker for Golang tests"
date:   2019-10-25 13:07:00 +0200
lastmod: 2019-10-27 18:58:00 +0200
categories: Golang
tags: [go, docker, tests]
sitemap:
    priority: 1
    changefreq: weekly
comments: true
todo: [
    "finish source code",
]
---

Use Docker for Golang tests

Docker is widely used in the development environment and one of the usages is testing.

This article will focus on 2 different usages of Docker for Golang tests:

    1. Use Docker image to test and build you application
    2. Use Go package to setup and run Docker images programmatically

First usage is straitforwad and commonly used. We can apply the same technics to any other programming language. We can have one image for backend and another for front-end.

Second aproach usualy involves an external package. It's very useful when you have external dependencies like database or 3rd party service.

It's quite easy to run Go application within Docker. Let's imagine we have an application with `cmd/main.go` as a entry point. Dockerfile will look like this:

Please note that when we execute

1. Run Golang application as a Docker container

Let's imagine we have an application with `cmd/main.go` as a entry point. This file contains very simple Go application.

```
<embed source code from GitHub>
```

To run this application as a Docker container we may have following Dockerfile:

*TIP* Dockerfile is a YAMl format text file which contains specification for a Docker image [link to Docker's website]

```
FROM golang:latest
RUN mkdir /app
ADD . /app/
WORKDIR /app
RUN go test -v ./...
RUN go build -o main cmd/main.go
ENV PATH="/app:${PATH}"
```

Here we use an official Go image as a base: `golang:latest`. Then we set-up our environment and run tests. Once all tests passed we build our image and save it as `main` executable file.

We can build and run this image using following command:

```
docker build ...
docker run ...
```

Also, we can execute our `main` application from within Docker container:

```
docker exec ...
```
