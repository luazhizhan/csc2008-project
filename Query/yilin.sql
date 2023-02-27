-- Most Featured Actor in a Given Year
SELECT a.name AS actor,
    COUNT(c.actor_id) AS total_program
FROM actor AS a
    JOIN cast AS c ON a.id = c.actor_id
    JOIN program AS p ON c.program_id = p.id
    JOIN broadcast AS b ON p.id = b.program_id
WHERE b.year = 2010
GROUP BY a.name
ORDER BY total_program DESC
LIMIT 1;

-- Most Featured Actor, Grouped by Year
SELECT a.name AS actor,
    COUNT(c.actor_id) AS total_program,
    b.year
FROM actor AS a
    JOIN cast AS c ON a.id = c.actor_id
    JOIN program AS p ON c.program_id = p.id
    JOIN broadcast AS b ON p.id = b.program_id
GROUP BY a.name,
    b.year
ORDER BY b.year ASC,
    total_program DESC;

-- Total Number of Programs Broadcasted in a Given Year and Category (Credit: 20% Zhi Zhan, 70% Yi Lin, 10% Kenny)
SELECT b.year, c.name AS category, COUNT(p.id) AS total_program
FROM broadcast AS b
JOIN program AS p ON b.program_id = p.id
JOIN listed AS l ON l.program_id = p.id
JOIN category AS c ON c.id = l.category_id
WHERE b.year = 2010
GROUP BY b.year, c.name
ORDER BY total_program DESC;





