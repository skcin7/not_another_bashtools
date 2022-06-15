#!/bin/sh
# Not Another Terminal Tools
#     Utility: githelper
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

NATT__UTILITY__GITHELPER__PARSE_GIT_BRANCH=true



# natt_utility__githelper__fn__parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }


#
# Parse the git branch as part of the terminal $PS1 shell environment variable, which causes the branch name shows in the terminal.
#
if [ "${NATT__UTILITY__GITHELPER__PARSE_GIT_BRANCH}" = true ]; then
    # One-liner:
    export PS1="\u@\h \W\[\033[32m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')\[\033[00m\] $ ";

    # # Use of function:
    # export PS1="\u@\h \W\[\033[32m\]\$(natt_utility__githelper__fn__parse_git_branch)\[\033[00m\] $ ";
fi

# #
# # Automatically bootstrap (initialize) NABT in each new bash session.
# # This may optionally be turned off in the custom configuration.
# #
# if [ ${NATT__UTILITY__GITHELPER__PARSE_GIT_BRANCH} -eq 1 ]; then
#     natt__execute_bootstrap
# fi



######################
# UTILITY FUNCTIONS: #
######################

#
# Determines if the current directory is a git repository.
#
natt_utility__githelper__fn__is_git_repo() {
    if [ -d .git ]; then
        return;
    fi;
    false;
}

#
# Determines the branch name of the current repository.
#
natt_utility__githelper__fn__branch_name() {
    local BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p');
    echo -e ${BRANCH};
}



#####################
# MAIN ENTRY POINT: #
#####################

#
# Main entry point to execute the utility.
#
natt_utility__githelper() {
    divider "Git Helper";

    if [ "${1}" == "--branch-list" ]; then
        git branch --list;
        return;
    fi

    if [ "${1}" == "--tag-list" ]; then
        git tag --list;
        return;
    fi


    if $(natt_utility__githelper__fn__is_git_repo); then
        echo -e "✅ The current directory is a git repository. Branch Name: \033[38;0;32m $(natt_utility__githelper__fn__branch_name) \033[0m \n\nStatus:\n$(git status)    \033[38;0;32m TESTING \033[0m"
    else
        echo -e '🚫 The current directory is not a git repository.';
    fi
}
alias "githelper=natt_utility__githelper";
alias "gith=githelper";