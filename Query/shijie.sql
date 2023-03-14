# Top Watched Categories
SELECT category.name AS catergory, COUNT(listed.category_id) AS total_programme
FROM listed 
JOIN category ON listed.category_id = category.id 
GROUP BY category.name 
ORDER BY total_programme DESC;

# Collaborating Actors
SELECT GROUP_CONCAT(a.name SEPARATOR ', ') AS actors
FROM actor AS a
    JOIN cast AS c ON a.id = c.actor_id
    JOIN program AS p ON c.program_id = p.id
    JOIN directed AS d ON p.id = d.program_id
    JOIN director AS dr ON d.director_id = dr.id
WHERE dr.name = {{dr.name}};


# Top 8 Most Prolific Directors
SELECT director.name, 
       COUNT(DISTINCT directed.program_id) AS directed_amount,
       GROUP_CONCAT(program.title) AS programme_list
FROM directed
JOIN director ON directed.director_id = director.id
JOIN program ON directed.program_id = program.id
GROUP BY director.id
ORDER BY directed_amount DESC
LIMIT 8;

# Top 2 Countries by Views of Most Watched Genre
SELECT 
    country.name AS country,
    category.name AS genre,
    COUNT(DISTINCT broadcast.program_id) AS total_views
FROM 
    broadcast
    JOIN country ON broadcast.country_id = country.id
    JOIN program ON broadcast.program_id = program.id
    JOIN listed ON program.id = listed.program_id
    JOIN category ON listed.category_id = category.id
WHERE 
    category.name = (
        SELECT 
            category.name
        FROM 
            listed
            JOIN category ON listed.category_id = category.id
            JOIN program ON listed.program_id = program.id
            JOIN broadcast ON program.id = broadcast.program_id
        GROUP BY 
            category.name
        ORDER BY 
            COUNT(DISTINCT broadcast.program_id) DESC
        LIMIT 1
    )
GROUP BY 
    country.name, category.name
ORDER BY 
    COUNT(DISTINCT broadcast.program_id) DESC
LIMIT 2;

# Actors with the Most Appearances Per Year
SELECT year, actor.name, COUNT(*) as appearances
FROM broadcast
INNER JOIN program ON program.id = broadcast.program_id
INNER JOIN cast ON cast.program_id = program.id
INNER JOIN actor ON actor.id = cast.actor_id
GROUP BY year, actor.name
HAVING appearances = (
    SELECT MAX(appearances)
    FROM (
        SELECT year, actor_id, COUNT(*) as appearances
        FROM broadcast
        INNER JOIN program ON program.id = broadcast.program_id
        INNER JOIN cast ON cast.program_id = program.id
        GROUP BY year, actor_id
    ) as actor_appearances
    WHERE actor_appearances.year = broadcast.year
)
ORDER BY year, appearances DESC;

# Number of TV/Movies Broadcasted in the Most Recent Year 
SELECT COUNT(*) AS total_programs
FROM broadcast
WHERE year = (SELECT MAX(year) FROM broadcast)

# A Breakdown of Shows/Movies by Country
SELECT country.name AS country, COUNT(DISTINCT broadcast.program_id) AS total_programme
FROM broadcast
JOIN country ON broadcast.country_id = country.id
GROUP BY country.name
ORDER BY country.name ASC

# Program Titles featuring Actor
SELECT program.title, broadcast.date, program.rating, country.name AS country, GROUP_CONCAT(DISTINCT category.name ORDER BY category.name ASC SEPARATOR ', ') AS genres
FROM cast
JOIN actor ON cast.actor_id = actor.id
JOIN program ON cast.program_id = program.id
JOIN broadcast ON cast.program_id = broadcast.program_id
JOIN listed ON program.id = listed.program_id
JOIN category ON listed.category_id = category.id
JOIN country ON broadcast.country_id = country.id
WHERE {{actor_name}}
GROUP BY program.title, broadcast.date, program.rating, country.name

