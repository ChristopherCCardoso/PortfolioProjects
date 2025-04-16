-- Creating New Table

create table layoffs_staging
like world_layoffs.layoffs;

insert into world_layoffs.layoffs_staging
select * from world_layoffs.layoffs; 

-- Data Cleaning --

select * from world_layoffs.layoffs_staging;

-- 1. Remove Duplicates 
-- 2. Standardize the Data 
-- 3. Null Values or Blank Values 
-- 4. Remove Columns 

-- 1. Remove Duplicates

with duplicates_cte as
(
select *, row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num 
from world_layoffs.layoffs_staging
)
select * from duplicates_cte
where row_num > 1;

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select * from world_layoffs.layoffs_staging2;

insert into world_layoffs.layoffs_staging2
select *, row_number() over(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num 
from world_layoffs.layoffs_staging;

select * from world_layoffs.layoffs_staging2
where row_num > 1;

delete from world_layoffs.layoffs_staging2
where row_num > 1;

select * from world_layoffs.layoffs_staging2;


-- 2. Standardize the Data
-- 2.1

select distinct company from world_layoffs.layoffs_staging2;

select company, (trim(company)) from world_layoffs.layoffs_staging2;

update world_layoffs.layoffs_staging2
set company = trim(company);

select * from world_layoffs.layoffs_staging2;

-- 2.2 

select distinct industry from world_layoffs.layoffs_staging2
order by industry;

select * from world_layoffs.layoffs_staging2
where industry like 'Crypto%';

update world_layoffs.layoffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%';

select distinct industry from world_layoffs.layoffs_staging2
order by industry;

-- 2.3

select * from world_layoffs.layoffs_staging2;

select distinct location from world_layoffs.layoffs_staging2
order by location;

-- 2.4

select distinct country from world_layoffs.layoffs_staging2
order by country;

select distinct country from world_layoffs.layoffs_staging2
where country like 'United States%';

select distinct country, trim(TRAILING '.' FROM country) from world_layoffs.layoffs_staging2
order by country;

update world_layoffs.layoffs_staging2
set country = trim(TRAILING '.' FROM country)
where country like 'United States%';

select * from world_layoffs.layoffs_staging2
order by country;

-- 2.5

select `date` from world_layoffs.layoffs_staging2;

select `date`, str_to_date(`date`, '%m/%d/%Y') from world_layoffs.layoffs_staging2;

update world_layoffs.layoffs_staging2
set `date` = str_to_date(`date`, '%m/%d/%Y');

select * from world_layoffs.layoffs_staging2;

alter table world_layoffs.layoffs_staging2
modify column `date` date;

select * from world_layoffs.layoffs_staging2;

-- 3. Null Values or Blank Values

select distinct industry from world_layoffs.layoffs_staging2;

select * from world_layoffs.layoffs_staging2
where industry is null or industry = '';

select * from world_layoffs.layoffs_staging2
where company = 'Airbnb';

update world_layoffs.layoffs_staging2
set industry = 'Travel'
where company = 'Airbnb' and industry = '';

select * from world_layoffs.layoffs_staging2
where company = 'Carvana';

update world_layoffs.layoffs_staging2
set industry = 'Transportation'
where company = 'Carvana' and industry = '';

select * from world_layoffs.layoffs_staging2
where company = 'Juul';

update world_layoffs.layoffs_staging2
set industry = 'Consumer'
where company = 'Juul' and industry = '';

-- Option Two --

update world_layoffs.layoffs_staging2
set industry = NULL
where industry = '';

select * from layoffs_staging2 as t1
join layoffs_staging2 as t2
on t1.company = t2.company
and t1.location = t2.location
where (t1.industry is null or t1.industry = '')
and t2.industry is not null;

update layoffs_staging2 as t1
join layoffs_staging2 as t2
on t1.company = t2.company
set t1.industry = t2.industry
where (t1.industry is null)
and t2.industry is not null;


-- 4. Remove Columns 

select * from world_layoffs.layoffs_staging2
where total_laid_off is null and percentage_laid_off is null;

DELETE from world_layoffs.layoffs_staging2
where total_laid_off is null and percentage_laid_off is null;


select * from world_layoffs.layoffs_staging2;

alter table world_layoffs.layoffs_staging2
drop column row_num;

select * from world_layoffs.layoffs_staging2;




