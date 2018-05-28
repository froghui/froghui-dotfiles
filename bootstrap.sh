#!/usr/bin/env bash

#   Copyright 2014 Steve Francia
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

############################  SETUP PARAMETERS
app_name='froghui-dotfiles'
app_dir="$HOME/.froghui-dotfiles"
app_symlinks_dir=".froghui-dotfiles"
debug_mode='0'
[ -z "$VUNDLE_URI" ] && VUNDLE_URI="https://github.com/gmarik/vundle.git"
[ -z "$MYZSH_URI" ] && MYZSH_URI="https://github.com/robbyrussell/oh-my-zsh.git"

############################  BASIC SETUP TOOLS
msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
    msg "\e[32m[✔]\e[0m ${1}${2}"
    fi
}

error() {
    msg "\e[31m[✘]\e[0m ${1}${2}"
    exit 1
}

debug() {
    if [ "$debug_mode" -eq '1' ] && [ "$ret" -gt '1' ]; then
      msg "An error occurred in function \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}, we're sorry for that."
    fi
}

program_exists() {
    local ret='0'
    type $1 >/dev/null 2>&1 || { local ret='1'; }

    # throw error on non-zero return value
    if [ ! "$ret" -eq '0' ]; then
    error "$2"
    fi
}

variable_set() {
    if [ -z "$1" ]; then
        error "You must have your HOME environmental variable set to continue."
    fi
}

############################ SETUP FUNCTIONS
lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
    ret="$?"
    debug
}

do_backup() {
    if [ -e "$2" ] || [ -e "$3" ] || [ -e "$4" ] || [ -e "$5" ] || [ -e "$6" ]; then
        today=`date +%Y%m%d_%s`
        for i in "$2" "$3" "$4" "$5" "$6"; do
            [ -e "$i" ] && [ ! -L "$i" ] && mv "$i" "$i.$today";
        done
        ret="$?"
        success "$1"
        debug
   fi
}

upgrade_repo() {
      msg "trying to update $1"

      if [ "$1" = "$app_name" ]; then
          cd "$app_dir" &&
          git pull origin "$git_branch"
      fi

      if [ "$1" = "vundle" ]; then
          cd "$HOME/.vim/bundle/vundle" &&
          git pull origin master
      fi
      if [ "$1" = "myzsh" ]; then
          cd "$HOME/.oh-my-zsh" &&
          git pull origin master
      fi

      ret="$?"
      success "$2"
      debug
}

clone_vundle() {
    if [ ! -e "$HOME/.vim/bundle/vundle" ]; then
        git clone $VUNDLE_URI "$HOME/.vim/bundle/vundle"
    else
        upgrade_repo "vundle"   "Successfully updated vundle"
    fi
    ret="$?"
    success "$1"
    debug
}

clone_myzsh() {
    if [ ! -e "$HOME/.oh-my-zsh" ]; then
        cd $HOME
        lnif "$app_symlinks_dir/.oh-my-zsh"   ".oh-my-zsh"
        cd -
        git clone $MYZSH_URI "$HOME/.oh-my-zsh"
    else
        upgrade_repo "myzsh"   "Successfully updated myzsh"
    fi
    ret="$?"
    success "$1"
    debug
}

create_symlinks() {
    msg "current dir in create_symlinks is `pwd`"

    if [ ! -d "$app_dir/.vim/bundle" ]; then
        mkdir -p "$app_dir/.vim/bundle"
    fi

    cd $HOME
    lnif "$app_symlinks_dir/.vimrc"              ".vimrc"
    lnif "$app_symlinks_dir/.vimrc.bundles"      ".vimrc.bundles"
    lnif "$app_symlinks_dir/.vim"                ".vim"
    lnif "$app_symlinks_dir/.bash_profile"       ".bash_profile"
    lnif "$app_symlinks_dir/.bashrc"             ".bashrc"
    lnif "$app_symlinks_dir/.zshrc"              ".zshrc"
    cd -

    ret="$?"
    success "$1"
    debug
}

setup_vundle() {
    system_shell="$SHELL"
    export SHELL='/bin/sh'
    
    vim \
        -u "$app_dir/.vimrc.bundles" \
        "+set nomore" \
        "+BundleInstall!" \
        "+BundleClean" \
        "+qall"
    
    export SHELL="$system_shell"

    success "$1"
    debug
}

############################ MAIN()
variable_set "$HOME"
program_exists "vim" "To install $app_name you first need to install Vim."
program_exists "zsh" "To install $app_name you first need to install Zsh."

do_backup   "Your old vim stuff has a suffix now and looks like .vim.`date +%Y%m%d%S`" \
        "$HOME/.vim" \
        "$HOME/.vimrc" \
        "$HOME/.gvimrc" \
        "$HOME/.bash_profile" \
        "$HOME/.bashrc" \
        "$HOME/.zshrc"

# create_symlinks "Setting up vim symlinks"

# msg " current dir is `pwd`"

# clone_vundle    "Successfully cloned vundle"
# setup_vundle    "Now updating/installing plugins using Vundle"

clone_myzsh     "Successfully cloned myzsh"

msg             "\n Install $app_name completed."
