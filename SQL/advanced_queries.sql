create database ipl_2022;
select * from ipl_ball_by_ball_2022;
select * from ipl_matches_2022;

-- What is the percentage of wins of each team?
with team_win as (select WinningTeam ,count(*) as no_of_win
from ipl_matches_2022
where WinningTeam is not NULL
group by 1
),
total_matches as ( select Team, COUNT(*) as total_matches
from (
    select Team1 as Team from ipl_matches_2022
    union all
    select Team2 as Team from ipl_matches_2022
) as AllTeams
group by 1
)select w.WinningTeam, w.no_of_win, m.total_matches, round((w.no_of_win*100/m.total_matches),2) as perc
from total_matches m
inner join team_win w
on w.WinningTeam = m.Team
group by 1,2,3
order by perc desc;

-- Which venue results in a win for Batting first team and vice versa?
select Venue, WinningTeam
from ipl_matches_2022
where WonBy = 'Runs' and WonBy is not null;

-- Who is the most consistent batsman and bowler in each team and also in the entire league?

-- BATSMAN PERFORMANCE ===========================================================================

with batsman as (select batter, sum(batsman_run) as total_run_score
from ipl_ball_by_ball_2022
group by 1
),
team as (select BattingTeam, batter from ipl_ball_by_ball_2022),
max_score as (select t.battingTeam, max(total_run_score) as max_run
from batsman b
inner join team t
on b.batter = t.batter
group by 1)
select ms.battingTeam, b.batter, ms.max_run
from max_score ms
inner join batsman b
on ms.max_run = b.total_run_score;

-- BOWLER PERFORMANCE==========================================================================================================

with ipl as (select ibb.bowler, sum(isWicketDelivery) as no_of_wicket,
case 
when im.Team1 = ibb.BattingTeam then im.Team2
else im.Team1 end as bowlingTeam
from ipl_matches_2022 im
inner join ipl_ball_by_ball_2022 ibb
on im.id = ibb.id
group by 1,3),
team_wickets as (select bowlingTeam, max(no_of_wicket) as max_wicket from ipl group by 1)
select i.bowlingTeam, i.bowler, w.max_wicket
from ipl i
inner join team_wickets w
on i.no_of_wicket = w.max_wicket and i.bowlingTeam = w.bowlingTeam
order by max_wicket desc;

-- Who wins the most player of the matches in the tournament?
select *
from (select Player_of_Match, count(Player_of_Match) as no_of_pom
from ipl_matches_2022 
group by 1) pom
order by no_of_pom desc
limit 1;

-- Who is the most valuable player after every match day?
select MatchNumber, Player_of_Match
from ipl_matches_2022;

--  strike rate more than 150 r/b in each team ?
select BattingTeam,batter,sum(batsman_run) as run_scored,
count(ballnumber) as ball,
round((sum(batsman_run)*100/count(ballnumber)),2) as strike_rate
from ipl_ball_by_ball_2022
group by 1,2
having strike_rate > 150;

-- GAME PLAYED BY EACH PLAYER
SELECT * FROM ipl_ball_by_ball_2022;
SELECT * FROM ipl_matches_2022;

select batter,count(distinct id) as match_played
from ipl_ball_by_ball_2022
group by 1
order by match_played desc;

-- best score by each batter in IPL 2022
with run as (select batter, id, sum(batsman_run) as run
from ipl_ball_by_ball_2022
group by 1,2)
select batter, max(run) as best 
from run
group by 1;

-- MOST BOUNDARIES by player each team

with batsman as (select batter, count(batsman_run) as total_boundaries
from ipl_ball_by_ball_2022
where batsman_run in (4,6)
group by 1
),
team as (select BattingTeam, batter from ipl_ball_by_ball_2022),
max_boundaries as (select t.battingTeam, max(total_boundaries) as max_run
from batsman b
inner join team t
on b.batter = t.batter
group by 1)
select ms.battingTeam, b.batter, ms.max_run
from max_boundaries ms
inner join batsman b
on ms.max_run = b.total_boundaries;





