/*ALTER TABLE allmatches ADD COLUMN GP REAL;*/
ALTER TABLE allmatches ADD COLUMN T_HF REAL;
/*UPDATE leagues set GP=(SELECT COUNT(*) FROM allmatches WHERE division=leagues.d_vision);*/
/*UPDATE allmatches SET GP=(SELECT GP FROM leagues WHERE d_vision=allmatches.division);*/
UPDATE leagues SET T_HF=(SELECT SUM(HF) FROM allmatches WHERE division=leagues.d_vision);
UPDATE allmatches SET T_HF=(SELECT T_HF FROM leagues WHERE d_vision=allmatches.division);
ALTER TABLE allmatches ADD COLUMN avg_HF REAL;/* GP and T_HG need to start*/
UPDATE allmatches SET avg_HF= T_HF/GP;
ALTER TABLE allmatches ADD COLUMN T_AF REAL;
UPDATE leagues SET T_AF=(SELECT SUM(AF) FROM allmatches WHERE division=leagues.d_vision);
UPDATE allmatches SET T_AF=(SELECT T_AF FROM leagues WHERE d_vision=allmatches.division);
ALTER TABLE allmatches ADD COLUMN avg_AF REAL;
UPDATE allmatches SET avg_AF= T_AF/GP; 
ALTER TABLE allmatches ADD COLUMN team_HF REAL;
/*ALTER TABLE allmatches ADD COLUMN team_homeGP REAL;*/
ALTER TABLE allmatches ADD COLUMN team_AF REAL;
/*ALTER TABLE allmatches ADD COLUMN team_awayGP REAL;*/
UPDATE teams SET team_HF=(SELECT SUM(HF) FROM allmatches WHERE HomeTeam=teams.team);
/*UPDATE teams SET team_homeGP=(SELECT COUNT(*) FROM allmatches WHERE HomeTeam=teams.team);*/
UPDATE teams SET team_AF=(SELECT SUM(AF) FROM allmatches WHERE AwayTeam=teams.team);
/*UPDATE teams SET team_awayGP=(SELECT COUNT(*) FROM allmatches WHERE AwayTeam=teams.team);*/
UPDATE allmatches SET team_HF=(SELECT team_HF FROM teams WHERE team =allmatches.HomeTeam);
/*UPDATE allmatches SET team_homeGP=(SELECT team_homeGP FROM teams WHERE team=allmatches.HomeTeam);*/
UPDATE allmatches SET team_AF=(SELECT team_AF FROM teams WHERE team=allmatches.AwayTeam);
/*UPDATE allmatches SET team_awayGP=(SELECT team_awayGP FROM teams WHERE team=allmatches.AwayTeam);*/
ALTER TABLE  allmatches ADD COLUMN home_fas REAL;
ALTER TABLE  allmatches ADD COLUMN away_fas REAL;
UPDATE allmatches SET home_fas = round(((team_HF/team_homeGP)/avg_HF),2);
UPDATE allmatches SET away_fas = round(((team_AF/team_awayGP)/avg_AF),2);
ALTER TABLE allmatches add COLUMN team_HFCO REAL;
ALTER TABLE allmatches add  COLUMN team_AFCO REAL;
UPDATE teams SET team_HFCO=(SELECT SUM(AF) FROM allmatches WHERE HomeTeam=teams.team);
UPDATE teams SET team_AFCO=(SELECT SUM(HF) FROM allmatches WHERE AwayTeam=teams.team);
UPDATE allmatches SET team_HFCO=(SELECT team_HFCO FROM teams WHERE team =allmatches.HomeTeam);
UPDATE allmatches SET team_AFCO=(SELECT team_AFCO FROM teams WHERE team =allmatches.AwayTeam);
ALTER TABLE allmatches ADD COLUMN avg_HFCO REAL;
ALTER TABLE allmatches ADD COLUMN avg_AFCO REAL;
UPDATE allmatches SET avg_HFCO=(T_AF/GP);
UPDATE allmatches SET avg_AFCO=(T_HF/GP);
ALTER TABLE allmatches ADD COLUMN home_fds REAL;
ALTER TABLE allmatches ADD COLUMN away_fds REAL;
UPDATE allmatches SET home_fds = round(((team_HFCO/team_homeGP)/avg_HFCO),2);
UPDATE allmatches SET away_fds = round(((team_AFCO/team_awayGP)/avg_AFCO),2);
