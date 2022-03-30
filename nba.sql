select * from games_details;
select * from players;
select * from rankings;
select * from teams;
select * from games;

#Jogadores com menos minutos em jogo
select avg(MIN) from games_details;
select PLAYER_NAME as Nome_Do_Jogador, PLAYER_ID, min(MIN) as Menor_tempo from games_details
 where MIN < 18 group by PLAYER_NAME having  min(MIN) order by Menor_tempo asc;

#Jogadores com mais minutos em jogos
select avg(MIN) from games_details;
select PLAYER_NAME as Nome_Do_Jogador, PLAYER_ID, max(MIN) as Maior_tempo from games_details
 where MIN > 18 group by PLAYER_NAME having max(MIN) order by Maior_tempo desc;
 
#Qual o time com mais vitoria ?
select distinct rankings.TEAM, rankings.TEAM_ID, teams.HEADCOACH, teams.OWNER, count(rankings.W) as Contagem_De_Vitorias 
from teams inner join rankings using(TEAM_ID);


#Jogadores com mais Assistências 
select distinct PLAYER_ID, PLAYER_NAME, max(AST) from games_details group by AST
having max(AST) order by AST desc limit 10;

#Outra maneira 
select distinct players.PLAYER_NAME, players.PLAYER_ID, (games_details.AST) 
from players left join games_details on players.PLAYER_ID = games_details.PLAYER_ID 
where (games_details.AST) > 10 order by AST desc limit 10;

#view 
create view nba_assist as select distinct PLAYER_ID, PLAYER_NAME, max(AST) from games_details group by AST
having max(AST) order by AST desc limit 10;


#Visualização de rankings de jogadores 
select PLAYER_NAME, TEAM_ABBREVIATION, TEAM_CITY, case
when sum(PTS) < 200
then 'Jogador Profissional'
when sum(PTS) between 300 and 999
then 'Jogador caro'
when sum(PTS) > 1000
then 'Jogador Lendário'
else 'Jogador bom'
end as Ranking from games_details group by PLAYER_ID having max(PTS) order by PTS desc;

