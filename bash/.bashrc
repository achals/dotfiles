# .bashrc
# Some handy shortcuts.

alias e="emacs"
export JAVA_HOME=$(/usr/libexec/java_home)


function cs () {
    cd "$@" && ls
    }

