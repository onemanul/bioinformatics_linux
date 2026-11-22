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

LC_ALL=C.UTF-8 grep -E -i -o '[a-zа-яё0-9_.+-]+@([a-zа-яё0-9-]+\.)+(ru|su|рф)\b' "$file_path"
