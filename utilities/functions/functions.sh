#!/usr/bin/env bash
# Not Another Terminal Tools
#     Utility: Functions
#
# Copyright 2022 Nick Morgan
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.




########################
# UTILITY ENTRY POINT: #
########################
#
# Main entry point to execute the utility.
#
natt_utility__functions() {

    if [ "${1}" == "--tests" ] || [ "${1}" == "tests" ]; then
        divider "Utility: Functions - Tests";
        source "${HOME}/.not_another_terminal_tools/utilities/functions/tests.sh";
        return;
    fi
    
}






alias "cmd_exists=natt_utility__functions__fn__cmd_exists";
alias "divider=natt_utility__functions__fn__divider";
alias "exists=natt_utility__functions__fn__exists";
alias "file_exists=natt_utility__functions__fn__file_exists";
alias "fn_exists=natt_utility__functions__fn__fn_exists";
alias "repeat=natt_utility__functions__fn__repeat";




natt_utility__functions__fn__cmd_exists() {
    if [ -z "$1" ]; then
        return 10;
    fi

    if command -v ${1} &> /dev/null; then
        return 0;
    fi


    return 10;
}



natt_utility__functions__fn__exists() {
    if [ -z "$1" ]; then
        return 10;
    fi

    if natt_utility__functions__fn__cmd_exists ${1} || natt_utility__functions__fn__fn_exists ${1}; then
        return 0;
    fi


    return 10;
}





# if $(natt_utility__functions__fn__exists ls); then
#     echo -e '✅ ls exists';
# else
#     echo -e '🚫 ls does not exist';
# fi

# if $(exists ls); then
#     echo -e '✅ ls exists (alias)';
# else
#     echo -e '🚫 ls does not exist (alias)';
# fi

# if $(natt_utility__functions__fn__exists natt_utility__functions); then
#     echo -e '✅ natt_utility__functions exists';
# else
#     echo -e '🚫 natt_utility__functions does not exist';
# fi

# if ! natt_utility__functions__fn__exists; then
#     echo -e '✅ unspecified does not exist';
# else
#     echo -e '🚫 unspecified exists';
# fi




# if $(natt_utility__functions__fn__cmd_exists ls); then
#     echo -e '✅ ls command exists';
# else
#     echo -e '🚫 ls command does not exist';
# fi

# if [[ $(natt_utility__functions__fn__cmd_exists ls) -eq 0 ]]; then
#     echo -e '✅ ls command exists';
# else
#     echo -e '🚫 ls command does not exist';
# fi

# if natt_utility__functions__fn__cmd_exists ls; then
#     echo -e '✅ ls command exists';
# else
#     echo -e '🚫 ls command does not exist';
# fi

# if ! natt_utility__functions__fn__cmd_exists; then
#     echo -e '✅ unspecified command does not exist';
# else
#     echo -e '🚫 unspecified command exists';
# fi


natt_utility__functions__fn__fn_exists() {
    # if [[ "$(declare -Ff "$1")" ]]; then
    #     return;
    # fi
    # false;

    # $(echo -e "Checking ${1}");

    # echo -e "Checking ${1}";

    if [ -n "$(LC_ALL=C type -t ${1})" ] && [ "$(LC_ALL=C type -t ${1})" = function ]; then
        # echo "${1} function exists";
        return;
    else
        # echo "${1} function does not exist";
        false;
    fi

    false;

    # type $1 2>/dev/null;
}
# alias "fn_exists=natt_utility__functions__fn__fn_exists";



# natt_utility__functions__fn__fn_exists_test() {
#     # echo -e "Testing ${1}";

#     local ALL_TESTS_PASS=true;

#     if natt_utility__functions__fn__fn_exists "${1}"; then
#         echo -e "EXISTS";
#     else
#         echo -e "NOT EXISTS";
#         ALL_TESTS_PASS=false;
#     fi


#     if ${ALL_TESTS_PASS}; then
#         echo -e "✅ Testing Passed";
#     else
#         echo -e "🚫 Testing Failed";
#     fi

#     # if natt_utility__functions__fn__fn_exists "${1}"; then
#     #     echo -e "EXISTS";
#     # else
#     #     echo -e "NOT EXISTS";
#     # fi
# }


# fn_exists() {
#     if [[ $(type -t foo) == function ]]; then
#         return;
#     fi
#     false;
# }

# fn_exists() {
#     declare -F "$1" > /dev/null;
# }


#
# Repeat a character or string N number of times.
#
natt_utility__functions__fn__repeat() {
    local start=1
    local end=${1:-80}
    local str="${2:-=}"
    local range=$(seq $start $end)

    # # Don't let it continue if no repeat string was provided.
    # if [ "${str}" == "" ]; then
    #     exit 10;
    # fi

    for i in $range ; do echo -n "${str}"; done
}
# alias "repeat=natt_utility__functions__fn__repeat";

# repeat2() {
#     num=$1
#     str=$2
#     eval $(echo printf '"${str}%0.s"' {1..$num})
# }

# repeat3() {
#     local str=$2 n=$1 spaces
#     printf -v spaces "%*s" $n " "     # create a string of spaces $n chars long
#     printf "%s" "${spaces// /$str}"   # substitute each space with the requested string
# }

#
# Print a divider in the terminal
#
natt_utility__functions__fn__divider() {
    local CURRENT_TERMINAL_WIDTH=${COLUMNS};
    local DIVIDER_TITLE="${1}";

    echo -e "$(repeat $(($((${CURRENT_TERMINAL_WIDTH} - ${#DIVIDER_TITLE})) / 2)) '=')${DIVIDER_TITLE}$(repeat $(($((${CURRENT_TERMINAL_WIDTH} - ${#DIVIDER_TITLE})) / 2)) '=')";
}
# alias "divider=natt_utility__functions__fn__divider";

#
# Determine if a file exists.
#
natt_utility__functions__fn__file_exists() {
    if [ ! test -f ${1} ]; then
        return false;
    fi
    return true;
}
# alias "file_exists=natt_utility__functions__fn__file_exists";



# #
# # https://unix.stackexchange.com/questions/311329/bash-output-array-in-table
# #
# print_table() {
#   perl -MText::ASCIITable -e '
#     $t = Text::ASCIITable->new({drawRowLine => 1});
#     while (defined($c = shift @ARGV) and $c ne "--") {
#       push @header, $c;
#       $cols++
#     }
#     $t->setCols(@header);
#     $rows = @ARGV / $cols;
#     for ($i = 0; $i < $rows; $i++) {
#       for ($j = 0; $j < $cols; $j++) {
#         $cell[$i][$j] = $ARGV[$j * $rows + $i]
#       }
#     }
#     $t->addRow(\@cell);
#     print $t' -- "$@"
# }


# table() {
#     # column -s ":" -t /etc/passwd

#     # values=(
#     #     case elems messing nlsys
#     #     "$var1" "$var2" "$var3" "$var4"
#     # )
#     # print -arC4 -- "$values[@]"

#     printf "a:b:c\n1: :3\n" | column -t -s ':'


#     # values=( 01----7 02----7 03-----8 04----7 05-----8 06-----8 07-----8 08-----8 09---6 10----7 11----7 12----7 13----7 14-----8 15-----8 16----7 17----7 18---6 19-----8 20-----8 21-----8)

#     # for value in "${values[@]}"; do 
#     #     printf "%-8s\n" "${value}"
#     # done | column -s "\t"

#     # echo "a:b:c:d:e:f" | column -t -s:

#     # echo $(printf "PERM LINKS OWNER GROUP SIZE MONTH DAY " ; \
#     #        printf "HH:MM/YEAR NAME\n" ; \
#     #        ls -l | sed 1d) | column -t;

#     # cat list.txt | sed 's/\t/,|,/g' | column -s ',' -t

#     # stringarray=('test' 'some thing' 'very long long long string' 'blah')
#     # numberarray=(1 22 7777 8888888888)
#     # anotherfieldarray=('other' 'mixed' 456 'data')
#     # array_size=4

#     # for((i=0;i<array_size;i++))
#     # do
#     #     echo ${stringarray[$i]} $'\x1d' ${numberarray[$i]} $'\x1d' ${anotherfieldarray[$i]}
#     # done | column -t -s$'\x1d'
# }


# #
# # Get options for some input
# # Usage: opts -a A -b B -c -d "foo bar" baz
# #
# opts () {
#     while getopts ":a:b" option; do
#         case $option in
#             a)
#                 echo "-a triggered with parameter $OPTARG" >&2
#                 ;;
#             b)
#                 echo "-b triggered" >&2
#                 ;;
#             :)
#                 echo "missing argument for option -${OPTARG}" >&2
#                 ;;
#             \?)
#                 echo "invalid option: -${OPTARG}" >&2
#                 ;;
#         esac
#     done
#     shift $(( OPTIND - 1 ))

#     echo "remaining arguments:"
#     for (( i=1; i<=$#; i++ )); do
#         printf "%d: '%s'\n" $i "${!i}"
#     done
# }



# #
# # Usage: opts2 -a A -b B -c -d "foo bar" baz
# # From: https://stackoverflow.com/a/21167390
# #
# opts2 () {
#     local extra_args=()
#     local options_available=":a:b:c";

#     while (( $# > 0 )); do
#         OPTIND=1
#         while getopts ${options_available} option; do
#             case $option in
#                 a)
#                     echo "-a triggered with parameter $OPTARG" >&2
#                     ;;
#                 b)
#                     echo "-b triggered" >&2 # output to STDERR
#                     ;;
#                 c)
#                     echo "-c triggered" >&2 # output to STDERR
#                     ;;
#                 :)
#                     echo "missing argument for option -$OPTARG" >&2
#                     ;;
#                 ?)
#                     echo "invalid option: -$OPTARG" >&2
#                     ;;
#             esac
#         done

#         shift $(( OPTIND - 1 ))
#         if (( $# > 0 )); then 
#             extra_args+=( "$1" )
#             shift
#         fi
#     done

#     echo "extra (non-option) arguments:"
#     printf "%s\n" "${extra_args[@]}"
# }