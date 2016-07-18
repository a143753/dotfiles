# $HeadURL: svn://rdnzl/dotfiles/.zshenv $
# $Id: .zshenv 16492 2010-01-10 13:10:10Z funamoto $

path=( \
    /usr/local/pkgs/ruby/bin \
    /usr/local/go/bin \
    ~/go/bin \
    ~/eclipse \
    ~/android/android-sdk-linux_x86/tools \
    ~/android/android-sdk-linux_x86/tools/platform-tools \
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
export EDITOR="emacsclient"
export ALTERNATE_EDITOR="emacs"
export GOROOT=/usr/local/go
export GOPATH=/home/funamoto/go

export RUBYLIB=.

#export MANPATH=$MANPATH:/usr/local/pkgs/openmpi-1.4.2/share/man/

#export CLASSPATH=.:/usr/local/linux-ibm-jdk1.4.0/src.jar
#export CLASSPATH=.:/usr/local/linux-sun-jdk1.4.1/src.zip
#export CLASSPATH=.:/usr/local/jdk1.3.1/src.jar
#export CLASSPATH=.:/usr/local/jdk1.3.1/src.jar


prompt="%m[%/]%% "
