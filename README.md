# Cyclistic Bikeshare Analysis – Google Capstone Project
## Introduction

Cyclistic is a successful bike-share company based in Chicago. They launched in 2016, and since then, the program has grown to a fleet of over 5800 bicycles that are geotracked and locked into a network of more than 600 docking stations across the city.

**Business Goal:** The company’s current goal is to design marketing strategies aimed at converting casual riders into annual members. To achieve that, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics.

**Business Task:** I will be assuming the position of ‘Jr. Data Analyst’, and to help guide the future marketing program, the director of marketing has asked for insights on the following question: **“How do annual members and casual riders use Cyclistic bikes differently?”** 

The resulting findings will help in drawing up strategies for achieving the business goal.

# Data Collection

To answer this question, the historical bike trips data for all 12 months in 2022 was retrieved from [this source](https://divvy-tripdata.s3.amazonaws.com/index.html). The data, collected by Cyclistic company and licensed by **Lyft Bikes and Scooters, LLC.,** contains all the relevant information necessary for this analysis, including customer type, and start and end time for each trip. It is separated by month and stored in CSV format.

The table for each month contains the following columns:

- ride_id: Unique ID assigned to each individual ride
- rideable_type: Type of bicycle (classic, docked, electric)
- started_at: Date and time at the start of the trip
- ended_at: Date and time at the end of the trip
- start_station_name: Name of the station the trip started at
- start_station_id: ID number of the station the trip started at
- end_station_name: Name of the station the trip ended at
- end_station_id: ID number of the station the trip ended at
- start_lat: Latitude of starting location
- start_lng: Longitude of the start location
- end_lat: Latitude of ending location
- end _lng: Longitude of ending location
- member_casual: Type of membership (Casual or Cyclistic Member)

# Data Cleaning and Processing

### *Microsoft Excel*

The cleaning process started with exploring the monthly data for each month using Microsoft Excel. This tool made it easy to get an overview and a general understanding of the data. In Excel, I performed some data cleaning procedures before exporting the data for processing. For each month’s data, the following procedures were performed:

a) Created a column for the duration of the trip (trip_duration), using the formula “=D2-C2” to populate the first cell in this column, and then proceeded to auto-fill the rest of the column

b) created another column at the end for the day of the week for each ride (day_of_week), using the syntax “=WEEKDAY(C2,1)” for the first cell in the column, and then did an auto-fill for the rest of the column

c) deleted columns for start_lat, start_lng, end_lat, end_lng from the data for each month. These columns aren’t necessary for the data analysis process as we have information on the start and stop stations for each ride.

After executing these data cleaning processes, the data for each month was exported in .csv format, for further processing in SQL.

### *SQL*

For the next stage of the data processing, my tool of choice was SQL (specifically MySQL) as this tool allows for managing large amount of data, which can be challenging with Excel. Extra data cleaning steps were carried out, before proceeding to analyze the data.

Full SQL code can be found here

# Data Analysis

After the data cleaning and processing phase, I analyzed the data and visualized the key findings using Tableau. With the help of this tool, the data was efficiently aggregated and visualized to help identify key trends and relationships from the data. These visualizations are represented in a comprehensive Tableau [dashboard, which can be accessed here](https://public.tableau.com/views/CyclisticBikeshareDashboardGoogleCapstoneProject/Dashboard1?:language=en-GB&:display_count=n&:origin=viz_share_link). Some of the findings are outlined below:

### Annual members vs. Casual Riders

![Screenshot 2023-09-28 at 20.17.50.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/32a79c18-b120-4301-9f5b-db7ea44e1852/4da54870-8fc2-4620-bb31-4c2276b89299/Screenshot_2023-09-28_at_20.17.50.png)

The cleaned and processed data provided valuable insights into the usage patterns of annual members and casual riders. In the 12 months of 2022, a total of about 4.4 million rides were recorded. Cyclistic members ****accounted for about 2.61 million rides, which is 60% of all the rides recorded in 2022. Casual riders ****recorded about 1.76 million rides, amounting to about 40% of the total rides. Overall, cyclistic members engaged in more rides than casual riders.

### Average Ride Length By User Type

![Screenshot 2023-09-29 at 02.49.16.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/32a79c18-b120-4301-9f5b-db7ea44e1852/97537d42-3bd9-4693-bfbf-498d10630ddf/Screenshot_2023-09-29_at_02.49.16.png)

The average ride duration for all the rides taken in 2022 was about 17 minutes. Further analysis was carried out to determine the average ride by user type.

![Screenshot 2023-09-28 at 20.18.22.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/32a79c18-b120-4301-9f5b-db7ea44e1852/32450647-5168-4b3f-974a-fcb6712ded57/Screenshot_2023-09-28_at_20.18.22.png)

Cyclistic members rode for an average of 12.45 minutes in the entire year. On the other hand, casual riders had an average of 23.75 minutes of bike activity, almost twice the average length of cyclistic members. Despite the lower number of rides by casual riders (40% of total rides), they had significantly longer average ride durations compared to annual members.

### Ride distribution by Weekday

![Screenshot 2023-09-29 at 02.49.24.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/32a79c18-b120-4301-9f5b-db7ea44e1852/21cd91dd-02f3-4642-9de7-44798a6c2c24/Screenshot_2023-09-29_at_02.49.24.png)

Overall, Saturday was the busiest day of the week, with a total of about 700 thousand rides recorded. However, when analyzed by user type, the data tells different stories for casual riders and Cyclistic members.

![Screenshot 2023-09-29 at 15.28.11.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/32a79c18-b120-4301-9f5b-db7ea44e1852/6178f999-e3ed-4e7d-a488-7a053e12d2d6/Screenshot_2023-09-29_at_15.28.11.png)

![Screenshot 2023-09-29 at 15.29.12.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/32a79c18-b120-4301-9f5b-db7ea44e1852/9df7ac7a-0f25-49c6-86c3-7b3a2355d8eb/Screenshot_2023-09-29_at_15.29.12.png)

Cyclistic members took more rides during the weekdays and had fewer rides on the weekends. The chart above shows that cyclistic members' usage peaked in the middle of the week (Tuesday, Wednesday, and Thursday), and significantly fewer rides were recorded on the weekend.

In contrast, casual riders took more rides on the weekends, with Saturday clearly topping the charts. Saturday and Sunday recorded over 300 thousand casual rides, followed by a sharp drop on Monday and even less on Tuesday.

### Average Ride Length By User Type

![Screenshot 2023-09-28 at 20.18.53.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/32a79c18-b120-4301-9f5b-db7ea44e1852/a2c5fb18-e9ee-487f-8688-f191d14cf2c5/Screenshot_2023-09-28_at_20.18.53.png)

The data analysis revealed that annual members and casual riders tend to have longer rides on Sundays and Saturdays. However, ride durations decrease during the middle of the week before increasing again on Fridays. This creates a u-shape trend in ride durations for both groups, although it is more pronounced for casual riders who rode almost twice as long on each given day.

### Ride Distribution by Month

![Screenshot 2023-09-28 at 20.19.08.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/32a79c18-b120-4301-9f5b-db7ea44e1852/23d80cdf-1e79-497c-9d56-3ef419feb08c/Screenshot_2023-09-28_at_20.19.08.png)

The busiest month of the year was July, while January had the least amount of rides. In general, summer months (June, July, and August) accounted for the most bike-share activity, with about 43% of all rides, while winter months (December, January, and February) recorded the least number of rides, with just about 7% of the total rides. 

The number of rides increased as the winter months gave way to the spring season and peaked in the summer before declining again in the fall. This trend was fairly consistent when rides were analyzed by user type.

# Summary & Conclusion

- Annual members accounted for 60% of the total rides in 2022, while casual riders comprised 40%.
- Despite the fewer rides, casual riders had significantly longer average (about 2x) ride durations than annual members.
- Analyzing ride frequency by weekday revealed interesting patterns, with higher ride volumes occurring on weekdays compared to weekends for cyclistic members and vice versa for casual riders.
- The summer months recorded the highest amount of rides, and the winter season had the least number of rides.

# Business Recommendations

The insights obtained from the data analysis phase can help inform marketing strategies to target and convert casual riders into annual members, as well as optimize resources and tailor promotions for more effective results:

- Casual riders could be encouraged to become cyclistic members by offering first-time discounts for new members and extra discounts on the weekends as casual riders tend to ride more on weekends.
- Since both casual riders and annual members take more rides on the weekend, special summer packages can be made available cyclistic members. This might encourage casual riders to consider a membership to benefit from the offer.
- From the analysis report, casual riders generally engage in longer rides. Cyclistic can introduce member discounts for longer rides.
