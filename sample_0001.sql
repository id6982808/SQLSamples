-- 達人に学ぶSQL徹底指南書より

-- Build Schema
-- DDL
create table items 
( item varchar(100),
 primary key(item));
 
insert into items (item) values ('ビール');
insert into items (item) values ('紙オムツ');
insert into items (item) values ('自転車');

create table shopitems
(
  shop varchar(100),
  item varchar(100),
  primary key(shop, item)
);

insert into shopitems (shop, item) values ('仙台', 'ビール');
insert into shopitems (shop, item) values ('仙台', '紙オムツ');
insert into shopitems (shop, item) values ('仙台', '自転車');
insert into shopitems (shop, item) values ('仙台', 'カーテン');
insert into shopitems (shop, item) values ('東京', 'ビール');
insert into shopitems (shop, item) values ('東京', '紙オムツ');
insert into shopitems (shop, item) values ('東京', '自転車');
insert into shopitems (shop, item) values ('大阪', 'テレビ');
insert into shopitems (shop, item) values ('大阪', '紙オムツ');
insert into shopitems (shop, item) values ('大阪', '自転車');


--DML
select si.shop
from shopitems si inner join items i on si.item = i.item
group by si.shop
having count(si.item) = (select count(item) from items)
;

