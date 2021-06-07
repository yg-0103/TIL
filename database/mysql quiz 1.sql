

# 1. sakila 데이터 베이스에서 국가가 인도 고객의 수를 출력하세요.
use sakila;
select country, count(country) as count
from customer_list
where country = "india";

# 2. 한국 도시중에 인구가 100만이 넘는 도시를 조회하여 인구순으로 내림차순하세요.
use world;
select name, population
from city
where countrycode = "KOR" and population > 100 * 10000
order by population desc;

# 3. city 테이블에서 population이 800만 ~ 1000만 사이인 도시 데이터를 인구수순으로 내림차순하세요.
select name, countrycode, population
from city
where population between 800 * 10000 and 1000 * 10000
order by population desc;

# 4. country 테이블에서 1940 ~ 1950년도 사이에 독립한 국가들을 조회하고 독립한 년도 순으로 오름차순하세요.
select code, concat(name,"(",indepyear, ")") as nameindep, continent, population
from country
where indepyear between 1940 and 1950
order by indepyear asc;

# 5. countrylanguage 테이블에서 스페인어, 한국어, 영어를 95% 이상 사용하는 국가 코드를 Percentage로 내림차순하여 아래와 같이 조회하세요.
select countrycode, language, percentage
from countrylanguage
where percentage > 95 AND language in ("spanish", "english", "korean")  
order by percentage desc;

# 6. country 테이블에서 Code가 A로 시작하고 GovernmentForm에 Republic이 포함되는 데이터를 아래와 같이 조회하세요.
select code, name, continent, governmentform, population
from country
where code like "a%" and governmentform like "%republic%";

# 7. Sakila actor 테이블에서 first_name이 DAN 인 배우의 수를 출력하세요.
use sakila;
select first_name, count(first_name) as count
from actor
where first_name = "DAN";

# 8. Sakila film_text 테이블에서 title이 ICE가 들어가고 description에 Drama가 들어간 데이터를 출력하세요.
select *
from film_text
where title like "%ICE%" and description like "%Drama%";

# 9. Sakila 데이터 베이스의 film_list 뷰에서 price가 1 ~ 4, length가 180 이상, category는 Sci-Fi과 Animation이 아닌 데이터를 출력하세요.
select title, description, category, length, price
from film_list
where price between 1 and 4 and length > 180 and category not in ("Sci-Fi", "Animation");