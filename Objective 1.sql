USE baby_names_db;

SELECT *
FROM regions;

SELECT *
FROM names;

-- Objective 1
-- Track changes in name popularity
-- Find the overall most popular girl and boy names and show how they have changed in popularity rankings over the years
WITH name_rank
AS (
	SELECT NAME
		,gender
		,sum(births) AS total_names
		,row_number() OVER (
			PARTITION BY gender ORDER BY sum(births) DESC
			) AS ranks
	FROM names
	GROUP BY gender
		,NAME
	)
SELECT *
FROM name_rank
WHERE ranks = 1;-- Jessica and Michael

-- how they have changed in popularity rankings over the years for (jessica)
SELECT *
FROM (
	WITH popularity AS (
			SELECT NAME
				,year
				,sum(births) AS total_birth
			FROM names
			WHERE gender = 'f'
			GROUP BY year
				,NAME
			)
	SELECT NAME
		,year
		,row_number() OVER (
			PARTITION BY year ORDER BY total_birth DESC
			) AS popularity_years
	FROM popularity
	) AS popu_table
WHERE NAME = 'Jessica';

-- how they have changed in popularity rankings over the years for (Michael)
SELECT *
FROM (
	WITH popularity AS (
			SELECT NAME
				,year
				,sum(births) AS total_birth
			FROM names
			WHERE gender = 'm'
			GROUP BY year
				,NAME
			)
	SELECT NAME
		,year
		,row_number() OVER (
			PARTITION BY year ORDER BY total_birth DESC
			) AS popularity_years
	FROM popularity
	) AS popu_table
WHERE NAME = 'Michael';

-- Find the names with the biggest jumps in popularity from the first year of the data set to the last year
WITH table_a
AS (
	WITH all_names_1980 AS (
			SELECT NAME
				,year
				,sum(births) AS total_no
			FROM names
			GROUP BY year
				,NAME
			)
	SELECT NAME
		,year
		,row_number() OVER (
			PARTITION BY year ORDER BY total_no DESC
			) AS a_ranks_80
	FROM all_names_1980
	WHERE year = '1980'
	)
	,table_b
AS (
	WITH all_names_2009 AS (
			SELECT NAME
				,year
				,sum(births) AS total_no
			FROM names
			GROUP BY year
				,NAME
			)
	SELECT NAME
		,year
		,row_number() OVER (
			PARTITION BY year ORDER BY total_no DESC
			) AS b_ranks_09
	FROM all_names_2009
	WHERE year = '2009'
	)
SELECT t.NAME
	,t.a_ranks_80
	,tt.b_ranks_09
	,cast(tt.b_ranks_09 AS signed) - cast(t.a_ranks_80 AS signed) AS rank_diff
FROM table_a t
INNER JOIN table_b tt ON t.NAME = tt.NAME
ORDER BY rank_diff;
