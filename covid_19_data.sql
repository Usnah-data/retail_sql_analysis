---- all columns from the COVID-19 dataset -----
select *
from covid_19_data;

---- Show the Country and Total Cases columns only ----
select country, cumulative_total_cases
from covid_19_data;

---- Display the first 10 records in the table ---
select*
from covid_19_data
limit 10;

---- show all countries where the Total Cases is greater than 100,000 ----
select country, cumulative_total_cases
from covid_19_data
where cumulative_total_cases > 100000 ;

---- Show all countries that reported zero deaths ----
select country, cumulative_total_deaths
from covid_19_data
where cumulative_total_deaths = 0;

---- list of countries whose first letter is  ‘A’ ----
select country
from covid_19_data
where country
like "A%";

select country
from covid_19_data
where country
like "Bur%";
---- list of countries whose last letter is  ‘o’ ----
select country
from covid_19_data
where country
like "%o";

---- list of countries that has ‘o’ in it ----
select country
from covid_19_data
where country
like "%o%";
---- Find all countries that have Total Cases between 50,000 and 100,000 ----
select country, cumulative_total_cases
from covid_19_data
where cumulative_total_cases >= 50000 ;

---- all countries where the Death Rate (Total Deaths / Total Cases) is greater than 0.05 ----
select country, cumulative_total_deaths
from covid_19_data
where cumulative_total_deaths > 0.05;

---- Write a query to find the total number of cases across all countries----
select country, cumulative_total_cases
from covid_19_data;

---- Find the average number of deaths across all countries----
select country, avg(cumulative_total_deaths)
from covid_19_data
group by country;

---- Find the country with the maximum total cases----
select country, max(cumulative_total_deaths)
from covid_19_data
group by country;

---- Find the minimum total deaths recorded among all countries----
select country, min(cumulative_total_deaths)
from covid_19_data
group by country;

---- Show the total cases and total deaths per country----
select country, cumulative_total_cases,cumulative_total_deaths
from covid_19_data;

---- Find how many countries have data available ----
select count(distinct country)
As total_country
from covid_19_data;

---- Write a query to list the top 10 countries with the highest number of cases----
select country, max(cumulative_total_cases)
As highest_cases
from covid_19_data
group by country
order by highest_cases desc
limit 10;

---- List the bottom 5 countries with the fewest deaths----
select country, max(cumulative_total_deaths)
As total_deaths
from covid_19_data
group by country
order by total_deaths asc
limit 5;

---- Order all countries by death rate in descending order----
select cumulative_total_deaths
from covid_19_data
order by cumulative_total_deaths desc;

---- Group the data by Country and show the sum of total cases and deaths----
select country, sum(cumulative_total_cases) as total_cases, sum(cumulative_total_deaths) as total_deaths
from covid_19_data
group by country;

---- Group the data by Country and show only those where the total deaths exceed 1 million----
select country, sum(cumulative_total_deaths) as total_deaths
from covid_19_data
group by country
having sum(cumulative_total_deaths) > 1000000;

---- average total cases per continent, but only include continents with more than 5 countries---
select country, avg(cumulative_total_cases) As avg_cases
from covid_19_data
where country like'%a%'
group by country;

----- a subquery to display countries whose total cases are above the global average----
select country, cumulative_total_cases
from covid_19_data
where cumulative_total_cases > (select avg(cumulative_total_cases)
from covid_19_data);