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

export GUIX_LOCPATH="$HOME/.guix-profile/lib/locale"
export GUIX_GTK3_PATH="$HOME/.guix-profile/lib/gtk-3.0${GUIX_GTK3_PATH:+:$GUIX_GTK3_PATH}"

export XDG_DATA_DIRS="$HOME/.guix-profile/share:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
export PATH="$HOME/.local/bin:$HOME/go/bin:$HOME/usr/bin:$PATH"
export EDITOR='emacs'
