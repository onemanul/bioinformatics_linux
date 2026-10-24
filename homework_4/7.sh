#!/bin/bash

#---1,2,3---
mkdir -p my_project/{src,docs,tests,build}/{images,scripts,data}
#-----4-----
for d in $(find my_project -type d); do
  echo "Создана директория: $d"
done
#-----5-----
touch my_project/README.md
