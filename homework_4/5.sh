#!/bin/bash

if [[ $# -eq 0 ]]; then
  file_path="text.txt"
else
  file_path=$1
fi

if [[ ! -f "$file_path" ]]; then
  echo "Файл не найден: $file_path"
  exit 1
fi

#-----1-----
sed 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/; s/[[:punct:]]//g' "$file_path"
#-----2-----
sed 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/; s/[[:punct:]]//g' "$file_path" \
  | awk '{for (i = 1; i <= NF; i++) count[$i]++} END {for (w in count) print count[w], w}' \
  | sort -nr | head -n 5 \
  | awk '{print $2 ": " $1}' > top5.txt
cat top5.txt
#-----3-----
for word in $(cut -d':' -f1 top5.txt); do
  echo "===$word==="
  # silent, не засорять вывод
  curl -s "https://api.dictionaryapi.dev/api/v2/entries/en/$word" \
    | grep -o '"definition":"[^"]*"' | head -n 1                      # only matching
done
