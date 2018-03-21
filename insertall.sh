#! /bin/bash	
# insert E0 E1 E2 E3 EC
awk -F, -f in_E0.awk ~/SQLITE/E0.csv | sed '1d' >> ~/SQLITE/eoib.sql
awk -F, -f in_E1.awk ~/SQLITE/E1.csv | sed '1d'| sed "s/'Nott'm Forest'/'Nottm Forest'/g" >> ~/SQLITE/e1ib.sql	
awk -F, -f in_E2.awk ~/SQLITE/E2.csv | sed '1d' >> ~/SQLITE/e2ib.sql
awk -F, -f in_E3.awk ~/SQLITE/E3.csv | sed '1d' >> ~/SQLITE/e3ib.sql
awk -F, -f in_EC.awk ~/SQLITE/EC.csv | sed '1d' >> ~/SQLITE/ecib.sql	
# insert SP1 SP2 D1 D2 F1 F2 I1 I2
awk -F, -f in_SP1.awk ~/SQLITE/SP1.csv | sed '1d' >> ~/SQLITE/sp1ib.sql	
awk -F, -f in_SP2.awk ~/SQLITE/SP2.csv | sed '1d' >> ~/SQLITE/sp2ib.sql	
awk -F, -f in_D1.awk ~/SQLITE/D1.csv | sed '1d'| sed "s/'M'gladbach'/'Mgladbach'/g" >> ~/SQLITE/d1ib.sql	
awk -F, -f in_D2.awk ~/SQLITE/D2.csv | sed '1d' >> ~/SQLITE/d2ib.sql	
awk -F, -f in_F1.awk ~/SQLITE/F1.csv | sed '1d' >> ~/SQLITE/f1ib.sql	
awk -F, -f in_F2.awk ~/SQLITE/F2.csv | sed '1d' >> ~/SQLITE/f2ib.sql	
awk -F, -f in_I1.awk ~/SQLITE/I1.csv | sed '1d' >> ~/SQLITE/i1ib.sql	
awk -F, -f in_I2.awk ~/SQLITE/I2.csv | sed '1d' >> ~/SQLITE/i2ib.sql	
# insert P1 N1 B1 T1 G1
awk -F, -f in_P1.awk ~/SQLITE/P1.csv | sed '1d' >> ~/SQLITE/p1ib.sql
awk -F, -f in_N1.awk ~/SQLITE/N1.csv | sed '1d' >> ~/SQLITE/n1ib.sql	
awk -F, -f in_B1.awk ~/SQLITE/B1.csv | sed '1d' >> ~/SQLITE/b1ib.sql 
awk -F, -f in_T1.awk ~/SQLITE/T1.csv | sed '1d' >> ~/SQLITE/t1ib.sql 
awk -F, -f in_G1.awk ~/SQLITE/G1.csv | sed '1d' >> ~/SQLITE/g1ib.sql
#insert SC0 SC1 SC2 SC3
awk -F, -f in_SC0.awk ~/SQLITE/SC0.csv | sed '1d' >> ~/SQLITE/sc0ib.sql
awk -F, -f in_SC1.awk ~/SQLITE/SC1.csv | sed '1d' >> ~/SQLITE/sc1ib.sql
awk -F, -f in_SC2.awk ~/SQLITE/SC2.csv | sed '1d' >> ~/SQLITE/sc2ib.sql
awk -F, -f in_SC3.awk ~/SQLITE/SC3.csv | sed '1d' >> ~/SQLITE/sc3ib.sql
#insert into fixtures
awk -F, -f in_fixtures.awk ~/SQLITE/fixtures.csv | sed '1d'| sed "s/'Nott'm Forest'/'Nottm Forest'/g" | sed  "s/'M'gladbach'/'Mgladbach'/g" >> ~/SQLITE/fixtures.SQLITE
awk -F, -f htcs.awk ~/SQLITE/tempallmatches0.txt | sed '1d' >> htcs.txt
awk -F, -f cs.awk ~/SQLITE/tempallmatches0.txt | sed '1d' >> cs.txt
