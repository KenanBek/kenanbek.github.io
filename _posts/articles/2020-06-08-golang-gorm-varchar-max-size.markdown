---
layout: article
permalink: /go-gorm-varchar-size
title: "GORM Set size for the string field"
date: 2020-06-08 21:56:00 +0200
lastmod: 2020-06-08 21:57:00 +0200
categories: Posts
tags: [go, gorm, varchar, string, model, golang]
sitemap:
    priority: 1
    changefreq: weekly
comments: true
todo: []
---

In GORM package, you can specify field's size using 2 options.

1. Using `gorm:size` tag
2. Using `gorm:type` tag

An example using `gorm:size`:

```go
type Article struct {
	gorm.Model

	Source   Source `json:"source" gorm:"foreignkey:SourceID"`
	SourceID uint   `json:"sourde_ref"`
	Group    string `json:"group" gorm:"not null"`
	FromURL  string `json:"from_url"`
	URL      string `json:"url" gorm:"unique;not null"`

	Title           string `json:"title" gorm:"size:1000"`
	Description     string `json:"description" gorm:"size:65535"`
	Content         string `json:"content" gorm:"size:65535"`
	AuthorName      string
	AuthorEmail     string
	ImageURL        string
	ImageTitle      string
	Published       string
	PublishedParsed *time.Time
	Updated         string
	UpdatedParsed   *time.Time
	Categories      string
}
```

Another example using `gorm:type`:

```go
type User struct {
  gorm.Model
  Name         string
  Age          sql.NullInt64
  Birthday     *time.Time
  Email        string  `gorm:"type:varchar(100);unique_index"`
}
```

Check [this](https://gorm.io/docs/models.html) page for more details.
