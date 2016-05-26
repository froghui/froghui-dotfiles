echo "Reading ~/.bashrc"


# Initialize FINK if needed

#if [[ ! -x $(which fink) && -d /sw/bin ]];then
#	source /sw/bin/init.sh
#fi


# Set the DISPLAY variable ONLY for OS X earlier than 10.5
# Do not set it for 10.5, or it will create problems.


#if [[ -z $DISPLAY && $(sw_vers -productVersion) < 10.5  && -z $SSH_CONNECTION ]]; then
#	# -- works for Apple X11 with Fast User Switching
#    disp_no=($( ps -awx | grep -F X11.app | awk '{print $NF}' | grep -e ":[0-9]"  ))
#    if [[ -n $disp_no ]];then
#        export DISPLAY=${disp_no}.0
#    else
#        export DISPLAY=:0.0
#    fi
#    echo "DISPLAY has been set to $DISPLAY"
#fi


# iTerm Tab and Title Customization and prompt customization

# Put the string " [bash]   hostname::/full/directory/path"
# in the title bar using the command sequence
# \[\e]2;[bash]   \h::\]$PWD\[\a\]

# Put the penultimate and current directory 
# in the iterm tab
# \[\e]1;\]$(basename $(dirname $PWD))/\W\[\a\]

# Make a simple command-line prompt:  bash-$

# PS1=$'\[\e]2;[bash]   \h::\]$PWD\[\a\]\[\e]1;\]$(basename "$(dirname "$PWD")")/\W\[\a\]bash@\w\$ 🚀  '
PS1=$'\u@\w$ \xF0\x9F\x9A\x80 '
#PS1=$'\u@\w$ 🚀  '


