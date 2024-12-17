-- There are 10 IPL team write an sql query such that team play with a every other team
-- Also write another query such that each team plays with every other team twice

create table if not exists ipl_team(
team_code varchar(10),
team_name varchar(40)
);

select * from ipl_team; 


insert into ipl_team (team_code, team_name) 
values
('CSK','Chennai Super kings'),
('DC', 'Delhi Capitals'),
('GT', 'Gujarat Titans'),
('KKR', 'Kolkata Knight Riders'),
('LSG', 'Lucknow Super Giants'),
('MI', 'Mumbai Indians'),
('PBKS', 'Punjab Kings'),
('RR', 'Rajasthan Royals'),
('RCB', 'Royal Challengers Bangalore'),
('SRH', 'Sunrisers Hyderbad');


-- Solution 1
-- using row_number for add id to the table
-- <
with matches as ( 
select row_number() over (order by team_name) as id, team_code, team_name
from ipl_team )
select t.team_name, o.team_name from matches t
join matches o on t.id < o.id;


-- Solution 2
-- <>
with matches as ( 
select row_number() over (order by team_name) as id, team_code, team_name
from ipl_team )
select t.team_name, o.team_name from matches t
join matches o on t.id <> o.id;


