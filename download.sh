#! /bin/bash 
fixtures=$(sed -n '1p' league.txt)
E0=$(sed -n '2p' league.txt)
E1=$(sed -n '3p' league.txt)
E2=$(sed -n '4p' league.txt)
E3=$(sed -n '5p' league.txt)
#EC=$(sed -n '6p' league.txt)
D1=$(sed -n '7p' league.txt)
D2=$(sed -n '8p' league.txt)
SP1=$(sed -n '9p' league.txt)
SP2=$(sed -n '10p' league.txt)
I1=$(sed -n '11p' league.txt)
#I2=$(sed -n '12p' league.txt)
F1=$(sed -n '13p' league.txt)
F2=$(sed -n '14p' league.txt)
SC0=$(sed -n '15p' league.txt)
#SC1=$(sed -n '16p' league.txt)
#SC2=$(sed -n '17p' league.txt)
#SC3=$(sed -n '18p' league.txt)
B1=$(sed -n '19p' league.txt)
P1=$(sed -n '20p' league.txt)
N1=$(sed -n '21p' league.txt)
G1=$(sed -n '22p' league.txt)
T1=$(sed -n '23p' league.txt)
#E0=$(sed -n '2p' league.txt)

curl $fixtures >> fixtures.csv
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
