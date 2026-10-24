#!/bin/bash

#-----1-----
df -h | awk 'NR > 1 {print $1, $5}'
#-----2-----
df -h | awk 'NR > 1 {print $1, $5}' | sed 's/%//g; s/dev/device/g' # g для всех вхождений
#-----3-----
for line in $(df -h | awk 'NR > 1 {print $1 "," $5}' | sed 's/%//g; s/dev/device/g'); do
  echo "$line" | awk -F',' '$2+0 > 80 {print "Использование системы " $1 " превышает 80%"}'
done
