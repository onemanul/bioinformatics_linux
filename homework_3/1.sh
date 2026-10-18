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
  csv)
    separator=','
    ;;
  tsv)
    separator='\t'
    ;;
  *)
    echo "Недопустимое расширение: $extension. Ожидается csv или tsv"
    exit 1
    ;;
esac

# разделили по сепаратору - вывели число столбцов в каждой строке - сортировали и оставили только уникальные - посчитали их число
n=$(awk -F "$separator" '{print NF}' "$file_path" | sort | uniq | wc -l)

if [ $n -eq 1 ]; then
  echo "Файл корректен"
else
  echo "Файл некорректен: в строках разное количество столбцов"
fi