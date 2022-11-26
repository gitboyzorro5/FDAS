#! /bin/bash	
# insert E0 E1 E2 E3 EC
awk -F, -f in_E0.awk E0.csv | sed '1d' | sed "s/'Nott'm Forest'/'Nottm Forest'/g" >> eoib.sql
awk -F, -f in_E1.awk E1.csv | sed '1d' >> e1ib.sql	
awk -F, -f in_E2.awk E2.csv | sed '1d' >> e2ib.sql
awk -F, -f in_E3.awk E3.csv | sed '1d' >> e3ib.sql
awk -F, -f in_EC.awk EC.csv | sed '1d'| sed "s/\x92//g"  >> ecib.sql	
# insert SP1 SP2 D1 D2 F1 F2 I1 I2
awk -F, -f in_SP1.awk SP1.csv | sed '1d' >> sp1ib.sql	
awk -F, -f in_SP2.awk SP2.csv | sed '1d' >> sp2ib.sql	
awk -F, -f in_D1.awk D1.csv | sed '1d'| sed "s/'M'gladbach'/'Mgladbach'/g" >> d1ib.sql	
awk -F, -f in_D2.awk D2.csv | sed '1d' >> d2ib.sql	
awk -F, -f in_F1.awk F1.csv | sed '1d' >> f1ib.sql	
awk -F, -f in_F2.awk F2.csv | sed '1d' >> f2ib.sql	
awk -F, -f in_I1.awk I1.csv | sed '1d' >> i1ib.sql	
awk -F, -f in_I2.awk I2.csv | sed '1d' >> i2ib.sql	
# insert P1 N1 B1 T1 G1
awk -F, -f in_P1.awk P1.csv | sed '1d' >> p1ib.sql
awk -F, -f in_N1.awk N1.csv | sed '1d' >> n1ib.sql	
awk -F, -f in_B1.awk B1.csv | sed '1d' >> b1ib.sql 
awk -F, -f in_T1.awk T1.csv | sed '1d' >> t1ib.sql 
awk -F, -f in_G1.awk G1.csv | sed '1d' >> g1ib.sql
#insert SC0 SC1 SC2 SC3
awk -F, -f in_SC0.awk SC0.csv | sed '1d' >> sc0ib.sql
awk -F, -f in_SC1.awk SC1.csv | sed '1d' >> sc1ib.sql
awk -F, -f in_SC2.awk SC2.csv | sed '1d' >> sc2ib.sql
awk -F, -f in_SC3.awk SC3.csv | sed '1d' >> sc3ib.sql
#insert into fixtures
#awk -F, -f in_fixtures.awk fixtures.csv | sed '1d'| sed "s/'Nott'm Forest'/'Nottm Forest'/g" | sed  "s/'M'gladbach'/'Mgladbach'/g" >> fixtures.
awk -F, -f htcs.awk tempallmatches0.txt | sed '1d' >> htcs.txt
awk -F, -f cs.awk tempallmatches0.txt | sed '1d' >> cs.txt
