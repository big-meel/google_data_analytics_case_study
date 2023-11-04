{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "4ff9164b",
   "metadata": {
    "papermill": {
     "duration": 0.006781,
     "end_time": "2023-11-04T22:11:30.111159",
     "exception": false,
     "start_time": "2023-11-04T22:11:30.104378",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "###### # Introduction\n",
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
   "id": "4103d216",
   "metadata": {
    "papermill": {
     "duration": 0.005646,
     "end_time": "2023-11-04T22:11:30.123008",
     "exception": false,
     "start_time": "2023-11-04T22:11:30.117362",
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
   "id": "3218a2a6",
   "metadata": {
    "_kg_hide-input": true,
    "_kg_hide-output": true,
    "execution": {
     "iopub.execute_input": "2023-11-04T22:11:30.139871Z",
     "iopub.status.busy": "2023-11-04T22:11:30.137650Z",
     "iopub.status.idle": "2023-11-04T22:11:57.089366Z",
     "shell.execute_reply": "2023-11-04T22:11:57.087907Z"
    },
    "papermill": {
     "duration": 26.963839,
     "end_time": "2023-11-04T22:11:57.092535",
     "exception": false,
     "start_time": "2023-11-04T22:11:30.128696",
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
    "library('hms')\n",
    "library('stringr')\n",
    "library('ggplot2')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "04f182a5",
   "metadata": {
    "_kg_hide-output": true,
    "execution": {
     "iopub.execute_input": "2023-11-04T22:11:57.146392Z",
     "iopub.status.busy": "2023-11-04T22:11:57.108175Z",
     "iopub.status.idle": "2023-11-04T22:12:23.395432Z",
     "shell.execute_reply": "2023-11-04T22:12:23.393692Z"
    },
    "papermill": {
     "duration": 26.297741,
     "end_time": "2023-11-04T22:12:23.398108",
     "exception": false,
     "start_time": "2023-11-04T22:11:57.100367",
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
   "id": "6d9b8546",
   "metadata": {
    "papermill": {
     "duration": 0.007978,
     "end_time": "2023-11-04T22:12:23.415366",
     "exception": false,
     "start_time": "2023-11-04T22:12:23.407388",
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
   "id": "96a41fc3",
   "metadata": {
    "papermill": {
     "duration": 0.008069,
     "end_time": "2023-11-04T22:12:23.431507",
     "exception": false,
     "start_time": "2023-11-04T22:12:23.423438",
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
   "id": "067ff841",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T22:12:23.450874Z",
     "iopub.status.busy": "2023-11-04T22:12:23.449576Z",
     "iopub.status.idle": "2023-11-04T22:12:29.052660Z",
     "shell.execute_reply": "2023-11-04T22:12:29.051177Z"
    },
    "papermill": {
     "duration": 5.616014,
     "end_time": "2023-11-04T22:12:29.055524",
     "exception": false,
     "start_time": "2023-11-04T22:12:23.439510",
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
   "id": "cee00106",
   "metadata": {
    "papermill": {
     "duration": 0.008434,
     "end_time": "2023-11-04T22:12:29.072489",
     "exception": false,
     "start_time": "2023-11-04T22:12:29.064055",
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
   "id": "f6b55ec5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T22:12:29.094138Z",
     "iopub.status.busy": "2023-11-04T22:12:29.092515Z",
     "iopub.status.idle": "2023-11-04T22:12:29.124731Z",
     "shell.execute_reply": "2023-11-04T22:12:29.123408Z"
    },
    "papermill": {
     "duration": 0.046018,
     "end_time": "2023-11-04T22:12:29.127095",
     "exception": false,
     "start_time": "2023-11-04T22:12:29.081077",
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
   "id": "66716234",
   "metadata": {
    "papermill": {
     "duration": 0.007961,
     "end_time": "2023-11-04T22:12:29.143186",
     "exception": false,
     "start_time": "2023-11-04T22:12:29.135225",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Our aggregated data contains 5,674,399 rows as seen above.\n",
    "\n",
    "Investigating the data showed that several end station data was missing."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "d54cd5aa",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T22:12:29.162997Z",
     "iopub.status.busy": "2023-11-04T22:12:29.161684Z",
     "iopub.status.idle": "2023-11-04T22:12:29.344805Z",
     "shell.execute_reply": "2023-11-04T22:12:29.342787Z"
    },
    "papermill": {
     "duration": 0.195969,
     "end_time": "2023-11-04T22:12:29.347179",
     "exception": false,
     "start_time": "2023-11-04T22:12:29.151210",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>03F7044D1304CD58</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>672503E0FC0835EC</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1D806492F95973AC</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>C60CE661AF7ECC93</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>F15583D1C6A41E62</td><td>NA</td><td>NA</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 3\n",
       "\\begin{tabular}{r|lll}\n",
       "  & ride\\_id & end\\_station\\_name & end\\_station\\_id\\\\\n",
       "  & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 03F7044D1304CD58 & NA & NA\\\\\n",
       "\t2 & 672503E0FC0835EC & NA & NA\\\\\n",
       "\t3 & 1D806492F95973AC & NA & NA\\\\\n",
       "\t4 & C60CE661AF7ECC93 & NA & NA\\\\\n",
       "\t5 & F15583D1C6A41E62 & NA & NA\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 3\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; |\n",
       "|---|---|---|---|\n",
       "| 1 | 03F7044D1304CD58 | NA | NA |\n",
       "| 2 | 672503E0FC0835EC | NA | NA |\n",
       "| 3 | 1D806492F95973AC | NA | NA |\n",
       "| 4 | C60CE661AF7ECC93 | NA | NA |\n",
       "| 5 | F15583D1C6A41E62 | NA | NA |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          end_station_name end_station_id\n",
       "1 03F7044D1304CD58 NA               NA            \n",
       "2 672503E0FC0835EC NA               NA            \n",
       "3 1D806492F95973AC NA               NA            \n",
       "4 C60CE661AF7ECC93 NA               NA            \n",
       "5 F15583D1C6A41E62 NA               NA            "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Sample of rows with missing end_station_name and end_station_id\n",
    "df %>% filter(is.na(end_station_name)) %>% select(ride_id, end_station_name, end_station_id) %>% head(5)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e3f56a6f",
   "metadata": {
    "papermill": {
     "duration": 0.008266,
     "end_time": "2023-11-04T22:12:29.364008",
     "exception": false,
     "start_time": "2023-11-04T22:12:29.355742",
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
   "id": "7042e244",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T22:12:29.383762Z",
     "iopub.status.busy": "2023-11-04T22:12:29.382460Z",
     "iopub.status.idle": "2023-11-04T22:12:29.896723Z",
     "shell.execute_reply": "2023-11-04T22:12:29.894837Z"
    },
    "papermill": {
     "duration": 0.527194,
     "end_time": "2023-11-04T22:12:29.899510",
     "exception": false,
     "start_time": "2023-11-04T22:12:29.372316",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>53BA437C0744B2FC</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>2FF6A0C21DA1340D</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>98F0AA2E7E2FC359</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>3BFF876768EFD425</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>C8C0D6DE201627A4</td><td>NA</td><td>NA</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 3\n",
       "\\begin{tabular}{r|lll}\n",
       "  & ride\\_id & start\\_station\\_name & start\\_station\\_id\\\\\n",
       "  & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 53BA437C0744B2FC & NA & NA\\\\\n",
       "\t2 & 2FF6A0C21DA1340D & NA & NA\\\\\n",
       "\t3 & 98F0AA2E7E2FC359 & NA & NA\\\\\n",
       "\t4 & 3BFF876768EFD425 & NA & NA\\\\\n",
       "\t5 & C8C0D6DE201627A4 & NA & NA\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 3\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; |\n",
       "|---|---|---|---|\n",
       "| 1 | 53BA437C0744B2FC | NA | NA |\n",
       "| 2 | 2FF6A0C21DA1340D | NA | NA |\n",
       "| 3 | 98F0AA2E7E2FC359 | NA | NA |\n",
       "| 4 | 3BFF876768EFD425 | NA | NA |\n",
       "| 5 | C8C0D6DE201627A4 | NA | NA |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          start_station_name start_station_id\n",
       "1 53BA437C0744B2FC NA                 NA              \n",
       "2 2FF6A0C21DA1340D NA                 NA              \n",
       "3 98F0AA2E7E2FC359 NA                 NA              \n",
       "4 3BFF876768EFD425 NA                 NA              \n",
       "5 C8C0D6DE201627A4 NA                 NA              "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Sample of rows with missing start_station_name and start_station_id\n",
    "df %>% filter(is.na(start_station_name)) %>% select(ride_id, start_station_name, start_station_id) %>% head(5)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6111d8f9",
   "metadata": {
    "papermill": {
     "duration": 0.008447,
     "end_time": "2023-11-04T22:12:29.916470",
     "exception": false,
     "start_time": "2023-11-04T22:12:29.908023",
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
   "id": "a1a72324",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T22:12:29.936293Z",
     "iopub.status.busy": "2023-11-04T22:12:29.934933Z",
     "iopub.status.idle": "2023-11-04T22:12:31.408702Z",
     "shell.execute_reply": "2023-11-04T22:12:31.407266Z"
    },
    "papermill": {
     "duration": 1.485974,
     "end_time": "2023-11-04T22:12:31.410719",
     "exception": false,
     "start_time": "2023-11-04T22:12:29.924745",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Removing all station related rows with empty data (NA)\n",
    "df_cleaned <- df %>%\n",
    "    drop_na(end_station_name, end_station_id, start_station_name, start_station_id)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a7606b03",
   "metadata": {
    "papermill": {
     "duration": 0.009514,
     "end_time": "2023-11-04T22:12:31.428624",
     "exception": false,
     "start_time": "2023-11-04T22:12:31.419110",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Included in the dataset are stations with an asterisk (*) at the end, all belonging to IDs with 'charging' in them. We'll remove the asterisks to avoid any issues."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "e9ed18b0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T22:12:31.448459Z",
     "iopub.status.busy": "2023-11-04T22:12:31.447036Z",
     "iopub.status.idle": "2023-11-04T22:12:38.240978Z",
     "shell.execute_reply": "2023-11-04T22:12:38.239700Z"
    },
    "papermill": {
     "duration": 6.806721,
     "end_time": "2023-11-04T22:12:38.243622",
     "exception": false,
     "start_time": "2023-11-04T22:12:31.436901",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 5 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>start_station_name</th><th scope=col>end_station_name</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td><span style=white-space:pre-wrap>Lincoln Ave &amp; Roscoe St   </span></td><td>Clarendon Ave &amp; Junior Ter</td></tr>\n",
       "\t<tr><th scope=row>2</th><td><span style=white-space:pre-wrap>Lincoln Ave &amp; Roscoe St   </span></td><td><span style=white-space:pre-wrap>Damen Ave &amp; Pierce Ave    </span></td></tr>\n",
       "\t<tr><th scope=row>3</th><td>Fort Dearborn Dr &amp; 31st St</td><td><span style=white-space:pre-wrap>MLK Jr Dr &amp; 29th St       </span></td></tr>\n",
       "\t<tr><th scope=row>4</th><td><span style=white-space:pre-wrap>Morgan St &amp; Lake St       </span></td><td><span style=white-space:pre-wrap>Kingsbury St &amp; Kinzie St  </span></td></tr>\n",
       "\t<tr><th scope=row>5</th><td><span style=white-space:pre-wrap>Morgan St &amp; Lake St       </span></td><td><span style=white-space:pre-wrap>Clark St &amp; Lake St        </span></td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 5 × 2\n",
       "\\begin{tabular}{r|ll}\n",
       "  & start\\_station\\_name & end\\_station\\_name\\\\\n",
       "  & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & Lincoln Ave \\& Roscoe St    & Clarendon Ave \\& Junior Ter\\\\\n",
       "\t2 & Lincoln Ave \\& Roscoe St    & Damen Ave \\& Pierce Ave    \\\\\n",
       "\t3 & Fort Dearborn Dr \\& 31st St & MLK Jr Dr \\& 29th St       \\\\\n",
       "\t4 & Morgan St \\& Lake St        & Kingsbury St \\& Kinzie St  \\\\\n",
       "\t5 & Morgan St \\& Lake St        & Clark St \\& Lake St        \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 5 × 2\n",
       "\n",
       "| <!--/--> | start_station_name &lt;chr&gt; | end_station_name &lt;chr&gt; |\n",
       "|---|---|---|\n",
       "| 1 | Lincoln Ave &amp; Roscoe St    | Clarendon Ave &amp; Junior Ter |\n",
       "| 2 | Lincoln Ave &amp; Roscoe St    | Damen Ave &amp; Pierce Ave     |\n",
       "| 3 | Fort Dearborn Dr &amp; 31st St | MLK Jr Dr &amp; 29th St        |\n",
       "| 4 | Morgan St &amp; Lake St        | Kingsbury St &amp; Kinzie St   |\n",
       "| 5 | Morgan St &amp; Lake St        | Clark St &amp; Lake St         |\n",
       "\n"
      ],
      "text/plain": [
       "  start_station_name         end_station_name          \n",
       "1 Lincoln Ave & Roscoe St    Clarendon Ave & Junior Ter\n",
       "2 Lincoln Ave & Roscoe St    Damen Ave & Pierce Ave    \n",
       "3 Fort Dearborn Dr & 31st St MLK Jr Dr & 29th St       \n",
       "4 Morgan St & Lake St        Kingsbury St & Kinzie St  \n",
       "5 Morgan St & Lake St        Clark St & Lake St        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Remove asterisks from start and end station names\n",
    "df_cleaned <- df_cleaned %>%\n",
    "    mutate(\n",
    "        start_station_name=str_replace(start_station_name,\"[*]\",\"\"),\n",
    "        end_station_name=str_replace(end_station_name,\"[*]\", \"\")\n",
    "    )\n",
    "\n",
    "# Review Sample of cleaned station names\n",
    "df_cleaned %>% filter(grepl(\"charging\", start_station_id)) %>% select(start_station_name, end_station_name) %>% head(5)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "125ea7cc",
   "metadata": {
    "papermill": {
     "duration": 0.009496,
     "end_time": "2023-11-04T22:12:38.262433",
     "exception": false,
     "start_time": "2023-11-04T22:12:38.252937",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "A now for a sample review of the cleaned data set."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "d5bb2b8f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T22:12:38.283942Z",
     "iopub.status.busy": "2023-11-04T22:12:38.282614Z",
     "iopub.status.idle": "2023-11-04T22:12:38.314963Z",
     "shell.execute_reply": "2023-11-04T22:12:38.313695Z"
    },
    "papermill": {
     "duration": 0.04483,
     "end_time": "2023-11-04T22:12:38.316849",
     "exception": false,
     "start_time": "2023-11-04T22:12:38.272019",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 10 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th><th scope=col>ride_length</th><th scope=col>day_of_week</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;time&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>011C1903BF4E2E28</td><td>classic_bike </td><td>2023-09-23 00:27:50</td><td>2023-09-23 00:33:27</td><td><span style=white-space:pre-wrap>Halsted St &amp; Wrightwood Ave  </span></td><td>TA1309000061</td><td>Sheffield Ave &amp; Wellington Ave</td><td>TA1307000052</td><td>41.92914</td><td>-87.64908</td><td>41.93625</td><td>-87.65266</td><td>member</td><td>00:05:37</td><td>7</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>87DB80E048A1BF9F</td><td>classic_bike </td><td>2023-09-02 09:26:43</td><td>2023-09-02 09:38:19</td><td><span style=white-space:pre-wrap>Clark St &amp; Drummond Pl       </span></td><td>TA1307000142</td><td><span style=white-space:pre-wrap>Racine Ave &amp; Fullerton Ave    </span></td><td>TA1306000026</td><td>41.93125</td><td>-87.64434</td><td>41.92557</td><td>-87.65842</td><td>member</td><td>00:11:36</td><td>7</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>7C2EB7AF669066E3</td><td>electric_bike</td><td>2023-09-25 18:30:11</td><td>2023-09-25 18:41:39</td><td>Financial Pl &amp; Ida B Wells Dr</td><td><span style=white-space:pre-wrap>SL-010      </span></td><td><span style=white-space:pre-wrap>Racine Ave &amp; 15th St          </span></td><td><span style=white-space:pre-wrap>13304       </span></td><td>41.87506</td><td>-87.63314</td><td>41.86127</td><td>-87.65663</td><td>member</td><td>00:11:28</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>57D197B010269CE3</td><td>classic_bike </td><td>2023-09-13 15:30:49</td><td>2023-09-13 15:39:18</td><td><span style=white-space:pre-wrap>Clark St &amp; Drummond Pl       </span></td><td>TA1307000142</td><td><span style=white-space:pre-wrap>Racine Ave &amp; Belmont Ave      </span></td><td>TA1308000019</td><td>41.93125</td><td>-87.64434</td><td>41.93974</td><td>-87.65887</td><td>member</td><td>00:08:29</td><td>4</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>8A2CEA7C8C8074D8</td><td>classic_bike </td><td>2023-09-18 15:58:58</td><td>2023-09-18 16:05:04</td><td><span style=white-space:pre-wrap>Halsted St &amp; Wrightwood Ave  </span></td><td>TA1309000061</td><td><span style=white-space:pre-wrap>Racine Ave &amp; Fullerton Ave    </span></td><td>TA1306000026</td><td>41.92914</td><td>-87.64908</td><td>41.92557</td><td>-87.65842</td><td>member</td><td>00:06:06</td><td>2</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>40D9EF382CC6C53D</td><td>classic_bike </td><td>2023-09-17 11:58:50</td><td>2023-09-17 12:08:36</td><td><span style=white-space:pre-wrap>Kedzie Ave &amp; Milwaukee Ave   </span></td><td><span style=white-space:pre-wrap>13085       </span></td><td>California Ave &amp; Milwaukee Ave</td><td><span style=white-space:pre-wrap>13084       </span></td><td>41.92957</td><td>-87.70786</td><td>41.92269</td><td>-87.69715</td><td>member</td><td>00:09:46</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>7</th><td>3812B98E9406040E</td><td>classic_bike </td><td>2023-09-12 16:01:28</td><td>2023-09-12 16:17:47</td><td>Financial Pl &amp; Ida B Wells Dr</td><td><span style=white-space:pre-wrap>SL-010      </span></td><td><span style=white-space:pre-wrap>Adler Planetarium             </span></td><td><span style=white-space:pre-wrap>13431       </span></td><td>41.87502</td><td>-87.63309</td><td>41.86610</td><td>-87.60727</td><td>member</td><td>00:16:19</td><td>3</td></tr>\n",
       "\t<tr><th scope=row>8</th><td>EBA56298CB3C803F</td><td>classic_bike </td><td>2023-09-24 13:17:23</td><td>2023-09-24 13:50:43</td><td><span style=white-space:pre-wrap>Clark St &amp; Schreiber Ave     </span></td><td>KA1504000156</td><td><span style=white-space:pre-wrap>Oakley Ave &amp; Touhy Ave        </span></td><td><span style=white-space:pre-wrap>RP-004      </span></td><td>41.99990</td><td>-87.67007</td><td>42.01234</td><td>-87.68824</td><td>member</td><td>00:33:20</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>9</th><td>C6BD5AF648F11D11</td><td>electric_bike</td><td>2023-09-28 18:09:40</td><td>2023-09-28 18:15:04</td><td><span style=white-space:pre-wrap>Halsted St &amp; Wrightwood Ave  </span></td><td>TA1309000061</td><td><span style=white-space:pre-wrap>Halsted St &amp; Roscoe St        </span></td><td>TA1309000025</td><td>41.92919</td><td>-87.64914</td><td>41.94367</td><td>-87.64895</td><td>member</td><td>00:05:24</td><td>5</td></tr>\n",
       "\t<tr><th scope=row>10</th><td>585C82FA2E006DE9</td><td>classic_bike </td><td>2023-09-22 12:30:41</td><td>2023-09-22 12:42:21</td><td><span style=white-space:pre-wrap>Halsted St &amp; Wrightwood Ave  </span></td><td>TA1309000061</td><td><span style=white-space:pre-wrap>Halsted St &amp; Roscoe St        </span></td><td>TA1309000025</td><td>41.92914</td><td>-87.64908</td><td>41.94367</td><td>-87.64895</td><td>member</td><td>00:11:40</td><td>6</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 10 × 15\n",
       "\\begin{tabular}{r|lllllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual & ride\\_length & day\\_of\\_week\\\\\n",
       "  & <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <time> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 011C1903BF4E2E28 & classic\\_bike  & 2023-09-23 00:27:50 & 2023-09-23 00:33:27 & Halsted St \\& Wrightwood Ave   & TA1309000061 & Sheffield Ave \\& Wellington Ave & TA1307000052 & 41.92914 & -87.64908 & 41.93625 & -87.65266 & member & 00:05:37 & 7\\\\\n",
       "\t2 & 87DB80E048A1BF9F & classic\\_bike  & 2023-09-02 09:26:43 & 2023-09-02 09:38:19 & Clark St \\& Drummond Pl        & TA1307000142 & Racine Ave \\& Fullerton Ave     & TA1306000026 & 41.93125 & -87.64434 & 41.92557 & -87.65842 & member & 00:11:36 & 7\\\\\n",
       "\t3 & 7C2EB7AF669066E3 & electric\\_bike & 2023-09-25 18:30:11 & 2023-09-25 18:41:39 & Financial Pl \\& Ida B Wells Dr & SL-010       & Racine Ave \\& 15th St           & 13304        & 41.87506 & -87.63314 & 41.86127 & -87.65663 & member & 00:11:28 & 2\\\\\n",
       "\t4 & 57D197B010269CE3 & classic\\_bike  & 2023-09-13 15:30:49 & 2023-09-13 15:39:18 & Clark St \\& Drummond Pl        & TA1307000142 & Racine Ave \\& Belmont Ave       & TA1308000019 & 41.93125 & -87.64434 & 41.93974 & -87.65887 & member & 00:08:29 & 4\\\\\n",
       "\t5 & 8A2CEA7C8C8074D8 & classic\\_bike  & 2023-09-18 15:58:58 & 2023-09-18 16:05:04 & Halsted St \\& Wrightwood Ave   & TA1309000061 & Racine Ave \\& Fullerton Ave     & TA1306000026 & 41.92914 & -87.64908 & 41.92557 & -87.65842 & member & 00:06:06 & 2\\\\\n",
       "\t6 & 40D9EF382CC6C53D & classic\\_bike  & 2023-09-17 11:58:50 & 2023-09-17 12:08:36 & Kedzie Ave \\& Milwaukee Ave    & 13085        & California Ave \\& Milwaukee Ave & 13084        & 41.92957 & -87.70786 & 41.92269 & -87.69715 & member & 00:09:46 & 1\\\\\n",
       "\t7 & 3812B98E9406040E & classic\\_bike  & 2023-09-12 16:01:28 & 2023-09-12 16:17:47 & Financial Pl \\& Ida B Wells Dr & SL-010       & Adler Planetarium              & 13431        & 41.87502 & -87.63309 & 41.86610 & -87.60727 & member & 00:16:19 & 3\\\\\n",
       "\t8 & EBA56298CB3C803F & classic\\_bike  & 2023-09-24 13:17:23 & 2023-09-24 13:50:43 & Clark St \\& Schreiber Ave      & KA1504000156 & Oakley Ave \\& Touhy Ave         & RP-004       & 41.99990 & -87.67007 & 42.01234 & -87.68824 & member & 00:33:20 & 1\\\\\n",
       "\t9 & C6BD5AF648F11D11 & electric\\_bike & 2023-09-28 18:09:40 & 2023-09-28 18:15:04 & Halsted St \\& Wrightwood Ave   & TA1309000061 & Halsted St \\& Roscoe St         & TA1309000025 & 41.92919 & -87.64914 & 41.94367 & -87.64895 & member & 00:05:24 & 5\\\\\n",
       "\t10 & 585C82FA2E006DE9 & classic\\_bike  & 2023-09-22 12:30:41 & 2023-09-22 12:42:21 & Halsted St \\& Wrightwood Ave   & TA1309000061 & Halsted St \\& Roscoe St         & TA1309000025 & 41.92914 & -87.64908 & 41.94367 & -87.64895 & member & 00:11:40 & 6\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 10 × 15\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; | ride_length &lt;time&gt; | day_of_week &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 011C1903BF4E2E28 | classic_bike  | 2023-09-23 00:27:50 | 2023-09-23 00:33:27 | Halsted St &amp; Wrightwood Ave   | TA1309000061 | Sheffield Ave &amp; Wellington Ave | TA1307000052 | 41.92914 | -87.64908 | 41.93625 | -87.65266 | member | 00:05:37 | 7 |\n",
       "| 2 | 87DB80E048A1BF9F | classic_bike  | 2023-09-02 09:26:43 | 2023-09-02 09:38:19 | Clark St &amp; Drummond Pl        | TA1307000142 | Racine Ave &amp; Fullerton Ave     | TA1306000026 | 41.93125 | -87.64434 | 41.92557 | -87.65842 | member | 00:11:36 | 7 |\n",
       "| 3 | 7C2EB7AF669066E3 | electric_bike | 2023-09-25 18:30:11 | 2023-09-25 18:41:39 | Financial Pl &amp; Ida B Wells Dr | SL-010       | Racine Ave &amp; 15th St           | 13304        | 41.87506 | -87.63314 | 41.86127 | -87.65663 | member | 00:11:28 | 2 |\n",
       "| 4 | 57D197B010269CE3 | classic_bike  | 2023-09-13 15:30:49 | 2023-09-13 15:39:18 | Clark St &amp; Drummond Pl        | TA1307000142 | Racine Ave &amp; Belmont Ave       | TA1308000019 | 41.93125 | -87.64434 | 41.93974 | -87.65887 | member | 00:08:29 | 4 |\n",
       "| 5 | 8A2CEA7C8C8074D8 | classic_bike  | 2023-09-18 15:58:58 | 2023-09-18 16:05:04 | Halsted St &amp; Wrightwood Ave   | TA1309000061 | Racine Ave &amp; Fullerton Ave     | TA1306000026 | 41.92914 | -87.64908 | 41.92557 | -87.65842 | member | 00:06:06 | 2 |\n",
       "| 6 | 40D9EF382CC6C53D | classic_bike  | 2023-09-17 11:58:50 | 2023-09-17 12:08:36 | Kedzie Ave &amp; Milwaukee Ave    | 13085        | California Ave &amp; Milwaukee Ave | 13084        | 41.92957 | -87.70786 | 41.92269 | -87.69715 | member | 00:09:46 | 1 |\n",
       "| 7 | 3812B98E9406040E | classic_bike  | 2023-09-12 16:01:28 | 2023-09-12 16:17:47 | Financial Pl &amp; Ida B Wells Dr | SL-010       | Adler Planetarium              | 13431        | 41.87502 | -87.63309 | 41.86610 | -87.60727 | member | 00:16:19 | 3 |\n",
       "| 8 | EBA56298CB3C803F | classic_bike  | 2023-09-24 13:17:23 | 2023-09-24 13:50:43 | Clark St &amp; Schreiber Ave      | KA1504000156 | Oakley Ave &amp; Touhy Ave         | RP-004       | 41.99990 | -87.67007 | 42.01234 | -87.68824 | member | 00:33:20 | 1 |\n",
       "| 9 | C6BD5AF648F11D11 | electric_bike | 2023-09-28 18:09:40 | 2023-09-28 18:15:04 | Halsted St &amp; Wrightwood Ave   | TA1309000061 | Halsted St &amp; Roscoe St         | TA1309000025 | 41.92919 | -87.64914 | 41.94367 | -87.64895 | member | 00:05:24 | 5 |\n",
       "| 10 | 585C82FA2E006DE9 | classic_bike  | 2023-09-22 12:30:41 | 2023-09-22 12:42:21 | Halsted St &amp; Wrightwood Ave   | TA1309000061 | Halsted St &amp; Roscoe St         | TA1309000025 | 41.92914 | -87.64908 | 41.94367 | -87.64895 | member | 00:11:40 | 6 |\n",
       "\n"
      ],
      "text/plain": [
       "   ride_id          rideable_type started_at          ended_at           \n",
       "1  011C1903BF4E2E28 classic_bike  2023-09-23 00:27:50 2023-09-23 00:33:27\n",
       "2  87DB80E048A1BF9F classic_bike  2023-09-02 09:26:43 2023-09-02 09:38:19\n",
       "3  7C2EB7AF669066E3 electric_bike 2023-09-25 18:30:11 2023-09-25 18:41:39\n",
       "4  57D197B010269CE3 classic_bike  2023-09-13 15:30:49 2023-09-13 15:39:18\n",
       "5  8A2CEA7C8C8074D8 classic_bike  2023-09-18 15:58:58 2023-09-18 16:05:04\n",
       "6  40D9EF382CC6C53D classic_bike  2023-09-17 11:58:50 2023-09-17 12:08:36\n",
       "7  3812B98E9406040E classic_bike  2023-09-12 16:01:28 2023-09-12 16:17:47\n",
       "8  EBA56298CB3C803F classic_bike  2023-09-24 13:17:23 2023-09-24 13:50:43\n",
       "9  C6BD5AF648F11D11 electric_bike 2023-09-28 18:09:40 2023-09-28 18:15:04\n",
       "10 585C82FA2E006DE9 classic_bike  2023-09-22 12:30:41 2023-09-22 12:42:21\n",
       "   start_station_name            start_station_id\n",
       "1  Halsted St & Wrightwood Ave   TA1309000061    \n",
       "2  Clark St & Drummond Pl        TA1307000142    \n",
       "3  Financial Pl & Ida B Wells Dr SL-010          \n",
       "4  Clark St & Drummond Pl        TA1307000142    \n",
       "5  Halsted St & Wrightwood Ave   TA1309000061    \n",
       "6  Kedzie Ave & Milwaukee Ave    13085           \n",
       "7  Financial Pl & Ida B Wells Dr SL-010          \n",
       "8  Clark St & Schreiber Ave      KA1504000156    \n",
       "9  Halsted St & Wrightwood Ave   TA1309000061    \n",
       "10 Halsted St & Wrightwood Ave   TA1309000061    \n",
       "   end_station_name               end_station_id start_lat start_lng end_lat \n",
       "1  Sheffield Ave & Wellington Ave TA1307000052   41.92914  -87.64908 41.93625\n",
       "2  Racine Ave & Fullerton Ave     TA1306000026   41.93125  -87.64434 41.92557\n",
       "3  Racine Ave & 15th St           13304          41.87506  -87.63314 41.86127\n",
       "4  Racine Ave & Belmont Ave       TA1308000019   41.93125  -87.64434 41.93974\n",
       "5  Racine Ave & Fullerton Ave     TA1306000026   41.92914  -87.64908 41.92557\n",
       "6  California Ave & Milwaukee Ave 13084          41.92957  -87.70786 41.92269\n",
       "7  Adler Planetarium              13431          41.87502  -87.63309 41.86610\n",
       "8  Oakley Ave & Touhy Ave         RP-004         41.99990  -87.67007 42.01234\n",
       "9  Halsted St & Roscoe St         TA1309000025   41.92919  -87.64914 41.94367\n",
       "10 Halsted St & Roscoe St         TA1309000025   41.92914  -87.64908 41.94367\n",
       "   end_lng   member_casual ride_length day_of_week\n",
       "1  -87.65266 member        00:05:37    7          \n",
       "2  -87.65842 member        00:11:36    7          \n",
       "3  -87.65663 member        00:11:28    2          \n",
       "4  -87.65887 member        00:08:29    4          \n",
       "5  -87.65842 member        00:06:06    2          \n",
       "6  -87.69715 member        00:09:46    1          \n",
       "7  -87.60727 member        00:16:19    3          \n",
       "8  -87.68824 member        00:33:20    1          \n",
       "9  -87.64895 member        00:05:24    5          \n",
       "10 -87.64895 member        00:11:40    6          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# A sample preview of the cleaned data\n",
    "head(df_cleaned, 10)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3ee41d67",
   "metadata": {
    "papermill": {
     "duration": 0.009239,
     "end_time": "2023-11-04T22:12:38.335356",
     "exception": false,
     "start_time": "2023-11-04T22:12:38.326117",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "For accessibility purposes, the data set was exported for further analysis and use with other tools."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "947acd7b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T22:12:38.356831Z",
     "iopub.status.busy": "2023-11-04T22:12:38.355440Z",
     "iopub.status.idle": "2023-11-04T22:13:14.774879Z",
     "shell.execute_reply": "2023-11-04T22:13:14.773246Z"
    },
    "papermill": {
     "duration": 36.432449,
     "end_time": "2023-11-04T22:13:14.776676",
     "exception": false,
     "start_time": "2023-11-04T22:12:38.344227",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Export data to csv for external use\n",
    "write_csv(df_cleaned, '/kaggle/working/cyclistic_trips_10_2022_to_09_2023.csv')"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3ac770ec",
   "metadata": {
    "papermill": {
     "duration": 0.009906,
     "end_time": "2023-11-04T22:13:14.795541",
     "exception": false,
     "start_time": "2023-11-04T22:13:14.785635",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Phase #4: Analyze\n",
    "\n",
    "## Summarizing the data\n",
    "\n",
    "Next we'll perform descriptive Analysis on the data set.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "eee47deb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T22:13:14.816675Z",
     "iopub.status.busy": "2023-11-04T22:13:14.815278Z",
     "iopub.status.idle": "2023-11-04T22:13:14.895340Z",
     "shell.execute_reply": "2023-11-04T22:13:14.893867Z"
    },
    "papermill": {
     "duration": 0.093079,
     "end_time": "2023-11-04T22:13:14.897618",
     "exception": false,
     "start_time": "2023-11-04T22:13:14.804539",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "00:15:58.005886"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "202:16:18"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "-02:48:42"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Add a more descriptive name to the dataset variable\n",
    "trips_cleaned <- df_cleaned\n",
    "\n",
    "# Descriptive analysis on the ride length (figures in the format of HH:MM:SS)\n",
    "as_hms(mean(trips_cleaned$ride_length))\n",
    "as_hms(max(trips_cleaned$ride_length))\n",
    "as_hms(min(trips_cleaned$ride_length))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d6ee74a0",
   "metadata": {
    "papermill": {
     "duration": 0.009419,
     "end_time": "2023-11-04T22:13:14.916513",
     "exception": false,
     "start_time": "2023-11-04T22:13:14.907094",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Initial analysis shows that average ride time is around 15-16 minutes. We can also immediately observe 2 outliers in the data set being the maximum and minimum ride times.\n",
    "\n",
    "We can analyze both."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "07d8c036",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T22:13:14.938166Z",
     "iopub.status.busy": "2023-11-04T22:13:14.936777Z",
     "iopub.status.idle": "2023-11-04T22:13:15.129964Z",
     "shell.execute_reply": "2023-11-04T22:13:15.128592Z"
    },
    "papermill": {
     "duration": 0.206819,
     "end_time": "2023-11-04T22:13:15.132461",
     "exception": false,
     "start_time": "2023-11-04T22:13:14.925642",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 1 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th><th scope=col>ride_length</th><th scope=col>day_of_week</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;time&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>59AD7EE868FC6588</td><td>docked_bike</td><td>2023-05-30 12:48:08</td><td>2023-06-07 23:04:26</td><td>Wells St &amp; Polk St</td><td>SL-011</td><td>Lincoln Ave &amp; Roscoe St</td><td>chargingstx5</td><td>41.87273</td><td>-87.63352</td><td>41.94335</td><td>-87.67067</td><td>casual</td><td>202:16:18</td><td>3</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1 × 15\n",
       "\\begin{tabular}{lllllllllllllll}\n",
       " ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual & ride\\_length & day\\_of\\_week\\\\\n",
       " <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <time> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 59AD7EE868FC6588 & docked\\_bike & 2023-05-30 12:48:08 & 2023-06-07 23:04:26 & Wells St \\& Polk St & SL-011 & Lincoln Ave \\& Roscoe St & chargingstx5 & 41.87273 & -87.63352 & 41.94335 & -87.67067 & casual & 202:16:18 & 3\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1 × 15\n",
       "\n",
       "| ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; | ride_length &lt;time&gt; | day_of_week &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 59AD7EE868FC6588 | docked_bike | 2023-05-30 12:48:08 | 2023-06-07 23:04:26 | Wells St &amp; Polk St | SL-011 | Lincoln Ave &amp; Roscoe St | chargingstx5 | 41.87273 | -87.63352 | 41.94335 | -87.67067 | casual | 202:16:18 | 3 |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 59AD7EE868FC6588 docked_bike   2023-05-30 12:48:08 2023-06-07 23:04:26\n",
       "  start_station_name start_station_id end_station_name        end_station_id\n",
       "1 Wells St & Polk St SL-011           Lincoln Ave & Roscoe St chargingstx5  \n",
       "  start_lat start_lng end_lat  end_lng   member_casual ride_length day_of_week\n",
       "1 41.87273  -87.63352 41.94335 -87.67067 casual        202:16:18   3          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 1 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th><th scope=col>ride_length</th><th scope=col>day_of_week</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;time&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>918F745F62CAC29E</td><td>classic_bike</td><td>2022-10-13 14:42:10</td><td>2022-10-13 11:53:28</td><td>Wilton Ave &amp; Diversey Pkwy</td><td>chargingstx0</td><td>Wilton Ave &amp; Diversey Pkwy</td><td>chargingstx0</td><td>41.93242</td><td>-87.6527</td><td>41.93242</td><td>-87.6527</td><td>member</td><td>-02:48:42</td><td>5</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1 × 15\n",
       "\\begin{tabular}{lllllllllllllll}\n",
       " ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual & ride\\_length & day\\_of\\_week\\\\\n",
       " <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <time> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 918F745F62CAC29E & classic\\_bike & 2022-10-13 14:42:10 & 2022-10-13 11:53:28 & Wilton Ave \\& Diversey Pkwy & chargingstx0 & Wilton Ave \\& Diversey Pkwy & chargingstx0 & 41.93242 & -87.6527 & 41.93242 & -87.6527 & member & -02:48:42 & 5\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1 × 15\n",
       "\n",
       "| ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; | ride_length &lt;time&gt; | day_of_week &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 918F745F62CAC29E | classic_bike | 2022-10-13 14:42:10 | 2022-10-13 11:53:28 | Wilton Ave &amp; Diversey Pkwy | chargingstx0 | Wilton Ave &amp; Diversey Pkwy | chargingstx0 | 41.93242 | -87.6527 | 41.93242 | -87.6527 | member | -02:48:42 | 5 |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 918F745F62CAC29E classic_bike  2022-10-13 14:42:10 2022-10-13 11:53:28\n",
       "  start_station_name         start_station_id end_station_name          \n",
       "1 Wilton Ave & Diversey Pkwy chargingstx0     Wilton Ave & Diversey Pkwy\n",
       "  end_station_id start_lat start_lng end_lat  end_lng  member_casual\n",
       "1 chargingstx0   41.93242  -87.6527  41.93242 -87.6527 member       \n",
       "  ride_length day_of_week\n",
       "1 -02:48:42   5          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Find the outlier max entry\n",
    "trips_cleaned %>% filter(ride_length == max(ride_length)) \n",
    "\n",
    "# Find the outlier min entry\n",
    "trips_cleaned %>% filter(ride_length == min(ride_length))\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4ec8e25b",
   "metadata": {
    "papermill": {
     "duration": 0.009665,
     "end_time": "2023-11-04T22:13:15.151732",
     "exception": false,
     "start_time": "2023-11-04T22:13:15.142067",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "We can dismiss the min value as an error in recording either the start or end time.\n",
    "\n",
    "The Max value however, shows an 8 day trip from May 30th to June 7th in 2023. A sorting of the dataset in descending order will show a few other trips of this length."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "e6cca95c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T22:13:15.174487Z",
     "iopub.status.busy": "2023-11-04T22:13:15.173031Z",
     "iopub.status.idle": "2023-11-04T22:13:17.048169Z",
     "shell.execute_reply": "2023-11-04T22:13:17.046942Z"
    },
    "papermill": {
     "duration": 1.888733,
     "end_time": "2023-11-04T22:13:17.049938",
     "exception": false,
     "start_time": "2023-11-04T22:13:15.161205",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 30 × 7</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>ride_length</th><th scope=col>day_of_week</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;time&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>59AD7EE868FC6588</td><td>docked_bike </td><td>2023-05-30 12:48:08</td><td>2023-06-07 23:04:26</td><td>202:16:18</td><td>3</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>FA287922CA358CE0</td><td>docked_bike </td><td>2023-06-03 17:52:15</td><td>2023-06-11 11:44:31</td><td>185:52:16</td><td>7</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>B139FE7DF42819B0</td><td>docked_bike </td><td>2022-10-24 14:37:54</td><td>2022-10-30 08:01:42</td><td>137:23:48</td><td>2</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>47158A16C754A9F4</td><td>docked_bike </td><td>2023-08-10 22:17:49</td><td>2023-08-15 17:09:02</td><td>114:51:13</td><td>5</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>4031082BC503CC84</td><td>docked_bike </td><td>2023-08-02 17:28:57</td><td>2023-08-06 11:07:57</td><td> 89:39:00</td><td>4</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>3BC5FFFDF7503DAA</td><td>docked_bike </td><td>2023-06-15 13:28:59</td><td>2023-06-18 23:12:06</td><td> 81:43:07</td><td>5</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>7</th><td>6786F74C5A6183FB</td><td>docked_bike </td><td>2023-06-18 19:21:22</td><td>2023-06-21 10:59:46</td><td> 63:38:24</td><td>1</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>8</th><td>D2273A0F45CDD4CC</td><td>docked_bike </td><td>2023-08-18 09:13:48</td><td>2023-08-20 16:14:38</td><td> 55:00:50</td><td>6</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>9</th><td>A795B5420E15A65B</td><td>docked_bike </td><td>2023-05-10 18:42:11</td><td>2023-05-13 00:47:58</td><td> 54:05:47</td><td>4</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>10</th><td>280CB8109510E280</td><td>docked_bike </td><td>2023-07-06 21:34:55</td><td>2023-07-08 14:32:46</td><td> 40:57:51</td><td>5</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>11</th><td>D88D5192DF6A4536</td><td>docked_bike </td><td>2023-04-13 17:46:11</td><td>2023-04-15 08:55:32</td><td> 39:09:21</td><td>5</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>12</th><td>81526396CBFBD708</td><td>docked_bike </td><td>2023-05-06 12:53:46</td><td>2023-05-07 18:21:09</td><td> 29:27:23</td><td>7</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>13</th><td>ABA068CBC4FFDA47</td><td>docked_bike </td><td>2023-07-26 02:23:38</td><td>2023-07-27 03:22:27</td><td> 24:58:49</td><td>4</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>14</th><td>7AC23ADF3F785C89</td><td>classic_bike</td><td>2023-09-29 12:32:03</td><td>2023-09-30 13:29:57</td><td> 24:57:54</td><td>6</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>15</th><td>89AB3E68A1FE1D42</td><td>classic_bike</td><td>2023-01-13 18:00:46</td><td>2023-01-14 18:58:38</td><td> 24:57:52</td><td>6</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>16</th><td>CB93E203A174AC97</td><td>classic_bike</td><td>2023-05-16 18:06:24</td><td>2023-05-17 19:03:53</td><td> 24:57:29</td><td>3</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>17</th><td>C65FD7B15C4C410F</td><td>classic_bike</td><td>2023-09-18 17:57:10</td><td>2023-09-19 18:54:33</td><td> 24:57:23</td><td>2</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>18</th><td>3309CF3DBCAD8E84</td><td>docked_bike </td><td>2023-08-20 19:43:06</td><td>2023-08-21 20:40:23</td><td> 24:57:17</td><td>1</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>19</th><td>4ED7BD1172CB09B6</td><td>classic_bike</td><td>2023-03-01 14:44:02</td><td>2023-03-02 15:40:52</td><td> 24:56:50</td><td>4</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>20</th><td>36628734F611A53C</td><td>classic_bike</td><td>2023-06-03 10:40:32</td><td>2023-06-04 11:36:15</td><td> 24:55:43</td><td>7</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>21</th><td>6EA5C4A03EE52C44</td><td>classic_bike</td><td>2023-07-17 18:57:07</td><td>2023-07-18 19:50:27</td><td> 24:53:20</td><td>2</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>22</th><td>3B64CE3CC611F18A</td><td>classic_bike</td><td>2022-11-07 16:52:50</td><td>2022-11-08 17:46:04</td><td> 24:53:14</td><td>2</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>23</th><td>596C6E432ADA6786</td><td>classic_bike</td><td>2023-08-02 16:26:13</td><td>2023-08-03 17:19:14</td><td> 24:53:01</td><td>4</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>24</th><td>A6AA6DAD829D4861</td><td>classic_bike</td><td>2023-09-02 15:34:43</td><td>2023-09-03 16:27:42</td><td> 24:52:59</td><td>7</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>25</th><td>9C9DBBD2DC872B6A</td><td>classic_bike</td><td>2023-07-22 09:19:03</td><td>2023-07-23 10:11:43</td><td> 24:52:40</td><td>7</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>26</th><td>7629FBAAB4B43EFD</td><td>docked_bike </td><td>2023-05-14 11:54:51</td><td>2023-05-15 12:47:25</td><td> 24:52:34</td><td>1</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>27</th><td>A9521ACAE3830A3E</td><td>classic_bike</td><td>2023-07-27 16:45:18</td><td>2023-07-28 17:37:34</td><td> 24:52:16</td><td>5</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>28</th><td>AA9833D38C531DC2</td><td>classic_bike</td><td>2023-06-17 17:26:27</td><td>2023-06-18 18:16:40</td><td> 24:50:13</td><td>7</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>29</th><td>0AC4676CD2F383AE</td><td>classic_bike</td><td>2023-09-30 16:20:05</td><td>2023-10-01 17:10:15</td><td> 24:50:10</td><td>7</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>30</th><td>4699A7D7CE7C52DF</td><td>classic_bike</td><td>2023-05-30 19:00:50</td><td>2023-05-31 19:50:42</td><td> 24:49:52</td><td>3</td><td>casual</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 30 × 7\n",
       "\\begin{tabular}{r|lllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & ride\\_length & day\\_of\\_week & member\\_casual\\\\\n",
       "  & <chr> & <chr> & <dttm> & <dttm> & <time> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 59AD7EE868FC6588 & docked\\_bike  & 2023-05-30 12:48:08 & 2023-06-07 23:04:26 & 202:16:18 & 3 & casual\\\\\n",
       "\t2 & FA287922CA358CE0 & docked\\_bike  & 2023-06-03 17:52:15 & 2023-06-11 11:44:31 & 185:52:16 & 7 & casual\\\\\n",
       "\t3 & B139FE7DF42819B0 & docked\\_bike  & 2022-10-24 14:37:54 & 2022-10-30 08:01:42 & 137:23:48 & 2 & casual\\\\\n",
       "\t4 & 47158A16C754A9F4 & docked\\_bike  & 2023-08-10 22:17:49 & 2023-08-15 17:09:02 & 114:51:13 & 5 & casual\\\\\n",
       "\t5 & 4031082BC503CC84 & docked\\_bike  & 2023-08-02 17:28:57 & 2023-08-06 11:07:57 &  89:39:00 & 4 & casual\\\\\n",
       "\t6 & 3BC5FFFDF7503DAA & docked\\_bike  & 2023-06-15 13:28:59 & 2023-06-18 23:12:06 &  81:43:07 & 5 & casual\\\\\n",
       "\t7 & 6786F74C5A6183FB & docked\\_bike  & 2023-06-18 19:21:22 & 2023-06-21 10:59:46 &  63:38:24 & 1 & casual\\\\\n",
       "\t8 & D2273A0F45CDD4CC & docked\\_bike  & 2023-08-18 09:13:48 & 2023-08-20 16:14:38 &  55:00:50 & 6 & casual\\\\\n",
       "\t9 & A795B5420E15A65B & docked\\_bike  & 2023-05-10 18:42:11 & 2023-05-13 00:47:58 &  54:05:47 & 4 & casual\\\\\n",
       "\t10 & 280CB8109510E280 & docked\\_bike  & 2023-07-06 21:34:55 & 2023-07-08 14:32:46 &  40:57:51 & 5 & casual\\\\\n",
       "\t11 & D88D5192DF6A4536 & docked\\_bike  & 2023-04-13 17:46:11 & 2023-04-15 08:55:32 &  39:09:21 & 5 & casual\\\\\n",
       "\t12 & 81526396CBFBD708 & docked\\_bike  & 2023-05-06 12:53:46 & 2023-05-07 18:21:09 &  29:27:23 & 7 & casual\\\\\n",
       "\t13 & ABA068CBC4FFDA47 & docked\\_bike  & 2023-07-26 02:23:38 & 2023-07-27 03:22:27 &  24:58:49 & 4 & casual\\\\\n",
       "\t14 & 7AC23ADF3F785C89 & classic\\_bike & 2023-09-29 12:32:03 & 2023-09-30 13:29:57 &  24:57:54 & 6 & casual\\\\\n",
       "\t15 & 89AB3E68A1FE1D42 & classic\\_bike & 2023-01-13 18:00:46 & 2023-01-14 18:58:38 &  24:57:52 & 6 & member\\\\\n",
       "\t16 & CB93E203A174AC97 & classic\\_bike & 2023-05-16 18:06:24 & 2023-05-17 19:03:53 &  24:57:29 & 3 & casual\\\\\n",
       "\t17 & C65FD7B15C4C410F & classic\\_bike & 2023-09-18 17:57:10 & 2023-09-19 18:54:33 &  24:57:23 & 2 & member\\\\\n",
       "\t18 & 3309CF3DBCAD8E84 & docked\\_bike  & 2023-08-20 19:43:06 & 2023-08-21 20:40:23 &  24:57:17 & 1 & casual\\\\\n",
       "\t19 & 4ED7BD1172CB09B6 & classic\\_bike & 2023-03-01 14:44:02 & 2023-03-02 15:40:52 &  24:56:50 & 4 & casual\\\\\n",
       "\t20 & 36628734F611A53C & classic\\_bike & 2023-06-03 10:40:32 & 2023-06-04 11:36:15 &  24:55:43 & 7 & casual\\\\\n",
       "\t21 & 6EA5C4A03EE52C44 & classic\\_bike & 2023-07-17 18:57:07 & 2023-07-18 19:50:27 &  24:53:20 & 2 & casual\\\\\n",
       "\t22 & 3B64CE3CC611F18A & classic\\_bike & 2022-11-07 16:52:50 & 2022-11-08 17:46:04 &  24:53:14 & 2 & member\\\\\n",
       "\t23 & 596C6E432ADA6786 & classic\\_bike & 2023-08-02 16:26:13 & 2023-08-03 17:19:14 &  24:53:01 & 4 & member\\\\\n",
       "\t24 & A6AA6DAD829D4861 & classic\\_bike & 2023-09-02 15:34:43 & 2023-09-03 16:27:42 &  24:52:59 & 7 & casual\\\\\n",
       "\t25 & 9C9DBBD2DC872B6A & classic\\_bike & 2023-07-22 09:19:03 & 2023-07-23 10:11:43 &  24:52:40 & 7 & casual\\\\\n",
       "\t26 & 7629FBAAB4B43EFD & docked\\_bike  & 2023-05-14 11:54:51 & 2023-05-15 12:47:25 &  24:52:34 & 1 & casual\\\\\n",
       "\t27 & A9521ACAE3830A3E & classic\\_bike & 2023-07-27 16:45:18 & 2023-07-28 17:37:34 &  24:52:16 & 5 & casual\\\\\n",
       "\t28 & AA9833D38C531DC2 & classic\\_bike & 2023-06-17 17:26:27 & 2023-06-18 18:16:40 &  24:50:13 & 7 & casual\\\\\n",
       "\t29 & 0AC4676CD2F383AE & classic\\_bike & 2023-09-30 16:20:05 & 2023-10-01 17:10:15 &  24:50:10 & 7 & casual\\\\\n",
       "\t30 & 4699A7D7CE7C52DF & classic\\_bike & 2023-05-30 19:00:50 & 2023-05-31 19:50:42 &  24:49:52 & 3 & casual\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 30 × 7\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | ride_length &lt;time&gt; | day_of_week &lt;dbl&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|\n",
       "| 1 | 59AD7EE868FC6588 | docked_bike  | 2023-05-30 12:48:08 | 2023-06-07 23:04:26 | 202:16:18 | 3 | casual |\n",
       "| 2 | FA287922CA358CE0 | docked_bike  | 2023-06-03 17:52:15 | 2023-06-11 11:44:31 | 185:52:16 | 7 | casual |\n",
       "| 3 | B139FE7DF42819B0 | docked_bike  | 2022-10-24 14:37:54 | 2022-10-30 08:01:42 | 137:23:48 | 2 | casual |\n",
       "| 4 | 47158A16C754A9F4 | docked_bike  | 2023-08-10 22:17:49 | 2023-08-15 17:09:02 | 114:51:13 | 5 | casual |\n",
       "| 5 | 4031082BC503CC84 | docked_bike  | 2023-08-02 17:28:57 | 2023-08-06 11:07:57 |  89:39:00 | 4 | casual |\n",
       "| 6 | 3BC5FFFDF7503DAA | docked_bike  | 2023-06-15 13:28:59 | 2023-06-18 23:12:06 |  81:43:07 | 5 | casual |\n",
       "| 7 | 6786F74C5A6183FB | docked_bike  | 2023-06-18 19:21:22 | 2023-06-21 10:59:46 |  63:38:24 | 1 | casual |\n",
       "| 8 | D2273A0F45CDD4CC | docked_bike  | 2023-08-18 09:13:48 | 2023-08-20 16:14:38 |  55:00:50 | 6 | casual |\n",
       "| 9 | A795B5420E15A65B | docked_bike  | 2023-05-10 18:42:11 | 2023-05-13 00:47:58 |  54:05:47 | 4 | casual |\n",
       "| 10 | 280CB8109510E280 | docked_bike  | 2023-07-06 21:34:55 | 2023-07-08 14:32:46 |  40:57:51 | 5 | casual |\n",
       "| 11 | D88D5192DF6A4536 | docked_bike  | 2023-04-13 17:46:11 | 2023-04-15 08:55:32 |  39:09:21 | 5 | casual |\n",
       "| 12 | 81526396CBFBD708 | docked_bike  | 2023-05-06 12:53:46 | 2023-05-07 18:21:09 |  29:27:23 | 7 | casual |\n",
       "| 13 | ABA068CBC4FFDA47 | docked_bike  | 2023-07-26 02:23:38 | 2023-07-27 03:22:27 |  24:58:49 | 4 | casual |\n",
       "| 14 | 7AC23ADF3F785C89 | classic_bike | 2023-09-29 12:32:03 | 2023-09-30 13:29:57 |  24:57:54 | 6 | casual |\n",
       "| 15 | 89AB3E68A1FE1D42 | classic_bike | 2023-01-13 18:00:46 | 2023-01-14 18:58:38 |  24:57:52 | 6 | member |\n",
       "| 16 | CB93E203A174AC97 | classic_bike | 2023-05-16 18:06:24 | 2023-05-17 19:03:53 |  24:57:29 | 3 | casual |\n",
       "| 17 | C65FD7B15C4C410F | classic_bike | 2023-09-18 17:57:10 | 2023-09-19 18:54:33 |  24:57:23 | 2 | member |\n",
       "| 18 | 3309CF3DBCAD8E84 | docked_bike  | 2023-08-20 19:43:06 | 2023-08-21 20:40:23 |  24:57:17 | 1 | casual |\n",
       "| 19 | 4ED7BD1172CB09B6 | classic_bike | 2023-03-01 14:44:02 | 2023-03-02 15:40:52 |  24:56:50 | 4 | casual |\n",
       "| 20 | 36628734F611A53C | classic_bike | 2023-06-03 10:40:32 | 2023-06-04 11:36:15 |  24:55:43 | 7 | casual |\n",
       "| 21 | 6EA5C4A03EE52C44 | classic_bike | 2023-07-17 18:57:07 | 2023-07-18 19:50:27 |  24:53:20 | 2 | casual |\n",
       "| 22 | 3B64CE3CC611F18A | classic_bike | 2022-11-07 16:52:50 | 2022-11-08 17:46:04 |  24:53:14 | 2 | member |\n",
       "| 23 | 596C6E432ADA6786 | classic_bike | 2023-08-02 16:26:13 | 2023-08-03 17:19:14 |  24:53:01 | 4 | member |\n",
       "| 24 | A6AA6DAD829D4861 | classic_bike | 2023-09-02 15:34:43 | 2023-09-03 16:27:42 |  24:52:59 | 7 | casual |\n",
       "| 25 | 9C9DBBD2DC872B6A | classic_bike | 2023-07-22 09:19:03 | 2023-07-23 10:11:43 |  24:52:40 | 7 | casual |\n",
       "| 26 | 7629FBAAB4B43EFD | docked_bike  | 2023-05-14 11:54:51 | 2023-05-15 12:47:25 |  24:52:34 | 1 | casual |\n",
       "| 27 | A9521ACAE3830A3E | classic_bike | 2023-07-27 16:45:18 | 2023-07-28 17:37:34 |  24:52:16 | 5 | casual |\n",
       "| 28 | AA9833D38C531DC2 | classic_bike | 2023-06-17 17:26:27 | 2023-06-18 18:16:40 |  24:50:13 | 7 | casual |\n",
       "| 29 | 0AC4676CD2F383AE | classic_bike | 2023-09-30 16:20:05 | 2023-10-01 17:10:15 |  24:50:10 | 7 | casual |\n",
       "| 30 | 4699A7D7CE7C52DF | classic_bike | 2023-05-30 19:00:50 | 2023-05-31 19:50:42 |  24:49:52 | 3 | casual |\n",
       "\n"
      ],
      "text/plain": [
       "   ride_id          rideable_type started_at          ended_at           \n",
       "1  59AD7EE868FC6588 docked_bike   2023-05-30 12:48:08 2023-06-07 23:04:26\n",
       "2  FA287922CA358CE0 docked_bike   2023-06-03 17:52:15 2023-06-11 11:44:31\n",
       "3  B139FE7DF42819B0 docked_bike   2022-10-24 14:37:54 2022-10-30 08:01:42\n",
       "4  47158A16C754A9F4 docked_bike   2023-08-10 22:17:49 2023-08-15 17:09:02\n",
       "5  4031082BC503CC84 docked_bike   2023-08-02 17:28:57 2023-08-06 11:07:57\n",
       "6  3BC5FFFDF7503DAA docked_bike   2023-06-15 13:28:59 2023-06-18 23:12:06\n",
       "7  6786F74C5A6183FB docked_bike   2023-06-18 19:21:22 2023-06-21 10:59:46\n",
       "8  D2273A0F45CDD4CC docked_bike   2023-08-18 09:13:48 2023-08-20 16:14:38\n",
       "9  A795B5420E15A65B docked_bike   2023-05-10 18:42:11 2023-05-13 00:47:58\n",
       "10 280CB8109510E280 docked_bike   2023-07-06 21:34:55 2023-07-08 14:32:46\n",
       "11 D88D5192DF6A4536 docked_bike   2023-04-13 17:46:11 2023-04-15 08:55:32\n",
       "12 81526396CBFBD708 docked_bike   2023-05-06 12:53:46 2023-05-07 18:21:09\n",
       "13 ABA068CBC4FFDA47 docked_bike   2023-07-26 02:23:38 2023-07-27 03:22:27\n",
       "14 7AC23ADF3F785C89 classic_bike  2023-09-29 12:32:03 2023-09-30 13:29:57\n",
       "15 89AB3E68A1FE1D42 classic_bike  2023-01-13 18:00:46 2023-01-14 18:58:38\n",
       "16 CB93E203A174AC97 classic_bike  2023-05-16 18:06:24 2023-05-17 19:03:53\n",
       "17 C65FD7B15C4C410F classic_bike  2023-09-18 17:57:10 2023-09-19 18:54:33\n",
       "18 3309CF3DBCAD8E84 docked_bike   2023-08-20 19:43:06 2023-08-21 20:40:23\n",
       "19 4ED7BD1172CB09B6 classic_bike  2023-03-01 14:44:02 2023-03-02 15:40:52\n",
       "20 36628734F611A53C classic_bike  2023-06-03 10:40:32 2023-06-04 11:36:15\n",
       "21 6EA5C4A03EE52C44 classic_bike  2023-07-17 18:57:07 2023-07-18 19:50:27\n",
       "22 3B64CE3CC611F18A classic_bike  2022-11-07 16:52:50 2022-11-08 17:46:04\n",
       "23 596C6E432ADA6786 classic_bike  2023-08-02 16:26:13 2023-08-03 17:19:14\n",
       "24 A6AA6DAD829D4861 classic_bike  2023-09-02 15:34:43 2023-09-03 16:27:42\n",
       "25 9C9DBBD2DC872B6A classic_bike  2023-07-22 09:19:03 2023-07-23 10:11:43\n",
       "26 7629FBAAB4B43EFD docked_bike   2023-05-14 11:54:51 2023-05-15 12:47:25\n",
       "27 A9521ACAE3830A3E classic_bike  2023-07-27 16:45:18 2023-07-28 17:37:34\n",
       "28 AA9833D38C531DC2 classic_bike  2023-06-17 17:26:27 2023-06-18 18:16:40\n",
       "29 0AC4676CD2F383AE classic_bike  2023-09-30 16:20:05 2023-10-01 17:10:15\n",
       "30 4699A7D7CE7C52DF classic_bike  2023-05-30 19:00:50 2023-05-31 19:50:42\n",
       "   ride_length day_of_week member_casual\n",
       "1  202:16:18   3           casual       \n",
       "2  185:52:16   7           casual       \n",
       "3  137:23:48   2           casual       \n",
       "4  114:51:13   5           casual       \n",
       "5   89:39:00   4           casual       \n",
       "6   81:43:07   5           casual       \n",
       "7   63:38:24   1           casual       \n",
       "8   55:00:50   6           casual       \n",
       "9   54:05:47   4           casual       \n",
       "10  40:57:51   5           casual       \n",
       "11  39:09:21   5           casual       \n",
       "12  29:27:23   7           casual       \n",
       "13  24:58:49   4           casual       \n",
       "14  24:57:54   6           casual       \n",
       "15  24:57:52   6           member       \n",
       "16  24:57:29   3           casual       \n",
       "17  24:57:23   2           member       \n",
       "18  24:57:17   1           casual       \n",
       "19  24:56:50   4           casual       \n",
       "20  24:55:43   7           casual       \n",
       "21  24:53:20   2           casual       \n",
       "22  24:53:14   2           member       \n",
       "23  24:53:01   4           member       \n",
       "24  24:52:59   7           casual       \n",
       "25  24:52:40   7           casual       \n",
       "26  24:52:34   1           casual       \n",
       "27  24:52:16   5           casual       \n",
       "28  24:50:13   7           casual       \n",
       "29  24:50:10   7           casual       \n",
       "30  24:49:52   3           casual       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Top 20 trips by ride length\n",
    "trips_cleaned %>% \n",
    "    select(ride_id, rideable_type, started_at, ended_at, ride_length, day_of_week, member_casual) %>%\n",
    "    arrange(desc(ride_length)) %>%\n",
    "    head(30)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6fcfa77d",
   "metadata": {
    "papermill": {
     "duration": 0.010134,
     "end_time": "2023-11-04T22:13:17.070578",
     "exception": false,
     "start_time": "2023-11-04T22:13:17.060444",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "This may indicate a correlation with casual riders and longer trips. We can analyze this further by grouping the two rider types and summarizing the amount of each rider type and average ride length."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "f0475f99",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T22:13:17.093950Z",
     "iopub.status.busy": "2023-11-04T22:13:17.092695Z",
     "iopub.status.idle": "2023-11-04T22:13:17.732997Z",
     "shell.execute_reply": "2023-11-04T22:13:17.731566Z"
    },
    "papermill": {
     "duration": 0.654355,
     "end_time": "2023-11-04T22:13:17.735051",
     "exception": false,
     "start_time": "2023-11-04T22:13:17.080696",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>rider_type_count</th><th scope=col>mean_ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;time&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>1549175</td><td>00:22:46.765914</td></tr>\n",
       "\t<tr><td>member</td><td>2742392</td><td>00:12:07.097680</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & rider\\_type\\_count & mean\\_ride\\_length\\\\\n",
       " <chr> & <int> & <time>\\\\\n",
       "\\hline\n",
       "\t casual & 1549175 & 00:22:46.765914\\\\\n",
       "\t member & 2742392 & 00:12:07.097680\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | rider_type_count &lt;int&gt; | mean_ride_length &lt;time&gt; |\n",
       "|---|---|---|\n",
       "| casual | 1549175 | 00:22:46.765914 |\n",
       "| member | 2742392 | 00:12:07.097680 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual rider_type_count mean_ride_length\n",
       "1 casual        1549175          00:22:46.765914 \n",
       "2 member        2742392          00:12:07.097680 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "trips_by_rider <- trips_cleaned %>% \n",
    "    group_by(member_casual) %>%\n",
    "    summarise(\n",
    "        rider_type_count=n(),\n",
    "        mean_ride_length=as_hms(mean(ride_length))\n",
    "    )\n",
    "\n",
    "View(trips_by_rider)\n",
    "\n",
    "\n",
    "# Display column chart to \n",
    "ggplot(data=trips_by_rider) +\n",
    "    geom_col(mapping=aes(x=member_casual, y=mean_ride_length, color=member_casual, fill=member_casual)) +\n",
    "    labs(title=\"Average ride length by rider type\", x=\"Rider Type\", y=\"Average rider length (HH:MM:SS)\") +\n",
    "    theme_dark()"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a8828ab3",
   "metadata": {
    "papermill": {
     "duration": 0.011049,
     "end_time": "2023-11-04T22:13:17.756873",
     "exception": false,
     "start_time": "2023-11-04T22:13:17.745824",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Here we can see our initial assumption is correct that Casual riders do on average take longer trips than members. But let's dig a bit deeper. We'll want to see how much longer a trips are the riders taking by checking intervals above the averages. We're interested in intervals of between 22 minutes to an hour, from an hour to 6 hours, 6 to 12 hours, 12 to 24 hours and above 24 hours. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "2ef9ac90",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T22:13:17.782082Z",
     "iopub.status.busy": "2023-11-04T22:13:17.780725Z",
     "iopub.status.idle": "2023-11-04T22:13:18.342247Z",
     "shell.execute_reply": "2023-11-04T22:13:18.340854Z"
    },
    "papermill": {
     "duration": 0.57592,
     "end_time": "2023-11-04T22:13:18.344161",
     "exception": false,
     "start_time": "2023-11-04T22:13:17.768241",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Trips from 22 mins to an hour\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>rider_type_count</th><th scope=col>mean_ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;time&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>332864</td><td>00:34:24.258165</td></tr>\n",
       "\t<tr><td>member</td><td>315179</td><td>00:31:19.222401</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & rider\\_type\\_count & mean\\_ride\\_length\\\\\n",
       " <chr> & <int> & <time>\\\\\n",
       "\\hline\n",
       "\t casual & 332864 & 00:34:24.258165\\\\\n",
       "\t member & 315179 & 00:31:19.222401\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | rider_type_count &lt;int&gt; | mean_ride_length &lt;time&gt; |\n",
       "|---|---|---|\n",
       "| casual | 332864 | 00:34:24.258165 |\n",
       "| member | 315179 | 00:31:19.222401 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual rider_type_count mean_ride_length\n",
       "1 casual        332864           00:34:24.258165 \n",
       "2 member        315179           00:31:19.222401 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "trips_from_22_mins_1_hr <- trips_cleaned %>%\n",
    "    filter(ride_length >= 1320, ride_length <= 3600)\n",
    "\n",
    "trips_from_1_hr_6_hrs <- trips_cleaned %>%\n",
    "    filter(ride_length > 3600, ride_length <= 21600)\n",
    "\n",
    "trips_from_6_hrs_12_hrs <- trips_cleaned %>%\n",
    "    filter(ride_length > 21600, ride_length <= 43200)\n",
    "\n",
    "trips_from_12_hrs_24_hrs <- trips_cleaned %>%\n",
    "    filter(ride_length > 43200, ride_length <= 86400)\n",
    "\n",
    "trips_above_24_hrs <- trips_cleaned %>%\n",
    "    filter(ride_length > 86400)\n",
    "\n",
    "# Here are all the trips within those iuntervals grouped by the rider subscription type\n",
    "    \n",
    "# Here are trips from 22 mins to an hour\n",
    "print(\"Trips from 22 mins to an hour\")\n",
    "trips_from_22_mins_1_hr %>%\n",
    "    group_by(member_casual) %>%\n",
    "    summarise(\n",
    "        rider_type_count=n(),\n",
    "        mean_ride_length=as_hms(mean(ride_length))\n",
    "    ) %>%\n",
    "    head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "01430578",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T22:13:18.369116Z",
     "iopub.status.busy": "2023-11-04T22:13:18.367715Z",
     "iopub.status.idle": "2023-11-04T22:13:18.409972Z",
     "shell.execute_reply": "2023-11-04T22:13:18.408368Z"
    },
    "papermill": {
     "duration": 0.057079,
     "end_time": "2023-11-04T22:13:18.412086",
     "exception": false,
     "start_time": "2023-11-04T22:13:18.355007",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Trips from 1 hour to 6 hours\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>rider_type_count</th><th scope=col>mean_ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;time&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>96722</td><td>01:39:48.864374</td></tr>\n",
       "\t<tr><td>member</td><td>15492</td><td>01:40:26.600891</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & rider\\_type\\_count & mean\\_ride\\_length\\\\\n",
       " <chr> & <int> & <time>\\\\\n",
       "\\hline\n",
       "\t casual & 96722 & 01:39:48.864374\\\\\n",
       "\t member & 15492 & 01:40:26.600891\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | rider_type_count &lt;int&gt; | mean_ride_length &lt;time&gt; |\n",
       "|---|---|---|\n",
       "| casual | 96722 | 01:39:48.864374 |\n",
       "| member | 15492 | 01:40:26.600891 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual rider_type_count mean_ride_length\n",
       "1 casual        96722            01:39:48.864374 \n",
       "2 member        15492            01:40:26.600891 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Here are trips above 1 hour to 6 hours\n",
    "print(\"Trips from 1 hour to 6 hours\")\n",
    "trips_from_1_hr_6_hrs %>%\n",
    "    group_by(member_casual) %>%\n",
    "    summarise(\n",
    "        rider_type_count=n(),\n",
    "        mean_ride_length=as_hms(mean(ride_length))\n",
    "    ) %>%\n",
    "    head()\n",
    "    "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "233d1e26",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T22:13:18.438005Z",
     "iopub.status.busy": "2023-11-04T22:13:18.436488Z",
     "iopub.status.idle": "2023-11-04T22:13:18.473258Z",
     "shell.execute_reply": "2023-11-04T22:13:18.471723Z"
    },
    "papermill": {
     "duration": 0.05272,
     "end_time": "2023-11-04T22:13:18.475918",
     "exception": false,
     "start_time": "2023-11-04T22:13:18.423198",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Trips from 6 hours to 12 hours\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>rider_type_count</th><th scope=col>mean_ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;time&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>1679</td><td>08:30:52.109589</td></tr>\n",
       "\t<tr><td>member</td><td> 570</td><td>08:22:12.680702</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & rider\\_type\\_count & mean\\_ride\\_length\\\\\n",
       " <chr> & <int> & <time>\\\\\n",
       "\\hline\n",
       "\t casual & 1679 & 08:30:52.109589\\\\\n",
       "\t member &  570 & 08:22:12.680702\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | rider_type_count &lt;int&gt; | mean_ride_length &lt;time&gt; |\n",
       "|---|---|---|\n",
       "| casual | 1679 | 08:30:52.109589 |\n",
       "| member |  570 | 08:22:12.680702 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual rider_type_count mean_ride_length\n",
       "1 casual        1679             08:30:52.109589 \n",
       "2 member         570             08:22:12.680702 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Here are trips above 6 hours to 12 hours\n",
    "print(\"Trips from 6 hours to 12 hours\")\n",
    "trips_from_6_hrs_12_hrs %>%\n",
    "    group_by(member_casual) %>%\n",
    "    summarise(\n",
    "        rider_type_count=n(),\n",
    "        mean_ride_length=as_hms(mean(ride_length))\n",
    "    ) %>%\n",
    "    head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "1ba55cda",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T22:13:18.501734Z",
     "iopub.status.busy": "2023-11-04T22:13:18.500222Z",
     "iopub.status.idle": "2023-11-04T22:13:18.536806Z",
     "shell.execute_reply": "2023-11-04T22:13:18.535284Z"
    },
    "papermill": {
     "duration": 0.051708,
     "end_time": "2023-11-04T22:13:18.538915",
     "exception": false,
     "start_time": "2023-11-04T22:13:18.487207",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Trips from 12 hours to 24 hours\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>rider_type_count</th><th scope=col>mean_ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;time&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>1838</td><td>17:05:01.603917</td></tr>\n",
       "\t<tr><td>member</td><td> 626</td><td>16:47:46.321086</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & rider\\_type\\_count & mean\\_ride\\_length\\\\\n",
       " <chr> & <int> & <time>\\\\\n",
       "\\hline\n",
       "\t casual & 1838 & 17:05:01.603917\\\\\n",
       "\t member &  626 & 16:47:46.321086\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | rider_type_count &lt;int&gt; | mean_ride_length &lt;time&gt; |\n",
       "|---|---|---|\n",
       "| casual | 1838 | 17:05:01.603917 |\n",
       "| member |  626 | 16:47:46.321086 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual rider_type_count mean_ride_length\n",
       "1 casual        1838             17:05:01.603917 \n",
       "2 member         626             16:47:46.321086 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Here are trips above 12 hours to 24 hours\n",
    "print(\"Trips from 12 hours to 24 hours\")\n",
    "trips_from_12_hrs_24_hrs %>%\n",
    "    group_by(member_casual) %>%\n",
    "    summarise(\n",
    "        rider_type_count=n(),\n",
    "        mean_ride_length=as_hms(mean(ride_length))\n",
    "    ) %>%\n",
    "    head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "e7f459ec",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T22:13:18.566212Z",
     "iopub.status.busy": "2023-11-04T22:13:18.564755Z",
     "iopub.status.idle": "2023-11-04T22:13:18.599906Z",
     "shell.execute_reply": "2023-11-04T22:13:18.598435Z"
    },
    "papermill": {
     "duration": 0.051935,
     "end_time": "2023-11-04T22:13:18.602717",
     "exception": false,
     "start_time": "2023-11-04T22:13:18.550782",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Trips above 24 hours\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>rider_type_count</th><th scope=col>mean_ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;time&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>102</td><td>32:18:53.480392</td></tr>\n",
       "\t<tr><td>member</td><td> 25</td><td>24:29:56.880000</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & rider\\_type\\_count & mean\\_ride\\_length\\\\\n",
       " <chr> & <int> & <time>\\\\\n",
       "\\hline\n",
       "\t casual & 102 & 32:18:53.480392\\\\\n",
       "\t member &  25 & 24:29:56.880000\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | rider_type_count &lt;int&gt; | mean_ride_length &lt;time&gt; |\n",
       "|---|---|---|\n",
       "| casual | 102 | 32:18:53.480392 |\n",
       "| member |  25 | 24:29:56.880000 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual rider_type_count mean_ride_length\n",
       "1 casual        102              32:18:53.480392 \n",
       "2 member         25              24:29:56.880000 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Here are trips above 24 hours\n",
    "print(\"Trips above 24 hours\")\n",
    "trips_above_24_hrs %>%\n",
    "    group_by(member_casual) %>%\n",
    "    summarise(\n",
    "        rider_type_count=n(),\n",
    "        mean_ride_length=as_hms(mean(ride_length))\n",
    "    ) %>%\n",
    "    head()"
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
   "duration": 111.892428,
   "end_time": "2023-11-04T22:13:18.936642",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-11-04T22:11:27.044214",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
