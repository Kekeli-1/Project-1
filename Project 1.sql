select * from media.netflix1;
select *, row_number() over (partition by type,show_id, director, date_added, country,title, release_year,rating,duration,listed_in ) as
row_n from media.netflix1;
select * from media.netflix1
where country = 'Pakistan';
-- standardizing data
select director,trim(director) from media.netflix1;
select distinct(title), country from media.netflix1
order by country;
update media.netflix1
set title = 'Motu Patlu'
where title like 'Motu Patlu in the Game of Zones%' OR title like'Motu Patlu in Wonderland%' OR title like 'Motu Patlue: Deep Sea Adventure%' OR
title like 'Motu Patlu: Mission Moon%';
select distinct(title), country from media.netflix1
order by country;
update media.netflix1
set title = 'Motu Patlu'
where title like 'Motu Patlu: Deep Sea Adventure%';
select distinct(title), country from media.netflix1
order by country;
Update media.netflix1
set title = 'Naruto Shippuden'
where title like 'Natuto Shippuden:The Movie:The lost Tower%';
select distinct(title), country from media.netflix1
order by country;
update media.netflix1
set title = 'untold'
where title like 'untold%';
select distinct(title), country,duration, listed_in from media.netflix1
order by listed_in;
select distinct(title) from media.netflix1;
select * from media.netflix1;
select title, date_added,Str_to_date(date_added, '%m/%d/%Y'), release_year from media.netflix1
order by release_year ASC;
select distinct(title),director, country,listed_in from media.netflix1
order by director;
Update media.netflix1
set director = null
where director = 'Not Given';
Update media.netflix1
set country = null
where country = 'Not Given';
select * from media.netflix1
where country = 'Japan';
select director, title from media.netflix1
where director is null;


-- Total Amount of each type of content produced 
select count(type) from media.netflix1
where type = 'Movie';
select count(type) from media.netflix1
where type = 'TV Show';

-- Total number of directors
select count( distinct director) as total_num_of_directors from media.netflix1
where director is not null;
-- Total amount of contents
select count(distinct title) as total_contents from media.netflix1;
select * from media.netflix1;
-- Total number of countries
select count(distinct country) as Total_countries from media.netflix1;
-- data from ratings
select distinct rating, count(*) as num_contents from media.netflix1
group by rating
order by num_contents DESC;
select count(distinct rating) from media.netflix1;
-- data from duration
select distinct duration, count(*) as total_contents from media.netflix1
group by duration
order by total_contents DESC;
select count(distinct duration) from media.netflix1;
-- data from the categories of contents
select distinct listed_in, count(distinct title) as Total_contents from media.netflix1
group by listed_in
order by Total_contents DESC;
select count(distinct listed_in) as total_categories from media.netflix1;
-- data on release years 
select  distinct release_year, count(release_year) as num_contents from media.netflix1
group by release_year 
order by release_year, num_years DESC;
select count( distinct release_year) from media.netflix1;

-- Data from directors
select  title, director, rank() over (order by director desc ) as status from media.netflix1
order by status;
select director, count(title) as total_content from media.netflix1
group by director
order by total_content DESC;
select director , count(title) as total_content, type from media.netflix1
group by director, type
order by total_content DESC;
select type,count( distinct director) as total_num from media.netflix1
where type = 'TV Show';
select distinct director,title from media.netflix1 
where director is not null
group by director, title
having count(distinct type) = 2;
select * from media.netflix1;
select count(distinct director) as total_num, rating from media.netflix1
group by rating
order by total_num DESC;
select count(distinct director) as total_num, listed_in from media.netflix1
group by listed_in
order by total_num DESC;

-- Data from title
select count(distinct title) as total_num, count(*) as total_year_titles from media.netflix1
where date_added like '2018%';
select year(date_added) as year_added, count(distinct title) as total_content
from media.netflix1
Group by year_added;
select count(distinct title) as total_num, country from media.netflix1
group by country
order by total_num DESC;
select count(distinct title) as total_num, release_year  from media.netflix1
group by release_year
order by total_num DESC;
select count(distinct title) as total_num, rating from media.netflix1
group by rating
order by total_num DESC;
select count(distinct title) as total_num, listed_in from media.netflix1
group by listed_in
order by total_num DESC;
select count(distinct type),type, rating from media.netflix1
group by rating,type;
select count(distinct(title)) as total_num, year(date_added) as year_added from media.netflix1
group by year(date_added)
order by year(date_added) DESC;
select count(listed_in) as total_numn , listed_in, country from media.netflix1
group by listed_in,country
order by total_numn DESC;
select genre,count(*) as total_titles from (
select show_id, title, trim(substring_index(listed_in,',',1)) as genre from media.netflix1
union all
select show_id, title, Trim(substring_index(substring_index(listed_in,',',2),',',-1)) as genre
from media.netflix1
where listed_in like '%,%'
union all
select show_id, title, trim(substring_index(substring_index(listed_in,',',3),',',-1)) as genre
from media.netflix1
where listed_in like '%,%,%') as genre_data
group by genre
order by total_titles DESC;
select AVG(year(date_added)- release_year) as avg_age from media.netflix1;


