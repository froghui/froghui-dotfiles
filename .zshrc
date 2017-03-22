# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel9k/powerlevel9k" # (this is one of the fancy ones)
ZSH_THEME="myagnoster/agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx ruby autojump)

# User configuration
# Java
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export M2_HOME="/usr/local/apache-maven-3.3.9"
export PATH="$M2_HOME/bin:$PATH"
export ANT_HOME="/usr/local/apache-ant-1.9.7"
export PATH="$ANT_HOME/bin:$PATH"

# Golang
export GOPATH="$HOME/Code/go"
export PATH="$GOPATH/bin:$PATH"

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# homebrew
export PATH="/usr/local/homebrew/opt/coreutils/libexec/gnubin:/usr/local/homebrew/bin:$PATH"
export MANPATH="/usr/local/homebrew/opt/coreutils/libexec/gnuman:$MANPATH"

# Sofa
export SOFA_HOME="/usr/local/sofa"
export PATH="$SOFA_HOME:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

# OSSCMD
export OSS_HOME="/usr/local/oss"
export PATH="$OSS_HOME:$PATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# locale settings
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

echo "reading .zshrc from $SHELL"
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# fast go
alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias jj='cd ~/Code/alipay/antcloud-caas/apcontainersrv'
alias li='cd ~/Code/linux/linux-2.6.32-431.29.2.el6'
alias f='cd ~/Code/froghui-github'
alias golang='cd ~/Code/go'

# ls dircolors using solarized dark
eval `gdircolors -b $HOME/Code/tools/dircolors-solarized/dircolors.ansi-dark`
alias ll='ls -al'

# autojump
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh
