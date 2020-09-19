-- Main Schema
-- Create schemas
-- Create tables
CREATE TABLE IF NOT EXISTS census_2017
(
    state VARCHAR(20) NOT NULL,
    median_income VARCHAR(10),
    number_employed BIGINT,
    number_unemployed BIGINT,
    number_poverty BIGINT,
    number_families_in_poverty BIGINT,
    median_home_value VARCHAR(15),
    median_gross_rent VARCHAR(10),
    PRIMARY KEY(state)
);
CREATE TABLE IF NOT EXISTS petfinder_data
(
    city VARCHAR(150),
    country VARCHAR(2),
    id VARCHAR(25) NOT NULL UNIQUE,
	latitude DECIMAL(6, 2),
    longitude DECIMAL(6, 2),
	name VARCHAR(150),
    state VARCHAR(20),
    zipcode VARCHAR(5)
    
);
CREATE TABLE IF NOT EXISTS census_demographics
(
    state VARCHAR(20),
    median_age DECIMAL(3, 1),
    population BIGINT,
    pop_white_only BIGINT,
    pop_black_only BIGINT,
    pop_american_indian_only BIGINT,
    pop_native_hawaiian_only BIGINT,
    pop_two_or_more_races BIGINT,
    pop_hispanic_origin_only BIGINT
);
CREATE TABLE IF NOT EXISTS census_commute_data
(
    state VARCHAR(20),
    commute_time_pub_transit DECIMAL(8, 6),
    commute_time_solo_auto DECIMAL(8, 6),
    commute_time_walking DECIMAL(8, 6)
);


-- IMPORT DATA BEFORE CONTINUING TO FOREIGN KEYS
-- -------------IMPORT FOREIGN KEYS-------------
-- Create FKs
ALTER TABLE census_commute_data
    ADD    FOREIGN KEY (state)
    REFERENCES census_2017(state)
    MATCH SIMPLE
;
ALTER TABLE census_demographics
    ADD    FOREIGN KEY (state)
    REFERENCES census_2017(state)
    MATCH SIMPLE
;
ALTER TABLE petfinder_data
    ADD    FOREIGN KEY (state)
    REFERENCES census_2017(state)
    MATCH SIMPLE
;
-- Create Indexes
