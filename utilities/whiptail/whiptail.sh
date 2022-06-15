#!/bin/sh
# Whiptail (Dialog) Messages
#   Info: https://en.wikibooks.org/wiki/Bash_Shell_Scripting/Whiptail
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


WHIPTAIL__ALIAS=dialog;
alias "whiptail=${WHIPTAIL__ALIAS}";



whiptail_message() {
    local MESSAGE_TITLE="${1:-Example Message}"
    local MESSAGE_BODY="${2:-This is an example of a message.}"
    whiptail --title "${MESSAGE_TITLE}" --infobox "${MESSAGE_BODY}" 8 78;
}

whiptail_confirm() {
    local MESSAGE_TITLE="${1:-Confirmation}"
    local MESSAGE_BODY="${2:-Really confirm?}"

    if(whiptail --title "${MESSAGE_TITLE}" --yesno "${MESSAGE_BODY}" 8 78); then
        echo "Happy Tuesday, exit status was $?."
        $(clear);
    else
        echo "Maybe it will be Tuesday tomorrow, exit status was $?."
        # $(clear);
    fi

}



whiptail_ask() {
    local NAME=$(whiptail --inputbox "What is your name?" 8 39 --title "Getting to know you" 3>&1 1>&2 2>&3);
    echo "${NAME}";
}



whiptail_choice() {
    STEP_LIST=(
        'install_fonts' 'Install fonts'
        'setup_ubuntu' 'Update and setup ubuntu'
        'setup_macos' 'Update and setup macOS'
        'setup_pi' 'Update and setup raspberry pi'
        'setup_fedora' 'Update and setup fedora'
        'setup_oh_my_zsh' 'Install oh my ZSH!'
        'setup_git' 'Setup git email and name'
        'setup_node' 'Install node using NVM'
        'setup_rust' 'Install Rust'
        'setup_docker' 'Install docker'
        'setup_flutter' 'Install flutter and its toolchain'
        'setup_miniconda' 'Setup python using miniconda'
        'setup_albert' 'Install albert plugins'
        'setup_fzf' 'Setup FZF'
        'setup_ssh_keys' 'Create and setup ssh keys'
    )

    entry_options=()
    entries_count=${#STEP_LIST[@]}
    message='Choose the steps to run!'

    for i in ${!STEP_LIST[@]}; do
        if [ $((i % 2)) == 0 ]; then
            entry_options+=($(($i / 2)))
            entry_options+=("${STEP_LIST[$(($i + 1))]}")
            entry_options+=('OFF')
        fi
    done

    SELECTED_STEPS_RAW=$(
        whiptail \
            --checklist \
            --separate-output \
            --title 'Setup' \
            "$message" \
            40 50 \
            "$entries_count" -- "${entry_options[@]}" \
            3>&1 1>&2 2>&3
    )

    if [[ ! -z SELECTED_STEPS_RAW ]]; then
        for STEP_FN_ID in ${SELECTED_STEPS_RAW[@]}; do
            FN_NAME_ID=$(($STEP_FN_ID * 2))
            STEP_FN_NAME="${STEP_LIST[$FN_NAME_ID]}"
            echo "---Running ${STEP_FN_NAME}---"
            $STEP_FN_NAME
        done
    fi
}


