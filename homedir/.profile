. "${HOME}"/.bash_secret

# Put your fun stuff here.
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

export SBCL_BIN=/usr/local/bin/sbcl               # Lisp
export SBCL_HOME=/usr/local/lib/sbcl              # Lisp
export PATH=$HOME/.roswell/bin:$PATH              # Lisp
export GOPATH=$HOME/go                            # Go
export PATH=/usr/lib/go-1.21/bin:$PATH            # Go
export PATH=$HOME/go/bin:$PATH                    # Go
export PATH=$HOME/.local/bin:$PATH                # Python
export PATH=$HOME/.cargo/bin:$PATH                # Rust
export PATH=$HOME/.luarocks/bin:$PATH             # Lua
export PATH=$HOME/.nimble/bin:$PATH               # Nim
export ERL_AFLAGS="-kernel shell_history enabled" # Erlang
export PATH=$HOME/.cache/rebar3/bin:$PATH         # Erlang
export ANDROID_HOME=$HOME/Android/Sdk             # Android
export PATH=$PATH:$ANDROID_HOME/tools             # Android
export PATH=$JAVA_HOME/bin/:$PATH                 # Java
export PATH=$HOME/.sbt_bin/bin:$PATH              # Scala
export PATH=$HOME/projects/scripts:$PATH          # Custom Scripts

# Node.js
NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"
export PATH=/usr/local/lib/nodejs/bin:$PATH

#unset MANPATH # delete if you already modified MANPATH elsewhere in your config
#MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# GraalVM
#PATH="${HOME}/Downloads/graalvm-ce-java17-21.3.0/bin:$PATH"
. "$HOME/.cargo/env"
