select*
from covid_data.coviddeaths

# DeathPercentage (for each date and location)
select location, date, total_cases, total_deaths, round((total_deaths/total_cases)*100,2) as death_percentage 
from covid_data.coviddeaths;

# Percentage of population got covid #
select location, date, total_cases, population, round((total_cases/population)*100,2) as covid_population_percentage
from covid_data.coviddeaths;

# countries with high infection rate #
select location, date, max(total_cases) as highest_infection , population, round((max(total_cases)/population)*100,2) as infection_rate
from covid_data.coviddeaths
group by location, population
order by highest_infection desc;


