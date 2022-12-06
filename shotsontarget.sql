/*ALTER TABLE allmatches ADD COLUMN GP REAL;*/
ALTER TABLE allmatches ADD COLUMN T_HST REAL;
/*UPDATE leagues set GP=(SELECT COUNT(*) FROM allmatches WHERE division=leagues.d_vision);*/
/*UPDATE allmatches SET GP=(SELECT GP FROM leagues WHERE d_vision=allmatches.division);*/
UPDATE leagues SET T_HST=(SELECT SUM(HST) FROM allmatches WHERE division=leagues.d_vision);
UPDATE allmatches SET T_HST=(SELECT T_HST FROM leagues WHERE d_vision=allmatches.division);
ALTER TABLE allmatches ADD COLUMN avg_HST REAL;/* GP and T_HG need to start*/
UPDATE allmatches SET avg_HST= T_HST/GP;
ALTER TABLE allmatches ADD COLUMN T_AST REAL;
UPDATE leagues SET T_AST=(SELECT SUM(AST) FROM allmatches WHERE division=leagues.d_vision);
UPDATE allmatches SET T_AST=(SELECT T_AST FROM leagues WHERE d_vision=allmatches.division);
ALTER TABLE allmatches ADD COLUMN avg_AST REAL;
UPDATE allmatches SET avg_AST= T_AST/GP; 
ALTER TABLE allmatches ADD COLUMN team_HST REAL;
/*ALTER TABLE allmatches ADD COLUMN team_homeGP REAL;*/
ALTER TABLE allmatches ADD COLUMN team_AST REAL;
/*ALTER TABLE allmatches ADD COLUMN team_awayGP REAL;*/
UPDATE teams SET team_HST=(SELECT SUM(HST) FROM allmatches WHERE HomeTeam=teams.team);
/*UPDATE teams SET team_homeGP=(SELECT COUNT(*) FROM allmatches WHERE HomeTeam=teams.team);*/
UPDATE teams SET team_AST=(SELECT SUM(AST) FROM allmatches WHERE AwayTeam=teams.team);
/*UPDATE teams SET team_awayGP=(SELECT COUNT(*) FROM allmatches WHERE AwayTeam=teams.team);*/
UPDATE allmatches SET team_HST=(SELECT team_HST FROM teams WHERE team =allmatches.HomeTeam);
/*UPDATE allmatches SET team_homeGP=(SELECT team_homeGP FROM teams WHERE team=allmatches.HomeTeam);*/
UPDATE allmatches SET team_AST=(SELECT team_AST FROM teams WHERE team=allmatches.AwayTeam);
/*UPDATE allmatches SET team_awayGP=(SELECT team_awayGP FROM teams WHERE team=allmatches.AwayTeam);*/
ALTER TABLE  allmatches ADD COLUMN home_sotas REAL;
ALTER TABLE  allmatches ADD COLUMN away_sotas REAL;
UPDATE allmatches SET home_sotas = round(((team_HST/team_homeGP)/avg_HST),2);
UPDATE allmatches SET away_sotas = round(((team_AST/team_awayGP)/avg_AST),2);
ALTER TABLE allmatches add COLUMN team_HSTC REAL;
ALTER TABLE allmatches add  COLUMN team_ASTC REAL;
UPDATE teams SET team_HSTC=(SELECT SUM(AST) FROM allmatches WHERE HomeTeam=teams.team);
UPDATE teams SET team_ASTC=(SELECT SUM(HST) FROM allmatches WHERE AwayTeam=teams.team);
UPDATE allmatches SET team_HSTC=(SELECT team_HSTC FROM teams WHERE team =allmatches.HomeTeam);
UPDATE allmatches SET team_ASTC=(SELECT team_ASTC FROM teams WHERE team =allmatches.AwayTeam);
ALTER TABLE allmatches ADD COLUMN avg_HSTC REAL;
ALTER TABLE allmatches ADD COLUMN avg_ASTC REAL;
UPDATE allmatches SET avg_HSTC=(T_AST/GP);
UPDATE allmatches SET avg_ASTC=(T_HST/GP);
ALTER TABLE allmatches ADD COLUMN home_sotds REAL;
ALTER TABLE allmatches ADD COLUMN away_sotds REAL;
UPDATE allmatches SET home_sotds = round(((team_HSTC/team_homeGP)/avg_HSTC),2);
UPDATE allmatches SET away_sotds = round(((team_ASTC/team_awayGP)/avg_ASTC),2);
