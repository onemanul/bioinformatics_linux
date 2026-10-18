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

for f in "$directory"/*.txt; do
  cp "$f" "${f%.txt}_$(date +%Y-%m-%d).txt"
done
