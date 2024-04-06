-- WITH processed_fact_table AS (
-- SELECT
--     dt.year,
--     edu.field_of_study,
--     ind.sector_name,
--     emp.gender AS employee_gender,
--     emp.age_group,
--     grad.gender AS graduate_gender,
--     emp_status.employment_status,
--     ft.number_of_employees,
--     ft.gdp_value,
--     ft.number_of_graduates
-- FROM
--     fact_table ft
-- JOIN
--     dim_date dt ON ft.date_key = dt.date_key
-- JOIN
--     dim_education edu ON ft.education_key = edu.education_key
-- JOIN
--     dim_industry ind ON ft.industry_key = ind.industry_key
-- JOIN
--     dim_employee_demographic emp ON ft.employee_demographic_key = emp.employee_demographic_key
-- JOIN
--     dim_graduate_demographic grad ON ft.graduate_demographic_key = grad.graduate_demographic_key
-- JOIN
--     dim_employment_status emp_status ON ft.employment_status_key = emp_status.employment_key
-- )

-- SELECT * FROM processed_fact_table;

-- ROLL UP QUERY
-- SELECT sector_name, sum(gdp_value) 
-- FROM processed_fact_table
-- GROUP BY sector_name

-- DRILL DOWN QUERY
-- SELECT employee_gender,sector_name, sum(number_of_employees)
-- FROM processed_fact_table
-- GROUP BY employee_gender, sector_name

-- SLICE QUERY
-- SELECT *
-- FROM processed_fact_table
-- WHERE field_of_study = 'Mathematics, computer and information sciences [7]'

-- DICE QUERIES
-- SELECT *
-- FROM processed_fact_table
-- WHERE year=2020 and  field_of_study = 'Mathematics, computer and information sciences [7]' and sector_name = 'Professional, scientific and technical services [54]'

-- SELECT *
-- FROM processed_fact_table
-- WHERE year=2008 and field_of_study = 'Business, management and public administration [5]' and sector_name = 'Finance and insurance [52]' and employment_status = 'Employed'

-- COMBINATION OLAP QUERIES
-- QUERY 1
-- SELECT sector_name, sum(gdp_value) 
-- FROM processed_fact_table
-- WHERE year = 2008
-- GROUP BY sector_name
