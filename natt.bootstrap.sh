#!/bin/sh
# Not Another Terminal Tools!
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





#
# Default NABT configuration.
# All of this configuration may be overwritten in the `nabt.ini.bash` initialization file.
#
NATT__GREETNAME=$(whoami)
NATT__AUTOBOOTSTRAP=1
NATT__VERBOSE=1
NATT__EDITOR=subl
NATT__UTILITIES=(
    "colors"
    "dns"
    "githelper"
    "natt"
    "nginxhelper"
    "nginxhelpers2"
    "phphelper"
    "functions"
    "whiptail"
    "shell"
    "system"
)
# source "${NATT__PATH}/nabt.ini.bash"

# Whether development mode is on.
NATT__DEVELOPMENT_MODE=true
# Development utilities to be loaded when in development mode.
NATT__DEVELOPMENT_MODE__UTILITIES=(
    "colors_old"
    "filesystem"
    "www"
)


# # Source the custom NABT configuration, which overrides the above default configuration.
# source "${NATT__PATH}/nabt.ini.bash"





# Don't mess with this.
NATT__IS_BOOTSTRAPPED=0
NATT__RETURN_CODE=0






#######################################
# Write a verbose message to stdout.
# ARGUMENTS:
#   Message to print
# OUTPUTS:
#   Writes verbose messages to stdout
# RETURN:
#   0
#######################################
natt__message() {
    # Only if verbose mode is turned on.
    if [ $NATT__VERBOSE -eq 1 ]; then
        printf "$1\n";
    fi

    NATT__RETURN_CODE=0
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
natt__execute_bootstrap() {

        #
    # Don't allow the bootstrapping to execute if it's already been executed in this bash session.
    #
    if [ ${NATT__IS_BOOTSTRAPPED} -eq 1 ]; then
        NATT__RETURN_CODE=10
        return 10;
    fi


    neofetch;


    #
    # Display a nice custom welcome message.
    #
    if [ -n "${NATT__GREETNAME}" ]; then
        figlet -w${COLUMNS} "Welcome Back, ${NATT__GREETNAME}!";
        # figlet "${NATT__GREETNAME}";
    else
        figlet "Not Another: BashTools!"
    fi




    natt__message "Bootstrapping Not Another Terminal Tools..."


    # Export variables to be enabled throughout the entire environment.
    # `bin` and `sh` directories, so those binaries/scripts may be used.
    export PATH=$PATH:"${NATT__PATH}/bin"
    export PATH=$PATH:"${NATT__PATH}/sh"
    export NATT__VERBOSE=${NATT__VERBOSE}

    # Load aliases.
    alias "code=${NATT__EDITOR}"
    alias "hosts=code /etc/hosts"
    alias "ll=ls -lashG"
    alias "sshconfig=code ${HOME}/.ssh/config"
    alias "which=which -a"
    # alias "nameservers=dig +short ns"

    # Load utilities
    for utility in ${NATT__UTILITIES[@]}; do
        source "${NATT__PATH}/utilities/${utility}/${utility}.sh"
        natt__message "\tLoaded Utility: ${utility}";
    done



    if [ "${NATT__DEVELOPMENT_MODE}" = true ]; then
        echo -e "Development Mode.";

        # Load development mode utilities
        for dev_utility in ${NATT__DEVELOPMENT_MODE__UTILITIES[@]}; do
            source "${NATT__PATH}/utilities_dev/${dev_utility}.sh"
            natt__message "\tLoaded Dev Utility: ${dev_utility}";
        done
    fi



    natt__message "✅ Not Another Terminal Tools - Bootstrapped"
    inspire.sh

    NATT__IS_BOOTSTRAPPED=1
    NATT__RETURN_CODE=0
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
natt__bootstrap() {
    natt__execute_bootstrap
}




#
# Automatically bootstrap (initialize) NABT in each new bash session.
# This may optionally be turned off in the custom configuration.
#
if [ ${NATT__AUTOBOOTSTRAP} -eq 1 ]; then
    natt__execute_bootstrap
fi