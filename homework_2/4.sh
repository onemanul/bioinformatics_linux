#!/bin/bash

file_path=$1

if [[ $# -ne 1 ]]; then
  echo "Неверное количество аргументов, должен быть 1"
  exit 1
fi

if [[ ! -f "$file_path" ]]; then
  echo "Файл не найден: $file_path"
  exit 1
fi

extension="${file_path##*.}"
case "$extension" in
  fasta|fa|fna)
    first_symbol=$(head -c 1 "$file_path")  # -c N = первые N байт
    if [[ "$first_symbol" != ">" ]]; then
      echo "Файл не является FASTA: первая строка должна начинаться с '>'"
      exit 1
    fi
    echo "Файл является корректным FASTA-файлом"
    ;;
  *)
    echo "Недопустимое расширение: $extension. Ожидается fasta, fa или fna"
    exit 1
    ;;
esac
