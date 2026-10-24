#!/bin/bash

if [[ $# -eq 0 ]]; then
  file_path="data.csv"
else
  file_path=$1
fi

if [[ ! -f "$file_path" ]]; then
  echo "Файл не найден: $file_path"
  exit 1
fi

#-----1-----
sed 's/;/,/g; s/"\([^"]\+\)$/"\1"/' "$file_path" > data_fixed.csv
#-----2-----
awk -F',' 'NF != 3 {print "Строка " NR "; полей " NF " -> " $0}' data_fixed.csv
#-----3-----
tail -n +2 data_fixed.csv | tr -d '"' | while read -r line; do
  echo "$line" | awk -F',' '{print "Hello, my name is " $1 ". I am " $2 " years old and I live in " $3 "."}'
done
