source ~/.bash_secret

# Put your fun stuff here.
export PATH=$PATH:$HOME/projects/scripts/scripts
export PATH=$PATH:$HOME/.bin
export PATH=$PATH:$HOME/bin

export UA="Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0"

export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth

export PAGER=less
export LESS="-SR"
export GREP_COLOR='1;30;42'

# Ref: https://wiki.archlinux.org/index.php/GTK_(Espa%C3%B1ol)
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc

export TERM=xterm-256color

export GOPATH=$HOME/go                # Go
export PATH=$PATH:$HOME/go/bin        # Go
export PATH=$PATH:$HOME/.local/bin    # Python
export PATH=$PATH:$HOME/.cargo/bin    # Rust
export PATH=$HOME/.luarocks/bin:$PATH # Lua

# Erlang
export ERL_AFLAGS="-kernel shell_history enabled"
export PATH=$HOME/.cache/rebar3/bin:$PATH
export PATH=$HOME/.kerl/builds/22.1/release_22.1/bin/:$PATH

# Node.js
NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
