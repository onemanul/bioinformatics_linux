#!/bin/bash

file_path=$1
actual_extension=$2
new_extension=$3

if [[ $# -ne 3 ]]; then
  echo "Неверное количество аргументов, должно быть 3"
  exit 1
fi

case "$actual_extension" in
  txt|pdf|doc) ;;
  *)
    echo -e "Недопустимое расширение: $actual_extension\nДопустимые расширения: txt, pdf, doc";
    exit 1
    ;;
esac

case "$new_extension" in
  txt|pdf|doc) ;;
  *)
    echo -e "Недопустимое расширение: $new_extension\nДопустимые расширения: txt, pdf, doc";
    exit 1
    ;;
esac

if [[ "$new_extension" == "$actual_extension" ]]; then
  echo "Старое и новое расширения совпадают"
  exit 1
fi

if [[ ! -f "$file_path" ]]; then
  echo "Файл не найден: $file_path"
  exit 1
fi

if [[ "${file_path##*.}" != "$actual_extension" ]]; then
  echo "У файла расширение не $actual_extension"
  exit 1
fi

if mv "$file_path" "${file_path%.*}.$new_extension"; then
  echo "Расширение файла успешно изменено на $new_extension"
else
  echo "Не удалось изменить расширение файла"
  exit 1
fi
