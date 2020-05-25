---
layout: article
permalink: /github-api-go-examples
title: "Go GitHub API code snippets and examples"
date: 2020-05-25 23:49:00 +0200
date: 2020-05-25 23:49:00 +0200
categories: Posts
tags: [github, api, library, examples, snippets, go, golang]
sitemap:
    priority: 1
    changefreq: weekly
comments: true
todo: []
---

Initialization:

```
ctx := context.TODO()
ts := oauth2.StaticTokenSource(
    &oauth2.Token{AccessToken: "YOUR-ACCESS-TOKEN"},
)
tc := oauth2.NewClient(ctx, ts)
client := github.NewClient(tc)
```

List user's repositories:

```
repos, _, err := client.Repositories.List(ctx, "kenanbek", nil)
if _, ok := err.(*github.RateLimitError); ok {
    log.Println("hit rate limit")
}
for _, repo := range repos {
    log.Printf("\t Name: %s \n", *repo.Name)
    log.Printf("\t Description: %s \n", *repo.Description)
    log.Printf("\t URL: %s \n", *repo.URL)
    log.Println()
}
```

Search repositories by the given term:

```
result, _, err := client.Search.Repositories(ctx, "web", &github.SearchOptions{})
if _, ok := err.(*github.RateLimitError); ok {
    log.Println("hit rate limit")
}
if result != nil {
    log.Println("Total results: ", result.Total)

    for _, repo := range result.Repositories {

        log.Printf("\t Name: %s \n", *repo.Name)
        log.Printf("\t Description: %s \n", *repo.Description)
        log.Printf("\t URL: %s \n", *repo.URL)
        log.Println()
    }
}
```

Search Go developers with more than 100 followers:

```
opt := &github.SearchOptions{
    ListOptions: github.ListOptions{
        PerPage: 5,
    },
}
result, response, err := client.Search.Users(ctx, "followers:>=100 language:go", opt)
if _, ok := err.(*github.RateLimitError); ok {
    log.Println("hit rate limit")
}

if response != nil {
    log.Println("Rate Information")
    log.Printf("Rate: %v \n", response.Rate)
    log.Println()
}

if result != nil {
    log.Println("Total results: ", result.GetTotal())

    for i, userB := range result.Users {
        user, _, _ := client.Users.Get(ctx, userB.GetLogin())

        log.Printf("\t %d \n", i)
        log.Printf("\t ID: %d \n", user.GetID())
        log.Printf("\t Login: %s \n", user.GetLogin())

        log.Printf("\t Created: %v \n", user.GetCreatedAt())
        log.Printf("\t Followers: %d \n", user.GetFollowers())

        log.Println()
    }
}
```

