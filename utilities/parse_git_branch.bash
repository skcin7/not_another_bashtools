#!/usr/bin/env bash
# Parse the present working directory to add the git branch name to bash prompt (if pwd is a git repository).
#
# Copyright 2022 Nick Morgan

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "