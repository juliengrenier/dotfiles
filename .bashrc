#History hacks                                                              
export EDITOR=vim
export HISTIGNORE="&:[]*:exit" #Ignore duplicates, command with leading spac    e and exit command
shopt -s histappend; #Append to file instead of overwrite
shopt -s histreedit; #Allow edition of failed command
shopt -s histverify; #verify substitution before executing


alias rm='rm -i'
alias ll='ls -larth --color=auto'

if [ -f $HOME/.bashrc_custom ]; then
  . $HOME/.bashrc_custom
fi

if [ -f $HOME/.bashrc-prompt ]; then
  . $HOME/.bashrc-prompt
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
