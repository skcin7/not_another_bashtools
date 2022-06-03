#!/bin/bash

echo "";
GIT_TAG_VERSION=$(git describe --tags --abbrev=0)
read -p "Rebuild \`${GIT_TAG_VERSION}.tar.gz\`? (Y/N): " TO_REBUILD_DISTRIBUTION

if [ ${TO_REBUILD_DISTRIBUTION} == "Y" ] | [ ${TO_REBUILD_DISTRIBUTION} == "y" ]; then
	./build.sh
    echo "Rebuild complete!";
else
	echo "Did not rebuild.";
fi
echo "";

# git_add_commit.sh

read -p "Enter Custom Git Commit Message: " CUSTOM_GIT_COMMIT_MESSAGE

# Check if a git commit message was entered, and exit with errors if one wasn't.
if [[ -z "${CUSTOM_GIT_COMMIT_MESSAGE}" ]]; then
   echo "No git commit message was specified.";
   exit 1
fi

git add -A .
git commit -m "${CUSTOM_GIT_COMMIT_MESSAGE}";
git push

echo -e "Git Commands Executed! \n\t \`git add -A .\` \n\t \`git commit -m \"${CUSTOM_GIT_COMMIT_MESSAGE}\"\` \n\t \`git push\`    ";