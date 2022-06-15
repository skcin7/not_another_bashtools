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

SYSTEM__GREETNAME="Nick Morgan"

system() {
    if [[ $* == *--info* ]]; then
        divider " System Information ";
        neofetch;
        return 0;
    fi

    divider " System Info ";
    neofetch;
    figlet -w${COLUMNS} "Welcome Back, ${SYSTEM__GREETNAME}!";
    return 0;
}


# shells() {
#     divider " Available Unix Shells ";
#     grep '^[^#]' /etc/shells
# }