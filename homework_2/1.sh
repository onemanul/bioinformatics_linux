#!/bin/bash

case_arg=$1
word=$2

if [[ $# -ne 2 ]]; then
  echo "Incorrect args number. Must be 2"
  exit
fi

if [[ "$case_arg" == "-u" ]]; then
  echo "${word^^}"
elif [[ "$case_arg" == "-l" ]]; then
  echo "${word,,}"
else
  echo "Unsupported arg: $1"
fi
