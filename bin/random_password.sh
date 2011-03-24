#!/bin/bash   
if [ "$1" != "" ]; then
    if [[ $1 =~ ^[0-9]+$ ]]; then
        CHARACTERS=$1
    else
        printf "The argument must be a number. Exiting.. \n"
        exit
    fi
else
    CHARACTERS=10
fi

openssl rand -base64 $CHARACTERS
