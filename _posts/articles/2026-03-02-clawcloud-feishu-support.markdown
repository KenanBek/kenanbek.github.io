---
layout: article
permalink: /clawcloud-feishu-support
title: "ClawCloud Now Supports Feishu and Lark"
description: "ClawCloud added Feishu and Lark support to its OpenClaw hosting platform. Deploy an AI assistant to your team workspace in under a minute — no webhook server, no public URL."
date: 2026-03-02 10:00:00 +0200
lastmod: 2026-03-02 10:00:00 +0200
categories: Posts
tags: [clawcloud, openclaw, feishu, lark, ai, chatbot, cloud-hosting]
image: /assets/posts/clawcloud-feishu-support-bot-chat.png
sitemap:
    priority: 1
    changefreq: weekly
comments: true
---

[ClawCloud](https://clawcloud.sh) now supports Feishu and Lark for hosted [OpenClaw](https://openclaw.ai/) deployments.

Telegram and Discord were the first two channels. Feishu brings in a third — and a pretty different one. If your team runs on Feishu or Lark, you can now deploy an AI assistant directly into your workspace without writing any integration code.

![OpenClaw AI assistant responding inside a Feishu group chat with streaming interactive card](/assets/posts/clawcloud-feishu-support-bot-chat.png "OpenClaw bot streaming reply in Feishu group chat using interactive card")

## Why Feishu

Feishu is Bytedance's enterprise communication platform, widely used across Chinese tech companies and multinationals operating in Asia. Lark is the international version — same product, different domain. Adding it wasn't a minor config change. Feishu uses a different authentication model (App ID + App Secret instead of a single bot token), and it connects via WebSocket long polling rather than inbound webhooks, so there's no public URL requirement on the server side.

That last part actually makes things simpler. OpenClaw initiates the connection to Feishu's servers, which means a ClawCloud deployment works without any DNS or port configuration. The server just comes up and connects.

## How the setup works

You create a custom app on the [Feishu Open Platform](https://open.feishu.cn/app) (or [open.larksuite.com/app](https://open.larksuite.com/app) for Lark), enable the bot capability, configure permissions, and copy your App ID and App Secret. That takes roughly 5 minutes.

Then in the ClawCloud deploy wizard, you:

1. Pick your plan
2. Select Feishu as the channel and paste the two credentials
3. Choose your AI model (or use managed credits)
4. Deploy

The server provisions, OpenClaw connects to Feishu, and your bot is available. The whole thing runs in under a minute on ClawCloud's end. The 5-minute part is just waiting for Feishu's permission approval if you're on an enterprise tenant.

## What it can actually do

The bot works in DMs and group chats. By default, ClawCloud configures open DM access so anyone on your workspace can start a conversation without manual pairing approval. For group chats, you can set it to respond only when @mentioned, or to all messages.

Replies stream in real time through Feishu's interactive card system. The card updates as the model generates its response, so you see output progressively rather than waiting for a complete answer.

Model switching works via slash commands inside the chat. `/model sonnet` switches to Claude Sonnet 4, `/model gemini-flash` to Gemini Flash, `/model gpt-mini` to GPT-4.1-mini. All 94 models in the OpenClaw catalog work on Feishu.

## A note on Lark

Feishu and Lark are technically the same platform — different regional deployments. OpenClaw's Feishu plugin handles both. The deploy wizard has a toggle to specify Lark, which points the WebSocket connection at the Lark domain instead. The credential setup on your side is the same either way, just at a different URL.

## What's next

Feishu rounds out the three major team chat platforms. Most enterprise teams run on one of these three or Slack, so there's good coverage now. Slack is on the roadmap, though Slack's bot approval process adds friction that makes self-hosted setups harder to document cleanly.

The full platform is at [clawcloud.sh](https://clawcloud.sh).
