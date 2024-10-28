-- Objective 3
-- Compare popularity across regions
-- Return the number of babies born in each of the six regions (NOTE: The state of MI should be in the Midwest region)
SELECT *
FROM names;

SELECT *
FROM regions;

SELECT DISTINCT region
FROM regions;-- new_england and new england is same

WITH clean_region_db
AS (
	SELECT STATE
		,(
			CASE 
				WHEN region = 'new england'
					THEN 'New_England'
				ELSE region
				END
			) AS clean_region
	FROM regions
	
	UNION
	
	SELECT 'MI' AS STATE
		,'Midwest' AS region
	)
SELECT r.clean_region
	,sum(n.births) AS total_babies_born
FROM names n
LEFT JOIN clean_region_db r ON n.STATE = r.STATE
GROUP BY r.clean_region;

-- Return the 3 most popular girl names and 3 most popular boy names within each region
SELECT *
FROM (
	WITH popular_name AS (
			WITH clean_region_db AS (
					SELECT STATE
						,(
							CASE 
								WHEN region = 'new england'
									THEN 'New_England'
								ELSE region
								END
							) AS clean_region
					FROM regions
					
					UNION
					
					SELECT 'MI' AS STATE
						,'Midwest' AS region
					)
			SELECT n.NAME
				,n.gender
				,r.clean_region
				,sum(n.births) AS no_of_names
			FROM names n
			LEFT JOIN clean_region_db r ON n.STATE = r.STATE
			GROUP BY n.NAME
				,n.gender
				,r.clean_region
			)
	SELECT NAME
		,gender
		,clean_region
		,no_of_names
		,row_number() OVER (
			PARTITION BY clean_region
			,gender ORDER BY no_of_names DESC
			) AS ranks
	FROM popular_name
	) AS top3_names
WHERE ranks <= 3;
