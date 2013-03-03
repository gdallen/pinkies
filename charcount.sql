
create table charcounts (
  id int,
  file_id int,
  letter varchar(10),
  count int
);

insert into charcounts (id, file_id, letter, count)
  values (1, 1, 'a', 2);


insert into charcounts (id, file_id, letter, count)
  values (2, 1, 't', 2);

insert into charcounts (id, file_id, letter, count)
  values (3, 1, 'T', 1);

create table charmap (
  id int not null auto_increment primary key,
  letter varchar(10),
  keystroke char(2)
);
insert into charmap (letter, keystroke) values ('a', 'lp');
insert into charmap (letter, keystroke) values ('b', 'l1');
insert into charmap (letter, keystroke) values ('c', 'lm');
insert into charmap (letter, keystroke) values ('d', 'lm');

insert into charmap (letter, keystroke) values ('t', 'l1');

select sum(charcounts.count), charmap.keystroke from charcounts, charmap where charcounts.letter = charmap.letter group by charmap.keystroke;

create table shiftmap (
  id int not null auto_increment primary key,
  letter varchar(10),
  keystroke char(2)
);

insert into shiftmap (letter, keystroke) values ('a', 'lp');
insert into shiftmap (letter, keystroke) values ('b', 'l1');
insert into shiftmap (letter, keystroke) values ('c', 'lm');
insert into shiftmap (letter, keystroke) values ('d', 'lm');

insert into shiftmap (letter, keystroke) values ('t', 'l1');
insert into shiftmap (letter, keystroke) values ('T', 'l1');
insert into shiftmap (letter, keystroke) values ('T', 'rp');

select sum(charcounts.count), shiftmap.keystroke from charcounts, shiftmap where binary charcounts.letter = binary shiftmap.letter group by shiftmap.keystroke;

select projects.name, charmaps.keystroke, sum(characters.count) 
from projects, datafiles, characters, charmaps
where characters.letter = charmaps.letter
and characters.datafile_id = datafiles.id
and datafiles.project_id = projects.id;

select concat(projects.id, keystrokes.order), projects.name, charmaps.keystroke, sum(characters.count) 
from projects inner join datafiles on datafiles.project_id = projects.id
  inner join characters on characters.datafile_id = datafiles.id 
  inner join charmaps on characters.letter = charmaps.letter
  inner join keystrokes on charmaps.keystroke = keystrokes.keystroke
group by projects.name, charmaps.keystroke 
order by projects.name, keystrokes.order



select mytotals.keystroke, sum(counter) as count from (
select charmaps.keystroke, sum(characters.count) as counter from projects inner join datafiles on datafiles.project_id = projects.id inner join characters on characters.datafile_id = datafiles.id  inner join charmaps on binary characters.letter= binary charmaps.letter inner join keystrokes on charmaps.keystroke = keystrokes.keystroke where projects.name = 'feature test' and datafiles.name = 'file2.txt' group by charmaps.keystroke 
union
select shiftmaps.keystroke, sum(characters.count) as counter from projects inner join datafiles on datafiles.project_id = projects.id inner join characters on characters.datafile_id = datafiles.id  inner join shiftmaps on binary characters.letter= binary shiftmaps.letter inner join keystrokes on shiftmaps.keystroke = keystrokes.keystroke where projects.name = 'feature test' and datafiles.name = 'file2.txt' group by shiftmaps.keystroke 
) mytotals
inner join keystrokes where mytotals.keystroke = keystrokes.keystroke
group by mytotals.keystroke
order by keystrokes.order







select shifttotals.id, shifttotals.name, shifttotals.filename, shifttotals.keystroke, sum(counter) as count from (
select projects.id*10+keystrokes.order as id, projects.name as name, datafiles.name as filename, charmaps.keystroke, sum(characters.count) as counter 
from projects inner join datafiles on datafiles.project_id = projects.id 
inner join characters on characters.datafile_id = datafiles.id  
inner join charmaps on binary characters.letter= binary charmaps.letter 
inner join keystrokes on charmaps.keystroke = keystrokes.keystroke 
group by projects.name, datafiles.name, charmaps.keystroke 
union
select projects.id*10+keystrokes.order as id, projects.name as name, datafiles.name as filename, shiftmaps.keystroke, sum(characters.count) as counter 
from projects inner join datafiles on datafiles.project_id = projects.id 
inner join characters on characters.datafile_id = datafiles.id  
inner join shiftmaps on binary characters.letter= binary shiftmaps.letter 
inner join keystrokes on shiftmaps.keystroke = keystrokes.keystroke 
group by projects.name, datafiles.name, shiftmaps.keystroke 
) shifttotals
inner join keystrokes 
on shifttotals.keystroke = keystrokes.keystroke
and shifttotals.name = 'feature test' and shifttotals.filename = 'file2.txt' 
group by shifttotals.id, shifttotals.name, shifttotals.filename, shifttotals.keystroke
order by keystrokes.order



select projects.id*10+keystrokes.order as id, projects.name as name, datafiles.name as filename, charmaps.keystroke, sum(characters.count) as counter
from projects inner join datafiles on datafiles.project_id = projects.id
inner join characters on characters.datafile_id = datafiles.id
inner join charmaps on binary characters.letter= binary charmaps.letter
inner join keystrokes on charmaps.keystroke = keystrokes.keystroke
where projects.name = 'feature test' and datafiles.name = 'file2.txt'
group by projects.name, charmaps.keystroke

union
select projects.id*10+keystrokes.order as id, projects.name as name, datafiles.name as filename, shiftmaps.keystroke, sum(characters.count) as counter
from projects inner join datafiles on datafiles.project_id = projects.id
inner join characters on characters.datafile_id = datafiles.id
inner join shiftmaps on binary characters.letter= binary shiftmaps.letter
inner join keystrokes on shiftmaps.keystroke = keystrokes.keystroke
where projects.name = 'feature test' and datafiles.name = 'file2.txt'
group by projects.name, shiftmaps.keystroke

