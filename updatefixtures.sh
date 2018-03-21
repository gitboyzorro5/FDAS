#! /bin/bash 
sed -i '1,$d' fixtures.sql
awk -F, -f in_fixtures.awk ~/SQLITE/fixtures.csv | sed '1d'| sed "s/'Nott'm Forest'/'Nottm Forest'/g" | sed "s/'M'gladbach'/'Mgladbach'/g" >> ~/SQLITE/fixtures.sql	

