#!/bin/bash

echo "Starting Deployment...";
CURRENT_GIT_BRANCH=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD);
echo "The Current Git Branch Is: \`${CURRENT_GIT_BRANCH}\`";
echo "";







DEPLOYMENT_AUTOGO_ENABLED=false
TO_RUN_REBUILD=
TO_RUN_GIT_ADD=
TO_RUN_GIT_COMMIT=
GIT_COMMIT_MESSAGE=
TO_RUN_GIT_PUSH=




# Special flag to check for to "automatically go" (process) the deployment with pre-configured settings.
if [[ $* == *--all* ]]; then
    echo -e "Auto-Go Mode Enabled.";
    DEPLOYMENT_AUTOGO_ENABLED=true
fi



if [ "${DEPLOYMENT_AUTOGO_ENABLED}" = true ]; then
    echo -e "✅ Rebuilding Distribution File";
    TO_RUN_REBUILD="Y"
else
    read -p "Rebuild Distribution File? (Y/N) (Y): " TO_RUN_REBUILD
    if [ "${TO_RUN_REBUILD}" == "" ] || [ "${TO_RUN_REBUILD}" == "Y" ] || [ "${TO_RUN_REBUILD}" == "y" ]; then
    	# git add -A .
    	# echo -e "Git Command Executed!: \t \`git add -A .\` ";
    	# echo "";
    	echo -e "✅ Rebuilding Distribution File";
    	TO_RUN_REBUILD="Y"
    else
    	TO_RUN_REBUILD="N"
    fi
fi
echo "";




if [ "${DEPLOYMENT_AUTOGO_ENABLED}" = true ]; then
    echo -e "✅ Including Git Add";
    TO_RUN_GIT_ADD="Y"
else
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
fi
echo "";



DEFAULT_GIT_COMMIT_MESSAGE="Deploying to \`${CURRENT_GIT_BRANCH}\` on `date`."
if [ "${DEPLOYMENT_AUTOGO_ENABLED}" = true ]; then
    TO_RUN_GIT_COMMIT="Y"
    GIT_COMMIT_MESSAGE="${DEFAULT_GIT_COMMIT_MESSAGE}"

    echo -e "✅ Including Git Commit \n\t Message: ${GIT_COMMIT_MESSAGE}";
else
    read -p "Run \`git commit -m <message>\`? (Y/N) (Y): " TO_RUN_GIT_COMMIT
    if [ "${TO_RUN_GIT_COMMIT}" == "" ] || [ "${TO_RUN_GIT_COMMIT}" == "Y" ] || [ "${TO_RUN_GIT_COMMIT}" == "y" ]; then

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
fi
echo "";




if [ "${DEPLOYMENT_AUTOGO_ENABLED}" = true ]; then
    echo -e "✅ Including Git Push";
    TO_RUN_GIT_PUSH="Y"
else
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
fi
echo "";








if [ "${TO_RUN_REBUILD}" == "N" ] && [ "${TO_RUN_GIT_ADD}" == "N" ] && [ "${TO_RUN_GIT_COMMIT}" == "N" ] && [ "${TO_RUN_GIT_PUSH}" == "N" ]; then
	echo "🚫 Nothing To Do!";
	echo "";
	exit 11;
fi



THE_DEPLOYMENT_IS_CONFIRMED="N"

if [ "${DEPLOYMENT_AUTOGO_ENABLED}" = false ]; then
    echo "";
    echo -e "⚠️  Confirm This Deployment (Y/N) (N): \n\t Rebuild Distribution File?: ${TO_RUN_REBUILD} \n\t Git Add?: ${TO_RUN_GIT_ADD} \n\t Git Commit?: ${TO_RUN_GIT_COMMIT} \n\t Git Push?: ${TO_RUN_GIT_PUSH}";
    read -p "" THE_DEPLOYMENT_IS_CONFIRMED
    # read -p "Looks Good? (Y/N) (N): " THE_DEPLOYMENT_IS_CONFIRMED
    if [ "${THE_DEPLOYMENT_IS_CONFIRMED}" == "Y" ] || [ "${THE_DEPLOYMENT_IS_CONFIRMED}" == "y" ]; then
    	THE_DEPLOYMENT_IS_CONFIRMED="Y"
    else
    	THE_DEPLOYMENT_IS_CONFIRMED="N"
    fi
    echo "";
else
    THE_DEPLOYMENT_IS_CONFIRMED="Y"
fi















#
# Cancel if it's not confirmed.
#
if [ "${THE_DEPLOYMENT_IS_CONFIRMED}" == "N" ]; then
    echo "🚫 Deployment Canceled!";
	echo "";
	exit 10;
fi




#Finally, actually run the deployment.
echo "Running The Deployment...";


if [ "${TO_RUN_REBUILD}" == "Y" ]; then

    if ./build.sh; then
		echo -e "Rebuilt Distribution File!";
	else
		echo -e '🚫 Could Not Rebuild Distribution. Tests Failed. Canceling Deployment.';
		exit 10;
	fi

    echo "";
fi

if [ "${TO_RUN_GIT_ADD}" == "Y" ]; then
    git add -A .
    echo -e "Git Command Completed!: \t \`git add -A .\` ";
    echo "";
fi

if [ "${TO_RUN_GIT_COMMIT}" == "Y" ]; then
    git commit -m "${GIT_COMMIT_MESSAGE}";
    echo -e "Git Command Completed!: \t \`git commit -m \"${GIT_COMMIT_MESSAGE}\"\` ";
    echo "";
fi

if [ "${TO_RUN_GIT_PUSH}" == "Y" ]; then
    git push
    echo -e "Git Command Completed!: \t \`git push\` ";
    echo "";
fi





if [ "${TO_RUN_REBUILD}" == "Y" ]; then
    echo -e "\t ✅ Rebuilt Distribution File";
else
    echo -e "\t 🚫 Rebuilt Distribution File";
fi

if [ "${TO_RUN_GIT_ADD}" == "Y" ]; then
    echo -e "\t ✅ Git Add";
else
    echo -e "\t 🚫 Git Add";
fi

if [ "${TO_RUN_GIT_COMMIT}" == "Y" ]; then
    echo -e "\t ✅ Git Commit (Message: \"${GIT_COMMIT_MESSAGE})\"";
else
    echo -e "\t 🚫 Git Commit";
fi

if [ "${TO_RUN_GIT_PUSH}" == "Y" ]; then
    echo -e "\t ✅ Git Push";
else
    echo -e "\t 🚫 Git Push";
fi

echo -e "✅ Deployment Completed!";
exit 0;














# read -p "Rebuild \`./dist/${GIT_TAG_VERSION}.tar.gz\`? (Y/N) (Y): " TO_RUN_REBUILD
# if [ "${TO_RUN_REBUILD}" == "" ] || [ "${TO_RUN_REBUILD}" == "Y" ] || [ "${TO_RUN_REBUILD}" == "y" ]; then
# 	# git add -A .
# 	# echo -e "Git Command Executed!: \t \`git add -A .\` ";
# 	# echo "";
# 	echo -e "✅ Rebuilding";
# 	TO_RUN_REBUILD="Y"
# else
# 	TO_RUN_REBUILD="N"
# fi
# echo "";



# read -p "Run \`git add -A .\`? (Y/N) (Y): " TO_RUN_GIT_ADD
# if [ "${TO_RUN_GIT_ADD}" == "" ] || [ "${TO_RUN_GIT_ADD}" == "Y" ] || [ "${TO_RUN_GIT_ADD}" == "y" ]; then
# 	# git add -A .
# 	# echo -e "Git Command Executed!: \t \`git add -A .\` ";
# 	# echo "";
# 	echo -e "✅ Including Git Add";
# 	TO_RUN_GIT_ADD="Y"
# else
# 	TO_RUN_GIT_ADD="N"
# fi
# echo "";


# read -p "Run \`git commit -m <message>\`? (Y/N) (Y): " TO_RUN_GIT_COMMIT
# if [ "${TO_RUN_GIT_COMMIT}" == "" ] || [ "${TO_RUN_GIT_COMMIT}" == "Y" ] || [ "${TO_RUN_GIT_COMMIT}" == "y" ]; then

# 	DEFAULT_GIT_COMMIT_MESSAGE="Deploying to \`${CURRENT_GIT_BRANCH}\` on `date`."

# 	read -p "Enter Git Commit Message (\"${DEFAULT_GIT_COMMIT_MESSAGE}\"): " GIT_COMMIT_MESSAGE
# 	# Check if a git commit message wasn't entered, and use a default one if so.
# 	if [[ -z "${GIT_COMMIT_MESSAGE}" ]]; then
# 	   GIT_COMMIT_MESSAGE="${DEFAULT_GIT_COMMIT_MESSAGE}";
# 	fi

# 	# git commit -m "${GIT_COMMIT_MESSAGE}";
# 	# echo -e "Git Command Executed!: \t \`git commit -m \"${GIT_COMMIT_MESSAGE}\"\` ";
# 	# echo "";
# 	echo -e "✅ Including Git Commit \n\t Message: ${GIT_COMMIT_MESSAGE}";
# 	TO_RUN_GIT_COMMIT="Y"
# else
# 	TO_RUN_GIT_COMMIT="N"
# fi
# echo "";




# read -p "Run \`git push\`? (Y/N) (Y): " TO_RUN_GIT_PUSH
# if [ "${TO_RUN_GIT_PUSH}" == "" ] || [ "${TO_RUN_GIT_PUSH}" == "Y" ] || [ "${TO_RUN_GIT_PUSH}" == "y" ]; then
# 	# git push
# 	# echo -e "Git Command Executed!: \t \`git push\` ";
# 	# echo "";
# 	echo -e "✅ Including Git Push";
# 	TO_RUN_GIT_PUSH="Y"
# else
# 	TO_RUN_GIT_PUSH="N"
# fi
# echo "";





# if [ "${TO_RUN_REBUILD}" == "N" ] && [ "${TO_RUN_GIT_ADD}" == "N" ] && [ "${TO_RUN_GIT_COMMIT}" == "N" ] && [ "${TO_RUN_GIT_PUSH}" == "N" ]; then
# 	echo "🚫 Nothing To Do!";
# 	echo "";
# 	exit 11;
# fi







# #
# # First confirm the deployment with the user (ask for input).
# #
# echo "";
# echo -e "⚠️  Confirm This Deployment (Y/N) (N): \n\t Rebuild?: ${TO_RUN_REBUILD} \n\t Git Add?: ${TO_RUN_GIT_ADD} \n\t Git Commit?: ${TO_RUN_GIT_COMMIT} \n\t Git Push?: ${TO_RUN_GIT_PUSH}";
# read -p "" THE_DEPLOYMENT_IS_CONFIRMED
# # read -p "Looks Good? (Y/N) (N): " THE_DEPLOYMENT_IS_CONFIRMED
# if [ "${THE_DEPLOYMENT_IS_CONFIRMED}" == "Y" ] || [ "${THE_DEPLOYMENT_IS_CONFIRMED}" == "y" ]; then
# 	THE_DEPLOYMENT_IS_CONFIRMED="Y"
# else
# 	THE_DEPLOYMENT_IS_CONFIRMED="N"
# fi
# echo "";
















# #
# # Finally, actually deploy or cancel.
# #
# if [ "${THE_DEPLOYMENT_IS_CONFIRMED}" == "Y" ]; then

# 	echo "Running The Deployment...";
# 	echo "";

# 	if [ "${TO_RUN_REBUILD}" == "Y" ]; then
# 		# echo "Rebuilding \`./dist/${GIT_TAG_VERSION}\`...";
# 		./build.sh
# 		echo "Rebuilt \`./dist/${GIT_TAG_VERSION}\`!";
# 		echo "";
# 	fi

# 	if [ "${TO_RUN_GIT_ADD}" == "Y" ]; then
# 		git add -A .
# 		echo -e "Git Command Completed!: \t \`git add -A .\` ";
# 		echo "";
# 	fi

# 	if [ "${TO_RUN_GIT_COMMIT}" == "Y" ]; then
# 		git commit -m "${GIT_COMMIT_MESSAGE}";
# 		echo -e "Git Command Completed!: \t \`git commit -m \"${GIT_COMMIT_MESSAGE}\"\` ";
# 		echo "";
# 	fi

# 	if [ "${TO_RUN_GIT_PUSH}" == "Y" ]; then
# 		git push
# 		echo -e "Git Command Completed!: \t \`git push\` ";
# 		echo "";
# 	fi



# 	echo "✅ The Deployment Was Successful! Summary:";
# 	if [ "${TO_RUN_REBUILD}" == "Y" ]; then
# 		echo -e "\t ✅ Rebuilt";
# 	else
# 		echo -e "\t 🚫 Rebuilt";
# 	fi

# 	if [ "${TO_RUN_GIT_ADD}" == "Y" ]; then
# 		echo -e "\t ✅ Git Add";
# 	else
# 		echo -e "\t 🚫 Git Add";
# 	fi

# 	if [ "${TO_RUN_GIT_COMMIT}" == "Y" ]; then
# 		echo -e "\t ✅ Git Commit (Message: \"${GIT_COMMIT_MESSAGE})\"";
# 	else
# 		echo -e "\t 🚫 Git Commit";
# 	fi

# 	if [ "${TO_RUN_GIT_PUSH}" == "Y" ]; then
# 		echo -e "\t ✅ Git Push";
# 	else
# 		echo -e "\t 🚫 Git Push";
# 	fi

# 	echo "";
# 	exit 0;

# else
# 	echo "🚫 Deployment Canceled!";
# 	echo "";
# 	exit 10;
# fi






# # echo "${GIT_COMMIT_MESSAGE}"
# # exit 1;


