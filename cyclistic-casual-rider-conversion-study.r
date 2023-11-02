{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "306a5642",
   "metadata": {
    "papermill": {
     "duration": 0.006467,
     "end_time": "2023-11-02T01:18:02.749071",
     "exception": false,
     "start_time": "2023-11-02T01:18:02.742604",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "\n",
    "# Introduction\n",
    "\n",
    "This is a Case Study on the bike-share company Cyclistic which seeks to design marketing campaigns aimed at future growth.\n",
    "The Study will go through 6 phases: *Ask, Prepare, Process, Analyze, Share and Act* to be presented as a report for the Stakeholders\n",
    "of Cyclistic.\n",
    "\n",
    "# Phase #1: Ask\n",
    "\n",
    "\n",
    "## Who is Cyclistic?\n",
    "\n",
    "Cyclistic™ is a bike-share company that has always sought to set itself apart from its competitors. Cyclisitc offers an impressive fleet of 5824 bikes, across 694 docking stations with a wide range of options that include bikes aimed at accessibility for those with disabilities and unable to use the standard two-handed bikes.\n",
    "\n",
    "Cyclistic has 3 pricing models comprised of \n",
    "*Single-Ride Passes*\n",
    "*Full-Day Passes*\n",
    "*Annual Memberships*\n",
    "  \n",
    "Those subscribed to Annual Memberships are referred to as “*Members*”.\n",
    "Single-Ride and Full-Day Riders are referred to as “*Casual Riders*”.\n",
    "  \n",
    "## Identifying the Business Task\n",
    "\n",
    "Cyclistic would like to Analyze the historical data of its riders to identify key \n",
    "differences between their Casual Riders and Annual Members and identify trends between the 2\n",
    "types of users. This Analysis will help the marketing team\n",
    "make design marketing strategies aimed at converting \"Casual\" Riders to Annual paid\n",
    "Members.\n",
    "\n",
    "## Stakeholders \n",
    "\n",
    "Key stakeholders in this endeavor will be *Lily Moreno*, *Cyclistic Marketing Analytics Team* and\n",
    "the *Cyclistic Executive Team*\n",
    "\n",
    "\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "c432abcc",
   "metadata": {
    "papermill": {
     "duration": 0.005162,
     "end_time": "2023-11-02T01:18:02.759799",
     "exception": false,
     "start_time": "2023-11-02T01:18:02.754637",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Phase #2: Prepare\n",
    "\n",
    "\n",
    "## The Data\n",
    "\n",
    "I'll be using Cyclistic's Historical Trip data collected for 12 months (Oct 2022 - Sept 2023) for this analysis. The Data was provided by Cyclistic and the data was collected and labeled on a monthly basis\n",
    "in csv files. Names and Personal identifieable information was removed and trips are identified by a `ride_id`. Data was captured on the trip starting and ending locations, times and geo-location coordinates.\n",
    "Each captured trip  also records if the trip is by a casual rider or a member and the type of bike used.\n",
    "\n",
    "Exploring the data revealed that some records have missing start station information, end station or both."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "492e8184",
   "metadata": {
    "_kg_hide-input": true,
    "execution": {
     "iopub.execute_input": "2023-11-02T01:18:02.777385Z",
     "iopub.status.busy": "2023-11-02T01:18:02.773957Z",
     "iopub.status.idle": "2023-11-02T01:18:38.242399Z",
     "shell.execute_reply": "2023-11-02T01:18:38.240465Z"
    },
    "papermill": {
     "duration": 35.479985,
     "end_time": "2023-11-02T01:18:38.245258",
     "exception": false,
     "start_time": "2023-11-02T01:18:02.765273",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.2     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.2     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.3     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.1     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n",
      "\n",
      "Attaching package: ‘hms’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:lubridate’:\n",
      "\n",
      "    hms\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "# Load tidyverse and other packages\n",
    "install.packages('tidyverse')\n",
    "install.packages('lubridate')\n",
    "library('tidyverse')\n",
    "library('lubridate')\n",
    "library('dplyr')\n",
    "library('hms')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "47fa5bad",
   "metadata": {
    "_kg_hide-output": false,
    "execution": {
     "iopub.execute_input": "2023-11-02T01:18:38.309176Z",
     "iopub.status.busy": "2023-11-02T01:18:38.260072Z",
     "iopub.status.idle": "2023-11-02T01:19:12.709581Z",
     "shell.execute_reply": "2023-11-02T01:19:12.707419Z"
    },
    "papermill": {
     "duration": 34.461345,
     "end_time": "2023-11-02T01:19:12.712740",
     "exception": false,
     "start_time": "2023-11-02T01:18:38.251395",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1mRows: \u001b[22m\u001b[34m666371\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m771693\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m767650\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m719618\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m604827\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m426590\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m258678\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m190445\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m190301\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m181806\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m337735\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n",
      "\u001b[1mRows: \u001b[22m\u001b[34m558685\u001b[39m \u001b[1mColumns: \u001b[22m\u001b[34m13\u001b[39m\n",
      "\u001b[36m──\u001b[39m \u001b[1mColumn specification\u001b[22m \u001b[36m────────────────────────────────────────────────────────\u001b[39m\n",
      "\u001b[1mDelimiter:\u001b[22m \",\"\n",
      "\u001b[31mchr\u001b[39m  (7): ride_id, rideable_type, start_station_name, start_station_id, end_...\n",
      "\u001b[32mdbl\u001b[39m  (4): start_lat, start_lng, end_lat, end_lng\n",
      "\u001b[34mdttm\u001b[39m (2): started_at, ended_at\n",
      "\n",
      "\u001b[36mℹ\u001b[39m Use `spec()` to retrieve the full column specification for this data.\n",
      "\u001b[36mℹ\u001b[39m Specify the column types or set `show_col_types = FALSE` to quiet this message.\n"
     ]
    }
   ],
   "source": [
    "# Read data from the csv files\n",
    "trip_sep_2023 <- read_csv('/kaggle/input/cyclistic-trip-csv-files/202309-divvy-tripdata.csv')\n",
    "trip_aug_2023 <- read_csv('/kaggle/input/cyclistic-trip-csv-files/202308-divvy-tripdata.csv')\n",
    "trip_jul_2023 <- read_csv('/kaggle/input/cyclistic-trip-csv-files/202307-divvy-tripdata.csv')\n",
    "trip_jun_2023 <- read_csv('/kaggle/input/cyclistic-trip-csv-files/202306-divvy-tripdata.csv')\n",
    "trip_may_2023 <- read_csv('/kaggle/input/cyclistic-trip-csv-files/202305-divvy-tripdata.csv')\n",
    "trip_apr_2023 <- read_csv('/kaggle/input/cyclistic-trip-csv-files/202304-divvy-tripdata.csv')\n",
    "trip_mar_2023 <- read_csv('/kaggle/input/cyclistic-trip-csv-files/202303-divvy-tripdata.csv')\n",
    "trip_feb_2023 <- read_csv('/kaggle/input/cyclistic-trip-csv-files/202302-divvy-tripdata.csv')\n",
    "trip_jan_2023 <- read_csv('/kaggle/input/cyclistic-trip-csv-files/202301-divvy-tripdata.csv')\n",
    "trip_dec_2022 <- read_csv('/kaggle/input/cyclistic-trip-csv-files/202212-divvy-tripdata.csv')\n",
    "trip_nov_2022 <- read_csv('/kaggle/input/cyclistic-trip-csv-files/202211-divvy-tripdata.csv')\n",
    "trip_oct_2022 <- read_csv('/kaggle/input/cyclistic-trip-csv-files/202210-divvy-tripdata.csv')"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "797e251f",
   "metadata": {
    "papermill": {
     "duration": 0.008622,
     "end_time": "2023-11-02T01:19:12.730637",
     "exception": false,
     "start_time": "2023-11-02T01:19:12.722015",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Phase #3: Process\n",
    "\n",
    "## Data Cleaning\n",
    "\n",
    "\n",
    "\n",
    "\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "38545739",
   "metadata": {
    "papermill": {
     "duration": 0.008553,
     "end_time": "2023-11-02T01:19:12.749661",
     "exception": false,
     "start_time": "2023-11-02T01:19:12.741108",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "First the data was aggregrated into a single dataset. 2 extra columns, ride_length and day_of_week were added to calculate how much time has passed between the start and end of a ride in the format HH:MM:SS and represent the day of the week of the ride numerically where Sunday = 1."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "66154114",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-02T01:19:12.770718Z",
     "iopub.status.busy": "2023-11-02T01:19:12.768973Z",
     "iopub.status.idle": "2023-11-02T01:19:20.104087Z",
     "shell.execute_reply": "2023-11-02T01:19:20.101830Z"
    },
    "papermill": {
     "duration": 7.348683,
     "end_time": "2023-11-02T01:19:20.107116",
     "exception": false,
     "start_time": "2023-11-02T01:19:12.758433",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Join rows into a single dataset and added the 2 new rows mentioned above\n",
    "complete_trip_data_raw <- bind_rows(trip_sep_2023, trip_aug_2023, trip_jul_2023, trip_jun_2023, trip_may_2023, trip_apr_2023, trip_mar_2023, trip_feb_2023, trip_jan_2023, trip_dec_2022, trip_nov_2022, trip_oct_2022) %>%\n",
    "    mutate(\n",
    "        ride_length=(as_hms(difftime(ended_at, started_at))),\n",
    "        day_of_week=wday(started_at, week_start=7)\n",
    "    )\n",
    "\n",
    "# Assign dataset to a dataframe\n",
    "df <- data.frame(complete_trip_data_raw)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2dc53cd3",
   "metadata": {
    "papermill": {
     "duration": 0.009453,
     "end_time": "2023-11-02T01:19:20.125748",
     "exception": false,
     "start_time": "2023-11-02T01:19:20.116295",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Here is the structure of the data frame:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "bf68d4ab",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-02T01:19:20.148512Z",
     "iopub.status.busy": "2023-11-02T01:19:20.146550Z",
     "iopub.status.idle": "2023-11-02T01:19:20.185894Z",
     "shell.execute_reply": "2023-11-02T01:19:20.183223Z"
    },
    "papermill": {
     "duration": 0.053502,
     "end_time": "2023-11-02T01:19:20.188917",
     "exception": false,
     "start_time": "2023-11-02T01:19:20.135415",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 5,674,399\n",
      "Columns: 15\n",
      "$ ride_id            \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"011C1903BF4E2E28\", \"87DB80E048A1BF9F\", \"7C2EB7AF66…\n",
      "$ rideable_type      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"classic_bike\", \"classic_bike\", \"electric_bike\", \"c…\n",
      "$ started_at         \u001b[3m\u001b[90m<dttm>\u001b[39m\u001b[23m 2023-09-23 00:27:50, 2023-09-02 09:26:43, 2023-09-…\n",
      "$ ended_at           \u001b[3m\u001b[90m<dttm>\u001b[39m\u001b[23m 2023-09-23 00:33:27, 2023-09-02 09:38:19, 2023-09-…\n",
      "$ start_station_name \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Halsted St & Wrightwood Ave\", \"Clark St & Drummond…\n",
      "$ start_station_id   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"TA1309000061\", \"TA1307000142\", \"SL-010\", \"TA130700…\n",
      "$ end_station_name   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Sheffield Ave & Wellington Ave\", \"Racine Ave & Ful…\n",
      "$ end_station_id     \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"TA1307000052\", \"TA1306000026\", \"13304\", \"TA1308000…\n",
      "$ start_lat          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.92914, 41.93125, 41.87506, 41.93125, 41.92914, 4…\n",
      "$ start_lng          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.64908, -87.64434, -87.63314, -87.64434, -87.649…\n",
      "$ end_lat            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.93625, 41.92557, 41.86127, 41.93974, 41.92557, 4…\n",
      "$ end_lng            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.65266, -87.65842, -87.65663, -87.65887, -87.658…\n",
      "$ member_casual      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"member\", \"member\", \"member\", \"member\", \"member\", \"…\n",
      "$ ride_length        \u001b[3m\u001b[90m<time>\u001b[39m\u001b[23m 00:05:37, 00:11:36, 00:11:28, 00:08:29, 00:06:06, …\n",
      "$ day_of_week        \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 7, 7, 2, 4, 2, 6, 4, 1, 1, 5, 3, 1, 5, 6, 5, 2, 5, …\n"
     ]
    }
   ],
   "source": [
    "glimpse(df)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8a2672c1",
   "metadata": {
    "papermill": {
     "duration": 0.008769,
     "end_time": "2023-11-02T01:19:20.207273",
     "exception": false,
     "start_time": "2023-11-02T01:19:20.198504",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Our aggregated data contains 5,674,399 rows as seen above."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9f9841b2",
   "metadata": {
    "papermill": {
     "duration": 0.00858,
     "end_time": "2023-11-02T01:19:20.224503",
     "exception": false,
     "start_time": "2023-11-02T01:19:20.215923",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Investigating the data showed that several end station data was missing."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "4a678d8f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-02T01:19:20.245688Z",
     "iopub.status.busy": "2023-11-02T01:19:20.243867Z",
     "iopub.status.idle": "2023-11-02T01:19:20.614623Z",
     "shell.execute_reply": "2023-11-02T01:19:20.611888Z"
    },
    "papermill": {
     "duration": 0.384488,
     "end_time": "2023-11-02T01:19:20.617649",
     "exception": false,
     "start_time": "2023-11-02T01:19:20.233161",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message:\n",
      "“\u001b[1m\u001b[22mThere was 1 warning in `filter()`.\n",
      "\u001b[1m\u001b[22m\u001b[36mℹ\u001b[39m In argument: `all_of(is.na(end_station_name))`.\n",
      "Caused by warning:\n",
      "\u001b[1m\u001b[22m\u001b[33m!\u001b[39m Using `all_of()` outside of a selecting function was deprecated in tidyselect\n",
      "  1.2.0.\n",
      "\u001b[36mℹ\u001b[39m See details at\n",
      "  <https://tidyselect.r-lib.org/reference/faq-selection-context.html>”\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th><th scope=col>ride_length</th><th scope=col>day_of_week</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;time&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>03F7044D1304CD58</td><td>electric_bike</td><td>2023-09-15 20:19:25</td><td>2023-09-15 20:30:27</td><td>Southport Ave &amp; Wrightwood Ave</td><td>TA1307000113</td><td>NA</td><td>NA</td><td>41.92884</td><td>-87.66387</td><td>41.90</td><td>-87.64</td><td>member</td><td>00:11:02</td><td>6</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>672503E0FC0835EC</td><td>electric_bike</td><td>2023-09-27 16:52:18</td><td>2023-09-27 17:03:22</td><td><span style=white-space:pre-wrap>Kedzie Ave &amp; Milwaukee Ave    </span></td><td><span style=white-space:pre-wrap>13085       </span></td><td>NA</td><td>NA</td><td>41.92956</td><td>-87.70796</td><td>41.93</td><td>-87.66</td><td>member</td><td>00:11:04</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1D806492F95973AC</td><td>electric_bike</td><td>2023-09-17 11:07:05</td><td>2023-09-17 11:13:39</td><td><span style=white-space:pre-wrap>Jeffery Blvd &amp; 71st St        </span></td><td>KA1503000018</td><td>NA</td><td>NA</td><td>41.76659</td><td>-87.57645</td><td>41.77</td><td>-87.57</td><td>member</td><td>00:06:34</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>C60CE661AF7ECC93</td><td>electric_bike</td><td>2023-09-07 20:52:43</td><td>2023-09-07 21:06:51</td><td>Southport Ave &amp; Wrightwood Ave</td><td>TA1307000113</td><td>NA</td><td>NA</td><td>41.92882</td><td>-87.66391</td><td>41.90</td><td>-87.63</td><td>member</td><td>00:14:08</td><td>5</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>F15583D1C6A41E62</td><td>electric_bike</td><td>2023-09-29 17:05:36</td><td>2023-09-29 17:12:19</td><td>Financial Pl &amp; Ida B Wells Dr </td><td><span style=white-space:pre-wrap>SL-010      </span></td><td>NA</td><td>NA</td><td>41.87506</td><td>-87.63296</td><td>41.88</td><td>-87.63</td><td>member</td><td>00:06:43</td><td>6</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 15\n",
       "\\begin{tabular}{r|lllllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual & ride\\_length & day\\_of\\_week\\\\\n",
       "  & <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <time> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 03F7044D1304CD58 & electric\\_bike & 2023-09-15 20:19:25 & 2023-09-15 20:30:27 & Southport Ave \\& Wrightwood Ave & TA1307000113 & NA & NA & 41.92884 & -87.66387 & 41.90 & -87.64 & member & 00:11:02 & 6\\\\\n",
       "\t2 & 672503E0FC0835EC & electric\\_bike & 2023-09-27 16:52:18 & 2023-09-27 17:03:22 & Kedzie Ave \\& Milwaukee Ave     & 13085        & NA & NA & 41.92956 & -87.70796 & 41.93 & -87.66 & member & 00:11:04 & 4\\\\\n",
       "\t3 & 1D806492F95973AC & electric\\_bike & 2023-09-17 11:07:05 & 2023-09-17 11:13:39 & Jeffery Blvd \\& 71st St         & KA1503000018 & NA & NA & 41.76659 & -87.57645 & 41.77 & -87.57 & member & 00:06:34 & 1\\\\\n",
       "\t4 & C60CE661AF7ECC93 & electric\\_bike & 2023-09-07 20:52:43 & 2023-09-07 21:06:51 & Southport Ave \\& Wrightwood Ave & TA1307000113 & NA & NA & 41.92882 & -87.66391 & 41.90 & -87.63 & member & 00:14:08 & 5\\\\\n",
       "\t5 & F15583D1C6A41E62 & electric\\_bike & 2023-09-29 17:05:36 & 2023-09-29 17:12:19 & Financial Pl \\& Ida B Wells Dr  & SL-010       & NA & NA & 41.87506 & -87.63296 & 41.88 & -87.63 & member & 00:06:43 & 6\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 15\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; | ride_length &lt;time&gt; | day_of_week &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 03F7044D1304CD58 | electric_bike | 2023-09-15 20:19:25 | 2023-09-15 20:30:27 | Southport Ave &amp; Wrightwood Ave | TA1307000113 | NA | NA | 41.92884 | -87.66387 | 41.90 | -87.64 | member | 00:11:02 | 6 |\n",
       "| 2 | 672503E0FC0835EC | electric_bike | 2023-09-27 16:52:18 | 2023-09-27 17:03:22 | Kedzie Ave &amp; Milwaukee Ave     | 13085        | NA | NA | 41.92956 | -87.70796 | 41.93 | -87.66 | member | 00:11:04 | 4 |\n",
       "| 3 | 1D806492F95973AC | electric_bike | 2023-09-17 11:07:05 | 2023-09-17 11:13:39 | Jeffery Blvd &amp; 71st St         | KA1503000018 | NA | NA | 41.76659 | -87.57645 | 41.77 | -87.57 | member | 00:06:34 | 1 |\n",
       "| 4 | C60CE661AF7ECC93 | electric_bike | 2023-09-07 20:52:43 | 2023-09-07 21:06:51 | Southport Ave &amp; Wrightwood Ave | TA1307000113 | NA | NA | 41.92882 | -87.66391 | 41.90 | -87.63 | member | 00:14:08 | 5 |\n",
       "| 5 | F15583D1C6A41E62 | electric_bike | 2023-09-29 17:05:36 | 2023-09-29 17:12:19 | Financial Pl &amp; Ida B Wells Dr  | SL-010       | NA | NA | 41.87506 | -87.63296 | 41.88 | -87.63 | member | 00:06:43 | 6 |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 03F7044D1304CD58 electric_bike 2023-09-15 20:19:25 2023-09-15 20:30:27\n",
       "2 672503E0FC0835EC electric_bike 2023-09-27 16:52:18 2023-09-27 17:03:22\n",
       "3 1D806492F95973AC electric_bike 2023-09-17 11:07:05 2023-09-17 11:13:39\n",
       "4 C60CE661AF7ECC93 electric_bike 2023-09-07 20:52:43 2023-09-07 21:06:51\n",
       "5 F15583D1C6A41E62 electric_bike 2023-09-29 17:05:36 2023-09-29 17:12:19\n",
       "  start_station_name             start_station_id end_station_name\n",
       "1 Southport Ave & Wrightwood Ave TA1307000113     NA              \n",
       "2 Kedzie Ave & Milwaukee Ave     13085            NA              \n",
       "3 Jeffery Blvd & 71st St         KA1503000018     NA              \n",
       "4 Southport Ave & Wrightwood Ave TA1307000113     NA              \n",
       "5 Financial Pl & Ida B Wells Dr  SL-010           NA              \n",
       "  end_station_id start_lat start_lng end_lat end_lng member_casual ride_length\n",
       "1 NA             41.92884  -87.66387 41.90   -87.64  member        00:11:02   \n",
       "2 NA             41.92956  -87.70796 41.93   -87.66  member        00:11:04   \n",
       "3 NA             41.76659  -87.57645 41.77   -87.57  member        00:06:34   \n",
       "4 NA             41.92882  -87.66391 41.90   -87.63  member        00:14:08   \n",
       "5 NA             41.87506  -87.63296 41.88   -87.63  member        00:06:43   \n",
       "  day_of_week\n",
       "1 6          \n",
       "2 4          \n",
       "3 1          \n",
       "4 5          \n",
       "5 6          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Sample of rows with missing ending_station_name and end_station_id\n",
    "df %>% filter(all_of(is.na(end_station_name))) %>% head(5)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1fdd79c1",
   "metadata": {
    "papermill": {
     "duration": 0.009141,
     "end_time": "2023-11-02T01:19:20.636316",
     "exception": false,
     "start_time": "2023-11-02T01:19:20.627175",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "This observation also exists for several start station data."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "962f027b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-02T01:19:20.658630Z",
     "iopub.status.busy": "2023-11-02T01:19:20.656900Z",
     "iopub.status.idle": "2023-11-02T01:19:21.255161Z",
     "shell.execute_reply": "2023-11-02T01:19:21.252563Z"
    },
    "papermill": {
     "duration": 0.612864,
     "end_time": "2023-11-02T01:19:21.258373",
     "exception": false,
     "start_time": "2023-11-02T01:19:20.645509",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th><th scope=col>ride_length</th><th scope=col>day_of_week</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;time&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>53BA437C0744B2FC</td><td>electric_bike</td><td>2023-09-16 16:53:40</td><td>2023-09-16 17:03:12</td><td>NA</td><td>NA</td><td><span style=white-space:pre-wrap>Damen Ave &amp; Pierce Ave   </span></td><td>TA1305000041</td><td>41.92</td><td>-87.65</td><td>41.90940</td><td>-87.67769</td><td>member</td><td>00:09:32</td><td>7</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>2FF6A0C21DA1340D</td><td>electric_bike</td><td>2023-09-17 16:35:53</td><td>2023-09-17 16:47:48</td><td>NA</td><td>NA</td><td><span style=white-space:pre-wrap>Damen Ave &amp; Pierce Ave   </span></td><td>TA1305000041</td><td>41.93</td><td>-87.66</td><td>41.90940</td><td>-87.67769</td><td>member</td><td>00:11:55</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>98F0AA2E7E2FC359</td><td>electric_bike</td><td>2023-09-05 06:12:17</td><td>2023-09-05 06:18:59</td><td>NA</td><td>NA</td><td>Milwaukee Ave &amp; Grand Ave</td><td><span style=white-space:pre-wrap>13033       </span></td><td>41.90</td><td>-87.67</td><td>41.89158</td><td>-87.64838</td><td>member</td><td>00:06:42</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>3BFF876768EFD425</td><td>electric_bike</td><td>2023-09-13 11:08:29</td><td>2023-09-13 11:31:16</td><td>NA</td><td>NA</td><td><span style=white-space:pre-wrap>Racine Ave &amp; 15th St     </span></td><td><span style=white-space:pre-wrap>13304       </span></td><td>41.86</td><td>-87.67</td><td>41.86127</td><td>-87.65663</td><td>member</td><td>00:22:47</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>C8C0D6DE201627A4</td><td>electric_bike</td><td>2023-09-14 19:18:16</td><td>2023-09-14 19:32:01</td><td>NA</td><td>NA</td><td>Laflin St &amp; Cullerton St </td><td><span style=white-space:pre-wrap>13307       </span></td><td>41.88</td><td>-87.64</td><td>41.85491</td><td>-87.66356</td><td>member</td><td>00:13:45</td><td>5</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 15\n",
       "\\begin{tabular}{r|lllllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual & ride\\_length & day\\_of\\_week\\\\\n",
       "  & <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <time> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 53BA437C0744B2FC & electric\\_bike & 2023-09-16 16:53:40 & 2023-09-16 17:03:12 & NA & NA & Damen Ave \\& Pierce Ave    & TA1305000041 & 41.92 & -87.65 & 41.90940 & -87.67769 & member & 00:09:32 & 7\\\\\n",
       "\t2 & 2FF6A0C21DA1340D & electric\\_bike & 2023-09-17 16:35:53 & 2023-09-17 16:47:48 & NA & NA & Damen Ave \\& Pierce Ave    & TA1305000041 & 41.93 & -87.66 & 41.90940 & -87.67769 & member & 00:11:55 & 1\\\\\n",
       "\t3 & 98F0AA2E7E2FC359 & electric\\_bike & 2023-09-05 06:12:17 & 2023-09-05 06:18:59 & NA & NA & Milwaukee Ave \\& Grand Ave & 13033        & 41.90 & -87.67 & 41.89158 & -87.64838 & member & 00:06:42 & 3\\\\\n",
       "\t4 & 3BFF876768EFD425 & electric\\_bike & 2023-09-13 11:08:29 & 2023-09-13 11:31:16 & NA & NA & Racine Ave \\& 15th St      & 13304        & 41.86 & -87.67 & 41.86127 & -87.65663 & member & 00:22:47 & 4\\\\\n",
       "\t5 & C8C0D6DE201627A4 & electric\\_bike & 2023-09-14 19:18:16 & 2023-09-14 19:32:01 & NA & NA & Laflin St \\& Cullerton St  & 13307        & 41.88 & -87.64 & 41.85491 & -87.66356 & member & 00:13:45 & 5\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 15\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; | ride_length &lt;time&gt; | day_of_week &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 53BA437C0744B2FC | electric_bike | 2023-09-16 16:53:40 | 2023-09-16 17:03:12 | NA | NA | Damen Ave &amp; Pierce Ave    | TA1305000041 | 41.92 | -87.65 | 41.90940 | -87.67769 | member | 00:09:32 | 7 |\n",
       "| 2 | 2FF6A0C21DA1340D | electric_bike | 2023-09-17 16:35:53 | 2023-09-17 16:47:48 | NA | NA | Damen Ave &amp; Pierce Ave    | TA1305000041 | 41.93 | -87.66 | 41.90940 | -87.67769 | member | 00:11:55 | 1 |\n",
       "| 3 | 98F0AA2E7E2FC359 | electric_bike | 2023-09-05 06:12:17 | 2023-09-05 06:18:59 | NA | NA | Milwaukee Ave &amp; Grand Ave | 13033        | 41.90 | -87.67 | 41.89158 | -87.64838 | member | 00:06:42 | 3 |\n",
       "| 4 | 3BFF876768EFD425 | electric_bike | 2023-09-13 11:08:29 | 2023-09-13 11:31:16 | NA | NA | Racine Ave &amp; 15th St      | 13304        | 41.86 | -87.67 | 41.86127 | -87.65663 | member | 00:22:47 | 4 |\n",
       "| 5 | C8C0D6DE201627A4 | electric_bike | 2023-09-14 19:18:16 | 2023-09-14 19:32:01 | NA | NA | Laflin St &amp; Cullerton St  | 13307        | 41.88 | -87.64 | 41.85491 | -87.66356 | member | 00:13:45 | 5 |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 53BA437C0744B2FC electric_bike 2023-09-16 16:53:40 2023-09-16 17:03:12\n",
       "2 2FF6A0C21DA1340D electric_bike 2023-09-17 16:35:53 2023-09-17 16:47:48\n",
       "3 98F0AA2E7E2FC359 electric_bike 2023-09-05 06:12:17 2023-09-05 06:18:59\n",
       "4 3BFF876768EFD425 electric_bike 2023-09-13 11:08:29 2023-09-13 11:31:16\n",
       "5 C8C0D6DE201627A4 electric_bike 2023-09-14 19:18:16 2023-09-14 19:32:01\n",
       "  start_station_name start_station_id end_station_name          end_station_id\n",
       "1 NA                 NA               Damen Ave & Pierce Ave    TA1305000041  \n",
       "2 NA                 NA               Damen Ave & Pierce Ave    TA1305000041  \n",
       "3 NA                 NA               Milwaukee Ave & Grand Ave 13033         \n",
       "4 NA                 NA               Racine Ave & 15th St      13304         \n",
       "5 NA                 NA               Laflin St & Cullerton St  13307         \n",
       "  start_lat start_lng end_lat  end_lng   member_casual ride_length day_of_week\n",
       "1 41.92     -87.65    41.90940 -87.67769 member        00:09:32    7          \n",
       "2 41.93     -87.66    41.90940 -87.67769 member        00:11:55    1          \n",
       "3 41.90     -87.67    41.89158 -87.64838 member        00:06:42    3          \n",
       "4 41.86     -87.67    41.86127 -87.65663 member        00:22:47    4          \n",
       "5 41.88     -87.64    41.85491 -87.66356 member        00:13:45    5          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Sample of rows with missing start_station_name and start_station_id\n",
    "df %>% filter(all_of(is.na(start_station_name))) %>% head(5)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0f50b6e4",
   "metadata": {
    "papermill": {
     "duration": 0.009521,
     "end_time": "2023-11-02T01:19:21.277569",
     "exception": false,
     "start_time": "2023-11-02T01:19:21.268048",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The geolocation is present in both cases, and we can search the location on Google Maps to verify and retrieve the names of the locations at those coordinates, however the data would still be missing the station ids. Therefore still being incomplete and unusable.\n",
    "\n",
    "For this reason we will be removing these rows:"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "254d2658",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-02T01:19:21.300443Z",
     "iopub.status.busy": "2023-11-02T01:19:21.298766Z",
     "iopub.status.idle": "2023-11-02T01:19:23.686170Z",
     "shell.execute_reply": "2023-11-02T01:19:23.684212Z"
    },
    "papermill": {
     "duration": 2.402613,
     "end_time": "2023-11-02T01:19:23.689796",
     "exception": false,
     "start_time": "2023-11-02T01:19:21.287183",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Removing all station related rows with empty data (NA)\n",
    "df_cleaned <- df %>%\n",
    "    drop_na(end_station_name, end_station_id, start_station_name, start_station_id)"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 85.006105,
   "end_time": "2023-11-02T01:19:24.023640",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-11-02T01:17:59.017535",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
