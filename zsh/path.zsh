[ -d ~/bin ] && export PATH=~/bin:$PATH
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$(ruby -rubygems -e "puts Gem.user_dir")/bin:$PATH"
