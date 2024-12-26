#!/bin/bash

container_name=${1}

echo -e "Testing container ${container_name}.\n"

echo -e "Container OS:"

cat /etc/os-release

echo -e "\nContainer PATH:"

echo $PATH

exit 0
