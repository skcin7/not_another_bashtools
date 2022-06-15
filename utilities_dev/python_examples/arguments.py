#!/usr/bin/env python3
# Not Another Terminal Tools
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


import argparse

msg = "Adding description"

# Initialize parser
parser = argparse.ArgumentParser(description = msg)
 
# Adding optional argument
parser.add_argument("-o", "--output", help = "Show output")
 
# Read arguments from command line
args = parser.parse_args()

print(args);
 
if args.output:
    print("Displaying output as: % s" % args.output)