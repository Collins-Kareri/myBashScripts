#!/bin/bash
number_regex='^[0-9]+$'

echo Enter the port to close:
while read port; do
  if ! [[ $port =~ $number_regex ]] ; then
    continue
  fi
  sudo kill $(sudo lsof -t -i:$port)
  break
done

echo Port now available
