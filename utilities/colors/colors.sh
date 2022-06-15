#!/bin/sh
# Not Another Terminal Tools - Utility
#     Utility: Colors
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


GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
NO_COLOR=$'\e[0m'



green() {
    echo ${GREEN};
}

red() {
    echo ${RED};
}

no_color() {
    echo ${NO_COLOR};
}



colors1() {
    echo -e "$(green)✅ This is green!$(no_color)"
    echo -e "$(red)🚫 This is red!$(no_color)"
}

#
# From: https://askubuntu.com/a/985386
#
colors2() {
    echo -e '\e[1mbold\e[22m'
    echo -e '\e[2mdim\e[22m'
    echo -e '\e[3mitalic\e[23m'
    echo -e '\e[4munderline\e[24m'
    echo -e '\e[4:1mthis is also underline (new in 0.52)\e[4:0m'
    echo -e '\e[21mdouble underline (new in 0.52)\e[24m'
    echo -e '\e[4:2mthis is also double underline (new in 0.52)\e[4:0m'
    echo -e '\e[4:3mcurly underline (new in 0.52)\e[4:0m'
    echo -e '\e[5mblink (new in 0.52)\e[25m'
    echo -e '\e[7mreverse\e[27m'
    echo -e '\e[8minvisible\e[28m <- invisible (but copy-pasteable)'
    echo -e '\e[9mstrikethrough\e[29m'
    echo -e '\e[53moverline (new in 0.52)\e[55m'

    echo -e '\e[31mred\e[39m'
    echo -e '\e[91mbright red\e[39m'
    echo -e '\e[38:5:42m256-color, de jure standard (ITU-T T.416)\e[39m'
    echo -e '\e[38;5;42m256-color, de facto standard (commonly used)\e[39m'
    echo -e '\e[38:2::240:143:104mtruecolor, de jure standard (ITU-T T.416) (new in 0.52)\e[39m'
    echo -e '\e[38:2:240:143:104mtruecolor, rarely used incorrect format (might be removed at some point)\e[39m'
    echo -e '\e[38;2;240;143;104mtruecolor, de facto standard (commonly used)\e[39m'

    echo -e '\e[46mcyan background\e[49m'
    echo -e '\e[106mbright cyan background\e[49m'
    echo -e '\e[48:5:42m256-color background, de jure standard (ITU-T T.416)\e[49m'
    echo -e '\e[48;5;42m256-color background, de facto standard (commonly used)\e[49m'
    echo -e '\e[48:2::240:143:104mtruecolor background, de jure standard (ITU-T T.416) (new in 0.52)\e[49m'
    echo -e '\e[48:2:240:143:104mtruecolor background, rarely used incorrect format (might be removed at some point)\e[49m'
    echo -e '\e[48;2;240;143;104mtruecolor background, de facto standard (commonly used)\e[49m'

    echo -e '\e[21m\e[58:5:42m256-color underline (new in 0.52)\e[59m\e[24m'
    echo -e '\e[21m\e[58;5;42m256-color underline (new in 0.52)\e[59m\e[24m'
    echo -e '\e[4:3m\e[58:2::240:143:104mtruecolor underline (new in 0.52) (*)\e[59m\e[4:0m'
    echo -e '\e[4:3m\e[58:2:240:143:104mtruecolor underline (new in 0.52) (might be removed at some point) (*)\e[59m\e[4:0m'
    echo -e '\e[4:3m\e[58;2;240;143;104mtruecolor underline (new in 0.52) (*)\e[59m\e[4:0m'

    echo -e '\e]8;;http://askubuntu.com\e\\hyperlink\e]8;;\e\\'
}





ansi()          { echo -e "\e[${1}m${*:2}\e[0m"; }
bold()          { ansi 1 "$@"; }
italic()        { ansi 3 "$@"; }
underline()     { ansi 4 "$@"; }
strikethrough() { ansi 9 "$@"; }
red()           { ansi 31 "$@"; }

colors3() {
    echo -e "\e[1mbold\e[0m"
    echo -e "\e[3mitalic\e[0m"
    echo -e "\e[3m\e[1mbold italic\e[0m"
    echo -e "\e[4munderline\e[0m"
    echo -e "\e[9mstrikethrough\e[0m"
    echo -e "\e[31mHello World\e[0m"
    echo -e "\x1B[31mHello World\e[0m"
}