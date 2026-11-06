# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

#
# Custom
#
__prompt() {
  local c=$?
  PS1='\n'
  ((c)) && PS1+="\[\e[91m\][$c]\[\e[0m\] "
  PS1+='\[\e[92m\]\u\[\e[97m\]@\[\e[92m\]\h\[\e[97m\]:\[\e[94m\]\w/\[\e[97m\]>\[\e[0m\] '
}
PROMPT_COMMAND=__prompt

# Makes Emacs' vterm work.
if [[ "$INSIDE_EMACS" = 'vterm' ]] \
       && [[ -n ${EMACS_VTERM_PATH} ]] \
       && [[ -f ${EMACS_VTERM_PATH}/etc/emacs-vterm-bash.sh ]]; then
    source ${EMACS_VTERM_PATH}/etc/emacs-vterm-bash.sh
fi

alias make='make -j$(nproc)'
