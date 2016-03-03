# Java
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/1.6.0_65-b14-462.jdk/Contents/Home"
#export JAVA_HOME="/usr/libexec/java_home -v 1.6.0_65-b14-462"
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
#export M2_HOME="/usr/local/apache-maven-3.2.5"

# homebrew and maven
#export PATH="/usr/local/homebrew/opt/coreutils/libexec/gnubin:/usr/local/homebrew/bin:$M2_HOME/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$PATH"

# locale settings
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# Golang
export GOPATH=~/Code/go

# fast go
alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias jj='cd ~/Code/'
alias li='cd ~/Code/linux/linux-2.6.32-431.29.2.el6'
alias dp='cd ~/Code/dianpingoa'

# ls dircolors using solarized dark
eval `gdircolors -b $HOME/Code/tools/dircolors-solarized/dircolors.ansi-dark`
alias ls='ls -F --show-control-chars --color=auto'
alias ll='ls -al -F --show-control-chars --color=auto'
#export CLICOLOR=1

# print process info
echo "Reading ~/.bash_profile"

# load the bash hint
source ~/.bashrc

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
