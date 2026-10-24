#!/bin/bash

#-----0-----
touch image1.jpg image2.png doc1.txt doc2.pdf script.sh archive.tar.gz
#-----1-----
mkdir -p images documents scripts archives
#---2,3,4---
for file in *; do
  [[ -f "$file" ]] || continue  # нужны только файлы
  [[ "$file" == "$(basename "$0")" ]] && continue   # пропускаем сам скрипт
  case "${file#*.}" in
    jpg|png)
      directory='images'
      ;;
    txt|pdf)
      directory='documents'
      ;;
    sh)
      directory='scripts'
      ;;
    tar.gz)
      directory='archives'
      ;;
    *)
      echo "Недопустимое расширение: ${file#*.}"
      continue
      ;;
  esac
  mv "$file" "$directory"
done
#-----5-----
ls -R
