

#   Oh-my-zsh

#   /¯¯¯¯¯\ |¯¯¯|¯¯¯|  |¯¯¯\/¯¯¯| \¯¯¯|¯¯¯/||¯¯¯¯¯¯| /¯¯¯¯¯/ '|¯¯¯|¯¯¯|
#   |  x  |'|       |° |       '|  \     /  /¯¯  __/ \ __¯¯¯\'|       |°
#   \_____/ |___|___|  |__|\/|__|  |____|'  |______| /______/||___|___|

# Variable pointing to modified location
ZSH=$HOME/.config/shells/oh-my-zsh
# Updated prefered (favorite) prompt themes
ZSH_THEME="frisk"
# Community and personalized plugins
plugins=(archlinux cp taskwarrior sublime cpanm git git-flow rvm ruby bundler gem node npm coffee)
# Source default omz config
source $ZSH/oh-my-zsh.sh
# Get rid of the TITLE error when using tmux
DISABLE_AUTO_TITLE=true
# Overrides from default omz settings
unsetopt correct_all


# Environment variables
#    ___         _                            _
#   | __|_ ___ _(_)_ _ ___ _ _  _ __  ___ _ _| |_
#   | _|| ' \ V / | '_/ _ \ ' \| '  \/ -_) ' \  _|
#   |___|_||_\_/|_|_| \___/_||_|_|_|_\___|_||_\__|
#
# Even for GUI based Pinentries; you should always set GPG_TTY.# }
export GPG_TTY=$(tty) # do not use /dev/tty it *must* be real tty

#LC_ALL is not being set!
export LANG="en_US.UTF-8"

# Disables sending the termcap initialization and deinitialization strings  to
# the terminal. Used to keep 'man' info from clearing after closing.
export LESS="-X"

# Default editor
export EDITOR="vim"

# Have termcap like detect terminal to prevent encoding and capabilities issues
#export TERM="rxvt-unicode-256color"



# Executable program files found here
#   ____   __   ____  _   _  ___
#  (  _ \ /__\ (_  _)( )_( )/ __)
#   )___//(__)\  )(   ) _ ( \__ \
#  (__) (__)(__)(__) (_) (_)(___/

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/vendor_perl:/usr/bin/core_perl


# Local user locally compiled/placed
export PATH="${PATH}:${HOME}/.local/bin:${HOME}/bin"

##
# NODE.JS
##

# Node package
export NODE_PATH="/usr/local/lib/node"

# Node modules
# 1) Do not rely on this, use local node_modules! It's more trustworthy and faster.
# 2) Install system wide packages using -g switch and ensure we have write /usr/local
export NODE_DIR="$HOME/node_modules:/usr/local/lib"


##
# RUBY VERSION MANAGER
##

# Grab the function so we have 'rvm' command available
source ~/.rvm/scripts/rvm

# This should come last somewhere
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting



