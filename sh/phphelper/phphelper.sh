#!/bin/bash
####################################################################
#                           ______
#                        .-.      .-.
#                       /            \
#                      |     zRR      |
#                      |,  .-.  .-.  ,|
#                      | )(z_/  \z_)( |
#                      |/     /\     \|
#              _       (_     ^^     _)
#      _\ ____) \_______\__|IIIIII|__/_________________________
#     (_)[___]{}<________|-\IIIIII/-|__zRR__zRR__zRR___________\
#       /     )_/        \          /
#                         \ ______ /
#                         PHP HELPER
####################################################################

source "./phphelper.ini"

# # Apple Silicon M1 Chipset
# alias php72="/opt/homebrew/opt/php@7.2/bin/php"
# alias php73="/opt/homebrew/opt/php@7.3/bin/php"
# alias php74="/opt/homebrew/opt/php@7.4/bin/php"
# alias php80="/opt/homebrew/opt/php@8.0/bin/php"
# alias php81="/opt/homebrew/opt/php@8.1/bin/php"

# # Make switching versions easy
# # From: https://kevdees.com/macos-11-big-sur-nginx-setup-multiple-php-versions/
# function phpv() {
#     brew unlink php
#     brew link --overwrite --force "php@$1"
#     php -v
# }


if [[ $* == *--version* ]]; then
    php --version
    return 0;
fi

if [[ $* == *--info* ]]; then
    php --info
    return 0;
fi

if [[ $* == *--ini* ]]; then
    php --ini
    return 0;
fi


return 0;


# function phphelper__usage() {
#     $(echo "Usage: $0 [-s <45|90>] [-p <string>]" 1>&2; exit 1;);
# }



# while getopts ":s:p:" o; do
#     case "${o}" in
#         s)
#             s=${OPTARG}
#             ((s == 45 || s == 90)) || phphelper__usage
#             ;;
#         p)
#             p=${OPTARG}
#             ;;
#         *)
#             phphelper__usage
#             ;;
#     esac
# done
# shift $((OPTIND-1))

# if [ -z "${s}" ] || [ -z "${p}" ]; then
#     phphelper__usage
#     return 1;
# fi

# echo "s = ${s}"
# echo "p = ${p}"