#!/bin/sh
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


natt_utility__natt() {
    if [ "${1}" == "--about" ] | [ "${1}" == "about" ]; then
        echo -e "${NATT__UTILITY__NATT__NAME} - Version ${NATT__UTILITY__NATT__VERSION} (${NATT__UTILITY__NATT__DATE}) \n By ${NATT__UTILITY__NATT__AUTHOR} <${NATT__UTILITY__NATT__CONTACT}> I ❤ ${NATT__UTILITY__NATT__NAME}" | lolcat -a -d 500
    fi

    #
    # Shows the shell's environment variable(s)
    #
    if [[ $* == *--ini* ]]; then
        code "${HOME}/"

        # shift
        # if [ "${1}" ]; then
        #     divider " natt.ini ";
        #     # printenv ${1};
        # else
        #     divider " natt.ini ";
        #     # printenv;
        # fi
        return 0;
    fi

    # if [[ $* == *--current* ]]; then
    #     echo "${SHELL}";
    # fi

    # echo "Not Another Terminal Tools";
    inspire.sh | lolcat -a -d 500
}
alias "natt=natt_utility__natt";

# shells() {
#     divider " Available Unix Shells ";
#     grep '^[^#]' /etc/shells
# }