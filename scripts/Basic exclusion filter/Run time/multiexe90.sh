#!/bin/bash

ccndstop
ccndstart

cd /home/nesl/workspace
./enumexe90.sh &
sleep 1

for ((i=1; i<=100; i++))
do
  cd /home/nesl/workspace/enumapp/Debug
  ./enumapp /ndn/app/files | tail -n 1 >> ./enumlog/enumlog90.txt &
  sleep 1 
  echo "iteration $i is done.\n"
done
ccndstop
