#!/bin/bash

path_dir=$1

total_folders=$(sudo find "$path_dir" -type d | wc -l)
top_folders=$(sudo du -h "$path_dir"* | sort -hr | head -n 5 | awk '{print NR " - " $2 ", " $1}')
total_files=$(sudo find "$path_dir" -type f | wc -l)
conf=$(sudo find "$path_dir" -type f -name "*.conf" | wc -l)
txt=$(sudo find "$path_dir" -type f -name "*.txt" | wc -l)
exe=$(sudo find "$path_dir" -type f -executable| wc -l)
log=$(sudo find "$path_dir" -type f -name "*.log" | wc -l)
archive=$(sudo find "$path_dir" -type f \( -name "*.zip" -o -name "*.tar" -o -name "*.gz" -o -name "*.7z" \) | wc -l)
links=$(sudo find "$path_dir" -type l | wc -l)
top_largest_files=$(sudo find "$path_dir" -type f -exec du -h {} + | sort -hr | sed -n '1,10'p | awk '{ext=""; file=$2; sub(".*/", "", file); if (index(file, ".") > 0) {n=split(file, arr, "."); ext=arr[n];} printf "%d - %s, %s%s\n", NR, $2, $1, (ext == "" ? "" : ", "ext)}')
top_largest_exe_files=$(sudo find "$path_dir" -type f -executable -exec du -h {} + | sort -hr | head -n 10 | awk '{printf "%d - %s, %s, ", NR, $2, $1; system("md5sum " $2 " | cut -d\" \" -f1")}')

echo "Total number of folders (including all nested ones) = $total_folders"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$top_folders"
echo "Total number of files = $total_files"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $conf"
echo "Text files = $txt"
echo "Executable files = $exe"
echo "Log files (with the extension .log) = $log"
echo "Archive files = $archive"
echo "Symbolic links = $links"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$top_largest_files"
echo "TOP 10 executable files of maximum size arranged in descending order (path, size and MD5 hash of file):"
echo "$top_largest_exe_files"