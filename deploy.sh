#!/bin/bash

echo "Starting Deployment...";
CURRENT_GIT_BRANCH=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD);
echo "The Current Git Branch Is: \`${CURRENT_GIT_BRANCH}\`";
echo "";

# GIT_TAG_VERSION=$(git describe --tags --abbrev=0)
# read -p "Rebuild \`./dist/${GIT_TAG_VERSION}.tar.gz\`? (Y/N): " TO_REBUILD_DISTRIBUTION

# if [ "${TO_REBUILD_DISTRIBUTION}" == "Y" ] || [ "${TO_REBUILD_DISTRIBUTION}" == "y" ]; then
# 	echo "Rebuilding \`./dist/${GIT_TAG_VERSION}\`...";
# 	./build.sh
#     echo "\`./dist/${GIT_TAG_VERSION}\` Rebuilt!";
# else
# 	echo "Did Not Rebuild.";
# fi
# echo "";



read -p "Rebuild \`./dist/${GIT_TAG_VERSION}.tar.gz\`? (Y/N) (Y): " TO_RUN_REBUILD
if [ "${TO_RUN_REBUILD}" == "" ] || [ "${TO_RUN_REBUILD}" == "Y" ] || [ "${TO_RUN_REBUILD}" == "y" ]; then
	# git add -A .
	# echo -e "Git Command Executed!: \t \`git add -A .\` ";
	# echo "";
	echo -e "✅ Rebuilding";
	TO_RUN_REBUILD="Y"
else
	TO_RUN_REBUILD="N"
fi
echo "";



read -p "Run \`git add -A .\`? (Y/N) (Y): " TO_RUN_GIT_ADD
if [ "${TO_RUN_GIT_ADD}" == "" ] || [ "${TO_RUN_GIT_ADD}" == "Y" ] || [ "${TO_RUN_GIT_ADD}" == "y" ]; then
	# git add -A .
	# echo -e "Git Command Executed!: \t \`git add -A .\` ";
	# echo "";
	echo -e "✅ Including Git Add";
	TO_RUN_GIT_ADD="Y"
else
	TO_RUN_GIT_ADD="N"
fi
echo "";


read -p "Run \`git commit -m <message>\`? (Y/N) (Y): " TO_RUN_GIT_COMMIT
if [ "${TO_RUN_GIT_COMMIT}" == "" ] || [ "${TO_RUN_GIT_COMMIT}" == "Y" ] || [ "${TO_RUN_GIT_COMMIT}" == "y" ]; then

	DEFAULT_GIT_COMMIT_MESSAGE="Deploying to \`${CURRENT_GIT_BRANCH}\` on `date`."

	read -p "Enter Git Commit Message (\"${DEFAULT_GIT_COMMIT_MESSAGE}\"): " GIT_COMMIT_MESSAGE
	# Check if a git commit message wasn't entered, and use a default one if so.
	if [[ -z "${GIT_COMMIT_MESSAGE}" ]]; then
	   GIT_COMMIT_MESSAGE="${DEFAULT_GIT_COMMIT_MESSAGE}";
	fi

	# git commit -m "${GIT_COMMIT_MESSAGE}";
	# echo -e "Git Command Executed!: \t \`git commit -m \"${GIT_COMMIT_MESSAGE}\"\` ";
	# echo "";
	echo -e "✅ Including Git Commit \n\t Message: ${GIT_COMMIT_MESSAGE}";
	TO_RUN_GIT_COMMIT="Y"
else
	TO_RUN_GIT_COMMIT="N"
fi
echo "";




read -p "Run \`git push\`? (Y/N) (Y): " TO_RUN_GIT_PUSH
if [ "${TO_RUN_GIT_PUSH}" == "" ] || [ "${TO_RUN_GIT_PUSH}" == "Y" ] || [ "${TO_RUN_GIT_PUSH}" == "y" ]; then
	# git push
	# echo -e "Git Command Executed!: \t \`git push\` ";
	# echo "";
	echo -e "✅ Including Git Push";
	TO_RUN_GIT_PUSH="Y"
else
	TO_RUN_GIT_PUSH="N"
fi
echo "";











#
# First confirm the deployment with the user (ask for input).
#
echo -e "ℹ️  Deployment Summary: \n\t Rebuilt: ${TO_RUN_REBUILD} \n\t Git Add: ${TO_RUN_GIT_ADD} \n\t Git Commit: ${TO_RUN_GIT_COMMIT} \n\t Git Push: ${TO_RUN_GIT_PUSH}":
echo "";
read -p "⚠️  Confirm Deployment? (Y/N) (N): " THE_DEPLOYMENT_IS_CONFIRMED
if [ "${THE_DEPLOYMENT_IS_CONFIRMED}" == "Y" ] || [ "${THE_DEPLOYMENT_IS_CONFIRMED}" == "y" ]; then
	THE_DEPLOYMENT_IS_CONFIRMED="Y"
else
	THE_DEPLOYMENT_IS_CONFIRMED="N"
fi




#
# Finally, actually deploy or cancel.
#
if [ "${THE_DEPLOYMENT_IS_CONFIRMED}" == "Y" ]; then

	if [ "${TO_RUN_REBUILD}" == "Y" ]; then
		echo "Rebuilding \`./dist/${GIT_TAG_VERSION}\`...";
		./build.sh
		echo "\`./dist/${GIT_TAG_VERSION}\` Rebuilt!";
	fi

	if [ "${TO_RUN_GIT_ADD}" == "Y" ]; then
		git add -A .
		echo -e "Git Command Executed!: \t \`git add -A .\` ";
		echo "";
	fi

	if [ "${TO_RUN_GIT_COMMIT}" == "Y" ]; then
		git commit -m "${GIT_COMMIT_MESSAGE}";
		echo -e "Git Command Executed!: \t \`git commit -m \"${GIT_COMMIT_MESSAGE}\"\` ";
		echo "";
	fi

	if [ "${TO_RUN_GIT_PUSH}" == "Y" ]; then
		git push
		echo -e "Git Command Executed!: \t \`git push\` ";
		echo "";
	fi

	echo "✅ Deployment Succeeded!";
	echo -e "ℹ️  Summary: \n\t Rebuilt: ${TO_RUN_REBUILD} \n\t Git Add: ${TO_RUN_GIT_ADD} \n\t Git Commit: ${TO_RUN_GIT_COMMIT} \n\t Git Push: ${TO_RUN_GIT_PUSH}":
	echo "";
	exit 0;

else
	echo "🚫 Deployment Canceled!";
	echo "";
	exit 1;
fi






# echo "${GIT_COMMIT_MESSAGE}"
# exit 1;


