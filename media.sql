select * from game_details;

select PLAYER_NAME, avg(DREB) from game_details where DREB > 0  group by PLAYER_NAME order by avg(DREB) desc limit 5;

select PLAYER_NAME, avg(FGM) from game_details where FGM > 0  group by PLAYER_NAME order by avg(FGM) desc limit 5;

select PLAYER_NAME, avg(AST) from game_details where AST > 0  group by PLAYER_NAME order by avg(AST) desc limit 5;