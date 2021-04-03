use fds;

# 데이터 타입

# INT
create table number1(data tinyint);
create table number2(data tinyint unsigned); #양수만 


# 현재 데이터 베이스의 테이블 확인
show tables;

# 테이블 스키마 확인
desc number1;
desc number2;

# 데이터 저장
insert into number1 value (127);
select * from number1;

insert into number2 value (128);

# 11111111 > 2^8 > 256 > 0 ~ 255 양수만 
# 1111111 > 2^7 > 128 > -128 ~ 127 > 256 개 음수 양수

# FLOAT(6자리) 4바이트 , DOUBLE(17자리) 8바이트
create table number3(data float);
insert into number3 value(12.3456789);
select * from number3;

create table number4(data double);
insert into number4 value(1234567890.123456789);
select * from number4;


# 가변적인 글자수는 VARCHAR , 고정적인 것은 CHAR 보통 200자 이하 긴 문자열은 TEXT
# PRIMARY KEY 에는 보통 AUTO INCREMENT 설정을 해준다 

# 데이터 베이스 생성
create database test;
use test;

# 테이블 생성
create table user1(
	user_id int,
    name varchar(20),
    email varchar(30),
    age int,
    rdate date
);

# 제약 조건 추가
create table user2(
	user_id int primary key auto_increment,
    name varchar(20) not null,
    email varchar(30) unique not null,
    age int default 30,
    rdate timestamp
);

#INSERT
desc user1;
insert into user1 (user_id, name, email, age, rdate) # 데이터를 넣어줄 곳
value (1, "peter", "peter@gmail.com", 23, "2018-01-23");
select * from user1;

insert into user1 (user_id, name, email, age, rdate) # 데이터를 넣어줄 곳
value (2, "peter2", "peter2@gmail.com", 25, "2021-10-23"),
(3, "peter3", "peter3@gmail.com", 33, now());
select * from user1;

desc user2;
insert into user2 (name, email, age)
value ("peter", "perter@gmail.com", 22);

insert into user2 (name, email)
value ("peter", "perter2@gmail.com");
select * from user2;

# select 결과 데이터를 insert
use world;

select countrycode, name, population
from city
where population >= 900 * 10000;

create table city_900(
	countrycode char(3),
    name varchar(50),
    population int
);

desc city_900;

insert into city_900
select countrycode, name, population
from city
where population >= 900 * 10000;

select * from city_900;

# UPDATE SET
use test;
select * from user1;

update user1
set age=20, email="peter@naver.com"
where rdate > "2020-12-31"
limit 5;

select * from user1;

# DELETE (DML)
delete from user1
where rdate > "2020-12-31"
limit 5;
select * from user1;

# TRUNCATE : 스키마만 남기고 모두 삭제 초기화 (DDL)
select * from user1;
truncate user1;

# drop : 테이블을 삭제
drop table user1;
show tables;

# Functions.  올림 반올림 버림
select ceil(12.345), round(12.345, 2), truncate(12.345, 2);

# date format 데이트 형식
use sakila;
select distinct date_format(payment_date, "%Y-%m") from payment;

# concat 데이타 결합
use world;
select code, name, concat(code, "/", name) from country;

# count 데이터 갯수 
select count(*) from country;
select count(distinct(continent)) from country;

# if
# 도시의 인구가 100만 이상이면 big, 100만 미만이면 small 을 출력하는 컬럼을 생성
select name, population, if(population >= 100 * 10000, "big", "small") as scale
from city;

# case
# 국가별 인구가 10억 이상이면 big, 1억 이상 medium, 1억 이하는 small
select name, population,
	case 
		when population > 10000 * 100000 then "big"
        when population > 10000 * 10000 then "medium"
        else "small"
	end as scale
from country
order by population desc;


# group by, having
# 여러개의 동일한 데이터를 가지는 지정한 컬럼의 데이터를 합쳐주는 방법
# 결합함수 : count, max, min, sum, avg, ...

# city 테이블에서 국가 코드별 도시의 갯수를 출력
select countrycode, count(countrycode) as count
from city
group by countrycode
order by count desc;

# country 에서 대륙별 총 인구수를 출력 내림차순 3위까지
select continent, sum(population) as total_population
from country
group by continent
order by total_population desc
limit 3;

# having 조건의 위치 차이 where 과
# 대륙의 인구수가 5억 이상인 대륙만 출력
select continent, sum(population) as total_population
from country
group by continent
having total_population >= 50000 * 10000;

# with rollup  토탈 데이터수 까지 표시해준다. ifnull null 이면 토탈로
select ifnull(continent, "total"), ifnull(region, "total"), count(region)
from country
group by continent, region
with rollup;

# 변수 선언 := 은 += 과 같다
set @rank = 0;
select @rank := @rank + 1 as ranking, countrycode, name, population
from city
order by population desc
limit 5;

#


