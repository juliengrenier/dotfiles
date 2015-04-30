#History hacks                                                              
export EDITOR=vim
export HISTIGNORE="&:[]*:exit" #Ignore duplicates, command with leading spac    e and exit command
shopt -s histappend; #Append to file instead of overwrite
shopt -s histreedit; #Allow edition of failed command
shopt -s histverify; #verify substitution before executing


alias rm='rm -i'
alias ls='ls -G'
alias ll='ls -larthG --color=auto'
alias less='less -FXR'
alias findpy='find . -type f -name "*py" -print0 | xargs -0  grep -n'
alias findhtml='find . -type f -name "*html" -print0 | xargs -0 grep -n'

if [ -f $HOME/.bashrc_custom ]; then
  . $HOME/.bashrc_custom
fi

if [ -f $HOME/.bashrc-prompt ]; then
  . $HOME/.bashrc-prompt
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
