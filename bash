#!/bin/bash

check_password_complexity() {
    local password=$1
    local length=${#password}
    local has_lower=0
    local has_upper=0
    local has_digit=0
    local has_special=0

    if [ $length -ge 8 ]; then
        for (( i=0; i<$length; i++ )); do
            char="${password:$i:1}"
            if [[ $char =~ [a-z] ]]; then
                has_lower=1
            elif [[ $char =~ [A-Z] ]]; then
                has_upper=1
            elif [[ $char =~ [0-9] ]]; then
                has_digit=1
            else
                has_special=1
            fi
        done

        if [ $has_lower -eq 1 ] && [ $has_upper -eq 1 ] && [ $has_digit -eq 1 ] && [ $has_special -eq 1 ]; then
            echo "Password is strong!"
        else
            echo "Password is weak. It should contain at least one lowercase letter, one uppercase letter, one digit, and one special character."
        fi
    else
        echo "Password is too short. It should be at least 8 characters."
    fi
}

read -s -p "Enter the password: " password
echo

check_password_complexity "$password"
