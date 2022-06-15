#!/usr/bin/env bash
# Not Another Terminal Tools
#     Tests: Functions
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

ALL_TESTS_PASS=true;
TESTS_PASSED_COUNT=0;
TESTS_FAILED_COUNT=0;


if $(natt_utility__functions__fn__exists ls); then
    echo -e '✅ ls exists';
    ((TESTS_PASSED_COUNT=TESTS_PASSED_COUNT+1));
else
    echo -e '🚫 ls does not exist';
    ALL_TESTS_PASS=false;
    ((TESTS_FAILED_COUNT=TESTS_FAILED_COUNT+1));
fi

if $(exists ls); then
    echo -e '✅ ls exists (alias)';
    ((TESTS_PASSED_COUNT=TESTS_PASSED_COUNT+1));
else
    echo -e '🚫 ls does not exist (alias)';
    ALL_TESTS_PASS=false;
    ((TESTS_FAILED_COUNT=TESTS_FAILED_COUNT+1));
fi

if $(natt_utility__functions__fn__exists natt_utility__functions); then
    echo -e '✅ natt_utility__functions exists';
    ((TESTS_PASSED_COUNT=TESTS_PASSED_COUNT+1));
else
    echo -e '🚫 natt_utility__functions does not exist';
    ALL_TESTS_PASS=false;
    ((TESTS_FAILED_COUNT=TESTS_FAILED_COUNT+1));
fi

if ! natt_utility__functions__fn__exists; then
    echo -e '✅ unspecified does not exist';
    ((TESTS_PASSED_COUNT=TESTS_PASSED_COUNT+1));
else
    echo -e '🚫 unspecified exists';
    ALL_TESTS_PASS=false;
    ((TESTS_FAILED_COUNT=TESTS_FAILED_COUNT+1));
fi




if $(natt_utility__functions__fn__cmd_exists ls); then
    echo -e '✅ ls command exists';
    ((TESTS_PASSED_COUNT=TESTS_PASSED_COUNT+1));
else
    echo -e '🚫 ls command does not exist';
    ALL_TESTS_PASS=false;
    ((TESTS_FAILED_COUNT=TESTS_FAILED_COUNT+1));
fi

if [[ $(natt_utility__functions__fn__cmd_exists ls) -eq 0 ]]; then
    echo -e '✅ ls command exists';
    ((TESTS_PASSED_COUNT=TESTS_PASSED_COUNT+1));
else
    echo -e '🚫 ls command does not exist';
    ALL_TESTS_PASS=false;
    ((TESTS_FAILED_COUNT=TESTS_FAILED_COUNT+1));
fi

if natt_utility__functions__fn__cmd_exists ls; then
    echo -e '✅ ls command exists';
    ((TESTS_PASSED_COUNT=TESTS_PASSED_COUNT+1));
else
    echo -e '🚫 ls command does not exist';
    ALL_TESTS_PASS=false;
    ((TESTS_FAILED_COUNT=TESTS_FAILED_COUNT+1));
fi

if ! natt_utility__functions__fn__cmd_exists; then
    echo -e '✅ unspecified command does not exist';
    ((TESTS_PASSED_COUNT=TESTS_PASSED_COUNT+1));
else
    echo -e '🚫 unspecified command exists';
    ALL_TESTS_PASS=false;
    ((TESTS_FAILED_COUNT=TESTS_FAILED_COUNT+1));
fi


echo "Summary:";

echo -e "Passed Count: ${TESTS_PASSED_COUNT}";
echo -e "Failed Count: ${TESTS_FAILED_COUNT}";

if ! ${ALL_TESTS_PASS}; then
    echo -e "🚫 Not All Tests Pass."
    exit 10;
fi

echo -e "✅ All Tests Pass."
exit 0;



##########
# TESTS: #
##########

# NATT__UTILITY__FUNCTIONS__TESTS=(
#     "fn_exists"
# )

# natt_utility__functions__run_test() {
#     local ALL_TESTS_PASS=true;

#     if [ "${1}" == "fn_exists" ]; then
#         divider "Testing: ${1}";

#         if fn_exists "${2}"; then
#             echo -e "EXISTS";
#         else
#             echo -e "NOT EXISTS";
#             ALL_TESTS_PASS=false;
#         fi



#         return;
#     fi


#     false;



#     # if natt_utility__functions__fn__fn_exists natt_utility__functions__fn__fn_exists_test; then
#     #     echo -e "Function Exists.";
#     # else
#     #     echo -e "Function Does Not Exist.";
#     #     ALL_TESTS_PASS=false;
#     # fi


#     # if ${ALL_TESTS_PASS}; then
#     #     echo -e "✅ Testing Passed";
#     # else
#     #     echo -e "🚫 Testing Failed";
#     # fi
# }

# natt_utility__functions__run_tests() {
#     local ALL_TESTS_PASS=true;

#     # for current_test in "${@:2}"; do
#     #     divider "Current Test: ${current_test}";


#     # done

#     # if ! natt_utility__functions__test fn_exists; then echo -e "Function Exists."; else echo -e "Function Does Not Exist."; ALL_TESTS_PASS=false; fi

#     for current_test in ${NATT__UTILITY__FUNCTIONS__TESTS[@]}; do
#         divider "Current Test: ${current_test}";
#         local CURRENT_TEST_PASSES=true;

#         if [ "${current_test}" == "fn_exists" ]; then

#             # With no argument (SHOULD PASS):
#             if natt_utility__functions__run_test $(!fn_exists); then
#                 CURRENT_TEST_PASSES=true;
#             else
#                 CURRENT_TEST_PASSES=false;
#                 echo -e "🚫 With No Argument - Failed";
#             fi

#             # With known existing argument (SHOULD PASS):
#             if natt_utility__functions__run_test $(fn_exists divider); then
#                 CURRENT_TEST_PASSES=true;
#             else
#                 CURRENT_TEST_PASSES=false;
#                 echo -e "🚫 With Known Existing Argument - Failed";
#             fi

#             # With known non-existing argument (SHOULD PASS):
#             if natt_utility__functions__run_test $(!fn_exists this_function_does_not_exist_lkajdsflkajsdflkj); then
#                 CURRENT_TEST_PASSES=true;
#             else
#                 CURRENT_TEST_PASSES=false;
#                 echo -e "🚫 With Known Non-Existing Argument - Failed";
#             fi

#         fi

#         if ! ${CURRENT_TEST_PASSES}; then
#             # echo -e "🚫 Failed";
#             ALL_TESTS_PASS=false;
#         fi
#     done

#     if ${ALL_TESTS_PASS}; then
#         echo -e "✅ All Tests Passed";
#     else
#         echo -e "🚫 All Tests Failed";
#     fi
# }


source "${HOME}/.not_another_terminal_tools/utilities/functions/functions.sh";

# ${HOME}/.not_another_terminal_tools/utilities/functions/functions.sh;

# echo "$(whoami)";


##########
# TESTS: #
##########

#
# Test for with no function argument supplied.
#
natt_utility__functions__test__cmd_exists() {
    local COMMAND_PASSES=true;

    if $(natt_utility__functions__fn__cmd_exists); then
        COMMAND_PASSES=false;
    fi

    if ! $(natt_utility__functions__fn__cmd_exists); then
        COMMAND_PASSES=false;
    fi


    false;
}




#
# Test for with no function argument supplied.
#
natt_utility__functions__test__no_function_argument_not_exists() {
    if ! $(natt_utility__functions__fn__fn_exists); then
        return;
    fi
    false;
}

#
# Test for a known existing function.
#
natt_utility__functions__test__known_existing_function_returns_true() {
    if $(natt_utility__functions__fn__fn_exists "natt_utility__functions__fn__divider"); then
        return;
    fi
    false;
}

#
# Test for a known non-existing function.
#
natt_utility__functions__test__known_non_existing_function_returns_false() {
    if ! $(natt_utility__functions__fn__fn_exists "this_function_does_not_exist_1234567890_qwertyuiopasdfghjklzxcvbnm"); then
        return;
    fi
    false;
}



# alias;




# source "${HOME}/.not_another_terminal_tools/utilities/functions/functions.sh";

# divider "Testing - Utility: Functions";

# ALL_TESTS_PASS=true;
# TEST_PASSED_COUNT=0;
# TEST_FAILED_COUNT=0;

# declare -a NATT__UTILITY__FUNCTIONS__AVAILABLE_TESTS=(
#     "no_function_argument_not_exists"
#     "known_existing_function_returns_true"
#     "non_existing_function_returns_false"
# )


# declare -a NATT__UTILITY__FUNCTIONS__AVAILABLE_TESTS=(
#     "no_function_argument_not_exists"
#     "known_existing_function_returns_true"
#     "non_existing_function_returns_false"
# )

# NATT__UTILITY__FUNCTIONS__TO_TEST=();

# # First loop through the input, and add the tests to be run if it's in the list of available tests.
# for current_test_inputted in "${@:2}"; do
#     echo -e "Current Test Inputted: ${current_test_inputted}";

#     if [[ " ${NATT__UTILITY__FUNCTIONS__AVAILABLE_TESTS[*]} " =~ " ${current_test_inputted} " ]]; then
#         # whatever you want to do when array contains value
#         NATT__UTILITY__FUNCTIONS__TO_TEST[${#NATT__UTILITY__FUNCTIONS__TO_TEST[@]}]="${current_test_inputted}";
#     fi
# done

# for current_test in "${NATT__UTILITY__FUNCTIONS__TO_TEST[@]}"; do
#      divider "Current Test: ${current_test}";

#     if [ "${current_test}" == "no_function_argument_not_exists" ]; then
#         # if natt_utility__functions__test__no_function_argument_not_exists; then

#         # else

#         # fi

#         if $(natt_utility__functions__test__no_function_argument_not_exists); then
#             ((TEST_PASSED_COUNT=TEST_PASSED_COUNT+1));
#             echo "✅ ${current_test} - Passed";
#         else
#             ALL_TESTS_PASS=false;
#             ((TEST_FAILED_COUNT=TEST_FAILED_COUNT+1));
#             echo "🚫 ${current_test} - Failed";
#         fi
#     fi

# done

# # echo "Available Tests: ${NATT__UTILITY__FUNCTIONS__AVAILABLE_TESTS}";
# echo "Available Tests: ${NATT__UTILITY__FUNCTIONS__AVAILABLE_TESTS[*]}"
# echo "To Test: ${NATT__UTILITY__FUNCTIONS__TO_TEST}";











divider "Utility: Functions - Tests";

ALL_TESTS_PASS=true;
TEST_PASSED_COUNT=0;
TEST_FAILED_COUNT=0;

declare -a NATT__UTILITY__FUNCTIONS__TESTS=(
    "natt_utility__functions__test__no_function_argument_not_exists"
    "known_existing_function_returns_true"
    "non_existing_function_returns_false"
)


echo "Running Tests:";


if $(natt_utility__functions__test__no_function_argument_not_exists); then
    ((TEST_PASSED_COUNT=TEST_PASSED_COUNT+1));
    echo -e "\t✅ no_function_argument_not_exists - Passed";
else
    ALL_TESTS_PASS=false;
    ((TEST_FAILED_COUNT=TEST_FAILED_COUNT+1));
    echo -e "\t🚫 no_function_argument_not_exists - Failed";
fi

if natt_utility__functions__test__known_existing_function_returns_true; then
    ((TEST_PASSED_COUNT=TEST_PASSED_COUNT+1));
    echo -e "\t✅ known_existing_function_returns_true - Passed";
else
    ALL_TESTS_PASS=false;
    ((TEST_FAILED_COUNT=TEST_FAILED_COUNT+1));
    echo -e "\t🚫 known_existing_function_returns_true - Failed";
fi

if natt_utility__functions__test__known_non_existing_function_returns_false; then
    ((TEST_PASSED_COUNT=TEST_PASSED_COUNT+1));
    echo -e "\t✅ known_non_existing_function_returns_false - Passed";
else
    ALL_TESTS_PASS=false;
    ((TEST_FAILED_COUNT=TEST_FAILED_COUNT+1));
    echo -e "\t🚫 known_non_existing_function_returns_false - Failed";
fi

# natt_utility__functions__test__known_existing_function_returns_true

# natt_utility__functions__test__known_non_existing_function_returns_false


# if ! $(natt_utility__functions__fn__fn_exists); then
#     ((TEST_PASSED_COUNT=TEST_PASSED_COUNT+1));
#     # echo "✅ No Function Argument - Passed";
# else
#     ALL_TESTS_PASS=false;
#     ((TEST_FAILED_COUNT=TEST_FAILED_COUNT+1));
#     echo "🚫 No Function Argument - Failed";
# fi


# if $(natt_utility__functions__fn__fn_exists "divider"); then
#     ((TEST_PASSED_COUNT=TEST_PASSED_COUNT+1));
#     # echo "✅ Known Existing Function - Passed";
# else
#     ALL_TESTS_PASS=false;
#     ((TEST_FAILED_COUNT=TEST_FAILED_COUNT+1));
#     echo "🚫 Known Existing Function - Failed";
# fi


# if ! $(natt_utility__functions__test__known_non_existing_function_returns_false "this_function_does_not_exist_1234567890_qwertyuiopasdfghjklzxcvbnm"); then
#     ((TEST_PASSED_COUNT=TEST_PASSED_COUNT+1));
#     # echo "✅ Known Non-Existing Function - Passed";
# else
#     ALL_TESTS_PASS=false;
#     ((TEST_FAILED_COUNT=TEST_FAILED_COUNT+1));
#     echo "🚫 Known Non-Existing Function - Failed";
# fi






echo "Summary:";


echo -e "\tPassed Count: ${TEST_PASSED_COUNT}";
echo -e "\tFailed Count: ${TEST_FAILED_COUNT}";
# echo -e "\tTotal Tests: $((TEST_PASSED_COUNT + TEST_FAILED_COUNT))";

if ${ALL_TESTS_PASS}; then
    echo -e "\t🚫 Testing Has Failed.";
    exit 10;
fi


echo -e "\t✅ The Testing Has Succeeded!";
exit 0;



# if [ natt_utility__functions__fn__fn_exists "divider" ]; then
#     echo -e "PASSES";
# else
#     echo -e "NOT PASSES";
#     # ALL_TESTS_PASS=false;
# fi

# echo "";

# if !natt_utility__functions__fn__fn_exists "this_function_does_not_exist_lkajdsflkajsdflkj"; then
#     echo -e "PASSES";
# else
#     echo -e "NOT PASSES";
#     # ALL_TESTS_PASS=false;
# fi

# echo "";







# ALL_TESTS_PASS=true;
# NATT__UTILITY__FUNCTIONS__TESTS=(
#     "fn_exists"
# )

# # natt_utility__functions__run_tests;

# for current_test in ${NATT__UTILITY__FUNCTIONS__TESTS[@]}; do
#     divider "Current Test: ${current_test}";
#     CURRENT_TEST_PASSES=true;

#     if [ "${current_test}" == "fn_exists" ]; then

#         if !natt_utility__functions__fn__fn_exists; then
#             CURRENT_TEST_PASSES=true;
#         else
#             CURRENT_TEST_PASSES=false;
#             echo -e "🚫 Failed - !fn_exists";
#         fi

#         # # With no argument (SHOULD PASS):
#         # if natt_utility__functions__run_test $(!fn_exists); then
#         #     CURRENT_TEST_PASSES=true;
#         # else
#         #     CURRENT_TEST_PASSES=false;
#         #     echo -e "🚫 With No Argument - Failed";
#         # fi

#         # # With known existing argument (SHOULD PASS):
#         # if natt_utility__functions__run_test $(fn_exists divider); then
#         #     CURRENT_TEST_PASSES=true;
#         # else
#         #     CURRENT_TEST_PASSES=false;
#         #     echo -e "🚫 With Known Existing Argument - Failed";
#         # fi

#         # # With known non-existing argument (SHOULD PASS):
#         # if natt_utility__functions__run_test $(!fn_exists this_function_does_not_exist_lkajdsflkajsdflkj); then
#         #     CURRENT_TEST_PASSES=true;
#         # else
#         #     CURRENT_TEST_PASSES=false;
#         #     echo -e "🚫 With Known Non-Existing Argument - Failed";
#         # fi

#     fi

#     if ! ${CURRENT_TEST_PASSES}; then
#         # echo -e "🚫 Failed";
#         ALL_TESTS_PASS=false;
#     fi
#     done


# if ${ALL_TESTS_PASS}; then
#     echo -e "✅ All Tests Passed";
# else
#     echo -e "🚫 All Tests Failed";
# fi

# exit 0;