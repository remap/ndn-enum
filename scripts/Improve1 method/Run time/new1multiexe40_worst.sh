#!/bin/bash

ccndstop
ccndstart

# ccnput, inject the names to ccn
cd /home/nesl/workspace
./new1enumexe40_worst.sh &
sleep 1

for ((i=1; i<=100; i++))
do
  cd /home/nesl/workspace/newenumapp/Debug
  ./enumapp /ndn/app/files | tail -n 1 >> ./new1enumlog_worst/enumlog40.txt &
  sleep 1 
  echo "iteration $i is done."
done
ccndstop
