#!/bin/bash

if [[ $# -eq 0 ]]; then
  file_path="config.json"
else
  file_path=$1
fi

if [[ ! -f "$file_path" ]]; then
  echo "Файл не найден: $file_path"
  exit 1
fi

#-----1-----
sed 's/["{} ]//g; s/:/=/g; s/,/\n/g' "$file_path" > "${file_path%.*}.env"
#-----2-----
awk '{print "CONF_" $0}' "${file_path%.*}.env" > "${file_path%.*}_conf.env"
#-----3-----
for line in $(cat "${file_path%.*}_conf.env"); do
  export "$line"
done
