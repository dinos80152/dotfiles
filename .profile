# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/Projects/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/development/flutter/bin
export GEM_HOME=$HOME/.gem
export PATH=$PATH:$GEM_HOME/bin
export COMPOSER_PATH=$HOME/.config/composer
export PATH=$PATH:$COMPOSER_PATH/vendor/bin

# aws snap
if command -v snap>/dev/null; then
    export SNAP_PATH=/snap
    export AWS_PATH=$SNAP_PATH/aws-cli/current
else
    export AWS_PATH=/usr/local/aws
fi

export PATH=$PATH:$AWS_PATH/bin

