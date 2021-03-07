use world;

# SELECT : 데이터 조회 컨트리테이블의 모든 데이터를 조회
select * 
from country;

select code, name continent, population
from country;

# countrycode 이름을 code 로 변경해서 name 과 출력
select countrycode as code, name
from city;

# WHERE : 조건으로 데이터를 검색
# 인구가 1억명이 넘는 국가의 국가코드와 국가이름, 인구수를 출력

select code, name, population
from country
where population >= 100000000;

# mysql 주석 한줄주석은 -- 여러줄 /* */

# 연산자 : 산술 연산자, 비교 연산자, 논리 연산자
# 산술 연산자 : +, -, *, /, %, DIV
# 인구 밀도
select name, surfacearea, population
			, population / surfacearea as pps
from country;

# 국가별 1인당 GNP
select name, population, GNP, GNP / population * 1000000 as gpp
from country;

# 비교 연산자: =, !=, >, <, >=, <=
# 도시의 인구수가 800만명 이상인 도시의 도시이름, 인구수
select name, population
from city
where population >= 800 * 10000;

# 논리 연산자 : AND, OR
# 인구수가 800만 에서 1000만인 국가의 국가이름, 인구수
select name, population
from country
where population >= 800 * 10000 and population <= 1000 * 10000;

# BETWEEN : 범위 연산시 사용
select name, population
from country
where population between 800 * 10000 and 1000 * 10000;

# 아시아와 아프리카 대륙의 국가 데이터를 출력
select name, continent
from country
where continent = "asia" or continent = "africa";

# IN, NOT IN : 컬럼에 여러개의 데이터를 포함하는 데이터를 출력할 때
select name, continent
from country
where continent in ("asia", "africa");

# LIKE : 특정한 문자열이 포함된 데이터를 출력
# governmentform 이 Republic 이 포함된 데이터를 출력
select name, governmentform
from country
where governmentform like "%Republic%"; # % 앞뒤로 다른 글자가 올수도 있고 없을수도 있고

# 국가 코드가 ar로 시작하는 국가 이름을 출력
select code, name
from country
where code like "ar%"; # ar로 시작되는 코드

# ORDER BY : 결과데이터를 정렬
# 국가를 gdp 순으로 정렬 0 인 국가는 제외 
select code, name, gnp
from country
where gnp > 0
order by gnp asc; # 오름차순 정렬 asc 생략가능

# 내림차순 정렬은 desc
select code, name, gnp
from country
where gnp > 0
order by gnp desc;

# 국가 코드 순으로 내림차순, 같은 국가 코드는 인구수 순으로 오름차순으로 정렬
select countrycode, name, population
from city
order by countrycode desc, population asc;

# LIMIT : 조회하는 데이터의 수를 제한
# 인구가 많은 상위 5개 국가의 국가이름, 인구수
select name, population
from country
order by population desc
limit 5; # 업데이트 딜리트 할떄는 리밋을 꼭 써줘야 한다.

# 인구수가 상위 6위 ~ 8위 까지 출력
select name, population
from country
order by population desc
limit 5, 3; # 앞에 있는 5는 스킵 뒤에는 출력될 데이터 수

# DISTINCT : 출력 데이터에서 중복을 제거해서 출력
select distinct continent
from country;

