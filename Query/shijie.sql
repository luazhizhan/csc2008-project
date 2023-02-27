-- TV shows produced in the United States that have at least three unique directors
-- sorts them by the number of directors in descending order,
-- then by title in ascending order
SELECT program.title,
    COUNT(DISTINCT directed.director_id) AS director_count
FROM program
    JOIN directed ON program.id = directed.program_id
    JOIN broadcast ON program.id = broadcast.program_id
    JOIN country ON broadcast.country_id = country.id
WHERE country.name = 'United States'
GROUP BY program.id
HAVING COUNT(DISTINCT directed.director_id) >= 3
ORDER BY director_count DESC,
    program.title ASC;
