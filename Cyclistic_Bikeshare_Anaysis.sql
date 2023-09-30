-- Merging all the monthly tables into one table

CREATE TABLE GDA Capstone.2022_tripdata AS
SELECT * FROM GDA Capstone.202201-divvy-tripdata
UNION
SELECT * FROM GDA Capstone.202202-divvy-tripdata
UNION
SELECT * FROM GDA Capstone.202203-divvy-tripdata
UNION
SELECT * FROM GDA Capstone.202204-divvy-tripdata
UNION
SELECT * FROM GDA Capstone.202205-divvy-tripdata
UNION
SELECT * FROM GDA Capstone.202206-divvy-tripdata
UNION
SELECT * FROM GDA Capstone.202207-divvy-tripdata
UNION
SELECT * FROM GDA Capstone.202208-divvy-tripdata
UNION
SELECT * FROM GDA Capstone.202209-divvy-tripdata
UNION
SELECT * FROM GDA Capstone.202210-divvy-tripdata
UNION
SELECT * FROM GDA Capstone.202211-divvy-tripdata
UNION
SELECT * FROM GDA Capstone.202212-divvy-tripdata;


-- removal of rows with missing values for start station

SELECT count(*) FROM `GDA Capstone`.`2022-tripdata`
WHERE start_station_name = '' OR start_station_id = '';		-- A count total of 833064 rows was returned

DELETE FROM `GDA Capstone`.`2022-tripdata`
WHERE start_station_name = '' OR start_station_id = '';

-- removal of rows with missing values for end station

SELECT count(*) FROM `GDA Capstone`.`2022-tripdata`
WHERE end_station_name = '' OR end_station_id = ''; 	-- A count total of 465293 extra rows was returned

DELETE FROM `GDA Capstone`.`2022-tripdata`
WHERE end_station_name = '' OR end_station_id = '';


-- Creating a column with time datatype for trip
ALTER TABLE `GDA Capstone`.`2022-tripdata`
ADD ride_length time AS (STR_TO_DATE(trip_duration,'%H:%i:%s'))
AFTER trip_duration;

-- Creating column for converting time to minutes
ALTER TABLE `GDA Capstone`.`2022-tripdata`
ADD ride_length_in_mins int 
GENERATED ALWAYS AS (TIME_TO_SEC(ride_length)/60)
AFTER ride_length;

-- Creating column for month index
ALTER TABLE `GDA Capstone`.`2022-tripdata`
ADD month_id int AS (SUBSTRING(started_at, 4, 2))
AFTER day_of_week;

-- Creating column for specifying the month name
ALTER TABLE `GDA Capstone`.`2022-tripdata`
ADD COLUMN Month varchar(50) AS (case 
	when month_id = 1 then 'January'
	when month_id = 2 then 'February'
	when month_id = 3 then 'March'
	when month_id = 4 then 'April'
	when month_id = 5 then 'May'
	when month_id = 6 then 'June'
	when month_id = 7 then 'July'
	when month_id = 8 then 'August'
	when month_id = 9 then 'September'
	when month_id = 10 then 'October'
	when month_id = 11 then 'November'
	when month_id = 12 then 'December'
	else null end);
