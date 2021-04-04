---
layout: article
permalink: /http-get-request-golang-rust
title: "How to make HTTP Get Request using Golang and Rust?"
date: 2021-04-04 21:22:26 +0200
lastmod: 2021-04-04 21:25:28 +0200
categories: Posts
tags: [http, get, request, fetch, go, golang, rust]
sitemap:
    priority: 1
    changefreq: weekly
comments: true
todo: []
---

This code snippet is part of my local repository for demo and simple applications. I wanted to see a difference between Go and Rust code for the given task.

There are many ways to implement a simple HTTP Get in each language. Since I already have Golang experience, the code in Go took me a few minutes.

My initial goal for the Rust code was to write an HTTP Get using only the standard library. But surprisingly, the Rust code took me at least one hour, where at the end, I just took the code from the `reqwest` package and just simplified it for the text response.

### Go implementation

```go
package main

import (
    "io/ioutil"
    "log"
    "net/http"
)

func main() {
    log.Println("mycurl")

    url := "https://kenanbek.github.io/"
    resp, err := http.Get(url)
    if err != nil {
        log.Fatalf("Error fetching url %s: %v", url, err)
    }

    defer resp.Body.Close()
    body, err := ioutil.ReadAll(resp.Body)
    if err != nil {
        log.Fatalf("Error fetching url %s: %v", url, err)
    }

    log.Println("Response: ")
    log.Println(string(body))
}
```

### Rust implementation

For the rust implementaiton, I am going to use `reqwest` package. That's why we need to initialize a project environment using following commands:

```bash
cargo init
```

Then edit content of the `Cargo.toml` and add `reqwest` dependency:

```toml
[dependencies]
reqwest = { version = "0.11", features = ["blocking", "json"] }
```

I will use blocking call api.

Here is the actual Rust code for fetching webpage's content via HTTP GET request:

```rust
fn main() -> Result<(), Box<dyn std::error::Error>> {
    let resp = reqwest::blocking::get("https://kenanbek.github.io/")?
        .text()?;
    println!("{:#?}", resp);
    Ok(())
}
```

If you are also a newbie in Rust as myself, you can run this code by executing the following command:

```bash
cargo run
```
