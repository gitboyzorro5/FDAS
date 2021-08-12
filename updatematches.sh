#! /bin/bash
sed -i '70039,$d' allteams2010-present.csv
./deleteall.sh 
#backup the allteams2010-present data
#cat allteams2010-present.csv >> allteams2010-present.backup
mv allteams20182019.csv allteams20182019.bak
mv allteams20192020.csv allteams20192020.bak
mv leaguetable2010-present.csv leaguetable2010-present.bak
rm *.csv
mv allteams20182019.bak allteams20182019.csv
mv allteams20192020.bak allteams20192020.csv
mv leaguetable2010-present.bak leaguetable2010-present.csv
./download.sh
./insertall.sh 
./megainsert.sh 
sed -f script.vim INSERTALL.sql > tempallmatches0.txt
./insertscores.sh 
awk -v OFS=, -f magical.awk tempallmatches0.txt htcs.txt > tempallmatches1.txt
awk -v OFS=, -f magical.awk tempallmatches1.txt cs.txt > tempallmatches2.txt
 echo "Div,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HTHG,HTAG,HTR,PSH,PSD,PSA,HTCS,CS" > allteams20212022.csv
#cat tempallmatches2.txt >> allteams20212022.csv
cut -d, -f1,1,2,3,4,5,6,7,8,9,10,11,12,13,18,19 tempallmatches2.txt >> allteams20212022.csv
 echo "Div,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HTHG,HTAG,HTR,PSH,PSD,PSA,HTCS,CS,HS,HST,AS,AST" > allteams20212022SOT.csv
awk -F, '{printf("'%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s'\n",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$18,$19,$14,$15,$16,$17)}' tempallmatches2.txt >> allteams20212022SOT.csv
cat allteams2010-present.backup >> allteams2010-present.csv
sed -n '2,$p' allteams20212022.csv >> allteams2010-present.csv
sed -i -e 's/\x92//g' EC.csv
sed -i -e "s/Nott'm Forest/Nottm Forest/g" E1.csv	
sed -i -e "s/M'gladbach/Mgladbach/g" D1.csv 	
sed -i -e "s/Nott'm Forest/Nottm Forest/g" fixtures.csv	
sed -i -e "s/M'gladbach/Mgladbach/g" fixtures.csv 	
sed -f insertallmatches.vim INSERTALL.sql > insertallmatches.sql
sed -i -e 's/\x92//g' fixtures.csv
sed -i -e "s/Switzerland,Super League/Switzerland,Swiss/g" new_league_fixtures.csv
