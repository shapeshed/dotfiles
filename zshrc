for zsh_file in $HOME/.zsh/*.zsh; do 
  source $zsh_file
done


[[ -s "/home/go/.gvm/scripts/gvm" ]] && source "/home/go/.gvm/scripts/gvm"
