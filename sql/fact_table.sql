CREATE TABLE fact_table (
    date_key INTEGER REFERENCES dim_date (date_key),
    education_key INTEGER REFERENCES dim_education (education_key),
    industry_key INTEGER REFERENCES dim_industry (industry_key),
    employee_demographic_key INTEGER REFERENCES dim_employee_demographic (employee_demographic_key),
    employment_status_key INTEGER REFERENCES dim_employment_status (employment_key),
    graduate_demographic_key INTEGER REFERENCES dim_graduate_demographic (graduate_demographic_key),

    number_of_employees NUMERIC,
    gdp_value NUMERIC,
    number_of_graduates NUMERIC,
    PRIMARY KEY (date_key, education_key, industry_key, employee_demographic_key, employment_status_key, graduate_demographic_key)
);