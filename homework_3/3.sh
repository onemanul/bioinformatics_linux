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

# убрали знаки препинания - заменили большие на малые - каждое слово с новой строки
# сортировка и вывод уникальных (с числом) - первые 10 (по умолчанию)
tr -s '.,!?;:' ' ' < "$file_path" | tr '[:upper:]' '[:lower:]' |  tr -s ' ' '\n' | sort | uniq -c | sort -nr | head