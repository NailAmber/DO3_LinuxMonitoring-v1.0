#!/bin/bash

if [ $# != 1 ] || [ $# = 0 ]; then
    echo "Invalid argument, please provide a single argument"
    exit 1
elif ! [ -d "$1" ]; then
    echo "Invalid argument, please provide a valid directory"
    exit 1
elif [ ${1: -1} != "/" ]; then
    echo "Invalid argument, please provide a directory with a trailing slash"
    exit 1
else
    chmod +x dirInfo.sh
    ./dirInfo.sh $@
fi

echo "Script execution time (in seconds) = $SECONDS"