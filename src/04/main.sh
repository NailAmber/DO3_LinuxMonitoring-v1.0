#!/bin/bash

CONFIG_FILE="config.txt"

if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
fi

colors=( "" "white" "red" "green" "blue" "purple" "black" )
bg_colors=( "" "47" "41" "42" "44" "45" "40" )
fg_colors=( "" "37" "31" "32" "34" "35" "30" )

DEFAULT_BG1=6   # (black)
DEFAULT_BG2=2   # (red)
DEFAULT_FG1=1   # (white)
DEFAULT_FG2=4   # (blue)

bg1_color=${column1_background:-$DEFAULT_BG1}
bg2_color=${column2_background:-$DEFAULT_BG2}
fg1_color=${column1_font_color:-$DEFAULT_FG1}
fg2_color=${column2_font_color:-$DEFAULT_FG2}

if [ "$bg1_color" -eq "$fg1_color" ] || [ "$bg2_color" -eq "$fg2_color" ]; then
    echo "Background and font color cannot be the same"
    exit 1
fi

bg1=${bg_colors[$bg1_color]}
bg2=${bg_colors[$bg2_color]}
fg1=${fg_colors[$fg1_color]}
fg2=${fg_colors[$fg2_color]}

export bg1
export bg2
export fg1
export fg2

chmod +x export.sh
./export.sh

echo ""
echo "Column 1 background = ${column1_background:-default} (${colors[$bg1_color]:-black})"
echo "Column 1 font color = ${column1_font_color:-default} (${colors[$fg1_color]:-white})"
echo "Column 2 background = ${column2_background:-default} (${colors[$bg2_color]:-red})"
echo "Column 2 font color = ${column2_font_color:-default} (${colors[$fg2_color]:-blue})"