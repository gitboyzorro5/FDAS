#! /bin/bash 
fixtures=$(sed -n '1p' league.txt)
new_league_fixtures=$(sed -n '39p' league.txt)
E0=$(sed -n '2p' league.txt)
E1=$(sed -n '3p' league.txt)
E2=$(sed -n '4p' league.txt)
E3=$(sed -n '5p' league.txt)
EC=$(sed -n '6p' league.txt)
D1=$(sed -n '7p' league.txt)
D2=$(sed -n '8p' league.txt)
SP1=$(sed -n '9p' league.txt)
SP2=$(sed -n '10p' league.txt)
I1=$(sed -n '11p' league.txt)
I2=$(sed -n '12p' league.txt)
F1=$(sed -n '13p' league.txt)
F2=$(sed -n '14p' league.txt)
SC0=$(sed -n '15p' league.txt)
SC1=$(sed -n '16p' league.txt)
SC2=$(sed -n '17p' league.txt)
SC3=$(sed -n '18p' league.txt)
ARG=$(sed -n '24p' league.txt)
AUT=$(sed -n '25p' league.txt)
BRA=$(sed -n '26p' league.txt)
CHN=$(sed -n '27p' league.txt)
DNK=$(sed -n '28p' league.txt)
FIN=$(sed -n '29p' league.txt)
IRL=$(sed -n '30p' league.txt)
JPN=$(sed -n '31p' league.txt)
MEX=$(sed -n '32p' league.txt)
NOR=$(sed -n '33p' league.txt)
POL=$(sed -n '34p' league.txt)
ROU=$(sed -n '35p' league.txt)
RUS=$(sed -n '36p' league.txt)
SWE=$(sed -n '37p' league.txt)
USA=$(sed -n '38p' league.txt)
B1=$(sed -n '19p' league.txt)
P1=$(sed -n '20p' league.txt)
SWZ=$(sed -n '40p' league.txt)
N1=$(sed -n '21p' league.txt)
G1=$(sed -n '22p' league.txt)
T1=$(sed -n '23p' league.txt)
#E0=$(sed -n '2p' league.txt)

curl $fixtures >> fixtures.csv
curl $new_league_fixtures >> new_league_fixtures.csv
curl $E0 >> E0.csv
curl $E1 >> E1.csv
curl $E2 >> E2.csv
curl $E3 >> E3.csv
curl $EC >> EC.csv
curl $D1 >> D1.csv
curl $D2 >> D2.csv
curl $SP1 >> SP1.csv
curl $SP2 >> SP2.csv
curl $F1 >> F1.csv
curl $F2 >> F2.csv
curl $I1 >> I1.csv
curl $I2 >> I2.csv
curl $SC0 >> SC0.csv
curl $SC1 >> SC1.csv
curl $SC2 >> SC2.csv
curl $SC3 >> SC3.csv
curl $P1 >> P1.csv
curl $B1 >> B1.csv
curl $N1 >> N1.csv
curl $G1 >> G1.csv
curl $T1 >> T1.csv
curl $ARG >> ARG.csv
curl $AUT >> AUT.csv
curl $BRA >> BRA.csv
curl $CHN >> CHN.csv
curl $DNK >> DNK.csv
curl $FIN >> FIN.csv
curl $IRL >> IRL.csv
curl $JPN >> JPN.csv
curl $MEX >> MEX.csv
curl $NOR >> NOR.csv
curl $POL >> POL.csv
curl $ROU >> ROU.csv
curl $RUS >> RUS.csv
curl $SWE >> SWE.csv
curl $USA >> USA.csv
curl $SWZ >> SWZ.csv

curl --insecure https://statbunker.com/competitions/PlayerStandings?comp_id=689 >> e0_scorers.html
curl --insecure https://statbunker.com/competitions/PlayerStandings?comp_id=690 >> e1_scorers.html
curl --insecure https://statbunker.com/competitions/PlayerStandings?comp_id=692 >> e2_scorers.html
curl --insecure https://statbunker.com/competitions/PlayerStandings?comp_id=697 >> e3_scorers.html
curl --insecure https://statbunker.com/competitions/PlayerStandings?comp_id=702 >> d1_scorers.html
curl --insecure https://statbunker.com/competitions/PlayerStandings?comp_id=698 >> sp1_scorers.html
curl --insecure https://statbunker.com/competitions/PlayerStandings?comp_id=696 >> i1_scorers.html
curl --insecure https://statbunker.com/competitions/PlayerStandings?comp_id=695 >> f1_scorers.html
curl --insecure https://statbunker.com/competitions/PlayerStandings?comp_id=691 >> sc0_scorers.html
curl --insecure https://statbunker.com/competitions/PlayerStandings?comp_id=684 >> mls_scorers.html



