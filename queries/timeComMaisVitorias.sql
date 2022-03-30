#Time que mais ganhou em casa

select TEAM_ID, TEAM, count(games.HOME_TEAM_WINS) as Vitoria_Em_Casa
from ranking inner join games on ranking.TEAM_ID = games.HOME_TEAM_ID
order by HOME_TEAM_WINS;
