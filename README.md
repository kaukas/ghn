ghn is a quick and slick GitHub notifications app for your terminal. Pour some
[fzf](https://github.com/junegunn/fzf) over
[hub](https://github.com/github/hub/) and freely mix with an assortment of other
command line tools. Consume while hot.

# Warning

A very early release, barely works!

# Installation

For MacOS [use Homebrew](https://github.com/kaukas/homebrew-ghn).

# Configuration

ghn sources `~/.config/ghn/config.sh` if present. At the moment you can override
the command that is expected to display the issue or pull request (e.g. in the
browser) upon receiving its URL. Default is `open` but you can specify something
else:

```sh
GHN_OPEN_CMD="/Applications/Firefox.app/Contents/MacOS/firefox --private-window"
```

# License

MIT

Copyright (c) 2020 Linas Juškevičius
