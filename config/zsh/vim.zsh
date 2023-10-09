export VIMINIT='if !has("nvim") | let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | else | let $MYVIMRC="$XDG_CONFIG_HOME/nvim/init.lua" | endif | source $MYVIMRC'
