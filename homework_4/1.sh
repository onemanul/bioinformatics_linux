#!/bin/bash

if [[ $# -eq 0 ]]; then
  file_path="access.log"
else
  file_path=$1
fi

if [[ ! -f "$file_path" ]]; then
  echo "Файл не найден: $file_path"
  exit 1
fi

#-----1-----
awk '{print $1, $9}' "$file_path" > status_codes.txt
#-----2-----
sed 's/" 4[0-9][0-9] /" CLIENT_ERROR /' "$file_path" > errors.log
#-----3-----
for ip in $(cut -d' ' -f1 status_codes.txt | sort | uniq); do # delimiter ' '
  count=$(grep "^$ip " status_codes.txt | wc -l) # построчный подсчёт
  echo "$ip: $count"
done
