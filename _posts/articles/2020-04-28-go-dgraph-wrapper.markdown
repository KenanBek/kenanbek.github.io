---
layout: article
permalink: /go-dgraph-wrapper
title: "Go Dgraph Wrapper"
date: 2020-04-28 02:51:00 +0200
lastmod: 2020-04-28 02:51:00 +0200
categories: Posts
tags: [graph, graph database, dgraph, go, golang, wrapper]
sitemap:
    priority: 1
    changefreq: weekly
comments: true
todo: []
---

This is an example of Dgraph Go wrapper I use in one of my projects. It wraps context, connection and client. Transaction handling is not ideal yet but I will keep updating this page.

```
package dgraph

import (
	"context"
	"encoding/json"
	"github.com/dgraph-io/dgo/v200"
	"github.com/dgraph-io/dgo/v200/protos/api"
	"google.golang.org/grpc"
	"log"
)

type DBInstance struct {
	ctx  context.Context
	conn *grpc.ClientConn
	cln  *dgo.Dgraph
	txn  *dgo.Txn
}

func NewDB() *DBInstance {
	ctx := context.TODO()

	conn, err := grpc.Dial("localhost:9080", grpc.WithInsecure())
	if err != nil {
		log.Fatal(err)
	}

	cln := dgo.NewDgraphClient(api.NewDgraphClient(conn))
	txn := cln.NewTxn()

	return &DBInstance{
		ctx:  ctx,
		conn: conn,
		cln:  cln,
		txn:  txn,
	}
}

func (db *DBInstance) Mutate(value interface{}) (*api.Response, error) {
	var err error

	b, err := json.Marshal(value)
	if err != nil {
		log.Fatal("failed to marshal", err)
	}

	mu := &api.Mutation{
		SetJson: b,
	}
	res, err := db.txn.Mutate(db.ctx, mu)
	if err != nil {
		log.Fatal("failed to mutate", err)
	}

	return res, err
}

func (db *DBInstance) CommitAndClose() error {
	var err error

	if db.txn != nil {
		err = db.txn.Commit(db.ctx)
		if err != nil {
			log.Fatal("failed to commit", err)
			return err
		}
	}

	err = db.conn.Close()
	if err != nil {
		log.Fatal("failed to close connection", err)
		return err
	}

	return nil
}

```
