export PATH=/opt/local/bin:/opt/local/sbin:/opt/local/lib/postgresql84/bin:/opt/local/lib/php/bin:~/bin:/usr/local/mongodb/bin:/Applications/plt_scheme/bin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
export JAVA_HOME=/Library/Java/Home
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR='vim'

source ~/code/personal/ec2/env

alias rc='rake_commit'
alias grep='grep --color'
alias sd='screen -x drew'
alias ll='ls -la'
alias btg='cd ~/bt/gateway'
alias bts='cd ~/bt/system-scripts'
alias ss='./script/server'
alias sc='./script/console'
alias m='script/generate migration'
alias mp='rake db:migrate && rake db:test:prepare'
alias lein-repl='rlwrap lein repl'
alias coffee-repl='rlwrap coffee -i'
bm () { ./script/generate migration $* && rake db:migrate && rake db:test:prepare; }

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='\[\033[01;32m\]\u@\h:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;32m\]$(parse_git_branch)\[\033[00m\]\$ '

if [ -f /opt/local/etc/bash_completion ]; then
    source /opt/local/etc/bash_completion
fi

if [ -f /opt/local/share/doc/git-core/contrib/completion/git-completion.bash ]; then
    source /opt/local/share/doc/git-core/contrib/completion/git-completion.bash
fi

if [[ -s ~/.rvm/scripts/rvm ]]; then
  source ~/.rvm/scripts/rvm
fi

[[ -r $rvm_path/scripts/completion ]] && source $rvm_path/scripts/completion
