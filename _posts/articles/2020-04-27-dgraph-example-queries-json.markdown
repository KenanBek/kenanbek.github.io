---
layout: article
permalink: /dgraph-example-queries-json
title: "Dgraph Example Queries"
date: 2020-04-27 21:23:00 +0200
lastmod: 2020-04-28 02:49:00 +0200
categories: Posts
tags: [graph, graph database, dgraph, query, json, example, tutorial]
sitemap:
    priority: 1
    changefreq: weekly
comments: true
todo: []
---

## Dgraph Example Queries

Hello, coders! In this page I've gather different Dgraph example queries.

Most of the examples are taken or extended version of examples from [https://tour.dgraph.io/](https://tour.dgraph.io/).


Follow [this](https://dgraph.io/tour/intro/3/) and [this](https://dgraph.io/tour/intro/4) to create a schema and load an example data.

For more information on Dgraph.io and it's usage with Go check my another article called ["Dgraph Graph Database: How to Install and Use With Go?"](https://medium.com/@kenanbek/dgraph-how-to-install-and-use-with-go-e25e2fe90939?sk=aa23028c966ad45c1d31111ed8b0fb24).

### Query #1: find by name

```
{
  find_michael(func: eq(name@., "Michael")) {
    uid
    name@.
    age
  }
}
```

### Query #2: get by name and show related edges

```
{
  michaels_friends(func: eq(name, "Michael")) {
    name
    age
    owns_pet {
      name@.
    }
    friend {
      name@.
    }
  }
}
```

### Query #3: get schema information

```
schema(pred: [name, age, friend, owns_pet]) {
  type
  index
}
```

By adding `type` and `index` in body we request to include type and index information about the scheme in the response.

### Query #4: get by annotated language tag

```
{
  language_support(func: allofterms(name@hi, "अमित")) {
    name@bn:hi:en
    age
    friend {
      name@ko:ru
      age
    }
  }
}
```

Syntax `name@bn:hi:en` specifies an order preference in which name field must be returned. More information [here](https://dgraph.io/tour/basic/4/#).

### Query #5: get all nodes count by a specific field name

```
{
  nodeCount(func: has(<message>)) {
    nodeCount: count(uid)
  }
}
```

### Query #6: get all nodes related to a specific type

```
{
    q(func: type(Log)) {
      uid
      created
    	message
    }
}
```
