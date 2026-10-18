#!/bin/bash

for host in $@; do
  # у линукса флаг -c, у винды -n
  if ping -c 4 "$host" > /dev/null; then
    echo "$host: доступен"
  else
    echo "$host: недоступен"
  fi
done