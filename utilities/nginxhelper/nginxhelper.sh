#!/bin/sh
# NGINX Helper! is a set of tools to manage NGINX within a bash linux shell.
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
NGINXHELPER__AUTHOR="Nick Morgan";
NGINXHELPER__CONTACT="nick@nicholas-morgan.com";
NGINXHELPER__VERBOSE=1
NGINXHELPER__DEBUGMODE=0 # 1 or 0. Run in debug mode.
NGINXHELPER__DIRECTORY="/opt/homebrew/etc/nginx";

#
# Text editor used to open/edit server conf files.
#
NGINXHELPER__EDITOR=subl;


#declare -A NGINXHELPER__COMMANDS
#NGINXHELPER__COMMANDS[${#NGINXHELPER__COMMANDS[@]}]="usage [ -c COMMAND ]";
#NGINXHELPER__COMMANDS[${#NGINXHELPER__COMMANDS[@]}]="addsite [ -n NAME ] [ -u --usage ]";
#NGINXHELPER__COMMANDS[${#NGINXHELPER__COMMANDS[@]}]="enablesite [ -n NAME ] [ -u --usage ]";
#NGINXHELPER__COMMANDS[${#NGINXHELPER__COMMANDS[@]}]="disablesite [ -n NAME ] [ -u --usage ]";
#NGINXHELPER__COMMANDS[${#NGINXHELPER__COMMANDS[@]}]="sites";
#NGINXHELPER__COMMANDS[${#NGINXHELPER__COMMANDS[@]}]="quit";
#NGINXHELPER__COMMANDS[${#NGINXHELPER__COMMANDS[@]}]="about";
#NGINXHELPER__COMMANDS[${#NGINXHELPER__COMMANDS[@]}]="help";

NGINXHELPER__COMMANDS=(
    "H | help"
    "addserver"
    "addssl"
    
    # "d"
    # "cd"
    "L | list | servers | sites"
    "usage"
    "removesite"
    "removessl"
    "C | conf"
    "reload"
    "restart"
);


#declare -A NGINXHELPER__COMMANDS=(
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


#function nginxhelper__command__usage() {
#    printf "Usage:\n\t%s\n" "${0} ${OPT_DESC}"
#    exit 10
#}
function nginxhelper__command__about() {
    figlet "NGINX Helper!";
    echo "By ${NGINXHELPER__AUTHOR} <${NGINXHELPER__CONTACT}>"

    # divider "About"
    # figlet "NGINX Helper!"
    # echo "Made By: Nick Morgan"
    # echo "Contact: nick@nicholas-morgan.com"
    # echo "Version: 1.0.0-alpha"
    # echo "";
    return 0;
}

function nginxhelper__command__addsite() {
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
    nginxhelper__command__addssl ${SITE_NAME}

    # Restart NGINX.
    nginxhelper__command__restart

    # Open the server configuration for the newly created server.
    # At this point, make any changes to it as necessary, and restart NGINX afterwards.
    code /opt/homebrew/etc/nginx/servers/$1.conf

    echo "Site Added."


    return 0;
}

function nginxhelper__command__addssl() {
    return 0;
}

function nginxhelper__command__conf() {

    



    local CONF_TO_EDIT=${1};

    echo "${CONF_TO_EDIT}";

    if [ "${CONF_TO_EDIT}" == "" ]; then
        read -p "Server To Edit?: " CONF_TO_EDIT
    fi

    # if [ ${CONF_TO_EDIT} == "" ]; then
    #     read -p "Server To Edit?: " CONF_TO_EDIT
    #     echo "";
    # else


    # code "/opt/homebrew/etc/nginx/servers/${1}.conf";
    # $(${NGINXHELPER__EDITOR} "/opt/homebrew/etc/nginx/servers/${1}.conf";);
    ${NGINXHELPER__EDITOR} "/opt/homebrew/etc/nginx/servers/${CONF_TO_EDIT}.conf";
    return 0;
}

function nginxhelper__command__cd() {
    return 0;
}

function nginxhelper__command__d() {
    return 0;
}

function nginxhelper__command__list() {
    local FUNCTION_RETURN_CODE=0

#    echo "Sites List:"
    divider "Sites"
#    ll "$NGINXHELPER__DIRECTORY/servers_available/"
#    search_dir="$NGINXHELPER__DIRECTORY/servers_available/"
#    for entry in "$search_dir"/*
#    do
#        echo "$entry"
#    done

#    echo "All Sites:"
    ls "$NGINXHELPER__DIRECTORY/servers_available/" | sed -e 's/\.conf$//'
    echo ""

    echo "Enabled:"
    ls "$NGINXHELPER__DIRECTORY/servers_enabled/" | sed -e 's/\.conf$//'
    echo ""
    # TODO : Get rid of a separate list for enabled and combine with the all sites list.

    NGINXHELPER__RETURN_CODE=${FUNCTION_RETURN_CODE}
    return ${FUNCTION_RETURN_CODE};
}

function nginxhelper__command__removesite() {
    return 0;
}

function nginxhelper__command__restart() {
    sudo brew services restart nginx
    return 0;
}

function nginxhelper__command__reload() {
    sudo brew services reload nginx
    return 0;
}

function nginxhelper__command__servers() {
    return 0;
}




#function nginxhelper__quit() {
#    echo "Sayonara."
#    exit 0;
#}



function nginxhelper__executecommand() {
    local COMMAND_TO_EXECUTE_KEY=${1}
    local COMMAND_TO_EXECUTE_NAME=""
    shift 1;
    local COMMAND_INPUT="${@}"

#    if [ $NGINXHELPER__DEBUGMODE -eq 1 ]; then
#        echo "$\{COMMAND_TO_EXECUTE}: ${COMMAND_TO_EXECUTE}"
#        echo "$\{COMMAND_INPUT}: ${COMMAND_INPUT}"
#    fi

    case "${COMMAND_TO_EXECUTE_KEY}" in

        about)
            # divider " About ";
            COMMAND_TO_EXECUTE_NAME='about';
        ;;

        addserver)
            # divider " Add A Server ";
            COMMAND_TO_EXECUTE_NAME='addsite';
        ;;

        conf)
            # divider " Edit Server Configuration ";
            COMMAND_TO_EXECUTE_NAME='conf';
        ;;

        L | list | servers | sites)
            COMMAND_TO_EXECUTE_NAME='list';
        ;;

        reload)
            COMMAND_TO_EXECUTE_NAME='reload';
        ;;

        restart)
            COMMAND_TO_EXECUTE_NAME='restart';
        ;;

        *)
            echo "🚫 Unrecognized Command.";
            echo "";
            return;
        ;;
    esac


    if [ "${COMMAND_TO_EXECUTE_NAME}" == "about" ]; then
        nginxhelper__command__about;
    fi

    if [ "${COMMAND_TO_EXECUTE_NAME}" == "addsite" ]; then
        nginxhelper__command__addsite "${COMMAND_INPUT}"
    fi

    if [ "${COMMAND_TO_EXECUTE_NAME}" == "conf" ]; then
        nginxhelper__command__conf "${COMMAND_INPUT}"
    fi

    if [ "${COMMAND_TO_EXECUTE_NAME}" == "list" ]; then
        nginxhelper__command__list;
    fi

    if [ "${COMMAND_TO_EXECUTE_NAME}" == "reload" ]; then
        nginxhelper__command__reload;
    fi

    if [ "${COMMAND_TO_EXECUTE_NAME}" == "restart" ]; then
        nginxhelper__command__restart;
    fi

    echo "✅ Action Completed Successfully.";
    echo "";



#    echo ${COMMAND_TO_EXECUTE}
#    echo ${COMMAND_INPUT}




#    until [ expression ]
#    do
#       code block
#       ...
#       ...
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



nginxhelper__print_available_commands() {
    divider " Available Actions ";
    for i in $(echo ${!NGINXHELPER__COMMANDS[@]}); do
        printf "\t${NGINXHELPER__COMMANDS[$i]}\n";
    done
}





# fun: nginxhelper
# txt: Show the NGINX Helpers menu
function nginxhelper() {
    nginxhelper__command__about;


#    local NGINXHELPER__AUTHOR="Nick Morgan";
#    local NGINXHELPER__CONTACT="nick@nicholas-morgan.com";

#    local NGINXHELPER__DEBUGMODE=1 # 1 or 0. Run in debug mode.

#    local NGINXHELPER__DIRECTORY="/opt/homebrew/etc/nginx";


#    source $HOME/bash/getopt.bash
#    local USAGE="-u USER -d DATABASE -p PASS -s SID [ -a START_DATE_TIME ]"
#    parse_options "${USAGE}" ${@}
#
#    echo ${USER}
#    echo ${START_DATE_TIME}

    if [ $NGINXHELPER__DEBUGMODE -eq 1 ]; then
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

    #
    # If no command name/input arguments were passed, then enter into an infinite loop which asks for commands and executes them until the user quits.
    # Otherwise, just process the specific command/input from the input arguments.
    #
    if [ ${#} -eq 0 ]; then
        # figlet -w $(shellwidth) -c "NGINX Helper!"
        # echo "By Nick Morgan <nick@nicholas-morgan.com>"
        # echo "";

        # printf "Usage:\n\t%s\n" "nginxhelper [ COMMAND_NAME ] [ ...COMMAND_INPUT ]"
        # echo "";


        # echo "Examples:";
        # printf "\tnginxhelper list\n"
        # printf "\tnginxhelper addsite\n"
        # printf "\tnginxhelper addsite -n books\n"
        # echo "";

        # echo "Available Commands:";
        # for i in $(echo ${!NGINXHELPER__COMMANDS[@]}); do
        #     printf "\t${NGINXHELPER__COMMANDS[$i]}\n";
        # done

#        for i in ${NGINXHELPER__COMMANDS[@]}; do
#            echo ${command};
##            printf "\t${command}\n"
##            echo "${i}";
##            printf "\t${NGINXHELPER__COMMANDS[$i]}\n"
#        done
        echo "";

        nginxhelper__print_available_commands;

#        local COMMAND_INPUT
#        read -p "What command to execute? " COMMAND_INPUT

        while true
        do
#            local COMMAND_READ_INPUT
#            read -p "What would you like to do? " COMMAND_READ_INPUT

            

            read -p "Your Action?: " COMMAND_NAME

#            if [ "${COMMAND_NAME}" == "quit" ]; then
#                nginxhelper__quit
#            fi

            # if [ "${COMMAND_NAME}" == "Q" ] || [ "${COMMAND_NAME}" == "quit" ] || [ "${COMMAND_NAME}" == "exit" ]; then
            #     # echo "Sayonara."
            #     echo "See you later."
            #     exit 0;
            # fi

            if [ "${COMMAND_NAME}" == "Q" ] | [ "$COMMAND_NAME" = "quit" ] | [ "$COMMAND_NAME" = "exit" ]; then
                echo "See you later."
                # return 0;
                break 2;
            fi

            nginxhelper__executecommand ${COMMAND_NAME}
            
        done
    else
        COMMAND_NAME=${1};
        shift 1
        COMMAND_INPUT="${@}";

        nginxhelper__executecommand ${COMMAND_NAME} ${COMMAND_INPUT}
    fi


    


    # if [ $NGINXHELPER__DEBUGMODE -eq 1 ]; then
    #     echo "Command Name: ${COMMAND_NAME}";
    #     echo "Command Input: ${COMMAND_INPUT}";
    # fi

    return 0;
}

NGINXHELPER__RETURN_CODE=0
function nginxhelper__run_tests() {
    echo "Running Tests..."

#    local NGINXHELPER__RETURN_CODE
#    NGINXHELPER__RETURN_CODE=nginxhelper__command__list
#    NGINXHELPER__RETURN_CODE=$(nginxhelper__command__list)
#    echo "${NGINXHELPER__RETURN_CODE}"
#    nginxhelper__command__list
#    echo "${NGINXHELPER__RETURN_CODE}"
#    echo $?



    res=$(nginxhelper__command__list)
    echo $?

    res="$(nginxhelper__executecommand) sites"
    echo $?


    res="$(nginxhelper__executecommand) about"
    echo $?


}
alias "nginxh=nginxhelper";