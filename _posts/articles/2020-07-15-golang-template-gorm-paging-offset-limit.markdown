---
layout: article
permalink: /golang-template-gorm-paging-offset-limit
title: "Simple paging with Golang templates and GORM"
date: 2020-07-15 00:16:00 +0200
lastmod: 2020-07-15 00:16:00 +0200
categories: Posts
tags: [go, template, gorm, paging, offset, limit]
sitemap:
    priority: 1
    changefreq: weekly
comments: true
todo: []
---

Go code:

```go

const PageCount = 10

type Paging struct {
	Page     int
	PrevPage int
	NextPage int
	HasPrev  bool
	HasNext  bool
}

type HomePage struct {
	Title    string
	Paging   Paging
	Articles []articles.Article
}

func (ws *Website) homePageHandler(w http.ResponseWriter, r *http.Request) {
	var page int
	var err error

	pageStr := r.URL.Query().Get("page")
	if pageStr != "" {
		page, err = strconv.Atoi(pageStr)
		if err != nil {
			log.Println("failed to parse page param", err)
		}
	}

	tmpl, err := template.ParseFiles("resources/fe/website/home.html")
	if err != nil {
		log.Println("failed to parse template", err)
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}

	count, err := ws.DB.Articles().CountArticles()
	if err != nil {
		errStr := fmt.Sprintf("failed to get count of articles from storage: %v", err)
		log.Println(errStr)
	}

	offset := page * PageCount
	paging := Paging{}
	if page == 0 {
		paging.HasPrev = false
	} else {
		paging.HasPrev = true
	}
	if page >= count/PageCount {
		paging.HasNext = false
	} else {
		paging.HasNext = true
	}
	paging.Page = page
	paging.NextPage = page + 1
	paging.PrevPage = page - 1

	arts, err := ws.DB.Articles().ListArticles(offset, PageCount)
	if err != nil {
		errStr := fmt.Sprintf("failed to load articles from storage: %v", err)
		log.Println(errStr)
	}

	hp := HomePage{
		Title:    "List of articles",
		Articles: arts,
		Paging:   paging,
	}

	err = tmpl.Execute(w, hp)
	if err != nil {
		errStr := fmt.Sprintf("failed to render template: %v", err)
		log.Println(errStr)
	}
}
```

Methods `ListArticles` and `CountArticles` are implemented by using GORM:

```go
func (rp *Articles) CountArticles() (int, error) {
	var count int

	if err := rp.db.Model(&Article{}).Order("posted DESC").Count(&count).Error; err != nil {
		return 0, err
	} else {
		return count, nil
	}
}

func (rp *Articles) ListArticles(offset, limit int) ([]Article, error) {
	var articles []Article

	if err := rp.db.Order("posted DESC").Offset(offset).Limit(limit).Find(&articles).Error; err != nil {
		return nil, err
	} else {
		return articles, nil
	}
}
```


HTML template:

```html
<nav aria-label="...">
	<ul class="pagination justify-content-center">

		{{if .Paging.HasPrev}}
		<li class="page-item">
			<a class="page-link" href="?page={{.Paging.PrevPage}}">Previous</a>
		</li>
		{{else}}
		<li class="page-item disabled">
			<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
		</li>
		{{end}}

		<li class="page-item active" aria-current="page">
			<a class="page-link" href="#">{{.Paging.Page}} <span class="sr-only">(current)</span></a>
		</li>

		{{if .Paging.HasNext}}
		<li class="page-item">
			<a class="page-link" href="?page={{.Paging.NextPage}}">Next</a>
		</li>
		{{else}}
		<li class="page-item disabled">
			<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Next</a>
		</li>
		{{end}}

	</ul>
</nav>
```
