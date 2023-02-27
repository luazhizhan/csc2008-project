-- Show the program available in the country in a given range year 
SELECT p.title,
    b.year,
    c.name AS country
FROM program AS p
    JOIN broadcast AS b ON p.id = b.program_id
    JOIN country AS c ON b.country_id = c.id
WHERE b.year >= 2010
    AND c.name = "Singapore"
ORDER BY b.year ASC,
    p.title ASC;
-- Given the director, list out the actor the director work with before 
SELECT a.name AS actor
FROM actor AS a
    JOIN cast AS c ON a.id = c.actor_id
    JOIN program AS p ON c.program_id = p.id
    JOIN directed AS d ON p.id = d.program_id
    JOIN director AS dr ON d.director_id = dr.id
WHERE dr.name = "Al Campbell"
GROUP BY a.name;
-- Show the total number of program broadcast by year and country
SELECT b.year,
    COUNT(b.program_id) AS total_broadcast,
    c.name AS country
FROM broadcast AS b
    JOIN country AS c ON b.country_id = c.id
GROUP BY b.year,
    c.name;
-- Show the total number of program broadcast by category
SELECT c.name AS category,
    COUNT(l.program_id) AS total_program
FROM category AS c
    JOIN listed AS l ON c.id = l.category_id
GROUP BY c.name;
