#! /bin/bash
sed -i '54539,$d' allteams2010-present.csv
./deleteall.sh 
#backup the allteams2010-present data
cat allteams2010-present.csv >> allteams2010-present.backup
rm *.csv
./download.sh
./insertall.sh 
./megainsert.sh 
sed -f script.vim INSERTALL.sql > tempallmatches0.txt
./insertscores.sh 
awk -v OFS=, -f magical.awk tempallmatches0.txt htcs.txt > tempallmatches1.txt
awk -v OFS=, -f magical.awk tempallmatches1.txt cs.txt > tempallmatches2.txt
touch allteams.csv
 echo "Div,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HTHG,HTAG,HTR,PSH,PSD,PSA,HTCS,CS" > allteams20172018.csv
cat tempallmatches2.txt >> allteams20172018.csv
cat allteams2010-present.backup >> allteams2010-present.csv
sed -n '2,$p' allteams20172018.csv >> allteams2010-present.csv



