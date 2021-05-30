---
layout: article
permalink: /neovim-youcompleteme-golang-issue
title: "Fixing neovim and YouCompleteMe issue for Vim autocomplete?"
date: 2021-04-24 21:29:03 +0200
lastmod: 2021-04-24 21:29:09 +0200
categories: Posts
tags: [neovim, vim, zsh, tmux, mac, terminal]
sitemap:
    priority: 1
    changefreq: weekly
comments: true
todo: []
---

After one of the updates, my You Complete Me setup, which I alongside my Go and vim-go setup, stoped working.

After some search that's what fixed the issue for me.

    # isntall neovim python
    python -m pip install --upgrade pynvim
    python2 -m pip install --upgrade pynvim
    python3 -m pip install --upgrade pynvim

    # execute Ycm install script
    cd ~/.config/nvim/plugged/YouCompleteMe
    ./install.py

    # restart Ycm server in neovim
    :YcmRestartServer

My setup is:
- MacOS
- MacOS Terminal
- zsh + oh my zsh + tmux
- neovim
