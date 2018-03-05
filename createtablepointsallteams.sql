CREATE TABLE points_allteams(Team text,H_wins integer,A_wins integer,Draws integer,total_points integer,goal_diff integer);
insert into points_allteams(Team) select HomeTeam from ALLTEAMS group by HomeTeam;
update points_allteams set H_wins=(select count(*) from ALLTEAMS where HomeTeam=Team and FTR='H');
update points_allteams set A_wins=(select count(*) from ALLTEAMS where AwayTeam=Team and FTR='A');
update points_allteams set Draws=(select count(*) from ALLTEAMS where HomeTeam=Team and FTR='D' or AwayTeam=Team and FTR='D');
update points_allteams set total_points=(H_wins + A_wins)*3 + Draws*1;
update points_allteams set goal_diff=((select sum(FTHG) from ALLTEAMS where HomeTeam=Team) + (select sum(FTAG) from ALLTEAMS where AwayTeam=Team)) - ((select sum(FTAG)from ALLTEAMS where HomeTeam=Team) +  (select sum(FTHG) from ALLTEAMS where AwayTeam=Team));
