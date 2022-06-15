#!/bin/sh
# Not Another Terminal Tools - Utility
#     Utility: Colors (Old)
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








#https://misc.flogisoft.com/bash/tip_colors_and_formatting

BLACK="30"
RED="31"
GREEN="32"
BROWN="33"
BLUE="34"
PURPLE="35"
CYAN="36"
LIGHTGRAY="37"
BOLDGREEN="\033[1;${GREEN}m"
ITALICRED="\033[3;${RED}m"
ENDCOLOR="\033[0m" #Removes all attributes (formatting and colors). It can be a good idea to add it at the end of each colored text. ;)

# echo "Hello World!" # This is an inline comment in bash
# echo -e "${BOLDGREEN}Behold! Bold, green text.${ENDCOLOR}"
# echo -e "${ITALICRED}Italian italics${ENDCOLOR}"


# 0 - Normal Style
# 1 - Bold
# 2 - Dim
# 3 - Italic
# 4 - Underlined
# 5 - Blinking
# 7 - Reverse
# 8 - Invisible
function normal() {
    echo -e '\033[0mYOUR_STRING\033[0m'
}

function bold() {
    echo -e "\033[1m${1}\033[0m"
}

function dim() {
    echo -e "\033[2m${1}\033[0m"
}

function italic() {
    echo -e "\033[3m${1}\033[0m"
}

function underline() {
    echo -e "\033[4m${1}\033[0m"
}

function blink() {
    echo -e "\033[5m${1}\033[0m"
}





function colorstest1() {
    reload
    divider "colorstest1"

    echo -e "\033[38;5;0m TESTING \033[0m"
    echo -e "\033[38;5;10m TESTING \033[0m"
    echo -e "\033[38;5;20m TESTING \033[0m"
    echo -e "\033[38;5;30m TESTING \033[0m"
    echo -e "\033[38;5;31m TESTING \033[0m"
    echo -e "\033[38;5;32m TESTING \033[0m"
    echo -e "\033[38;5;33m TESTING \033[0m"

    echo -e "\033[38;0;0m TESTING \033[0m"
    echo -e "\033[38;0;10m TESTING \033[0m"
    echo -e "\033[38;0;20m TESTING \033[0m"
    echo -e "\033[38;0;30m TESTING \033[0m"
    echo -e "\033[38;0;31m TESTING \033[0m"
    echo -e "\033[38;0;32m TESTING \033[0m"
    echo -e "\033[38;0;33m TESTING \033[0m"
}

function stylestest1() {
    echo ""
    # echo "STANDARD OUTPUT"

    # echo -e "\033[0;30m NORMAL STYLE, COLOR BLACK \033[0m"

    echo -e "\033[0m NORMAL \033[0m"

    echo -e "\033[0;0;0m NORMAL \033[0m"
    echo -e "\033[0;0;1m BOLD \033[0m"
    echo -e "\033[0;0;2m DIM \033[0m"
    echo -e "\033[0;0;3m ITALIC \033[0m"
    echo -e "\033[0;0;4m UNDERLINE \033[0m"
    echo -e "\033[0;0;5m BLINK \033[0m"
    echo -e "\033[0;0;7m REVERSE \033[0m"
    echo -e "\033[0;0;8m INVISIBLE \033[0m"
    echo ""

    echo -e "\033[${1};${2};${3}m NORMAL \033[0m"
    echo -e "\033[${1};${2};${3}m BOLD \033[0m"
    echo -e "\033[${1};${2};${3}m DIM \033[0m"
    echo -e "\033[${1};${2};${3}m ITALIC \033[0m"
    echo -e "\033[${1};${2};${3}m UNDERLINE \033[0m"
    echo -e "\033[${1};${2};${3}m BLINK \033[0m"
    echo -e "\033[${1};${2};${3}m REVERSE \033[0m"
    echo -e "\033[${1};${2};${3}m INVISIBLE \033[0m"
    echo ""
}

function colorstest2() {
    echo ""
    echo "STANDARD OUTPUT"
    echo -e "\033[1;31m RED \033[0m"
    echo -e "\033[1;32m GREEN \033[0m"
    echo -e "\033[1;33m YELLOW \033[0m"
    echo -e "\033[1;34m BLUE \033[0m"
    echo -e "\033[1;35m MAGENTA \033[0m"
    echo -e "\033[1;36m CYAN \033[0m"
    echo ""
    echo "BACKGROUND COLOR"
    echo -e "\033[1;41m RED \033[0m"
    echo -e "\033[1;42m GREEN \033[0m"
    echo -e "\033[1;43m YELLOW \033[0m"
    echo -e "\033[1;44m BLUE \033[0m"
    echo -e "\033[1;45m MAGENTA \033[0m"
    echo -e "\033[1;46m CYAN \033[0m"
    echo ""
    echo "STANDARD OUTPUT"
    echo -e "\033[${1};31m RED \033[0m"
    echo -e "\033[${1};32m GREEN \033[0m"
    echo -e "\033[${1};33m YELLOW \033[0m"
    echo -e "\033[${1};34m BLUE \033[0m"
    echo -e "\033[${1};35m MAGENTA \033[0m"
    echo -e "\033[${1};36m CYAN \033[0m"
    echo ""
    echo "BACKGROUND COLOR"
    echo -e "\033[${1};41m RED \033[0m"
    echo -e "\033[${1};42m GREEN \033[0m"
    echo -e "\033[${1};43m YELLOW \033[0m"
    echo -e "\033[${1};44m BLUE \033[0m"
    echo -e "\033[${1};45m MAGENTA \033[0m"
    echo -e "\033[${1};46m CYAN \033[0m"
    echo ""
}







# This script:  https://gist.github.com/tavinus/925c7c9e67b5ba20ae38637fd0e06b07
# SO reference: https://stackoverflow.com/questions/16843382/colored-shell-script-output-library

ESeq="\x1b["
RCol="$ESeq"'0m'    # Text Reset

# Regular               Bold                    Underline               High Intensity          BoldHigh Intens         Background              High Intensity Backgrounds
Bla="$ESeq"'0;30m';     BBla="$ESeq"'1;30m';    UBla="$ESeq"'4;30m';    IBla="$ESeq"'0;90m';    BIBla="$ESeq"'1;90m';   On_Bla="$ESeq"'40m';    On_IBla="$ESeq"'0;100m';
Red="$ESeq"'0;31m';     BRed="$ESeq"'1;31m';    URed="$ESeq"'4;31m';    IRed="$ESeq"'0;91m';    BIRed="$ESeq"'1;91m';   On_Red="$ESeq"'41m';    On_IRed="$ESeq"'0;101m';
Gre="$ESeq"'0;32m';     BGre="$ESeq"'1;32m';    UGre="$ESeq"'4;32m';    IGre="$ESeq"'0;92m';    BIGre="$ESeq"'1;92m';   On_Gre="$ESeq"'42m';    On_IGre="$ESeq"'0;102m';
Yel="$ESeq"'0;33m';     BYel="$ESeq"'1;33m';    UYel="$ESeq"'4;33m';    IYel="$ESeq"'0;93m';    BIYel="$ESeq"'1;93m';   On_Yel="$ESeq"'43m';    On_IYel="$ESeq"'0;103m';
Blu="$ESeq"'0;34m';     BBlu="$ESeq"'1;34m';    UBlu="$ESeq"'4;34m';    IBlu="$ESeq"'0;94m';    BIBlu="$ESeq"'1;94m';   On_Blu="$ESeq"'44m';    On_IBlu="$ESeq"'0;104m';
Pur="$ESeq"'0;35m';     BPur="$ESeq"'1;35m';    UPur="$ESeq"'4;35m';    IPur="$ESeq"'0;95m';    BIPur="$ESeq"'1;95m';   On_Pur="$ESeq"'45m';    On_IPur="$ESeq"'0;105m';
Cya="$ESeq"'0;36m';     BCya="$ESeq"'1;36m';    UCya="$ESeq"'4;36m';    ICya="$ESeq"'0;96m';    BICya="$ESeq"'1;96m';   On_Cya="$ESeq"'46m';    On_ICya="$ESeq"'0;106m';
Whi="$ESeq"'0;37m';     BWhi="$ESeq"'1;37m';    UWhi="$ESeq"'4;37m';    IWhi="$ESeq"'0;97m';    BIWhi="$ESeq"'1;97m';   On_Whi="$ESeq"'47m';    On_IWhi="$ESeq"'0;107m';

printInfo() {
    echo -e "${BICya}>>>> ${BIYel}${1}${RCol}"
}

function colorstest3() {
    printInfo "REGULAR"
    echo -e "${Bla}BLACK ${Blu}BLUE ${Red}RED ${Gre}GREEN ${Yel}YELLOW ${Pur}PURPLE ${Cya}CYAN ${Whi}WHITE ${RCol}\n"

    # Using printf
    #printf "${Bla}BLACK ${Blu}BLUE ${Red}RED ${Gre}GREEN ${Yel}YELLOW ${Pur}PURPLE ${Cya}CYAN ${Whi}WHITE ${RCol}\n\n"

    printInfo "BOLD"
    echo -e "${BBla}BLACK ${BBlu}BLUE ${BRed}RED ${BGre}GREEN ${BYel}YELLOW ${BPur}PURPLE ${BCya}CYAN ${BWhi}WHITE ${RCol}\n"

    printInfo "UNDERLINE"
    echo -e "${UBla}BLACK ${UBlu}BLUE ${URed}RED ${UGre}GREEN ${UYel}YELLOW ${UPur}PURPLE ${UCya}CYAN ${UWhi}WHITE ${RCol}\n"

    printInfo "HIGH INTENSITY"
    echo -e "${IBla}BLACK ${IBlu}BLUE ${IRed}RED ${IGre}GREEN ${IYel}YELLOW ${IPur}PURPLE ${ICya}CYAN ${IWhi}WHITE ${RCol}\n"

    printInfo "BOLD HIGH INTENSITY"
    echo -e "${BIBla}BLACK ${BIBlu}BLUE ${BIRed}RED ${BIGre}GREEN ${BIYel}YELLOW ${BIPur}PURPLE ${BICya}CYAN ${BIWhi}WHITE ${RCol}\n"

    printInfo "BACKGROUND"
    echo -e "${On_Bla}BLACK ${On_Blu}BLUE ${On_Red}RED ${On_Gre}GREEN ${On_Yel}YELLOW ${On_Pur}PURPLE ${On_Cya}CYAN ${On_Whi}WHITE ${RCol}\n"

    printInfo "HIGH INTENSITY BACKGROUND"
    echo -e "${On_IBla}BLACK ${On_IBlu}BLUE ${On_IRed}RED ${On_IGre}GREEN ${On_IYel}YELLOW ${On_IPur}PURPLE ${On_ICya}CYAN ${On_IWhi}WHITE ${RCol}\n"
}



function colorstest4() {
    for x in {0..8}; do 
        for i in {30..37}; do 
            for a in {40..47}; do 
                echo -ne "\033[$x;$i;$a""m\\\033[$x;$i;$a""m\033[0;37;40m "
            done
            echo
        done
    done
    echo ""

    # # One Liner:
    # for x in {0..8}; do for i in {30..37}; do for a in {40..47}; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo ""
}


function linebreak() {
    echo "";
}

# function divider() {
#   # local HEADING_TEXT=${1}
#   # local DIVIDER_CHARACTER=${2} # '='
#   # local DOUBLE=${3}

#   local HEADING_TEXT=""
#   local DIVIDER_CHARACTER="="
#   local DOUBLE=false

#   if [[ "$1" ]]; then
#       HEADING_TEXT=${1}
#   fi

#   if [[ "$2" ]]; then
#       DIVIDER_CHARACTER=${2}
#   fi

#   if [[ "$3" ]]; then
#       DOUBLE=true
#   fi

#   # # echo ${HEADING_TEXT}
#   # local HEADING_TEXT_SIZE=${#HEADING_TEXT}
#   # echo ${HEADING_TEXT_SIZE}

#   local WIDTH=$(shellwidth)


#   if [[ "${DOUBLE}" = true ]]; then
#       local PADDING_SIZE=2

#       local HEADING_TEXT_WITH_PADDING="$(repeatcharacterntimes '_' ${PADDING_SIZE})${HEADING_TEXT}$(repeatcharacterntimes '_' ${PADDING_SIZE})"

#       echo -e $(repeatcharacterntimes "${DIVIDER_CHARACTER}" ${WIDTH})
#       echo -e $(padstring "${HEADING_TEXT_WITH_PADDING}" ${WIDTH} "~" center)
#       echo -e $(repeatcharacterntimes "${DIVIDER_CHARACTER}" ${WIDTH})
#       return
#   fi

#   if [ ${#HEADING_TEXT} -gt 0 ]; then
#       echo -e $(padstring "${HEADING_TEXT}" ${WIDTH} "${DIVIDER_CHARACTER}" center)
#   else
#       echo -e $(repeatcharacterntimes "${DIVIDER_CHARACTER}" ${WIDTH})
#   fi
# }


function repeatcharacterntimes() {
    local REPEAT_CHARACTER=${1}
    local REPEAT_TIMES=${2}

    # echo -e ${#REPEAT_CHARACTER}

    #https://stackoverflow.com/questions/5799303/print-a-character-repeatedly-in-bash

    # It seems to be calculating the size correctly even for whitespaces
    local REPEATED_STRING=$(printf "%0.s${REPEAT_CHARACTER}" $(seq 1 ${REPEAT_TIMES}))
    # echo -e ${#REPEATED_STRING}

    # echo -e "  "

    echo -e ${REPEATED_STRING}

    # local REPEATED_STRING_SIZE=${#REPEATED_STRING}
    # echo -e ${REPEATED_STRING_SIZE}

    # echo -e $(printf "%0.s${REPEAT_CHARACTER}" $(seq 1 ${REPEAT_TIMES}))


    # echo -e $(printf '%0.s-' $(seq 1 ${REPEAT_TIMES}))

    # # this works to repeat a character n amount of times
    # local NEW_PAD_LENGTH=10
    # local PAD_TEST=$(printf "%0.s${REPEAT_CHARACTER}" $(seq 1 ${REPEAT_TIMES}))
    # echo -e ${PAD_TEST}
}


function padstring() {
    # local STRING="40m"
    # local PAD_LENGTH=10 # Total length of the final padded string
    # local PAD_CHARACTER=' '
    # local PAD_ALIGNMENT='center' # "left", "center", or "right"

    local STRING=${1}
    local PAD_LENGTH=${2} # Total length of the final padded string
    local PAD_CHARACTER="${3}"
    local PAD_ALIGNMENT=${4} # "left", "center", or "right"


    local STRING_SIZE=${#STRING}

    # if total pad length is less than the length of the string, then just return the string without any added padding
    if (( ${STRING_SIZE} > ${PAD_LENGTH} )); then
        # echo -e ${STRING}
        # echo ${STRING_SIZE}
        # echo ${PAD_LENGTH}
        # echo -e "padding not added"
        return
    fi

    #echo -e $(( ${PAD_LENGTH} - ${STRING_SIZE} ))

    # echo -e $(printf '=%.0s' {1..$(( ${PAD_LENGTH} - ${STRING_SIZE} ))})
    # echo -e $(printf '=%.0s' {1..$(( ${PAD_LENGTH} - ${STRING_SIZE} ))})
    # echo -e $(echo $(printf '=%.0s' {1..${PAD_LENGTH}))

    # $(perl -E 'say "-" x 80')

    # local PAD_TEST=$(printf "%0.s." {1..10})

    # # this works to repeat a character n amount of times
    # local NEW_PAD_LENGTH=10
    # local PAD_TEST=$(printf '%0.s-' $(seq 1 ${NEW_PAD_LENGTH}))
    # echo -e ${PAD_TEST}

    # echo -e "${PAD_TEST}${STRING}${PAD_TEST}"



    local PAD_LEFT=''
    local PAD_RIGHT=''
    local PAD_LEFT_AMOUNT=0
    local PAD_RIGHT_AMOUNT=0

    local PAD_TOTAL_AMOUNT=$(( ${PAD_LENGTH} - ${STRING_SIZE} ))
    #echo -e "PAD_TOTAL_AMOUNT: ${PAD_TOTAL_AMOUNT}"


    if [[ "${PAD_ALIGNMENT}" == "left" ]]; then
        # echo -e "left align";

        # left alignment means the padding gets added to the right, so that the string stays on the left
        # PAD_RIGHT=$(printf "%0.s${PAD_CHARACTER}" $(seq 1 ${PAD_TOTAL_AMOUNT}))
        PAD_RIGHT=$(repeatcharacterntimes "${PAD_CHARACTER}" ${PAD_TOTAL_AMOUNT})
        
    elif [[ "${PAD_ALIGNMENT}" == "center" ]]; then
        # center alignment means the padding gets added to both the left and the right, so that the string will be in the middle
        # echo -e "center align";

        if [[ $((${PAD_TOTAL_AMOUNT} % 2)) -eq 0 ]]; then
            # number is even
            # echo -e "number is even";
            PAD_LEFT_AMOUNT=$(( ${PAD_TOTAL_AMOUNT} / 2 ))
            PAD_RIGHT_AMOUNT=$(( ${PAD_TOTAL_AMOUNT} / 2 ))
            # PAD_LEFT=$(printf '%0.s-' $(seq 1 $(( ${PAD_TOTAL_AMOUNT} / 2 )) ))
            # PAD_RIGHT=$(printf '%0.s-' $(seq 1 $(( ${PAD_TOTAL_AMOUNT} / 2 )) ))
        else
            # number is odd
            # echo -e "number is odd";
            PAD_LEFT_AMOUNT=$(( $(( ${PAD_TOTAL_AMOUNT} - 1 )) / 2 + 1 ))
            PAD_RIGHT_AMOUNT=$(( $(( ${PAD_TOTAL_AMOUNT} - 1 )) / 2 ))
            # PAD_LEFT=$(printf '%0.s-' $(seq 1 $(( $(( ${PAD_TOTAL_AMOUNT} - 1 )) / 2 )) ))
            # PAD_RIGHT=$(printf '%0.s-' $(seq 1 $(( $(( ${PAD_TOTAL_AMOUNT} - 1 )) / 2 )) + 1 ))
        fi

        # echo -e "PAD_LEFT_AMOUNT: ${PAD_LEFT_AMOUNT}"
        # echo -e "PAD_RIGHT_AMOUNT: ${PAD_RIGHT_AMOUNT}"

        # PAD_LEFT=$(printf "%0.s${PAD_CHARACTER}" $(seq 1 ${PAD_LEFT_AMOUNT}))
        # PAD_RIGHT=$(printf "%0.s${PAD_CHARACTER}" $(seq 1 ${PAD_RIGHT_AMOUNT}))
        PAD_LEFT="$(repeatcharacterntimes "${PAD_CHARACTER}" ${PAD_LEFT_AMOUNT})"
        PAD_RIGHT="$(repeatcharacterntimes "${PAD_CHARACTER}" ${PAD_RIGHT_AMOUNT})"


        # PAD_LEFT=$(printf '%0.s-' $(seq 1 $(( ${PAD_TOTAL_AMOUNT} / 2 )) ))
        # PAD_RIGHT=$(printf '%0.s-' $(seq 1 $(( ${PAD_TOTAL_AMOUNT} / 2 )) ))
    elif [[ "${PAD_ALIGNMENT}" == "right" ]]; then
        # echo -e "right align";

        # right alignment means the padding gets added to the left, so that the string stays on the right
        # PAD_LEFT=$(printf "%0.s${PAD_CHARACTER}" $(seq 1 ${PAD_TOTAL_AMOUNT}))
        PAD_LEFT=$(repeatcharacterntimes "${PAD_CHARACTER}" ${PAD_TOTAL_AMOUNT})
    fi

    # echo -e "PAD_LEFT_AMOUNT: ${PAD_LEFT_AMOUNT}"
    # echo -e "PAD_RIGHT_AMOUNT: ${PAD_RIGHT_AMOUNT}"

    echo -e "${PAD_LEFT}${STRING}${PAD_RIGHT}"
}

# function colsizetester() {
#   local COLUMN_SIZE=10
#   perl -E 'say "-" x '${COLUMN_SIZE}
# }


function colorstest5() {
    #local T='gYw'   # The test text
    local T=${USER}
    local T_SIZE=${#T}
    local PADDING_SIZE=2 # how many characters to pad on each side of the string
    local COLUMN_SIZE=$(( ${T_SIZE} + $(( ${PADDING_SIZE} * ${PADDING_SIZE} )) )) # the total size of each column, including padding on each side

    # echo ${COLUMN_SIZE}

    #echo -e "\n                 40m     41m     42m     43m     44m     45m     46m     47m";

    local HEADING
    HEADING+=$(repeatcharacterntimes '-' $(( 7 + ${T_SIZE} + 4 ))) # this is not currently working with a space, using '&' or '-' instead.
    HEADING+="$(padstring '40m' $(( ${T_SIZE} + 7 )) '-' center)"
    HEADING+="$(padstring '41m' $(( ${T_SIZE} + 7 )) '-' center)"
    HEADING+="$(padstring '42m' $(( ${T_SIZE} + 7 )) '-' center)"
    HEADING+="$(padstring '43m' $(( ${T_SIZE} + 7 )) '-' center)"
    HEADING+="$(padstring '44m' $(( ${T_SIZE} + 7 )) '-' center)"
    HEADING+="$(padstring '45m' $(( ${T_SIZE} + 7 )) '-' center)"
    HEADING+="$(padstring '46m' $(( ${T_SIZE} + 7 )) '-' center)"
    HEADING+="$(padstring '47m' $(( ${T_SIZE} + 7 )) '-' center)"
    echo -e ${HEADING}

    for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
           '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
           '  36m' '1;36m' '  37m' '1;37m';
    do FG=${FGs// /}
        echo -en " $FGs \033[$FG  $T  "
        for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
        do
            echo -en "$EINS \033[$FG\033[$BG   $T   \033[0m";
        done
        echo;
    done
    echo
}