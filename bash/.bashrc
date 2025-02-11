# .bashrc
# Some handy shortcuts.

alias e="emacs -nw"
export JAVA_HOME=$(/usr/libexec/java_home)
export PROMPT_COMMAND='history -a'

function cs () {
    cd "$@" && ls
    }
