#!/bin/bash

file_path=$1
organism=$2

if [[ $# -ne 2 ]]; then
  echo "Неверное количество аргументов, должно быть 2"
  exit 1
fi

if [[ ! -f "$file_path" ]]; then
  echo "Файл не найден: $file_path"
  exit 1
fi

case "$organism" in
  human|mouse|rat|fly)
    file_name=$(basename "$file_path")
    echo "Обрабатываю ${file_name}"
    ;;
  *)
    echo -e "Недопустимый организм: $organism\nПоддерживаемые организмы: human, mouse, rat, fly";
    exit 1
    ;;
esac
