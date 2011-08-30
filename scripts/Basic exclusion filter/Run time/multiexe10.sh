#!/bin/bash

ccndstop
ccndstart

# ccnput, inject the names to ccn
cd /home/nesl/workspace
./enumexe10.sh &
sleep 1

for ((i=1; i<=100; i++))
do
  cd /home/nesl/workspace/enumapp/Debug
#  ./enumapp /ndn/app/files | tail -n 1 >> ./enumlog/enumlog10.txt & 
  ./enumapp /ndn/app/files >> ./enumlog/enumlog10_nosleep.txt
  echo "iteration $i is done."
#  sleep 1
done
ccndstop
