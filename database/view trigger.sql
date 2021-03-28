# view
# 가상 테이블 : 복잡한 쿼리 단순화


# index
# 많은 데이터가 있는 테이블에서 검색속도를 빠르게 하기위한 문법


# trigger
# 특정 테이블의 특정 조건을 감시하고 있다가
# 조건이 감지되면 지정해 놓은 쿼리가 자동실행

 # 데이터 베이스 백업
 # cold, hot / logical / physical
 # crontab : 작업 스케쥴러
 
 
 # 데이터 베이스 동기화
 # 데이터 베이스에 부하가 많이 생겨서 여러개의 서버로 처리할때
 
 # Mongodb
 
 
 
 # VIEW
 # 뷰 생성
 use world;
 create view code_name as
 select code, name
 from country;
 
 select *
 from city
 join code_name
 on city.countrycode = code_name.code;
 
 # 한국의 인구소보다 많은 국가의 국가코드, 국가이름, 국가인구수를
 # 저장하는 뷰를 생성
 create view country_kor as
 select code, name, population
 from country
 where population > (
	select population
    from country
    where code = "kor"
 );

 # INDEX
 # 인덱스 종류 : 클러스터형, 보조
 use employees;
 select *
 from salaries
 where from_date < "1986-01-01";
 
 select *
 from salaries
 where to_date < "1995-01-01";
 
 # 실행 계획 확인
explain
select *
from salaries
where to_date < "1986-01-01";

# 인덱스 설정
create index tdate on salaries(to_date);
show index from salaries;

# 인덱스 삭제
drop index tdate on salaries;

# 트리거
# 특정 테이블의 특정 조건을 감시하고 있다가 감지되면 미리 설정해 놓은 쿼리가 실행
create database tr;
use tr;

# 테이블 2개 생성

create table chat(
	chat_id int primary key auto_increment,
    msg varchar(100) not null
);

create table backup(
	backup_id int primary key auto_increment,
    backup_msg varchar(100) not null,
    backup_date timestamp default current_timestamp
);

# 트리거 생성

delimiter |
create trigger backup_tr
before delete on chat
for each row begin
	insert into backup(backup_msg)
    value(old.msg);
end |

show triggers;

insert into chat(msg) values ("hello"), ("hi"), ("hello!!!!!");

delete
from chat
where msg like "hello%"
limit 10;

select * from backup;