#!/bin/bash

file_path=$1
threshold=$2

if [[ $# -ne 2 ]]; then
  echo "Неверное количество аргументов, должно быть 2"
  exit 1
fi

if [[ ! -f "$file_path" ]]; then
  echo "Файл не найден: $file_path"
  exit 1
fi

for subj in $(cut -f3 "$file_path" | sort | uniq); do
  echo "== $subj =="
  # за разделитель берём табуляцию
  awk -F '\t' -v threshold="$threshold" -v subj="$subj" '$3 == subj && $2 > threshold {print $1, $2}' "$file_path"
done