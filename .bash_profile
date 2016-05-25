#echo "starting ... $PATH"

# Java
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/1.6.0_65-b14-462.jdk/Contents/Home"
#export JAVA_HOME="/usr/libexec/java_home -v 1.6.0_65-b14-462"
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export M2_HOME="/usr/local/apache-maven-3.2.5"
export PATH="$M2_HOME/bin:$PATH"

# Golang
export GOPATH="$HOME/Code/go"
export PATH="$GOPATH/bin:$PATH"

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# homebrew
export PATH="/usr/local/homebrew/opt/coreutils/libexec/gnubin:/usr/local/homebrew/bin:$PATH"
#export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$PATH"
export MANPATH="/usr/local/homebrew/opt/coreutils/libexec/gnuman:$MANPATH"

# locale settings
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# fast go
alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias jj='cd ~/Code/alipay'
alias li='cd ~/Code/linux/linux-2.6.32-431.29.2.el6'
alias fr='cd ~/Code/froghui-github'
alias golang='cd ~/Code/go'

# ls dircolors using solarized dark
eval `gdircolors -b $HOME/Code/tools/dircolors-solarized/dircolors.ansi-dark`
alias ls='ls -F --show-control-chars --color=auto'
alias ll='ls -al -F --show-control-chars --color=auto'
#export CLICOLOR=1

# Sofa
export SOFA_HOME="/usr/local/sofa"
export PATH="$SOFA_HOME:$PATH"
source /usr/local/sofa/resources/completion/bash_autocomplete

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# print process info
echo "Reading ~/.bash_profile"

# load the bash hint
source ~/.bashrc

