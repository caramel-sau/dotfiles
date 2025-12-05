export CLICOLOR=1
export TERM=xterm-256color
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@3/include"
export "PATH=/usr/local/bin:$PATH"

# jrogue オプション
export ROGUEOPTS="terse,passgo,jump,color,idscrl,name=caramel-25,fruit=アップルパイ "

# .NET テレメトリのオプトアウト
DOTNET_CLI_TELEMETRY_OPTOUT=1

# 保管機能を有効
autoload -U compinit
compinit -u

# 保管機能に色
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# 単語の入力途中でもTab補完を有効化
setopt complete_in_word

# 補完候補をハイライト
zstyle ':completion:*:default:*' use-cache true

# 大文字小文字を区別せず補完
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完リストの表示間隔を狭くする
setopt list_packed

# cdを使わずにディレクトリ移動
setopt auto_cd

# pyenvの設定
eval "$(pyenv init --path)"

# 履歴を前方一致に限定させる
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
#
# エイリアス
alias la="ls -alh"
alias vi="nvim"
alias dot="cd ~/.dotfiles/"
alias icat="wezterm imgcat"
alias tabn="wezterm cli set-tab-title"
