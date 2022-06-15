#!/bin/sh
# Not Another Terminal Tools - Utility
#     Utility: DNS
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


local_ip() {
    ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1';

    # ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}';
}

#
# Reveal nameservers for a domain.
#
nameservers() {
    divider "Nameservers"

    local DOMAIN_NAME=${1};

    if [ "${DOMAIN_NAME}" == "" ]; then
        read -p "Domain Name?: " DOMAIN_NAME
    fi

    if [ "${DOMAIN_NAME}" == "" ]; then
        echo -e "No Domain Name Provided.";
        return 10;
    fi

    dig +short ns "${DOMAIN_NAME}"
    return 0;
}



# echo "I ${RED}love${NC} ${GREEN}Stack Overflow${NC}"

#
# Flush the DNS cache on the current machine.
#
dns_cache_flush() {
    # divider "DNS Cache Flush"

    local GREEN=$'\e[0;32m'
    local RED=$'\e[0;31m'
    local NC=$'\e[0m'

    if(dialog --title "Confirm DNS Cache Flush" --yesno "This will flush the DNS cache on the current machine. Continue?" 8 78); then

        sudo -S dscacheutil -flushcache;
        sudo -S killall -HUP mDNSResponder;

        # local SUDO_PASSWORD=$(dialog --inputbox "Sudo password?" 8 39 --title "Sudo Password" 3>&1 1>&2 2>&3);

        # echo ${SUDO_PASSWORD} | sudo -S dscacheutil -flushcache;
        # echo ${SUDO_PASSWORD} | sudo -S killall -HUP mDNSResponder;
        $(clear);
        # echo -e "${GREEN}✅ The DNS cache has successfully been flushed!${NC}"
        echo -e "$(green)✅ The DNS cache has successfully been flushed!$(no_color)";
        # echo -e "The DNS cache has successfully been flushed!";
    else
        $(clear);
        # echo -e "The DNS cache was NOT flushed."
        echo -e "$(red)🚫 The DNS cache was NOT flushed.$(no_color)";
        return 10;
    fi

    return 0;
}