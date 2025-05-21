#!/bin/bash

# Timezone in format: America/New_York UTC-5
export TIMEZONE="$(cat /etc/timezone) UTC $(date +%:::z)"
export OS=$(cat /etc/issue | awk '{print $1$2}')
# Date in format: 12 May 2020 12:24:36
export DATE=$(date +'%d %B %Y %T')
export UPTIME=$(uptime -p | sed 's/up //')
# Uptime in seconds in format: 123456
export UPTIME_SEC=$(awk '{print int($1)}' /proc/uptime)
export IP=$(hostname -I | awk '{print $1}')
export MASK=$(netstat -rn | awk 'NR==4{print $3}')
export GATEWAY=$(ip route | grep default | awk '{print $3}')
# Ram in format: GB, 3 digits after the dot
export RAM_TOTAL=$(free -h | grep Mem | awk '{printf "%.3f GB",$2}')
export RAM_USED=$(free -h | grep Mem | awk '{printf "%.3f GB",$3}')
export RAM_FREE=$(free -h | grep Mem | awk '{printf "%.3f GB",$4}')
# Space in format: MB, 2 digits after the dot
export SPACE_ROOT=$(df / | grep / | awk '{printf "%.2f MB",$2/1024}')
export SPACE_ROOT_USED=$(df / | grep / | awk '{printf "%.2f MB",$3/1024}')
export SPACE_ROOT_FREE=$(df / | grep / | awk '{printf "%.2f MB",$4/1024}')
chmod +x print.sh
./print.sh
chmod +x save.sh
source ./save.sh

