# Vim
alias v="vim"

# Always edit crontab with Vim
alias crontab="VIM_CRONTAB=true crontab"

# Git 
alias g='git'
alias gs='git status'
alias ga='git add .'
alias gl='git pull'
alias gp='git push'
alias gc='git commit'
alias gd='git diff'
alias git commit='git commit -S'

# Radio 
alias playbbcr1="mpv 'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_one.m3u8'"
alias playbbcr4="mpv 'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_fourfm.m3u8'"
alias playbbcr5l="mpv 'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_five_live.m3u8'"
alias playbbcr5lsx="mpv 'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_radio_five_live_sports_extra.m3u8'"
alias playbbcr6="mpv 'http://a.files.bbci.co.uk/media/live/manifesto/audio/simulcast/hls/uk/sbr_high/ak/bbc_6music.m3u8'"

# Node.js
alias grunt='grunt --stack'

# Platform specific aliases
if [[ `uname` == 'Linux' ]]; then
  alias ls='ls --color'
  alias less='less -R'
  alias cb='xclip -selection clipboard' 
elif [[ `uname` == 'Darwin' ]]; then
  alias update='brew update && brew upgrade && getchromium'
  alias cb='pbcopy' 
fi


