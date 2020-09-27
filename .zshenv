
path=( \
       ~/.local/bin \
       ~/anaconda3/bin \
       ~/.stack/programs/x86_64-linux/ghc-nopie-8.0.1/bin \
       /usr/local/go/bin \
       ~/go/bin \
       ~/.cargo/bin \
       $path \
)

export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
#export LANG=ja_JP.eucJP
#export LC_ALL=ja_JP.eucJP
#export LC_CTYPE=ja_JP.eucJP
export PAGER=lv
#export XMODIFIERS="@im=xim"
export HISTFILE="~/.history"
export EDITOR="gvim -f"
export ALTERNATE_EDITOR="vim"
export GOROOT=/usr/local/go

export RUBYLIB=.

#export MANPATH=$MANPATH:/usr/local/pkgs/openmpi-1.4.2/share/man/

#export CLASSPATH=.:/usr/local/linux-ibm-jdk1.4.0/src.jar
#export CLASSPATH=.:/usr/local/linux-sun-jdk1.4.1/src.zip
#export CLASSPATH=.:/usr/local/jdk1.3.1/src.jar
#export CLASSPATH=.:/usr/local/jdk1.3.1/src.jar


prompt="%m[%/]%% "
