{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "9a0dd718",
   "metadata": {
    "papermill": {
     "duration": 0.010787,
     "end_time": "2023-11-04T01:58:09.116202",
     "exception": false,
     "start_time": "2023-11-04T01:58:09.105415",
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
   "id": "cc188180",
   "metadata": {
    "papermill": {
     "duration": 0.008179,
     "end_time": "2023-11-04T01:58:09.133039",
     "exception": false,
     "start_time": "2023-11-04T01:58:09.124860",
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
   "id": "e36f1e6c",
   "metadata": {
    "_kg_hide-input": true,
    "_kg_hide-output": true,
    "execution": {
     "iopub.execute_input": "2023-11-04T01:58:09.154762Z",
     "iopub.status.busy": "2023-11-04T01:58:09.152281Z",
     "iopub.status.idle": "2023-11-04T01:58:47.001999Z",
     "shell.execute_reply": "2023-11-04T01:58:46.999906Z"
    },
    "papermill": {
     "duration": 37.864545,
     "end_time": "2023-11-04T01:58:47.005895",
     "exception": false,
     "start_time": "2023-11-04T01:58:09.141350",
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
   "id": "498a7970",
   "metadata": {
    "_kg_hide-output": true,
    "execution": {
     "iopub.execute_input": "2023-11-04T01:58:47.088204Z",
     "iopub.status.busy": "2023-11-04T01:58:47.029568Z",
     "iopub.status.idle": "2023-11-04T01:59:28.460373Z",
     "shell.execute_reply": "2023-11-04T01:59:28.457954Z"
    },
    "papermill": {
     "duration": 41.44658,
     "end_time": "2023-11-04T01:59:28.464485",
     "exception": false,
     "start_time": "2023-11-04T01:58:47.017905",
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
   "id": "7d7467d2",
   "metadata": {
    "papermill": {
     "duration": 0.011969,
     "end_time": "2023-11-04T01:59:28.491458",
     "exception": false,
     "start_time": "2023-11-04T01:59:28.479489",
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
   "id": "6f15b216",
   "metadata": {
    "papermill": {
     "duration": 0.012113,
     "end_time": "2023-11-04T01:59:28.515625",
     "exception": false,
     "start_time": "2023-11-04T01:59:28.503512",
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
   "id": "294bc9b8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T01:59:28.544066Z",
     "iopub.status.busy": "2023-11-04T01:59:28.542046Z",
     "iopub.status.idle": "2023-11-04T01:59:38.173066Z",
     "shell.execute_reply": "2023-11-04T01:59:38.170785Z"
    },
    "papermill": {
     "duration": 9.648601,
     "end_time": "2023-11-04T01:59:38.176265",
     "exception": false,
     "start_time": "2023-11-04T01:59:28.527664",
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
   "id": "2ee9946a",
   "metadata": {
    "papermill": {
     "duration": 0.012497,
     "end_time": "2023-11-04T01:59:38.201385",
     "exception": false,
     "start_time": "2023-11-04T01:59:38.188888",
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
   "id": "b9f30eb4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T01:59:38.230786Z",
     "iopub.status.busy": "2023-11-04T01:59:38.229006Z",
     "iopub.status.idle": "2023-11-04T01:59:38.271625Z",
     "shell.execute_reply": "2023-11-04T01:59:38.269498Z"
    },
    "papermill": {
     "duration": 0.060511,
     "end_time": "2023-11-04T01:59:38.274654",
     "exception": false,
     "start_time": "2023-11-04T01:59:38.214143",
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
   "id": "eefe66b0",
   "metadata": {
    "papermill": {
     "duration": 0.012674,
     "end_time": "2023-11-04T01:59:38.299910",
     "exception": false,
     "start_time": "2023-11-04T01:59:38.287236",
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
   "id": "7b4a8da1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T01:59:38.330178Z",
     "iopub.status.busy": "2023-11-04T01:59:38.328129Z",
     "iopub.status.idle": "2023-11-04T01:59:38.613666Z",
     "shell.execute_reply": "2023-11-04T01:59:38.611702Z"
    },
    "papermill": {
     "duration": 0.30363,
     "end_time": "2023-11-04T01:59:38.616419",
     "exception": false,
     "start_time": "2023-11-04T01:59:38.312789",
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
   "id": "00bf7ab8",
   "metadata": {
    "papermill": {
     "duration": 0.014493,
     "end_time": "2023-11-04T01:59:38.643682",
     "exception": false,
     "start_time": "2023-11-04T01:59:38.629189",
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
   "id": "d18a01a6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T01:59:38.673144Z",
     "iopub.status.busy": "2023-11-04T01:59:38.671230Z",
     "iopub.status.idle": "2023-11-04T01:59:39.499865Z",
     "shell.execute_reply": "2023-11-04T01:59:39.497758Z"
    },
    "papermill": {
     "duration": 0.846585,
     "end_time": "2023-11-04T01:59:39.502810",
     "exception": false,
     "start_time": "2023-11-04T01:59:38.656225",
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
   "id": "fac52c03",
   "metadata": {
    "papermill": {
     "duration": 0.013166,
     "end_time": "2023-11-04T01:59:39.529137",
     "exception": false,
     "start_time": "2023-11-04T01:59:39.515971",
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
   "id": "93fda6c7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T01:59:39.559882Z",
     "iopub.status.busy": "2023-11-04T01:59:39.558023Z",
     "iopub.status.idle": "2023-11-04T01:59:42.166768Z",
     "shell.execute_reply": "2023-11-04T01:59:42.164549Z"
    },
    "papermill": {
     "duration": 2.627463,
     "end_time": "2023-11-04T01:59:42.169892",
     "exception": false,
     "start_time": "2023-11-04T01:59:39.542429",
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
   "id": "407fbdf1",
   "metadata": {
    "papermill": {
     "duration": 0.013392,
     "end_time": "2023-11-04T01:59:42.196225",
     "exception": false,
     "start_time": "2023-11-04T01:59:42.182833",
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
   "id": "bf3d3b39",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T01:59:42.226110Z",
     "iopub.status.busy": "2023-11-04T01:59:42.224370Z",
     "iopub.status.idle": "2023-11-04T01:59:53.205209Z",
     "shell.execute_reply": "2023-11-04T01:59:53.203238Z"
    },
    "papermill": {
     "duration": 10.999248,
     "end_time": "2023-11-04T01:59:53.208342",
     "exception": false,
     "start_time": "2023-11-04T01:59:42.209094",
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
   "id": "616b39db",
   "metadata": {
    "papermill": {
     "duration": 0.013548,
     "end_time": "2023-11-04T01:59:53.235223",
     "exception": false,
     "start_time": "2023-11-04T01:59:53.221675",
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
   "id": "b49c5bb6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T01:59:53.267407Z",
     "iopub.status.busy": "2023-11-04T01:59:53.265547Z",
     "iopub.status.idle": "2023-11-04T01:59:53.315593Z",
     "shell.execute_reply": "2023-11-04T01:59:53.313657Z"
    },
    "papermill": {
     "duration": 0.070124,
     "end_time": "2023-11-04T01:59:53.318764",
     "exception": false,
     "start_time": "2023-11-04T01:59:53.248640",
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
   "id": "bae3e774",
   "metadata": {
    "papermill": {
     "duration": 0.013795,
     "end_time": "2023-11-04T01:59:53.346367",
     "exception": false,
     "start_time": "2023-11-04T01:59:53.332572",
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
   "id": "c8ce6111",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T01:59:53.378124Z",
     "iopub.status.busy": "2023-11-04T01:59:53.376221Z",
     "iopub.status.idle": "2023-11-04T02:00:53.978885Z",
     "shell.execute_reply": "2023-11-04T02:00:53.976305Z"
    },
    "papermill": {
     "duration": 60.622362,
     "end_time": "2023-11-04T02:00:53.982332",
     "exception": false,
     "start_time": "2023-11-04T01:59:53.359970",
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
   "id": "575bf183",
   "metadata": {
    "papermill": {
     "duration": 0.014308,
     "end_time": "2023-11-04T02:00:54.011274",
     "exception": false,
     "start_time": "2023-11-04T02:00:53.996966",
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
   "id": "b132b524",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T02:00:54.044078Z",
     "iopub.status.busy": "2023-11-04T02:00:54.042047Z",
     "iopub.status.idle": "2023-11-04T02:00:54.202827Z",
     "shell.execute_reply": "2023-11-04T02:00:54.200019Z"
    },
    "papermill": {
     "duration": 0.182086,
     "end_time": "2023-11-04T02:00:54.207393",
     "exception": false,
     "start_time": "2023-11-04T02:00:54.025307",
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
   "id": "5a1d6adb",
   "metadata": {
    "papermill": {
     "duration": 0.014762,
     "end_time": "2023-11-04T02:00:54.237102",
     "exception": false,
     "start_time": "2023-11-04T02:00:54.222340",
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
   "id": "eac3503b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T02:00:54.271799Z",
     "iopub.status.busy": "2023-11-04T02:00:54.269467Z",
     "iopub.status.idle": "2023-11-04T02:00:54.667873Z",
     "shell.execute_reply": "2023-11-04T02:00:54.665755Z"
    },
    "papermill": {
     "duration": 0.419223,
     "end_time": "2023-11-04T02:00:54.671129",
     "exception": false,
     "start_time": "2023-11-04T02:00:54.251906",
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
   "id": "58ef50ef",
   "metadata": {
    "papermill": {
     "duration": 0.016584,
     "end_time": "2023-11-04T02:00:54.703069",
     "exception": false,
     "start_time": "2023-11-04T02:00:54.686485",
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
   "id": "700e9cc6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T02:00:54.739073Z",
     "iopub.status.busy": "2023-11-04T02:00:54.737221Z",
     "iopub.status.idle": "2023-11-04T02:00:57.989312Z",
     "shell.execute_reply": "2023-11-04T02:00:57.987232Z"
    },
    "papermill": {
     "duration": 3.27289,
     "end_time": "2023-11-04T02:00:57.992283",
     "exception": false,
     "start_time": "2023-11-04T02:00:54.719393",
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
   "id": "07f4582d",
   "metadata": {
    "papermill": {
     "duration": 0.015946,
     "end_time": "2023-11-04T02:00:58.025259",
     "exception": false,
     "start_time": "2023-11-04T02:00:58.009313",
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
   "id": "996c5fa3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-04T02:00:58.060889Z",
     "iopub.status.busy": "2023-11-04T02:00:58.059081Z",
     "iopub.status.idle": "2023-11-04T02:00:58.760375Z",
     "shell.execute_reply": "2023-11-04T02:00:58.756835Z"
    },
    "papermill": {
     "duration": 0.722746,
     "end_time": "2023-11-04T02:00:58.763801",
     "exception": false,
     "start_time": "2023-11-04T02:00:58.041055",
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
      "image/png": "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\n+OCQe9695ccbdPA4V0HnvBQ7duzYTtgL0MkmTZrUOTsyh0CU8plDSkpKysrKMpnMnDlzWreX\nqqqqlhbl+4zdxSc80K3P4VMfu7Y0ufTJsm/vsv+3dtors37vO3/x2/Djy1o3MgAA2ku+f3li\n8mfVGx91fHPVNUkkS48/buCSz27vgIEBALBq8g27bslkzcyaL19fM7Mmkcrj8xMAAHSwfMPu\nhI3K/3XzMS/M/cLfhK2b/9Jx100rH3B8BwwMAIBVk+977Ebdfc5Zg3+xwwZDfnbcqB22GFAc\nlvz7tWduvPz6adWFk+4a1aFDBAAgH/mGXcXAY978c/qQY3599fmnXv35lT0Hfu+KK245elBF\nri0BAOgUq/A9dn13Oeqpt0b/Z+qLb/z749pQtG6/TbfeZL18X8oFAKCDrerfik30HfTtvoM6\nZCgAALTFKjzjNuvF+0bvv/vh973fdPGxPbbabp+Rd/7js44ZGAAAqybfsJv/zu823nb/6x98\nsaB46SY9t97o/ScmH7TDRle9NbfDhgcAQL7yDbvf/+jXi0u2evqDj67dc72ma7a+4M7pHzyz\nTWnNGQf8rsOGBwBAvvINu0v+NX/AoZfv0Ltk+SuL1/rOpKMHznvn0g4YGAAAqybfsGvMZgvL\nC798fao0FUKmXYcEAEBr5Bt2x23Q4+1rTv+wtnH5KzN1M8ZdPrV73zEdMDAAAFZNvl93cvQ9\nZ5y35cmDBw096cRRO2wxoDRZ/+6bf79pwv88Nrth3MPHdegQAQDIR75h13Oz//fGg6kDxpw2\nbuzTzVcW9xx09u13nfGdtTpmbAAArIJV+ILiDfYa+/z7R7/+3JR/Tn2/ujG9Tr/BO+/07R6p\nRMcNDgCA/K3iX55IFG623e6bbdcxYwEAoA38rVcAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBIpLt6AO2vrKysq4cArK5MIEBb5DOHpNPpEEIikWjdhJPJZHLd\neCtu8WsumfQ0JNBKJhCgLfKZQxKJRP4r59j8K0UYdgsXLuzqIQCrKxMI0Bb5zCElJSXpdDqb\nzbZ6wikuLm5pkf83BQCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiES6s3aUeWrylQ8+/dKHC1Ob\nbLbN4WNHbViSWmGNbMPce6+95pFnXpldk1xnvY32HXn0Hlv1blo089nTRl/w2vIrj7npzn0q\niztp7AAAq4NOCrvp95x+yR3vjzz2uJ9VNjx0zRWnndhw61VHJ764zqPnn/yHN7ofdtTYTfuU\nvfr47VeOO7bm8pt+uF63EMK8l+eV9Bp2/OjBzSv3KyvsnJEDAKwuOiXssnUT7nhrwMgJw3fb\nMIQw4MJwwGG/uX3GyIPXKWtepbH2w6tfnLXT+Rf/cHBlCGGjQZvP+MeI+6+e+sPzvh1C+PTN\nBRWbbr/99oNb2gMAAJ3xHrva+U9/UNO419B1my4WVe44pFvh81NmLr9OY81762+44d79un9+\nRWKr8qK6+YuaLryyoLZyq4rGJQs++XRethNGDACwGuqMZ+zqFr8aQti0dNm+BpemH319/vLr\nFJbvOHHijs0X6xdNvf7jRRuMHtB08Z+L6jN/nXTgZVPrs9l02Vp7HHz8mGFbNK986aWX3n//\n/U0/p9PpP/3pTx13X4C49erVq6uHAKzG8p9Dkslk6yacxsbGHEs7I+wytYtDCFUFyz4tUVWQ\nql9Q39L67z3/x8sm3dDQb+9f794nhNBY99H8RGqDnttdeNv48sYFz/3xut9ee3rRRjcfPqii\naf2ampoFCxY0/ZxOpxOJREu3DJCbCQRoi1WaQ1o34eTeqjPCLllUGkKYU5/pXbj0ld9Z9Y3p\nyq/Yde3cqddfetn/vTJnp+E/P+/gocWJRAghVdjn7rvv/nyVqp0OOnXaoyOeuO71wy/+btNV\ne+yxx0YbbbR0X8nkokWLOvb+APEygQBtkc8cUlhYWFhYmM1mFy9e3IpdZLPZ7t27t7S0M8Ku\noHTzEKZMXVLfu7Co6ZppSxrKB5evsNrCdx876ZdXpLbY66JrDx1YleurTL61dskTcz9rvrjl\nlltuueWWzRdnzZrVfmMH1iw1NTVdPQRgNZbPHJJIJJrCrtUTTo6w64wPTxRX7NKnMPXwM0tT\nrH7RSy8srNt6l97Lr5PNVJ/331cV7fqLK888aoWqmzftiiOOPHZmXebzVRunzKiu2HTjThg5\nAMBqpFO+7iRRcNLwQb/8/bgnvvGrQRW19182oazP7iPXLQshTL/7D1Oqy0cdOqz6k1verK4/\nYouyF194oXm7gpKNhgwu79FvRK/qo085+5rjDtq1PFH9wqO3PL24+5lHCjsAgC/opC8oHjDi\n3GNqJ9424YzZNYn+Q3Yaf9Lopjf+ffTEIw/N6Tvq0GHz334vhPD7C89bfqvyfmfcMvE7yXTV\n+CvOvuHqWy8999c16R79Bmx2ysRztupW0DkjBwBYXSSy2di+GK5z3mM3duzYTtgL0MkmTZrU\nOTsyh0CU8plDSkpKysrKMpnMnDlzWreXqqqqlhZ1xnvsAADoBMIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOAMwXAsMAABlmSURB\nVCASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACAS6a4eQPsrKCjo6iEAqysTCNAW+cwhqVQqhJBIJDpiwokw7Hr06NHVQwBW\nVyYQoC3yn0MSiUTrJpzGxsYcSyMMu9mzZ3f1EIDVlQkEaIt85pCSkpKysrJMJjNnzpzW7aWq\nqqqlRd5jBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQ\nCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcA\nEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEH\nABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlh\nBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJ\nYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQ\nCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcA\nEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABAJYQcAEIl0Z+0o89TkKx98+qUPF6Y22Wybw8eO\n2rAktSrr5LM5AMAarZOesZt+z+mX3PHsdj8efdYJh5b++7HTTrw2uyrr5LM5AMAarlPCLls3\n4Y63Bow8d/hu2w3+1o4nXHjsoo8evn3G4nzXyWdzAIA1XmeEXe38pz+oadxr6LpNF4sqdxzS\nrfD5KTPzXCefzQEA6Iz32NUtfjWEsGnpsn0NLk0/+vr8PNdZ6eb33Xffc8891/RzMpk866yz\n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"
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
    "ggplot(data=trips_by_rider) +\n",
    "    geom_bar(mapping=aes(x=mean_ride_length))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "979dd02e",
   "metadata": {
    "papermill": {
     "duration": 0.015927,
     "end_time": "2023-11-04T02:00:58.795708",
     "exception": false,
     "start_time": "2023-11-04T02:00:58.779781",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Here we can see our initial assumption is correct that Casual riders do on average take longer trips than members. But let's dig a bit deeper. We'll want to see how much longer a trips are the riders taking by checking intervals.  "
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
   "duration": 173.947937,
   "end_time": "2023-11-04T02:00:59.237842",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-11-04T01:58:05.289905",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
