#!/bin/bash

file_path=$1

if [[ $# -ne 1 ]]; then
  echo "Неверное количество аргументов, должен быть 1"
  exit 1
fi

if [[ -d "$file_path" ]]; then
  echo "Файлы в папке $1:"
  find "$file_path" -maxdepth 1 -type f  # сам выведет в консоль, без echo. Без maxdepth пойдёт рекурсивно вглубь
elif [[ -f "$file_path" ]]; then
  stat "$file_path"
  echo "Строк в файле: $(wc -l < "$1")"  # знак < чтобы вывел только число, без имени файла
else
  echo "Аргумент не является директорией или файлом"
  exit 1
fi
