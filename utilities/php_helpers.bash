#!/bin/bash
# PHP helper for a bash profile
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

PHP_VERSION=''

# Apple Silicon M1 Chipset
alias php72="/opt/homebrew/opt/php@7.2/bin/php"
alias php73="/opt/homebrew/opt/php@7.3/bin/php"
alias php74="/opt/homebrew/opt/php@7.4/bin/php"
alias php80="/opt/homebrew/opt/php@8.0/bin/php"
alias php81="/opt/homebrew/opt/php@8.1/bin/php"

# Make switching versions easy
# From: https://kevdees.com/macos-11-big-sur-nginx-setup-multiple-php-versions/
function phpv() {
    brew unlink php
    brew link --overwrite --force "php@$1"
    php -v
}
