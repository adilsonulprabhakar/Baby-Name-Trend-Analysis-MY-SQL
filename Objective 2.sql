-- Objective 2
-- Compare popularity across decades
-- For each year, return the 3 most popular names
SELECT *
FROM (
	WITH all_names AS (
			SELECT year
				,NAME
				,sum(births) AS total_num
			FROM names
			GROUP BY year
				,NAME
			)
	SELECT year
		,NAME
		,row_number() OVER (
			PARTITION BY year ORDER BY total_num DESC
			) AS ranks
	FROM all_names
	) AS names_ranks
WHERE ranks <= 3;

-- For each year, return the 3 most popular girl names and 3 most popular boy names
-- (GIRLS)
SELECT *
FROM (
	WITH girl_names AS (
			SELECT year
				,NAME
				,gender
				,sum(births) AS total_num
			FROM names
			WHERE gender = 'F'
			GROUP BY year
				,NAME
				,gender
			)
	SELECT year
		,NAME
		,row_number() OVER (
			PARTITION BY year ORDER BY total_num DESC
			) AS girl_ranks
	FROM girl_names
	) AS top_girls
WHERE girl_ranks <= 3;

-- (BOYS)
SELECT *
FROM (
	WITH boys_names AS (
			SELECT year
				,NAME
				,gender
				,sum(births) AS total_num
			FROM names
			WHERE gender = 'M'
			GROUP BY year
				,NAME
				,gender
			)
	SELECT year
		,NAME
		,row_number() OVER (
			PARTITION BY year ORDER BY total_num DESC
			) AS boys_ranks
	FROM boys_names
	) AS top_boys
WHERE boys_ranks <= 3;

-- For each decade, return the 3 most popular girl names and 3 most popular boy names
SELECT *
FROM (
	WITH year_rank AS (
			SELECT (
					CASE 
						WHEN year BETWEEN 1980
								AND 1989
							THEN 'first_decade 1980-1990'
						WHEN year BETWEEN 1990
								AND 1999
							THEN 'second_decade 1990-2000'
						WHEN year BETWEEN 2000
								AND 2010
							THEN 'third_decade 2000-2010'
						ELSE 'none'
						END
					) AS decades
				,NAME
				,gender
				,sum(births) AS total_name
			FROM names
			GROUP BY decades
				,NAME
				,gender
			)
	SELECT decades
		,NAME
		,gender
		,total_name
		,row_number() OVER (
			PARTITION BY decades
			,gender ORDER BY total_name DESC
			) AS ranks
	FROM year_rank
	) AS top_three
WHERE ranks <= 3;
