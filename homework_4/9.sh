#!/bin/bash

#-----0-----
touch document{1..5}.txt
#-----1-----
mkdir -p renamed
#---2,3,4---
while read -r fl; do
  mv "$fl" "renamed/${fl/document/file}"    # ${переменная/шаблон/замена}
done < <(ls document*.txt)
#-----5-----
ls renamed
