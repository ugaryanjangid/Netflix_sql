-- =====================================================
-- Q1. Count the Number of Movies vs TV Shows
-- =====================================================

SELECT type, COUNT(type) as total_content
FROM netflix_table
GROUP BY type;


-- =====================================================
-- Q2. Find the Most Common Rating for Movies and TV Shows
-- =====================================================

select *
from(
SELECT type, rating, count(*), rank() over(
							  partition by type
                              order by count(*) desc) as ranking
FROM netflix_table
group by type, rating) as t1
where ranking = 1;



-- =====================================================
-- Q3. List All Movies Released in a Specific Year (e.g., 2020)
-- =====================================================

select type,title,release_year
from netflix_table
where type = 'Movie' and release_year = 2020;

-- =====================================================
-- Q4. Find the Top 5 Countries with the Most Content on Netflix
-- =====================================================

select country,count(show_id) as total
from netflix_table
group by country
order by total desc
limit 5;

-- ====================================================
-- Q5. Identify the Longest Movie
-- =====================================================
select title , ( select max(duration) from netflix_table)
from netflix_table
where type = 'Movie';

-- =====================================================
-- Q6. Find Content Added in the Last 5 Years
-- =====================================================
SELECT
    title,
    STR_TO_DATE(date_added, '%M ,%e, %Y') AS added_date
FROM netflix_table
WHERE STR_TO_DATE(date_added, '%M %e, %Y') >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);


-- =====================================================
-- Q7. Find All Movies and TV Shows Directed by 'Rajiv Chilaka'
-- =====================================================

select title,type,director
from netflix_table
where director = 'Rajiv Chilaka';


-- =====================================================
-- Q8. List All TV Shows with More Than 5 Seasons
-- =====================================================

select  title,type,duration
from netflix_table
where type = 'TV Show'
and
duration > '5 Seasons';


-- =====================================================
-- Q9. Count the Number of Content Items in Each Genre
-- =====================================================

SELECT
    listed_in,
    COUNT(*) AS total_content
FROM netflix_table
GROUP BY listed_in
ORDER BY total_content DESC;

-- =====================================================
-- Q10. Show the Top 5 years in which Netflix released the most Indian content.
-- =====================================================

SELECT
    YEAR(STR_TO_DATE(date_added, '%M %e, %Y')) AS year_added,
    COUNT(*) AS total_content
FROM netflix_table
WHERE country = 'India'
GROUP BY year_added
ORDER BY total_content DESC
LIMIT 5;




-- =====================================================
-- Q11. List All Movies That Are Documentaries
-- =====================================================

select title, type , listed_in
from netflix_table
where type = 'Movie' 
and
listed_in = 'Documentaries';


-- =====================================================
-- Q12. Find All Content Without a Director
-- =====================================================

SELECT *
FROM netflix_table
WHERE director = '';

-- =====================================================
-- Q13. Find How Many Movies Actor 'Salman Khan'
-- Appeared in During the Last 10 Years
-- =====================================================

SELECT *
FROM netflix_table
WHERE type = 'Movie'
  AND cast LIKE '%Salman Khan%'
  AND release_year >= YEAR(CURDATE()) - 10;
