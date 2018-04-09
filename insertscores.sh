#! /bin/bash
awk -F, -f htcs.awk tempallmatches0.txt  >> htcs.txt
awk -F, -f cs.awk tempallmatches0.txt >> cs.txt
