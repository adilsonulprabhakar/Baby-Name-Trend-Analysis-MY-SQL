-- Objective 4
-- Explore unique names in the dataset
-- Find the 10 most popular androgynous names (names given to both females and males)
SELECT NAME
	,COUNT(DISTINCT gender) AS no_of_gender
	,SUM(births) AS popular
FROM names
GROUP BY NAME
HAVING no_of_gender > 1
ORDER BY popular DESC LIMIT 10;

-- Find the length of the shortest and longest names, and identify the most popular short names 
-- (those with the fewest characters) and long names (those with the most characters)
-- (longest name)
SELECT DISTINCT NAME
	,LENGTH(NAME) AS len
FROM names
ORDER BY len DESC LIMIT 1;-- 15

-- (shortest name)
SELECT DISTINCT NAME
	,LENGTH(NAME) AS len
FROM names
ORDER BY len ASC LIMIT 1;-- 2

-- identify the most popular short names
SELECT NAME
	,sum(births) AS popular_name
FROM names
WHERE length(NAME) = 2
GROUP BY NAME
ORDER BY popular_name DESC limit 1;

-- -- identify the most popular long names
SELECT NAME
	,sum(births) AS popular_name
FROM names
WHERE length(NAME) = 15
GROUP BY NAME
ORDER BY popular_name DESC limit 1;

-- Find the state with the highest percent of babies named "Chris"
WITH percentage_state
AS (
	WITH state_chris AS (
			SELECT STATE
				,sum(births) AS no_of_chris
			FROM names
			WHERE NAME = 'Chris'
			GROUP BY STATE
			)
		,total_names AS (
			SELECT STATE
				,sum(births) AS total_no_names
			FROM names
			GROUP BY STATE
			)
	SELECT s.STATE
		,s.no_of_chris
		,t.total_no_names
	FROM state_chris s
	INNER JOIN total_names t ON s.STATE = t.STATE
	)
SELECT STATE
	,no_of_chris
	,total_no_names
	,((no_of_chris / total_no_names) * 100) AS perct
FROM percentage_state
ORDER BY perct ASC;
