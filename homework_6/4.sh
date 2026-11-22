#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Неверное количество аргументов, должен быть 1"
  exit 1
fi

file_path=$1

if [[ ! -f "$file_path" ]]; then
  echo "Файл не найден: $file_path"
  exit 1
fi

if [[ ! "${file_path,,}" =~ \.gff3?$ ]]; then
  echo "Файл должен иметь расширение .gff или .gff3"
  exit 1
fi

awk -F'\t' '$3 == "gene" && $7 == "-" {print $9}' "$file_path" \
  | sed 's/[^\t]*gene_name=\([^;]*\).*$/\1/' \
  | grep -E -i '^[^azh].{3,}$'
