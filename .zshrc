bindkey -e
bindkey ' ' magic-space

compctl -g '*(-/)' cd

compctl -a unalias
compctl -g '*.tex *(-/)' jlatex
compctl -g '*.texi *(-/)' jtex

# MH commands
#folders=(`\folders -recurse -fast`)

compctl -x 's[+]' -k folders  -- scan
compctl -x 's[+]' -k folders  -- show
compctl -x 's[+]' -k folders  -- prev
compctl -x 's[+]' -k folders  -- next
compctl -x 's[+]' -k folders  -- refile
compctl -x 's[+]' -k folders  -- folder
compctl -x 's[+]' -k folders  -- folders
compctl -x 's[+]' -k folders  -- msort
compctl -x 's[+]' -k folders  -- mpack
compctl -x 's[+]' -k folders  -- mdelete

# PRINTER
printers=(phaser-ps able-ps 500CP 607CP )
compctl -g '*.ps *(-/)' -x 's[-P]' -k printers -- lpr
compctl -x 's[-P]' -k printers -- lpq

compctl -g '*.dvi *(-/)' -x 's[-P]' -k printers -- dvi2ps dviprint xdvi
compctl -g '*.ps *(-/)' ghostview
compctl -g '*.obj *(-/)' tgif

# CVS
cvscommands=( add admin annotate checkout commit diff edit editors export history import init log login logout pserver rdiff release remove rtag server status tag unedit update watch watchers )
compctl -k cvscommands -g '*' cvs


# Remote Hosts
#rhosts=(`cat ~/.rhosts`)
compctl -u S @ -x 'n[1,@]' -k rhosts -- finger talk phone
compctl -k rhosts rlogin
compctl -k rhosts xon

####################################################################

alias Rm="/bin/rm"
alias RM="/bin/rm -fr"
alias delete="/bin/rm -f *.bak .*~ .*.bak *~ *.BAK *.dvi *.toc *.aux"

alias ls="/bin/ls -F"
alias la="/bin/ls -aF"
alias ll="/bin/ls -lF"

alias cp="/bin/cp -pi"
alias CP="/bin/cp -p"
alias cl="cd \!^; ls"

alias mv="mv -i"
alias dirs="dirs -v | awk '/^[^0]/'"
alias skm="~/bin/$OSTYPE/skm out"
alias 5echo="/usr/5bin/echo"
alias pwd="/bin/pwd"

#alias emacs="XMODIFIERS=\"@im=none\" emacs -bg black -fg white -fn a14"
alias vi="vim"

HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt chase_links

export XIM=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=xim
export XMODIFIERS=@im=ibus
export XIM_PROGRAM="ibus-daemon"
export XIM_ARGS="-r --daemonize --xim"


# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$(CONDA_REPORT_ERRORS=false '/home/a143753/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     \eval "$__conda_setup"
# else
#     if [ -f "/home/a143753/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/a143753/anaconda3/etc/profile.d/conda.sh"
#         CONDA_CHANGEPS1=false conda activate base
#     else
#         \export PATH="/home/a143753/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda init <<<

export PYENV_ROOT="${HOME}/.pyenv"
export PATH=${PYENV_ROOT}/bin:$PATH
eval "$(pyenv init -)"

# OPAM configuration
. /home/a143753/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
