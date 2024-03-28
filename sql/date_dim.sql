-- Dimension: Date
CREATE TABLE dim_date (
    date_key INTEGER PRIMARY KEY,
    year INTEGER CHECK (year >= 2000 AND year <= 2020)
);