#!/bin/bash

# This way DOES output command output in the terminal:
if ./tests.sh; then
	echo -e '✅ Tests Passed! Building...';
else
	echo -e '🚫 Not All Tests Passed. Can Not Build.';
	exit 10;
fi

# NABT__VERSION=0.0.1-alpha
NABT__VERSION=$(git describe --tags --abbrev=0)
# echo "${NABT__VERSION}";
tar -czvf "./dist/${NABT__VERSION}.tar.gz" ./bin ./sh ./utilities ./nabt.bootstrapper.bash ./nabt.ini.bash ./README.md


echo -e "✅ Successfully Built File: ./dist/${NABT__VERSION}.tar.gz!";
exit 0;