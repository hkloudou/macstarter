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

red() {
    echo "\033[31m$@\033[0m"
}

yellow() {
    echo "\033[33m$@\033[0m"
}

green() {
    echo "\033[32m$@\033[0m"
}
