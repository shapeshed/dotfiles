[ -d ~/bin ] && export PATH=~/bin:$PATH
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$(ruby -r rubygems -e "puts Gem.user_dir")/bin:$HOME/go/bin:/usr/local/heroku/bin:$HOME/.local/bin:$PATH"
