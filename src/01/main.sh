#!/bin/bash

# Check if the argument is string
if [ -n "$1" ]; then
    if [[ "$1" =~ ^[a-zA-Z]+$ ]]; then
        echo "$1"
    else
        echo "Argument is not a string."
    fi
else
    echo "No argument provided."
fi