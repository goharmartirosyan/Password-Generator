#!/bin/bash

green="\033[0;32m"
blue="\033[0;34m"
reset="\033[0m"
underline="\033[4m"

echo -e "${green}Random Password Generator${reset}"

echo -e "${underline}Please select an option:${reset}"
echo "1. Generate random passwords"
echo "2. Exit"

read option

case $option in
1)
    echo "Please enter the length of the password (between 8 - 48): "
    read length
    if [ $length -lt  8 ]; then
        echo "Enter a length of the password which is greater then 8"
    else
        echo -ne "${blue}Generating password."
        for i in {1..10}; do
            echo -n "."
            sleep 0.5
        done
        echo -e "${reset}"

        password=$(openssl rand -base64 48 | cut -c1-$length)
        echo "Generated password: $password"
    fi
    ;;
2)
    echo "Exit"
    ;;
*)
    echo "Invalid option. Please select option 1 or 2."
    ;;
esac
