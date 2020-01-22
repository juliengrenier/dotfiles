
set -g VIRTUALFISH_ACTIVATION_FILE .env
set -g PROJECT_HOME ~/dev
source ~/.virtualenvs/default/bin/activate.fish
eval (python -m virtualfish auto_activation global_requirements projects)

source /Users/j.grenier/Library/Preferences/org.dystroy.broot/launcher/fish/br
 
source /Users/j.grenier/erl/activate.fish

set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin ~/opt ~/.rvm/bin ~/go/bin ~/.cargo/bin $PATH
#set -U fish_key_bindings fish_vi_key_bindings
set -g fish_key_bindings fish_default_key_bindings
alias vim='nvim'
alias updatedb='sudo /usr/libexec/locate.updatedb'
