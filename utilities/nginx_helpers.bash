#!/bin/bash
# NGINX Helpers! is a set of tools to manage NGINX within a bash linux shell.
#      This module adds useful helper utilities and commands
#      to make NGINX servers a lot easier to manage and
#      maintain in a local development environment
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







# Specify the NGINX root directory.
#NGINXDIRECTORY=/opt/homebrew/etc/nginx
NGINXHELPERS__AUTHOR="Nick Morgan";
NGINXHELPERS__CONTACT="nick@nicholas-morgan.com";
NGINXHELPERS__VERBOSE=1
NGINXHELPERS__DEBUGMODE=0 # 1 or 0. Run in debug mode.
NGINXHELPERS__DIRECTORY="/opt/homebrew/etc/nginx";


#declare -A NGINXHELPERS__COMMANDS
#NGINXHELPERS__COMMANDS[${#NGINXHELPERS__COMMANDS[@]}]="usage [ -c COMMAND ]";
#NGINXHELPERS__COMMANDS[${#NGINXHELPERS__COMMANDS[@]}]="addsite [ -n NAME ] [ -u --usage ]";
#NGINXHELPERS__COMMANDS[${#NGINXHELPERS__COMMANDS[@]}]="enablesite [ -n NAME ] [ -u --usage ]";
#NGINXHELPERS__COMMANDS[${#NGINXHELPERS__COMMANDS[@]}]="disablesite [ -n NAME ] [ -u --usage ]";
#NGINXHELPERS__COMMANDS[${#NGINXHELPERS__COMMANDS[@]}]="sites";
#NGINXHELPERS__COMMANDS[${#NGINXHELPERS__COMMANDS[@]}]="quit";
#NGINXHELPERS__COMMANDS[${#NGINXHELPERS__COMMANDS[@]}]="about";
#NGINXHELPERS__COMMANDS[${#NGINXHELPERS__COMMANDS[@]}]="help";

NGINXHELPERS__COMMANDS=(
        "help"
        "addsite"
        "addssl"
        "editsite"
        "reload"
        "restart"
        "servers"
        "d"
        "cd"
        "list"
        "usage"
        "removesite"
        "removessl"
        )


#declare -A NGINXHELPERS__COMMANDS=(
##        "help [ -c COMMAND ]"
#    [usage]="[ -c COMMAND ]"
#    )
#
#declare -A array
#array[foo]=bar
#array[bar]=foo



#declare -A COMMAND_LIST=(
#   [aajob1] = "a set of arguments"
#   [bbjob2] = "another different list"
#   ...
#)
#sorted=($(printf '%s\n' "${!COMMAND_LIST[@]}"| /bin/sort))
#for job in "${sorted[@]}"; do
#   for args in "${job[@]}"; do
#     echo "Do something with ${arg} in ${job}"
#   done
#done


#function nginxhelpers__executecommand__usage() {
#    printf "Usage:\n\t%s\n" "${0} ${OPT_DESC}"
#    exit 10
#}
function nginxhelpers__executecommand__about() {
    divider "About"
#    echo "Author: Nick Morgan <nick@nicholas-morgan.com>"
    figlet "NGINX Helpers!"
    echo "Made By: Nick Morgan"
    echo "Contact: nick@nicholas-morgan.com"
    echo "Version: 1.0.0-alpha"
    echo "";
    return 0;
}

function nginxhelpers__executecommand__addsite() {
    local SITE_NAME;
    read -p "Site Name: " SITE_NAME
    echo "Adding Site..."

    # Retrieve the NGINX server config template and store it locally
    #wget https://gist.githubusercontent.com/kevindees/deb3e2bdef377bbf2ffacbc48dfa7574/raw/1d5dc055fe87319a7f247808c9f9ee14c6abd9cd/nginx-server-template-m1.conf -O /opt/homebrew/etc/nginx/servers/$1.conf
    # wget https://gist.githubusercontent.com/kevindees/deb3e2bdef377bbf2ffacbc48dfa7574/raw/1d5dc055fe87319a7f247808c9f9ee14c6abd9cd/nginx-server-template-m1.conf -O /opt/homebrew/etc/nginx/servers/$1.conf
    wget https://gist.githubusercontent.com/skcin7/5282712d00967972187aab5a6bd610e4/raw/59316ce6554ee25bde1a22da8acd09966fcd95d5/my-nginx-server-config-template.conf -O /opt/homebrew/etc/nginx/servers/$1.conf
    #wget https://gist.githubusercontent.com/skcin7/5282712d00967972187aab5a6bd610e4/raw/59316ce6554ee25bde1a22da8acd09966fcd95d5/my-nginx-server-config-template.conf -O /opt/homebrew/etc/nginx/servers/$1.conf




    # Update the host
    sed -i '' "s:{{host}}:${SITE_NAME}:" "/opt/homebrew/etc/nginx/servers/${SITE_NAME}.conf"

    # Update the server root.
    # If a 2nd input parameter exists, use that as the path instead of the default one.
    if [ "$2" ]; then
        sed  -i '' "s:{{root}}:$2:" "/opt/homebrew/etc/nginx/servers/${SITE_NAME}.conf"
    else
        sed  -i '' "s:{{root}}:$HOME/www/${SITE_NAME}:" "/opt/homebrew/etc/nginx/servers/${SITE_NAME}.conf"
    fi

    # Add the SSL for the new server.
    nginxaddssl ${SITE_NAME}

    # Restart NGINX.
    nginxrestart

    # Open the server configuration for the newly created server.
    # At this point, make any changes to it as necessary, and restart NGINX afterwards.
    code /opt/homebrew/etc/nginx/servers/$1.conf

    echo "Site Added."


    return 0;
}

function nginxhelpers__executecommand__addssl() {
    return 0;
}

function nginxhelpers__executecommand__cd() {
    return 0;
}

function nginxhelpers__executecommand__d() {
    return 0;
}

function nginxhelpers__executecommand__editsite() {
    return 0;
}

function nginxhelpers__executecommand__sites() {
    local FUNCTION_RETURN_CODE=0

#    echo "Sites List:"
    divider "Sites"
#    ll "$NGINXHELPERS__DIRECTORY/servers_available/"
#    search_dir="$NGINXHELPERS__DIRECTORY/servers_available/"
#    for entry in "$search_dir"/*
#    do
#        echo "$entry"
#    done

#    echo "All Sites:"
    ls "$NGINXHELPERS__DIRECTORY/servers_available/" | sed -e 's/\.conf$//'
    echo ""

    echo "Enabled:"
    ls "$NGINXHELPERS__DIRECTORY/servers_enabled/" | sed -e 's/\.conf$//'
    echo ""
    # TODO : Get rid of a separate list for enabled and combine with the all sites list.

    NGINXHELPERS__RETURN_CODE=${FUNCTION_RETURN_CODE}
    return ${FUNCTION_RETURN_CODE};
}

function nginxhelpers__executecommand__reload() {
    return 0;
}

function nginxhelpers__executecommand__removesite() {
    return 0;
}

function nginxhelpers__executecommand__restart() {
    return 0;
}

function nginxhelpers__executecommand__servers() {
    return 0;
}




#function nginxhelpers__quit() {
#    echo "Sayonara."
#    exit 0;
#}



function nginxhelpers__executecommand() {
    local COMMAND_TO_EXECUTE=${1}
    shift 1;
    local COMMAND_INPUT="${@}"

#    if [ $NGINXHELPERS__DEBUGMODE -eq 1 ]; then
#        echo "$\{COMMAND_TO_EXECUTE}: ${COMMAND_TO_EXECUTE}"
#        echo "$\{COMMAND_INPUT}: ${COMMAND_INPUT}"
#    fi

    case $COMMAND_TO_EXECUTE in

        about)
            nginxhelpers__executecommand__about
        ;;

        addsite)
            nginxhelpers__executecommand__addsite "${COMMAND_INPUT}"
        ;;

        sites)
            nginxhelpers__executecommand__sites
        ;;

        *)
            echo "Invalid command."
        ;;
    esac



#    echo ${COMMAND_TO_EXECUTE}
#    echo ${COMMAND_INPUT}




#    until [ expression ]
#    do
#    	code block
#    	...
#    	...
#    done
#
#
#
#    if [ ${#} -eq 0 ]; then
#        read -sp 'What command to execute? ' COMMAND
#    else
#        COMMAND=${1};
#    fi
#
#
#    if [ -z "$COMMAND" ]; then
#        echo "No command was specified."
#        return 10;
#    fi
#
#    echo ${COMMAND}
}



#declare {BPM_COMMAND,BPM_PASSWORD,HOST,TARGET_IP,OVERRIDE_STATUS}=''
#OPTS=`getopt -a --longoptions command:,password:,csc:,ip:,override: -n "$0" -- "$@"`
#eval set -- "$OPTS"
#
#if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi
#
#while true; do
#    echo ""
#    echo $OPTS
#    echo $1
#    echo $2
#
#  case "$1" in
#    --command )
#        BPM_COMMAND=$2
#        shift 2
#        ;;
#    --password )
#        BPM_PASSWORD=$2
#        shift 2
#        ;;
#    --csc )
#        HOST=$2
#        shift 2
#        ;;
#    --ip )
#        TARGET_IP=$2
#        shift 2
#        ;;
#    --override )
#        OVERRIDE_STATUS=$2
#        shift 2
#        ;;
#    --)
#        shift
#        echo "Breaking While loop"
#        break
#        ;;
#    *)
#        echo ""
#        echo "Error in given Parameters. Undefined: "
#        echo $*
#        echo ""
#        echo "Usage: $0 [--command BPM_COMMAND] [--password BPM_PASSWORD] [--ip IP ADDRESS_OF_VyOS/BPM] [--csc CLIENT_SHORT_CODE] [--override TRUE/FALSE]"
#        exit 1
#  esac
#done





# fun: nginxhelpers
# txt: Show the NGINX Helpers menu
function nginxhelpers() {
#    local NGINXHELPERS__AUTHOR="Nick Morgan";
#    local NGINXHELPERS__CONTACT="nick@nicholas-morgan.com";

#    local NGINXHELPERS__DEBUGMODE=1 # 1 or 0. Run in debug mode.

#    local NGINXHELPERS__DIRECTORY="/opt/homebrew/etc/nginx";


#    source $HOME/bash/getopt.bash
#    local USAGE="-u USER -d DATABASE -p PASS -s SID [ -a START_DATE_TIME ]"
#    parse_options "${USAGE}" ${@}
#
#    echo ${USER}
#    echo ${START_DATE_TIME}

    if [ $NGINXHELPERS__DEBUGMODE -eq 1 ]; then
        divider " DEBUG MODE ";
        echo "$\{#}: ${#}"
        echo "$\{@}: ${@}"
#        echo "getopts: ${getopts}"

#        getopts "c:" OPTION
#        echo $OPTION
#        echo $OPTARG

#        getopt "c:" GETOPT_OPTION
#        echo "$\{GETOPT_OPTION}: ${GETOPT_OPTION}"
#        echo "$\{GETOPT_OPTION}: ${GETOPT_OPTION}"
#        echo $OPTARG

#        local OPTIND
#        getopts "n:" COMMAND
##        echo Input: $*, OPTION: $OPTION, OPTARG: $OPTARG
#        echo "INPUT: ${*}"
#        echo "COMMAND: ${COMMAND}"
#        echo "OPTARG: ${OPTARG}"
    fi



    local COMMAND_NAME
    local COMMAND_INPUT

    if [ ${#} -eq 0 ]; then
        figlet -w $(shellwidth) -c "NGINX Helpers!"
        echo "By Nick Morgan <nick@nicholas-morgan.com>"
        echo "";

        printf "Usage:\n\t%s\n" "nginxhelpers [ COMMAND_NAME ] [ ...COMMAND_INPUT ]"
        echo "";


        echo "Examples:";
        printf "\tnginxhelpers list\n"
        printf "\tnginxhelpers addsite\n"
        printf "\tnginxhelpers addsite -n books\n"
        echo "";

        echo "Available Commands:";
        for i in $(echo ${!NGINXHELPERS__COMMANDS[@]}); do
            printf "\t${NGINXHELPERS__COMMANDS[$i]}\n";
        done

#        for i in ${NGINXHELPERS__COMMANDS[@]}; do
#            echo ${command};
##            printf "\t${command}\n"
##            echo "${i}";
##            printf "\t${NGINXHELPERS__COMMANDS[$i]}\n"
#        done
        echo "";

#        local COMMAND_INPUT
#        read -p "What command to execute? " COMMAND_INPUT

        while true
        do
#            local COMMAND_READ_INPUT
#            read -p "What would you like to do? " COMMAND_READ_INPUT

            read -p "What would you like to do? " COMMAND_NAME

#            if [ "${COMMAND_NAME}" == "quit" ]; then
#                nginxhelpers__quit
#            fi

            if [ "$COMMAND_NAME" = "quit" ]; then
#                echo "Sayonara."
                echo "Smell you later."
                return 0;
            fi

            nginxhelpers__executecommand ${COMMAND_NAME}
#            sleep 1
        done


    else
        COMMAND_NAME=${1};

        shift 1
        COMMAND_INPUT="${@}";
    fi


    if [ $NGINXHELPERS__DEBUGMODE -eq 1 ]; then
        echo "Command Name: ${COMMAND_NAME}";
        echo "Command Input: ${COMMAND_INPUT}";
    fi


    nginxhelpers__executecommand ${COMMAND_NAME} ${COMMAND_INPUT}

    return 0;
}

NGINXHELPERS__RETURN_CODE=0
function nginxhelpers__run_tests() {
    echo "Running Tests..."

#    local NGINXHELPERS__RETURN_CODE
#    NGINXHELPERS__RETURN_CODE=nginxhelpers__executecommand__sites
#    NGINXHELPERS__RETURN_CODE=$(nginxhelpers__executecommand__sites)
#    echo "${NGINXHELPERS__RETURN_CODE}"
#    nginxhelpers__executecommand__sites
#    echo "${NGINXHELPERS__RETURN_CODE}"
#    echo $?



    res=$(nginxhelpers__executecommand__sites)
    echo $?

    res="$(nginxhelpers__executecommand) sites"
    echo $?


    res="$(nginxhelpers__executecommand) about"
    echo $?


}