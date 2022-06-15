#!/bin/sh
# Not Another Terminal Tools - Utility
#     Utility: Filesystem
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






#
# Create a new directory and change into it.
#
mkcd() {
    divider "Create Directory";
    local DIRECTORY_NAME="${1}";

    if [ "${DIRECTORY_NAME}" == "" ]; then
        read -p "Directory Name?: " DIRECTORY_NAME
    fi

    if [ "${DIRECTORY_NAME}" == "" ]; then
        echo -e "No Directory Name Provided.";
        return 10;
    fi

    mkdir -p "${DIRECTORY_NAME}";
    cd "${DIRECTORY_NAME}";
    echo -e "Created/Changed Into Directory: ${DIRECTORY_NAME}.";
    return 0;
    


   #  # Use first parameter as the directory name if one is provided, or prompt for input.
   #  if [ $# -eq 0 ]; then
   #      read -p "Enter Directory Name: " DIRECTORY_NAME
   #  else
   #      DIRECTORY_NAME=${1}
   #  fi

   #  # If directory name is an empty string, disable directory from being created.
   #  if [ -z "$DIRECTORY_NAME" ]; then
   #      echo "No Directory Provided."
   #      return 1;
   #  fi

   #  mkdir -p "${DIRECTORY_NAME}"
   #  cd "${DIRECTORY_NAME}"
   # echo -e "Created and changed to directory: ${DIRECTORY_NAME}";
   #  # verbosem "Created and changed to directory: ${DIRECTORY_NAME}";
   #  #mkdir -p "$@" && cd "$@";
   #  return 0;
}