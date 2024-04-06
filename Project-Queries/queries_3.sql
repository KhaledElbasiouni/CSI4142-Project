-- ICEBERG QUERY
-- WITH gdp_per_industry AS (SELECT
--     dt.year,
--     ind.sector_name,
--     ft.gdp_value FROM fact_table ft
-- JOIN
--     dim_date dt ON ft.date_key = dt.date_key
-- JOIN
--     dim_industry ind ON ft.industry_key = ind.industry_key)
	
-- SELECT DISTINCT *
-- FROM gdp_per_industry
-- ORDER BY gdp_value DESC
-- LIMIT 10


-- WINDOWING QUERY
-- Total # of grads per field of study per gender between 2015 and 2020

-- WITH graduates_per_field_of_study AS (
-- SELECT
-- 	dt.year,
--     edu.field_of_study,
--     grad.gender AS graduate_gender,
--     ft.number_of_graduates
-- FROM
--     fact_table ft
-- JOIN
--     dim_date dt ON ft.date_key = dt.date_key
-- JOIN
--     dim_education edu ON ft.education_key = edu.education_key
-- JOIN
--     dim_graduate_demographic grad ON ft.graduate_demographic_key = grad.graduate_demographic_key
-- )

-- SELECT *, RANK() OVER (ORDER BY total_graduates DESC) AS field_rank
-- FROM 
-- 	(SELECT field_of_study, graduate_gender, sum(sum1) as total_graduates
-- 		FROM (SELECT year, field_of_study, graduate_gender, sum(number_of_graduates) as sum1
-- 				FROM graduates_per_field_of_study
-- 			  	WHERE year >= 2015 AND year <= 2020
-- 	 			GROUP BY year, field_of_study, graduate_gender) AS total_graduates_per_field_of_study
-- 		GROUP BY field_of_study, graduate_gender	 
-- 	) AS rankings_fields_of_study


--  USING THE WINDOW CLAUSE
-- WITH gdp_per_industry AS (SELECT
--     dt.year,
--     ind.sector_name,
--     ft.gdp_value FROM fact_table ft
-- JOIN
--     dim_date dt ON ft.date_key = dt.date_key
-- JOIN
--     dim_industry ind ON ft.industry_key = ind.industry_key)
	
-- SELECT DISTINCT year, sector_name, avg(gdp_value) OVER W moving_average
-- FROM gdp_per_industry
-- WINDOW W AS (PARTITION BY sector_name
-- 				ORDER BY year
-- 				RANGE BETWEEN 1 PRECEDING AND 1 FOLLOWING
-- 			)
-- ORDER BY year ASC