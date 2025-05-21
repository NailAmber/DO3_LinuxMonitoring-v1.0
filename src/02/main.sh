#!/bin/bash

if [ -n "$1" ]; then
    echo "Invalid argument"
else
    chmod +x export.sh
    ./export.sh
fi