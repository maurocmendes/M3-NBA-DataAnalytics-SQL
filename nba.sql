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

