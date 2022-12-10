/*ALTER TABLE allmatches ADD COLUMN GP REAL;*/
ALTER TABLE allmatches ADD COLUMN T_HCO REAL;
/*UPDATE leagues set GP=(SELECT COUNT(*) FROM allmatches WHERE division=leagues.d_vision);*/
/*UPDATE allmatches SET GP=(SELECT GP FROM leagues WHERE d_vision=allmatches.division);*/
UPDATE leagues SET T_HCO=(SELECT SUM(HCO) FROM allmatches WHERE division=leagues.d_vision);
UPDATE allmatches SET T_HCO=(SELECT T_HCO FROM leagues WHERE d_vision=allmatches.division);
ALTER TABLE allmatches ADD COLUMN avg_HCO REAL;/* GP and T_HG need to start*/
UPDATE allmatches SET avg_HCO= T_HCO/GP;
ALTER TABLE allmatches ADD COLUMN T_ACO REAL;
UPDATE leagues SET T_ACO=(SELECT SUM(ACO) FROM allmatches WHERE division=leagues.d_vision);
UPDATE allmatches SET T_ACO=(SELECT T_ACO FROM leagues WHERE d_vision=allmatches.division);
ALTER TABLE allmatches ADD COLUMN avg_ACO REAL;
UPDATE allmatches SET avg_ACO= T_ACO/GP; 
ALTER TABLE allmatches ADD COLUMN team_HCO REAL;
/*ALTER TABLE allmatches ADD COLUMN team_homeGP REAL;*/
ALTER TABLE allmatches ADD COLUMN team_ACO REAL;
/*ALTER TABLE allmatches ADD COLUMN team_awayGP REAL;*/
UPDATE teams SET team_HCO=(SELECT SUM(HCO) FROM allmatches WHERE HomeTeam=teams.team);
/*UPDATE teams SET team_homeGP=(SELECT COUNT(*) FROM allmatches WHERE HomeTeam=teams.team);*/
UPDATE teams SET team_ACO=(SELECT SUM(ACO) FROM allmatches WHERE AwayTeam=teams.team);
/*UPDATE teams SET team_awayGP=(SELECT COUNT(*) FROM allmatches WHERE AwayTeam=teams.team);*/
UPDATE allmatches SET team_HCO=(SELECT team_HCO FROM teams WHERE team =allmatches.HomeTeam);
/*UPDATE allmatches SET team_homeGP=(SELECT team_homeGP FROM teams WHERE team=allmatches.HomeTeam);*/
UPDATE allmatches SET team_ACO=(SELECT team_ACO FROM teams WHERE team=allmatches.AwayTeam);
/*UPDATE allmatches SET team_awayGP=(SELECT team_awayGP FROM teams WHERE team=allmatches.AwayTeam);*/
ALTER TABLE  allmatches ADD COLUMN home_coas REAL;
ALTER TABLE  allmatches ADD COLUMN away_coas REAL;
UPDATE allmatches SET home_coas = round(((team_HCO/team_homeGP)/avg_HCO),2);
UPDATE allmatches SET away_coas = round(((team_ACO/team_awayGP)/avg_ACO),2);
ALTER TABLE allmatches add COLUMN team_HCOC REAL;
ALTER TABLE allmatches add  COLUMN team_ACOC REAL;
UPDATE teams SET team_HCOC=(SELECT SUM(ACO) FROM allmatches WHERE HomeTeam=teams.team);
UPDATE teams SET team_ACOC=(SELECT SUM(HCO) FROM allmatches WHERE AwayTeam=teams.team);
UPDATE allmatches SET team_HCOC=(SELECT team_HCOC FROM teams WHERE team =allmatches.HomeTeam);
UPDATE allmatches SET team_ACOC=(SELECT team_ACOC FROM teams WHERE team =allmatches.AwayTeam);
ALTER TABLE allmatches ADD COLUMN avg_HCOC REAL;
ALTER TABLE allmatches ADD COLUMN avg_ACOC REAL;
UPDATE allmatches SET avg_HCOC=(T_ACO/GP);
UPDATE allmatches SET avg_ACOC=(T_HCO/GP);
ALTER TABLE allmatches ADD COLUMN home_cods REAL;
ALTER TABLE allmatches ADD COLUMN away_cods REAL;
UPDATE allmatches SET home_cods = round(((team_HCOC/team_homeGP)/avg_HCOC),2);
UPDATE allmatches SET away_cods = round(((team_ACOC/team_awayGP)/avg_ACOC),2);
