# MySQL queries

## In Metabase

Queries visualized on Metabase.

### Total Number of Programs Streaming by Country

```sql
SELECT country.name AS country, COUNT(DISTINCT broadcast.program_id) AS total_programme
FROM broadcast
JOIN country ON broadcast.country_id = country.id
GROUP BY country.name
ORDER BY total_programme DESC
```

### Actors in Programs Directed by a Specific Director

```sql
SELECT a.name AS actors
FROM actor AS a
    JOIN cast AS c ON a.id = c.actor_id
    JOIN program AS p ON c.program_id = p.id
    JOIN directed AS d ON p.id = d.program_id
    JOIN director ON d.director_id = director.id
WHERE d.name = "NAME"
```

### Actors with the Most Appearances since Year 2000

Optimised

```sql
WITH actor_appearances AS (
    SELECT year, actor_id, COUNT(*) as appearances
    FROM broadcast
    JOIN program ON program.id = broadcast.program_id
    JOIN cast ON cast.program_id = program.id
    WHERE year >= 2000
    GROUP BY year, actor_id
), max_actor_appearances AS (
    SELECT year, MAX(appearances) as max_appearances
    FROM actor_appearances
    GROUP BY year
)
SELECT broadcast.year, actor.name, actor_appearances.appearances
FROM broadcast
JOIN program ON program.id = broadcast.program_id
JOIN cast ON cast.program_id = program.id
JOIN actor ON actor.id = cast.actor_id
JOIN actor_appearances ON actor_appearances.actor_id = actor.id
JOIN max_actor_appearances ON max_actor_appearances.year = broadcast.year AND max_actor_appearances.max_appearances = actor_appearances.appearances
ORDER BY broadcast.year, actor_appearances.appearances DESC;
```

Not optimised

```sql
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
```

### Total Number of Programs by Categories

```sql
SELECT category.name AS catergory, COUNT(listed.program_id) AS total_programme
FROM listed
JOIN category ON listed.category_id = category.id
GROUP BY category.name
ORDER BY total_programme DESC;
```

### Program Titles Featuring Actor

```sql
SELECT DISTINCT(program.title), broadcast.date, program.rating
FROM cast
JOIN actor ON cast.actor_id = actor.id
JOIN program ON cast.program_id = program.id
JOIN broadcast ON cast.program_id = broadcast.program_id
JOIN listed ON program.id = listed.program_id
JOIN category ON listed.category_id = category.id
JOIN country ON broadcast.country_id = country.id
WHERE actor.name = "NAME"
GROUP BY program.title, broadcast.date, program.rating
```

### Top 10 Most Prolific Directors

```sql
SELECT director.name,
       COUNT(DISTINCT directed.program_id) AS directed_amount,
       GROUP_CONCAT(program.title) AS programme_list
FROM directed
JOIN director ON directed.director_id = director.id
JOIN program ON directed.program_id = program.id
GROUP BY director.id
ORDER BY directed_amount DESC
LIMIT 10;
```

### Total Programs Broadcasted in the 2021

```sql
SELECT COUNT(*) AS total_programs
FROM broadcast
WHERE year = (SELECT MAX(year) FROM broadcast) -- will return 2021
```

## Not In Metabase

Queries not visualized on Metabase.

### Top 5 Countries by Views of Most Watched Genre (WRONG)

```sql
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
LIMIT 5;
```

### Show the program available in the country in a given range year

```sql
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
```


### Given the director, list out the actor the director work with before 


```sql
SELECT a.name AS actor
FROM actor AS a
    JOIN cast AS c ON a.id = c.actor_id
    JOIN program AS p ON c.program_id = p.id
    JOIN directed AS d ON p.id = d.program_id
    JOIN director AS dr ON d.director_id = dr.id
WHERE dr.name = "Al Campbell"
GROUP BY a.name;
```

### Most Featured Actor, Grouped by Year

```sql
SELECT a.name AS actor,
    COUNT(c.actor_id) AS total_program,
    b.year
FROM actor AS a
    JOIN cast AS c ON a.id = c.actor_id
    JOIN program AS p ON c.program_id = p.id
    JOIN broadcast AS b ON p.id = b.program_id
GROUP BY a.name,
    b.year
ORDER BY b.year DESC,
    total_program DESC;
```
