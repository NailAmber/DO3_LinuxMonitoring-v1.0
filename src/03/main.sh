#!/bin/bash

if [ $# -ne 4 ]; then
    echo "Invalid arguments"
    exit 1
fi

for arg in "$@"; do
    if ! [[ "$arg" =~ ^[1-6]$ ]]; then
        echo "Invalid arguments, arguments must be between 1 and 6"
        exit 1
    fi
done

if [ "$1" -eq "$2" ] || [ "$3" -eq "$4" ]; then
    echo "Invalid arguments, background and foreground colors must be different, try again"
    exit 1
fi

bg_colors=( "" "47" "41" "42" "44" "45" "40" )
fg_colors=( "" "37" "31" "32" "34" "35" "30" )

bg1=${bg_colors[$1]}
bg2=${bg_colors[$3]}
fg1=${fg_colors[$2]}
fg2=${fg_colors[$4]}

export bg1
export bg2
export fg1
export fg2

chmod +x export.sh
./export.sh