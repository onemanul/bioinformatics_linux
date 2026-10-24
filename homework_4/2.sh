#!/bin/bash

if [[ $# -eq 0 ]]; then
  file_path="products.csv"
else
  file_path=$1
fi

if [[ ! -f "$file_path" ]]; then
  echo "Файл не найден: $file_path"
  exit 1
fi

#-----1-----
for category in $(tail -n +2 "$file_path" | cut -d',' -f3 | sort | uniq); do # со второй строки
  awk -F',' -v c="$category" '$3 == c {sum = sum + $4 * $5} END {print c "," sum}' "$file_path"
done | sort -t',' -k2nr
#-----2-----
sed '/,0$/d' "$file_path" > available_products.csv # d удалит всю строку с вхождением
#-----3-----
while read -r line; do
  echo "$line" | awk -F',' '$4+0 > 100 {print $2}'
done < "available_products.csv"
