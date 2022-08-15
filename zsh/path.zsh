[ -d ~/bin ] && export PATH=~/bin:$PATH
export PATH="/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$(ruby -r rubygems -e "puts Gem.user_dir")/bin:$HOME/go/bin::$HOME/.local/bin:$PATH"
