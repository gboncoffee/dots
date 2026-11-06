# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

export XDG_DATA_DIRS="$XDG_DATA_DIRS:$HOME/usr/share/applications"
export PATH="$PATH:$HOME/go/bin:$HOME/usr/bin"
export EDITOR=emacs
