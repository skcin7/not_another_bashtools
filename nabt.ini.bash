#!/bin/bash
# Not Another BashTools!
# A set of tools and utilities to be used within a bash shell.
#
# About nabt.ini.bash
# #####################################
# Not Another BashTools! initialization file, is responsible for
# configuring many of the aspects of YABT's behavior.
#
# This initialization is sourced in the bootstrapper, and any
# variables within this initialization will over-ride the
# default ones in the bootstrapper.
#

#
# Name to greet the user as when they log in.
# Leave blank to be greeted by a generic message.
#
NATT__GREETNAME="Nick Morgan"

#
# Automatically run bootstrapper in a new bash session.
#
NATT__AUTOBOOTSTRAP=1

#
# Whether to show messages verbosely.
#
NATT__VERBOSE=1

#
# Program for editing code. This should be a text editor, such as 'vi', 'nano', or whatever your preferred editor is for code.
#
NATT__CODE_COMMAND=subl

# #
# # List of utilities to be included in the bootstrapper.
# #
NATT__UTILITIES=(
    "nginxhelper"
    # "parse_git_branch"
    # "phphelper"
    "utils"
    "whiptail"
    "shell"
    "system"
)