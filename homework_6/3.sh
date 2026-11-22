#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Неверное количество аргументов, должен быть 1"
  exit 1
fi

path=$1

if [[ -d "$path" ]]; then
  find "$path" -type f \( -name '*genome*' -or -name '*GCA*' \) # сам выведет в консоль, без echo. Без maxdepth пойдёт рекурсивно вглубь
else
  echo "Аргумент не является директорией"
  exit 1
fi
