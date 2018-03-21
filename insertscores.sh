#! /bin/bash
awk -F, -f htcs.awk ~/SQLITE/tempallmatches0.txt  >> htcs.txt
awk -F, -f cs.awk ~/SQLITE/tempallmatches0.txt >> cs.txt
