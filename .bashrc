#History hacks                                                              
export HISTIGNORE="&:[]*:exit" #Ignore duplicates, command with leading spac    e and exit command
shopt -s histappend; #Append to file instead of overwrite
shopt -s histreedit; #Allow edition of failed command
shopt -s histverify; #verify substitution before executing


if [ -f $HOME/.bashrc_custom ]; then
  . $HOME/.bashrc_custom
fi
