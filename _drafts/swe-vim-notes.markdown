# Software Engineer's VIM notes

## Start with Factory Settings

If you want to start VIM without any customizations, you can use the following command.

```sh
$ vim -u NONE -N
```

Here,

- `-u NONE` leads to not sourcing `vimrc` on startup
- `-N` prevents reverting to `vi` compatible mode by setting `nocompatible` option

By default if not `vimrc` sourced VIM revert to vi compatible mode which leads to disabling many useful features.
