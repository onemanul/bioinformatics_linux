#!/bin/bash

#-----1-----
mkdir -p backup
#----2,3----
for i in {1..7}; do
  mkdir -p backup/day_$i
  echo "Резервная копия за день $i" > "backup/day_$i/info.txt"
done
#-----4-----
mkdir -p all_backups
for i in {1..7}; do
  cp "backup/day_$i/info.txt" "all_backups/info_day_$i.txt"
done
#-----5-----
ls all_backups
