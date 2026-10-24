#!/bin/bash

#-----1-----
mkdir -p logs
#----2,3----
for i in {1..10}; do
  name=$(printf "log_%02d.txt" "$i") # целое число, min 2 знака, дозаполнять нулями
  echo "Это лог номер $i" > "logs/$name"
done
#-----4-----
for f in logs/*.txt; do
  cat "$f"
done
#-----5-----
for i in {1..10}; do
  if [[ $(( i % 2 )) -eq 0 ]]; then
    rm "logs/$(printf "log_%02d.txt" "$i")"
  fi
done
