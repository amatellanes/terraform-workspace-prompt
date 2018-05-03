#!/usr/bin/env bash

function terraform_prompt()
{
    if [ -d .terraform ]; then
        workspace="$(command terraform workspace show 2>/dev/null)"
        echo " (${workspace})"
    fi
}

export PS1='\u@\h \[\033[38;5;135m\]\w\[\e[38;5;99m\]\[\e[1m\]$(terraform_prompt)\e[0m\$ '
