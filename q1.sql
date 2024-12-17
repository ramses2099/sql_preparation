create table if not exists comments_and_translation(
id serial primary key,
"comment" varchar(100),
translation varchar(100)
);

select * from comments_and_translation; 

insert into comments_and_translation(comment, translation) 
values
('very good',null),
('good',null),
('bad',null),
('ordinary',null),
('cdcdcdcd','very bad'),
('excellent', null),
('ababab', 'no satisfied'),
('satisfied', null),
('aabbaabb','extraordinary'),
('ccdccbb','meidum');


-- solution
select 
  case when translation is null
  then comment
  else
  translation
  end as output
from comments_and_translation;

select 
  case when translation is null
  then comment
  else
  translation
  end as output
from comments_and_translation;


select coalesce (translation, comment) as output
from comments_and_translation; 
select coalesce (translation, comment) as output
from comments_and_translation; 

