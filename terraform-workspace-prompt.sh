#!/usr/bin/env bash

function check_plan_exists()
{
    $(command terraform validate > /dev/null 2>&1)
    echo "$?"
}

function terraform_prompt()
{
    if [ $(check_plan_exists) -eq 0 ]; then
        workspace="$(command terraform workspace show 2>/dev/null)"
        echo " (${workspace})"
    fi
}

export PS1='\u@\h \[\033[38;5;135m\]\w\[\e[38;5;99m\]\[\e[1m\]$(terraform_prompt)\e[0m\$ '