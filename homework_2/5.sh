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

full_path=$(realpath "$file_path")
file_name=$(basename "$file_path")

ln -s "$full_path" "$file_name" || exit 1  # ошибка, если файл с таким именем уже существует
echo "Ссылка создана"
