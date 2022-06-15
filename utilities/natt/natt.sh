#!/usr/bin/env python3
# Not Another Terminal Tools
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


######################
# UTILITY VARIABLES: #
######################


NATT__UTILITY__NATT__NAME="Not Another Terminal Tools";
NATT__UTILITY__NATT__VERSION="0.0.1";
NATT__UTILITY__NATT__DATE="6/14/2022";
NATT__UTILITY__NATT__AUTHOR="Nick Morgan";
NATT__UTILITY__NATT__CONTACT="nick@nicholas-morgan.com";

# NATT__UTILITIES=(
#     "colors"
#     "dns"
#     "githelper"
#     "natt"
#     "nginxhelper"
#     "nginxhelpers2"
#     "phphelper"
#     "functions"
#     "whiptail"
#     "shell"
#     "system"
# )


declare -a registered_utilities=();

natt_utility__natt__fn__register_utility() {
    registered_utilities+=("${1}");
}

########################
# UTILITY ENTRY POINT: #
########################

#
# Main entry point to execute the utility.
#
natt_utility__natt() {
    if [ "${1}" == "--about" ] | [ "${1}" == "about" ]; then
        # Works with adding linebreaks in cowsay:
        (echo -e "${NATT__UTILITY__NATT__NAME}\n";
            echo -e "Version ${NATT__UTILITY__NATT__VERSION} (${NATT__UTILITY__NATT__DATE})\n";
            echo -e "By ${NATT__UTILITY__NATT__AUTHOR} <${NATT__UTILITY__NATT__CONTACT}>\n";
            # echo -e "$(fortune -s)\n"
            inspire.sh
        ) | cowsay -W80 -f dragon | lolcat;

        # # Not adding linebreaks in cowsay:
        # (echo -e "${NATT__UTILITY__NATT__NAME}"; echo -e "Version ${NATT__UTILITY__NATT__VERSION} (${NATT__UTILITY__NATT__DATE})"; echo -e "By ${NATT__UTILITY__NATT__AUTHOR} <${NATT__UTILITY__NATT__CONTACT}>"; echo -e "I ❤ ${NATT__UTILITY__NATT__NAME}";) | cowsay -W80 -f dragon | lolcat
        
        return;
    fi

    # #
    # # Shows the shell's environment variable(s)
    # #
    # if [[ $* == *--ini* ]]; then
    #     code "${HOME}/"

    #     # shift
    #     # if [ "${1}" ]; then
    #     #     divider " natt.ini ";
    #     #     # printenv ${1};
    #     # else
    #     #     divider " natt.ini ";
    #     #     # printenv;
    #     # fi
    #     return 0;
    # fi



    # echo "Not Another Terminal Tools";
    # inspire.sh | lolcat -a -d 500

    natt_utility__natt__fn__register_utility "Hi";
    echo "Registered Utilities Size: ${#registered_utilities[@]}";
    echo "Registered Utilities: ${registered_utilities[*]}"




}
alias "natt=natt_utility__natt";





# shells() {
#     divider " Available Unix Shells ";
#     grep '^[^#]' /etc/shells
# }