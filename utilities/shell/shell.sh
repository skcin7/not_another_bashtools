#!/bin/sh
# Bash Helpful Utilities
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

shell() {
    if [[ $* == *--info* ]]; then
        divider " Shell Info ";
        neofetch;
        echo "You Are Logged In As: $(whoami)";
        echo "Current Shell: ${SHELL}";
        ps -p $$
        return 0;
    fi

    if [[ $* == *--list* ]]; then
        divider " Available Shells ";
        grep '^[^#]' /etc/shells
        return 0;
    fi

    #
    # Shell History.
    #
    if [[ $* == *--history* ]]; then
        divider " History ";

        # Can optionally clear the history instead of displaying it.
        if [[ $* == *--clear* ]]; then
            echo -n > "${HOME}/.bash_history";
            echo "The Shell History Has Been Cleared.";
            return 0;
        fi

        # Display the history.
        cat "${HOME}/.bash_history" | sed 's/\t/,|,/g' | column -s ',' -t
        return 0;
    fi

    #
    # Shows the shell's environment variable(s)
    #
    if [[ $* == *--env* ]]; then
        shift
        if [ "${1}" ]; then
            printenv ${1};
        else
            divider " Shell Environment: ";
            printenv;
        fi
        return 0;
    fi

    #
    # Changes the current working shell
    #
    if [[ $* == *--change* ]]; then
        local NEW_SHELL;
        divider " Change Unix Shell ";
        echo "Choose Shell:"
        grep '^[^#]' /etc/shells
        read -p "Which Shell To Change To?: " NEW_SHELL

        local CURRENT_SHELL=$(shell);
        echo "Current Shell: \`${CURRENT_SHELL}\`";

        echo "New Shell: \`${NEW_SHELL}\`";

        if [ "${CURRENT_SHELL}" == "${NEW_SHELL}" ]; then
            echo "${NEW_SHELL} is already your shell. Shell not changed.";
            return 0;
        fi

        $(chsh -s ${NEW_SHELL});
        echo "Default Shell Changed To: ${NEW_SHELL}";
        return 0;
    fi




    #
    # If a shell name is specifically passed, then switch to that shell
    #
    if [ "${1}" ]; then

        if [ "${1}" == "bash" ]; then
            echo "Switching To Bash..."
            bash;
        elif [ "${1}" == "zsh" ]; then
            echo "Switching To Zsh..."
            zsh;
        else
            echo "Invalid Shell!";
            return 10;
        fi

        return 0;
    fi


    # When command is run with no input or arguments, just print the current shell.
    echo "${SHELL}";
}