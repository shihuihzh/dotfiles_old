# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export M2_HOME=$HOME/DEV/Soft/apache-maven-3.5.3
export GOPATH=$HOME/DEV/go
export JAVA_HOME=$HOME/DEV/Soft/Java/jdk1.8.0_152
export PATH=$PATH:$M2_HOME/bin
export PATH=$PATH:$HOME/.scripts
#export MOZ_GTK_TITLEBAR_DECORATION=system
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export TERMINAL=alacritty
ibus-daemon -drx


export PATH="$HOME/.cargo/bin:$PATH"
