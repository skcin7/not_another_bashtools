#!/bin/bash
# Not Another BashTools!
# A set of tools and utilities to be used within a bash shell.
#
# Author: Nick Morgan
# Contact: nick@nicholas-morgan.com
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


# Default NABT configuration.
NABT__AUTOBOOTSTRAP=1
NABT__VERBOSE=1
NABT__CODE_COMMAND=nano
NABT__UTILITIES=(
    "nginx_helpers"
    "parse_git_branch"
    "php_helpers"
)
NABT__RETURN_CODE=0


# # Source the NABT initialization, which over-rides default YATB
# # configuration for any values present in the initialization
# source "${NABT__PATH}/nabt.ini.bash"



#######################################
# Write a verbose message to stdout.
# ARGUMENTS:
#   Message to print
# OUTPUTS:
#   Writes verbose messages to stdout
# RETURN:
#   0
#######################################
nabt__message() {
    # Only if verbose mode is turned on.
    if [ $NABT__VERBOSE -eq 1 ]; then
        printf "$1\n";
    fi

    NABT__RETURN_CODE=0
    return 0
}

#######################################
# Execute the bootstrapper.
# ARGUMENTS:
#   (none)
# OUTPUTS:
#   Writes verbose messages to stdout
# RETURN:
#   0 if bootstrapper succeeds; non-zero on error
#######################################
nabt__execute_bootstrap() {
    if [ -n "${NABT__GREETNAME}" ]; then
        figlet "Welcome:";
        figlet "${NABT__GREETNAME}";
    else
        figlet "Not Another: BashTools!"
    fi

    nabt__message "Bootstrapping..."


    # Export variables to be enabled throughout the entire environment.
    # `bin` and `sh` directories, so those binaries/scripts may be used.
    export PATH=$PATH:"${NABT__PATH}/bin"
    export PATH=$PATH:"${NABT__PATH}/sh"
    export NABT__VERBOSE=${NABT__VERBOSE}

    # Load aliases.
    alias "code=${NABT__CODE_COMMAND}"
    alias "hosts=code /etc/hosts"
    alias "ll=ls -lashG"

    # Load utilities
    for utility in ${NABT__UTILITIES[@]}; do
        source "${NABT__PATH}/utilities/${utility}.bash"
        nabt__message "\tLoaded Utility: ${utility}";
    done

    nabt__message "Bootstrapped."
    NABT__RETURN_CODE=0
    return 0;
}

#######################################
# Manually run the bootstrapper.
# ARGUMENTS:
#   (none)
# OUTPUTS:
#   Writes verbose messages to stdout
# RETURN:
#   0 if bootstrapper succeeds; non-zero on error
#######################################
nabt__bootstrap() {
#    nabt__message "Not Another BashTools! - Bootstrapping..."
    nabt__execute_bootstrap

#    if [ ${NABT__RETURN_CODE} -eq 0 ]; then
#        nabt__message "Not Another BashTools! - Bootstrapped!"
#    fi
}





alias bootstrap="nabt__bootstrap"

# Automatically bootstrap for a new bash session.
#Otherwise, bootstrapping must be done manually.
if [ ${NABT__AUTOBOOTSTRAP} -eq 1 ]; then
#    # All this does is return the value (it doesn't echo)
#    res=$(nabt__execute_bootstrap)
#    echo $?

#    nabt__message "Auto-Bootstrapping..."
    nabt__execute_bootstrap
#    if [ ${NABT__RETURN_CODE} -eq 0 ]; then
#        nabt__message "Auto-Bootstrapped!"
#    fi
fi