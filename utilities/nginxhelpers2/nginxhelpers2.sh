#!/bin/sh
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



function nginxhelpers2__usage() {
    $(echo "Usage: $0 [-s <45|90>] [-p <string>]" 1>&2; exit 1;);
}


#
# From: https://stackoverflow.com/a/16496491
# Usage: nginxhelpers2
# Usage: nginxhelpers2 -h
# Usage: nginxhelpers2 -s "" -p ""
# Usage: nginxhelpers2 -s 10 -p foo
# Usage: nginxhelpers2 -s 45 -p foo
# Usage: nginxhelpers2 -s 90 -p bar
#
function nginxhelpers2() {
    while getopts ":s:p:" o; do
        case "${o}" in
            s)
                s=${OPTARG}
                ((s == 45 || s == 90)) || nginxhelpers2__usage
                ;;
            p)
                p=${OPTARG}
                ;;
            *)
                nginxhelpers2__usage
                ;;
        esac
    done
    shift $((OPTIND-1))

    if [ -z "${s}" ] || [ -z "${p}" ]; then
        nginxhelpers2__usage
        return 1;
    fi

    echo "s = ${s}"
    echo "p = ${p}"
}

alias "nginxh2=nginxhelpers2";



# usage() { echo "Usage: $0 [-s <45|90>] [-p <string>]" 1>&2; exit 1; }

# while getopts ":s:p:" o; do
#     case "${o}" in
#         s)
#             s=${OPTARG}
#             ((s == 45 || s == 90)) || usage
#             ;;
#         p)
#             p=${OPTARG}
#             ;;
#         *)
#             usage
#             ;;
#     esac
# done
# shift $((OPTIND-1))

# # if [ -z "${s}" ] || [ -z "${p}" ]; then
# #     usage
# # fi

# echo "s = ${s}"
# echo "p = ${p}"