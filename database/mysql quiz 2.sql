# 1. 전체 몇개의 대륙이 있는지 출력하세요.
use world;
select count(distinct continent) as count
from country;

# 2. 국가 코드별 도시의 갯수를 출력하세요. (상위 5개를 출력)
select countrycode, count(countrycode) as count
from city
group by countrycode
order by count desc
limit 5;

# 3. 대륙별 몇개의 나라가 있는지 대륙별 나라의 갯수로 내림차순하여 출력하세요.
select continent, count(continent) as count
from country
group by continent
order by count desc;

# 4. 대륙별 인구가 1000만명 이상인 나라의 수와 GNP의 표준편차를 출력하세요. (GNP 표준편차로 내림차순)
select continent, count(name) as count, round(std(gnp), 2) as std_gnp
from country
where population > 1000 * 10000
group by continent
order by std_gnp desc;

# 5. City 테이블에서 국가코드(CountryCode) 별로 총인구가 몇명인지 조회하고 총인구 순으로 내림차순하세요. (총인구가 5천만 이상인 도시만 출력)
select countrycode, sum(population) as population
from city
group by countrycode
having population >= 5000 * 10000
order by population desc;

# 6. 언어별 사용하는 국가수를 조회하고 많이 사용하는 언어를 6위에서 10위까지 조회하세요.
select language, count(countrycode) as count
from countrylanguage
group by language
order by count desc
limit 5, 5;

# 7. 언어별 15곳 이상의 국가에서 사용되는 언어를 조회하고, 언어별 국가수에 따라 내림차순하세요.
select language, count(countrycode) as count
from countrylanguage
group by language
having count >= 15
order by count desc;

# 8. 대륙별 전체 표면적크기를 구하고 표면적 크기 순으로 내림차순하세요.
select continent, floor(sum(surfacearea)) as surfacearea
from country
group by continent
order by surfacearea desc;