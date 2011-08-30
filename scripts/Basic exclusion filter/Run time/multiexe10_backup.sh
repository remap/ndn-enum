#!/bin/bash

ccndstart

cd /home/nesl/workspace
./enumexe10.sh &
sleep 1

for ((i=1; i<=100; i++))
do
#  ccndstop &
#  sleep 1
#  ccndstart &
#  cd /home/nesl/workspace
#  ./enumexe10.sh &
#  sleep 1
  cd /home/nesl/workspace/enumapp/Debug
  ./enumapp /ndn/app/files >> ./enumlog/enumlog10.txt & 
#  ./enumapp /ndn/app/files
  echo "iteration $i is done."
  sleep 1
done
ccndstop
