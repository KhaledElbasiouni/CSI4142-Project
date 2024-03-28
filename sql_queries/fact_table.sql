CREATE TABLE fact_table (
    date_key INTEGER REFERENCES dim_date (date_key),
    education_key INTEGER REFERENCES dim_education (education_key),
    industry_key INTEGER REFERENCES dim_industry (industry_key),
    demographic_key INTEGER REFERENCES dim_demographic (demographic_key),
    employment_key INTEGER REFERENCES dim_employment_status (employment_key),
    Number_of_Employees NUMERIC,  
    GDP_Value NUMERIC,           
    Number_of_Graduates NUMERIC, 
    PRIMARY KEY (date_key, education_key, industry_key, demographic_key, employment_key)
);







