/*ALTER TABLE allmatches ADD COLUMN GP REAL;*/
ALTER TABLE allmatches ADD COLUMN T_HY REAL;
/*UPDATE leagues set GP=(SELECT COUNT(*) FROM allmatches WHERE division=leagues.d_vision);*/
/*UPDATE allmatches SET GP=(SELECT GP FROM leagues WHERE d_vision=allmatches.division);*/
UPDATE leagues SET T_HY=(SELECT SUM(HY) FROM allmatches WHERE division=leagues.d_vision);
UPDATE allmatches SET T_HY=(SELECT T_HY FROM leagues WHERE d_vision=allmatches.division);
ALTER TABLE allmatches ADD COLUMN avg_HY REAL;/* GP and T_HG need to start*/
UPDATE allmatches SET avg_HY= T_HY/GP;
ALTER TABLE allmatches ADD COLUMN T_AY REAL;
UPDATE leagues SET T_AY=(SELECT SUM(AY) FROM allmatches WHERE division=leagues.d_vision);
UPDATE allmatches SET T_AY=(SELECT T_AY FROM leagues WHERE d_vision=allmatches.division);
ALTER TABLE allmatches ADD COLUMN avg_AY REAL;
UPDATE allmatches SET avg_AY= T_AY/GP; 
ALTER TABLE allmatches ADD COLUMN team_HY REAL;
/*ALTER TABLE allmatches ADD COLUMN team_homeGP REAL;*/
ALTER TABLE allmatches ADD COLUMN team_AY REAL;
/*ALTER TABLE allmatches ADD COLUMN team_awayGP REAL;*/
UPDATE teams SET team_HY=(SELECT SUM(HY) FROM allmatches WHERE HomeTeam=teams.team);
/*UPDATE teams SET team_homeGP=(SELECT COUNT(*) FROM allmatches WHERE HomeTeam=teams.team);*/
UPDATE teams SET team_AY=(SELECT SUM(AY) FROM allmatches WHERE AwayTeam=teams.team);
/*UPDATE teams SET team_awayGP=(SELECT COUNT(*) FROM allmatches WHERE AwayTeam=teams.team);*/
UPDATE allmatches SET team_HY=(SELECT team_HY FROM teams WHERE team =allmatches.HomeTeam);
/*UPDATE allmatches SET team_homeGP=(SELECT team_homeGP FROM teams WHERE team=allmatches.HomeTeam);*/
UPDATE allmatches SET team_AY=(SELECT team_AY FROM teams WHERE team=allmatches.AwayTeam);
/*UPDATE allmatches SET team_awayGP=(SELECT team_awayGP FROM teams WHERE team=allmatches.AwayTeam);*/
ALTER TABLE  allmatches ADD COLUMN home_yas REAL;
ALTER TABLE  allmatches ADD COLUMN away_yas REAL;
UPDATE allmatches SET home_yas = round(((team_HY/team_homeGP)/avg_HY),2);
UPDATE allmatches SET away_yas = round(((team_AY/team_awayGP)/avg_AY),2);
ALTER TABLE allmatches add COLUMN team_HYC REAL;
ALTER TABLE allmatches add  COLUMN team_AYC REAL;
UPDATE teams SET team_HYC=(SELECT SUM(AY) FROM allmatches WHERE HomeTeam=teams.team);
UPDATE teams SET team_AYC=(SELECT SUM(HY) FROM allmatches WHERE AwayTeam=teams.team);
UPDATE allmatches SET team_HYC=(SELECT team_HYC FROM teams WHERE team =allmatches.HomeTeam);
UPDATE allmatches SET team_AYC=(SELECT team_AYC FROM teams WHERE team =allmatches.AwayTeam);
ALTER TABLE allmatches ADD COLUMN avg_HYC REAL;
ALTER TABLE allmatches ADD COLUMN avg_AYC REAL;
UPDATE allmatches SET avg_HYC=(T_AY/GP);
UPDATE allmatches SET avg_AYC=(T_HY/GP);
ALTER TABLE allmatches ADD COLUMN home_yds REAL;
ALTER TABLE allmatches ADD COLUMN away_yds REAL;
UPDATE allmatches SET home_yds = round(((team_HYC/team_homeGP)/avg_HYC),2);
UPDATE allmatches SET away_yds = round(((team_AYC/team_awayGP)/avg_AYC),2);
