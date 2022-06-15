#!/usr/bin/env bash
# Not Another Terminal Tools
#     Tests
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





shopt -s expand_aliases
source "${HOME}/.not_another_terminal_tools/utilities/functions/functions.sh";



ALL_UTIL_TESTS_PASS=true;


#
# Testing Utility: Functions
#

echo "Utility: Functions - Running Tests...";
# This way DOES output command output in the terminal:
if ${HOME}/.not_another_terminal_tools/utilities/functions/tests.sh | awk '{ print "\t" $0 }'; then
	echo -e '✅ Utility: Functions - Passed!';
else
	echo -e '🚫 Utility: Functions - Did Not Pass.';
	ALL_UTIL_TESTS_PASS=false;
fi



if ${ALL_UTIL_TESTS_PASS}; then
    echo -e "\n✅ All Tests Passed!";
    exit 0;
else
    echo -e "\n🚫 Not All Tests Passed.";
    exit 10;
fi