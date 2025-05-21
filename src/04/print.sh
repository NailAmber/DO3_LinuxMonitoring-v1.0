#!/bin/bash

colored_echo() {
    local name=$1
    local text=$2
    echo -e "\e[${bg1};${fg1}m ${name} \e[0m = \e[${bg2};${fg2}m ${text} \e[0m"
}

colored_echo "HOSTNAME" "$HOSTNAME"
colored_echo "TIMEZONE" "$TIMEZONE"
colored_echo "USER" "$USER"
colored_echo "OS" "$OS"
colored_echo "DATE" "$DATE"
colored_echo "UPTIME" "$UPTIME"
colored_echo "UPTIME_SEC" "$UPTIME_SEC"
colored_echo "IP" "$IP"
colored_echo "MASK" "$MASK"
colored_echo "GATEWAY" "$GATEWAY"
colored_echo "RAM_TOTAL" "$RAM_TOTAL"
colored_echo "RAM_USED" "$RAM_USED"
colored_echo "RAM_FREE" "$RAM_FREE"
colored_echo "SPACE_ROOT" "$SPACE_ROOT"
colored_echo "SPACE_ROOT_USED" "$SPACE_ROOT_USED"
colored_echo "SPACE_ROOT_FREE" "$SPACE_ROOT_FREE"