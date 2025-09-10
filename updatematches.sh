#! /bin/bash
sed -i '123412,$d' allteams2010-present.csv
sed -i '23310,$d' allteams2023-presentSOT.csv
./deleteall.sh 
#backup the allteams2010-present data
#cat allteams2010-present.csv >> allteams2010-present.backup
mv allteams20182019.csv allteams20182019.bak
mv allteams20192020.csv allteams20192020.bak
mv allteams20212022.csv allteams20212022.bak
mv leaguetable2010-present.csv leaguetable2010-present.bak
rm *.csv
rm *.html
mv allteams20182019.bak allteams20182019.csv
mv allteams20192020.bak allteams20192020.csv
mv allteams20212022.bak allteams20212022.csv
mv leaguetable2010-present.bak leaguetable2010-present.csv
./download.sh
sed -i -n '/[^ ,]/p' B1.csv
./insertall.sh 
./megainsert.sh 
sed -f script.vim INSERTALL.sql > tempallmatches0.txt
./insertscores.sh 
awk -v OFS=, -f magical.awk tempallmatches0.txt htcs.txt > tempallmatches1.txt
awk -v OFS=, -f magical.awk tempallmatches1.txt cs.txt > tempallmatches2.txt
 echo "Div,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HTHG,HTAG,HTR,PSH,PSD,PSA,HTCS,CS" > allteams20252026.csv
#cat tempallmatches2.txt >> allteams20252026.csv
cut -d, -f1,1,2,3,4,5,6,7,8,9,10,11,12,13,26,27 tempallmatches2.txt >> allteams20252026.csv
 echo "Div,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HTHG,HTAG,HTR,PSH,PSD,PSA,HTCS,CS,HS,HST,AS,AST,HY,AY,HR,AR,HCO,ACO,HF,AF" > allteams20252026SOT.csv
awk -F, '{printf("'%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s'\n",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$26,$27,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25)}' tempallmatches2.txt >> allteams20252026SOT.csv
cat allteams2010-present.backup >> allteams2010-present.csv
cat allteams2023-presentSOT.backup >> allteams2023-presentSOT.csv
sed -n '2,$p' allteams20252026.csv >> allteams2010-present.csv
sed -n '2,$p' allteams20252026SOT.csv >> allteams2023-presentSOT.csv
#cat allteams20252026SOT.csv >> allteams2023-presentSOT.csv
sed -i -e 's/\x92//g' EC.csv
sed -i -e "s/Nott'm Forest/Nottm Forest/g" E0.csv	
sed -i -e "s/M'gladbach/Mgladbach/g" D1.csv 	
sed -i -e "s/Apollon Apollon/Apollon/g" G1.csv 	
sed -i -e "s/Nott'm Forest/Nottm Forest/g" fixtures.csv	
sed -i -e "s/M'gladbach/Mgladbach/g" fixtures.csv
sed -i -n '/[^ ,]/p' B1.csv
sed -f insertallmatches.vim INSERTALL.sql > insertallmatches.sql
sed -i -e 's/\x92//g' fixtures.csv
sed -i -e "s/Switzerland,Super League/Switzerland,Swiss/g" new_league_fixtures.csv
sed -i -e "s/Wolfsberger AC/Wolfsberger/g" new_league_fixtures.csv
sed -i -e "s/Bundesliga/Admiral Bundesliga/g" new_league_fixtures.csv
sed -i -e "s/Colon Santa Fe/Colon Santa FE/g" new_league_fixtures.csv
sed -i -e "s/Colon Santa Fe/Colon Santa FE/g" ARG.csv
sed -i -f autwolfberger.vim AUT.csv
sed -i -f autwolfberger.vim new_league_fixtures.csv
sed -i -f russovetov.vim RUS.csv
sed -i -f russovetov.vim new_league_fixtures.csv
sed -i -e 's:<th class="nonMob" title="Yellow"><img src="/images/yellowCard.png" alt="Yellow Card"></th>:<th class="nonMob" title="Yellow">Yellow</th>:g' *.html
sed -i -e 's:<th class="nonMob" title="Yellow - Red"><img src="/images/redYellow.png" alt="Red and Yellow Card"></th>:<th class="nonMob" title="Yellow - Red">YellowRed</th>:g' *.html
sed -i -e 's:<th class="nonMob" title="Red"><img src="/images/redCard.png" alt="Red Card"></th>:<th class="nonMob" title="Red">Red</th>:g' *.html
