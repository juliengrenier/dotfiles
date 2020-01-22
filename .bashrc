#History hacks                                                              
export EDITOR=vim
export HISTIGNORE="&:[]*:exit" #Ignore duplicates, command with leading spac    e and exit command
shopt -s histappend; #Append to file instead of overwrite
shopt -s histreedit; #Allow edition of failed command
shopt -s histverify; #verify substitution before executing


alias rm='rm -i'
alias ls='ls -G'
alias ll='ls -larthG'
alias less='less -FXR'
#alias fzf="fzf-tmux"
alias vim='nvim'
alias findpy='find . -type f -name "*py" -print0 | xargs -0  grep -n'
alias findhtml='find . -type f -name "*html" -print0 | xargs -0 grep -n'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias tcpdump='sudo tcpdump'

if [ -f $HOME/.bashrc_custom ]; then
  . $HOME/.bashrc_custom
fi

if [ -f $HOME/.bashrc-prompt ]; then
  . $HOME/.bashrc-prompt
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$HOME/opt:$PATH
PATH=$HOME/.cargo/bin:$PATH

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export CLICOLOR=1
source ~/.env/bin/activate

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export PATH=$PATH:$(go env GOPATH)/bin
source /Users/j.grenier//erl/activate
PATH=$PATH:/Users/.jgrenier/.cargo/bin


workon() {
    chdir cd $HOME/dev/$1;
}

_workonComplete()
#_fzf_complete_workon()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    local dirs=`ls $HOME/dev`
    COMPREPLY=( $(compgen -W "$dirs" -- $cur) )
}
complete -F _workonComplete -o default -o bashdefault workon


chdir() {
    local action="$1"; shift
    builtin $action "$*"
    [ -d ".env" ] && source .env/bin/activate
}

alias cd='chdir cd'
# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

source /Users/j.grenier/Library/Preferences/org.dystroy.broot/launcher/bash/br
