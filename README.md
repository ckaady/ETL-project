# ETL-project

Problem

We set out to discover if there was a correlation between the number of pet adoption shelters and the socioeconomics of each state.

Methods

Extract

    To answer the above problem, we downloaded a database of over 10,000 animal shelters in North America (https://www.kaggle.com/aaronschlegel/petfinder-animal-shelters-database) and extracted 2017 US Census data (https://www.census.gov/data/developers/data-sets/acs-1year.2017.html) via the Census Bureau API. Request a unique API key here: https://api.census.gov/data/key_signup.html. We also used a state name to state code abbreviation CSV (https://worldpopulationreview.com/states/state-abbreviations) to create the join between the Census data and the shelter data. 

Transform

    To narrow the scope of the project, we removed shelters in Mexico and Canada from the shelter CSV. We also added leading zeros to the ZIP code column to ensure consistency throughout the project. We deleted the "Abbreviation" column from the state code CSV since we only needed state name and state code to create our merges. Once this was completed, we imported both CSVs into a jupyter notebook (extract_and_transform.ipynb) to combine with the API call for Census data. We used the pandas library to read both CSVs and drop the address, phone and email columns from the shelter data csv since we only want to know the location of each shelter. We used 'api_key' from the 'config' library to import the API and 'Census' from the 'census' library to utilize the census wrapper. We then created pandas dataframes from the Census API data which converted the census codes to English names to make each code readable. Once we had a dataframe (joint_df), we performed an inner join of the joint_df and the the state_ids dataframe so we had the census data with an added state code column related the the state name. We then broke the merged dataframe into three different dataframes based on data type and converted them to CSVs: (census_income_data.csv, census_demo_data.csv, census_commute_data.csv).

Load

    Once we had all of the transformed CSVs that we needed, we used GenMyModel (https://www.genmymodel.com/) to create our ERD. We established our primary and foreign keys as the state column and made the corresponding connections. We then loaded the ERD to use in pgAdmin4 (https://www.pgadmin.org/download/) and created our schema to load our tables. We then imported our CSVs to the corresponding tables to create our finalized database.

Next Steps

    Now that we have a full database with merged data, one could draw correlations between the various demographic data and the number of shelters in each state.