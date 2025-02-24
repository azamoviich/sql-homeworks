use leetcode;

--p1:
Create table Products (product_id int, low_fats char(1), recyclable char(1))

insert into Products (product_id, low_fats, recyclable) values ('0', 'Y', 'N')
insert into Products (product_id, low_fats, recyclable) values ('1', 'Y', 'Y')
insert into Products (product_id, low_fats, recyclable) values ('2', 'N', 'Y')
insert into Products (product_id, low_fats, recyclable) values ('3', 'Y', 'Y')
insert into Products (product_id, low_fats, recyclable) values ('4', 'N', 'N')

select product_id from Products
where low_fats = 'Y' and recyclable = 'Y'

--p2:
Create table  Customer (id int, name varchar(25), referee_id int)

insert into Customer (id, name, referee_id) values ('1', 'Will', NULL)
insert into Customer (id, name, referee_id) values ('2', 'Jane', NULL)
insert into Customer (id, name, referee_id) values ('3', 'Alex', '2')
insert into Customer (id, name, referee_id) values ('4', 'Bill', NULL)
insert into Customer (id, name, referee_id) values ('5', 'Zack', '1')
insert into Customer (id, name, referee_id) values ('6', 'Mark', '2')

select name from Customer
where referee_id <> 2 or referee_id is null

--p3)

Create table  World (name varchar(255), continent varchar(255), area int, population int, gdp bigint)

insert into World (name, continent, area, population, gdp) values ('Afghanistan', 'Asia', '652230', '25500100', '20343000000')
insert into World (name, continent, area, population, gdp) values ('Albania', 'Europe', '28748', '2831741', '12960000000')
insert into World (name, continent, area, population, gdp) values ('Algeria', 'Africa', '2381741', '37100000', '188681000000')
insert into World (name, continent, area, population, gdp) values ('Andorra', 'Europe', '468', '78115', '3712000000')
insert into World (name, continent, area, population, gdp) values ('Angola', 'Africa', '1246700', '20609294', '100990000000')

select name, population, area from World
where area > 3000000 or population > 25000000

--p4)
Create table Views (article_id int, author_id int, viewer_id int, view_date date)

insert into Views (article_id, author_id, viewer_id, view_date) values ('1', '3', '5', '2019-08-01')
insert into Views (article_id, author_id, viewer_id, view_date) values ('1', '3', '6', '2019-08-02')
insert into Views (article_id, author_id, viewer_id, view_date) values ('2', '7', '7', '2019-08-01')
insert into Views (article_id, author_id, viewer_id, view_date) values ('2', '7', '6', '2019-08-02')
insert into Views (article_id, author_id, viewer_id, view_date) values ('4', '7', '1', '2019-07-22')
insert into Views (article_id, author_id, viewer_id, view_date) values ('3', '4', '4', '2019-07-21')
insert into Views (article_id, author_id, viewer_id, view_date) values ('3', '4', '4', '2019-07-21')

select distinct author_id as id from Views
where article_id > 1

--p5)
Create table  Tweets(tweet_id int, content varchar(50))

insert into Tweets (tweet_id, content) values ('1', 'Let us Code')
insert into Tweets (tweet_id, content) values ('2', 'More than fifteen chars are here!')

;with cte as
(
select tweet_id, len(content) as ln from Tweets
)
select tweet_id from cte
where ln > 15

--p6)
Create table Employees1(id int, name varchar(20))
Create table  EmployeeUNI (id int, unique_id int)

insert into Employees1 (id, name) values ('1', 'Alice')
insert into Employees1 (id, name) values ('7', 'Bob')
insert into Employees1 (id, name) values ('11', 'Meir')
insert into Employees1 (id, name) values ('90', 'Winston')
insert into Employees1 (id, name) values ('3', 'Jonathan')
--Truncate table EmployeeUNI
insert into EmployeeUNI (id, unique_id) values ('3', '1')
insert into EmployeeUNI (id, unique_id) values ('11', '2')
insert into EmployeeUNI (id, unique_id) values ('90', '3')

select * from Employees1
select * from EmployeeUNI

select eu.unique_id as unique_id, e.name as name from Employees1 as e
left join  EmployeeUNI as eu
on e.id = eu.id
