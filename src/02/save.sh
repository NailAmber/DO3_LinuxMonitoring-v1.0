#!bin/bash

read -p "Save to file? (y/n): " answer
if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    file_name="$(date +%d_%m_%y_%H_%M_%S).status"
    source ./print.sh > "$file_name"
    echo "File saved as $file_name"
fi