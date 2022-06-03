#!/bin/bash

#NABT__VERSION=0.0.1-alpha
NABT__VERSION=$(git describe --tags --abbrev=0)
# echo "${NABT__VERSION}";
tar -czvf "./dist/${NABT__VERSION}.tar.gz" ./bin ./sh ./utilities ./nabt.bootstrapper.bash ./nabt.ini.bash ./README.md