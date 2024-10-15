# fpath+=~/.zfunc
fpath+=($HOME/.config/zsh/completions $fpath)
autoload bashcompinit && bashcompinit
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit
. <(neutrond enable-cli-autocomplete zsh)
