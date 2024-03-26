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

# countries with highest death count #
select location, date, total_cases, max(cast(total_deaths as signed)) as death_count, population
from covid_data.coviddeaths
group by location
order by death_count desc ;

# death count by continents #
select continent, max(cast(total_deaths as signed)) as death_count
from covid_data.coviddeaths
where continent is not null
group by continent
order by death_count desc ;

# joining the covideaths and covidvaccinations table #
use covid_data;
select *
from coviddeaths cd 
join covidvaccinations vc on cd.location = vc.location and cd.date = vc.date;

# total population and vaccination #
select cd.continent, cd.location, cd.date, cd.population, cast(vc.new_vaccinations as signed) as new_vaccinations
from coviddeaths cd 
join covidvaccinations vc on cd.location = vc.location and cd.date = vc.date
order by new_vaccinations desc;


