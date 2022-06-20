#######color code########
# red="31m"
# green="32m"
# yellow="33m"
# blue="36m"
# fuchsia="35m"

# color_echo() {
#     echo "\033[$1${@:2}\033[0m"
# }

blue() {
    echo "\033[36m$@\033[0m"
}

green() {
    echo "\033[32m$@\033[0m"
}

red() {
    echo "\033[31m$@\033[0m"
}

error() {
    echo "\033[31m$@\033[0m"
}

yellow() {
    echo "\033[33m$@\033[0m"
}

warn() {
    echo "\033[33m$@\033[0m"
}

write_bash_profile() {
    for pt in ~/.zprofile ~/.profile ~/.bash_profile; do
        if test -r $pt && ! cat $pt | fgrep "$@" >/dev/null; then
            (
                test -r $pt && echo $@ >>$pt && blue $0 $@
            )
        fi
    done
}
