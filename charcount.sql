
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
