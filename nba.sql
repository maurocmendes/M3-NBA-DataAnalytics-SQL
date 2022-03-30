select*from games_details;
select*from games;
desc games_details;
desc games;
desc ranking;
desc teams;
select*from ranking;

#qual time perdeu mais jogos na season 2018? 
select*from ranking where SEASON_ID=22018;


#quais times possuem mais vitórias na season 2018?
select teams.NICKNAME, ranking.SEASON_ID from teams left join ranking using(TEAM_ID) having (select*from ranking where SEASON_ID=22018) order by max(W);

#quais times possuem mais derrotas na season 2018?
select teams.NICKNAME, ranking.SEASON_ID from teams left join ranking using(TEAM_ID) having (select*from ranking where SEASON_ID=22018) order by max(L);

#Time que mais pontuou em casa
select TEAM_ID, TEAM, sum(games.PTS_home) as Pontos_Em_Casa
from rankings inner join games on rankings.TEAM_ID = games.HOME_TEAM_ID 
where SEASON between '2003' and '2019'
order by PTS_home;

#Time que mais pontuou fora de casa
select TEAM_ID, TEAM, sum(games.PTS_away) as Pontos_Fora_De_Casa
from rankings inner join games on rankings.TEAM_ID = games.VISITOR_TEAM_ID 
where SEASON between '2003' and '2019'
order by PTS_away;


#Time que mais ganharam em casa
select TEAM_ID, TEAM, count(games.HOME_TEAM_WINS) as Vitoria_Em_Casa
from rankings inner join games on rankings.TEAM_ID = games.HOME_TEAM_ID 
order by HOME_TEAM_WINS;


