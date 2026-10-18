#!/bin/bash

directory=$1

if [[ $# -ne 1 ]]; then
  echo "Неверное количество аргументов, должен быть 1"
  exit 1
fi

if [[ ! -d "$directory" ]]; then
  echo "Директория не найдена $directory"
  exit 1
fi

find "$directory" -type f | sed 's/.*\.//' | sort | uniq -c
du -sh "$directory"