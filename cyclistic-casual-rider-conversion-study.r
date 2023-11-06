{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "ff63164c",
   "metadata": {
    "papermill": {
     "duration": 0.005401,
     "end_time": "2023-11-06T07:27:17.663062",
     "exception": false,
     "start_time": "2023-11-06T07:27:17.657661",
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
   "id": "883a273f",
   "metadata": {
    "papermill": {
     "duration": 0.004223,
     "end_time": "2023-11-06T07:27:17.671762",
     "exception": false,
     "start_time": "2023-11-06T07:27:17.667539",
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
   "id": "d16bf948",
   "metadata": {
    "_kg_hide-input": true,
    "_kg_hide-output": true,
    "execution": {
     "iopub.execute_input": "2023-11-06T07:27:17.684060Z",
     "iopub.status.busy": "2023-11-06T07:27:17.682262Z",
     "iopub.status.idle": "2023-11-06T07:27:47.220702Z",
     "shell.execute_reply": "2023-11-06T07:27:47.219102Z"
    },
    "papermill": {
     "duration": 29.546976,
     "end_time": "2023-11-06T07:27:47.223010",
     "exception": false,
     "start_time": "2023-11-06T07:27:17.676034",
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
    "library('ggplot2')\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "6d1f2d36",
   "metadata": {
    "_kg_hide-output": true,
    "execution": {
     "iopub.execute_input": "2023-11-06T07:27:47.279288Z",
     "iopub.status.busy": "2023-11-06T07:27:47.236276Z",
     "iopub.status.idle": "2023-11-06T07:28:16.471455Z",
     "shell.execute_reply": "2023-11-06T07:28:16.469591Z"
    },
    "papermill": {
     "duration": 29.245759,
     "end_time": "2023-11-06T07:28:16.473899",
     "exception": false,
     "start_time": "2023-11-06T07:27:47.228140",
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
   "id": "03c42b62",
   "metadata": {
    "papermill": {
     "duration": 0.007038,
     "end_time": "2023-11-06T07:28:16.488467",
     "exception": false,
     "start_time": "2023-11-06T07:28:16.481429",
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
   "id": "6a2fea2f",
   "metadata": {
    "papermill": {
     "duration": 0.006808,
     "end_time": "2023-11-06T07:28:16.501985",
     "exception": false,
     "start_time": "2023-11-06T07:28:16.495177",
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
   "id": "a454bd5d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-06T07:28:16.519482Z",
     "iopub.status.busy": "2023-11-06T07:28:16.517816Z",
     "iopub.status.idle": "2023-11-06T07:28:25.295965Z",
     "shell.execute_reply": "2023-11-06T07:28:25.294475Z"
    },
    "papermill": {
     "duration": 8.790182,
     "end_time": "2023-11-06T07:28:25.298888",
     "exception": false,
     "start_time": "2023-11-06T07:28:16.508706",
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
    "        day_of_week=wday(started_at, week_start=7),\n",
    "        day_of_week_name=format(as.Date(started_at), \"%A\")\n",
    "    )\n",
    "\n",
    "# Assign dataset to a dataframe\n",
    "df <- data.frame(complete_trip_data_raw)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "abb346bb",
   "metadata": {
    "papermill": {
     "duration": 0.007318,
     "end_time": "2023-11-06T07:28:25.313030",
     "exception": false,
     "start_time": "2023-11-06T07:28:25.305712",
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
   "id": "5c36fabf",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-06T07:28:25.329685Z",
     "iopub.status.busy": "2023-11-06T07:28:25.328397Z",
     "iopub.status.idle": "2023-11-06T07:28:25.356348Z",
     "shell.execute_reply": "2023-11-06T07:28:25.354971Z"
    },
    "papermill": {
     "duration": 0.038131,
     "end_time": "2023-11-06T07:28:25.358101",
     "exception": false,
     "start_time": "2023-11-06T07:28:25.319970",
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
      "Columns: 16\n",
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
      "$ day_of_week        \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 7, 7, 2, 4, 2, 6, 4, 1, 1, 5, 3, 1, 5, 6, 5, 2, 5, …\n",
      "$ day_of_week_name   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Saturday\", \"Saturday\", \"Monday\", \"Wednesday\", \"Mon…\n"
     ]
    }
   ],
   "source": [
    "glimpse(df)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "02acf4c5",
   "metadata": {
    "papermill": {
     "duration": 0.006901,
     "end_time": "2023-11-06T07:28:25.372072",
     "exception": false,
     "start_time": "2023-11-06T07:28:25.365171",
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
   "id": "a64dfbf7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-06T07:28:25.389336Z",
     "iopub.status.busy": "2023-11-06T07:28:25.387874Z",
     "iopub.status.idle": "2023-11-06T07:28:25.951729Z",
     "shell.execute_reply": "2023-11-06T07:28:25.949553Z"
    },
    "papermill": {
     "duration": 0.574784,
     "end_time": "2023-11-06T07:28:25.954022",
     "exception": false,
     "start_time": "2023-11-06T07:28:25.379238",
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
   "id": "1d338784",
   "metadata": {
    "papermill": {
     "duration": 0.009413,
     "end_time": "2023-11-06T07:28:25.973110",
     "exception": false,
     "start_time": "2023-11-06T07:28:25.963697",
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
   "id": "82313d73",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-06T07:28:25.994978Z",
     "iopub.status.busy": "2023-11-06T07:28:25.992998Z",
     "iopub.status.idle": "2023-11-06T07:28:26.559201Z",
     "shell.execute_reply": "2023-11-06T07:28:26.557896Z"
    },
    "papermill": {
     "duration": 0.579063,
     "end_time": "2023-11-06T07:28:26.560978",
     "exception": false,
     "start_time": "2023-11-06T07:28:25.981915",
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
   "id": "1326715b",
   "metadata": {
    "papermill": {
     "duration": 0.007901,
     "end_time": "2023-11-06T07:28:26.577550",
     "exception": false,
     "start_time": "2023-11-06T07:28:26.569649",
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
   "id": "a3ac9c2d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-06T07:28:26.596416Z",
     "iopub.status.busy": "2023-11-06T07:28:26.594784Z",
     "iopub.status.idle": "2023-11-06T07:28:28.196388Z",
     "shell.execute_reply": "2023-11-06T07:28:28.194790Z"
    },
    "papermill": {
     "duration": 1.614864,
     "end_time": "2023-11-06T07:28:28.199462",
     "exception": false,
     "start_time": "2023-11-06T07:28:26.584598",
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
   "id": "8237e220",
   "metadata": {
    "papermill": {
     "duration": 0.00711,
     "end_time": "2023-11-06T07:28:28.213994",
     "exception": false,
     "start_time": "2023-11-06T07:28:28.206884",
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
   "id": "4b8fd3b1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-06T07:28:28.231900Z",
     "iopub.status.busy": "2023-11-06T07:28:28.230445Z",
     "iopub.status.idle": "2023-11-06T07:28:33.219894Z",
     "shell.execute_reply": "2023-11-06T07:28:33.218516Z"
    },
    "papermill": {
     "duration": 5.000532,
     "end_time": "2023-11-06T07:28:33.221684",
     "exception": false,
     "start_time": "2023-11-06T07:28:28.221152",
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
   "id": "151d08e0",
   "metadata": {
    "papermill": {
     "duration": 0.007088,
     "end_time": "2023-11-06T07:28:33.236152",
     "exception": false,
     "start_time": "2023-11-06T07:28:33.229064",
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
   "id": "7334ee9f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-06T07:28:33.253733Z",
     "iopub.status.busy": "2023-11-06T07:28:33.252332Z",
     "iopub.status.idle": "2023-11-06T07:28:33.288576Z",
     "shell.execute_reply": "2023-11-06T07:28:33.287179Z"
    },
    "papermill": {
     "duration": 0.047587,
     "end_time": "2023-11-06T07:28:33.290975",
     "exception": false,
     "start_time": "2023-11-06T07:28:33.243388",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 10 × 16</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th><th scope=col>ride_length</th><th scope=col>day_of_week</th><th scope=col>day_of_week_name</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;time&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>011C1903BF4E2E28</td><td>classic_bike </td><td>2023-09-23 00:27:50</td><td>2023-09-23 00:33:27</td><td><span style=white-space:pre-wrap>Halsted St &amp; Wrightwood Ave  </span></td><td>TA1309000061</td><td>Sheffield Ave &amp; Wellington Ave</td><td>TA1307000052</td><td>41.92914</td><td>-87.64908</td><td>41.93625</td><td>-87.65266</td><td>member</td><td>00:05:37</td><td>7</td><td>Saturday </td></tr>\n",
       "\t<tr><th scope=row>2</th><td>87DB80E048A1BF9F</td><td>classic_bike </td><td>2023-09-02 09:26:43</td><td>2023-09-02 09:38:19</td><td><span style=white-space:pre-wrap>Clark St &amp; Drummond Pl       </span></td><td>TA1307000142</td><td><span style=white-space:pre-wrap>Racine Ave &amp; Fullerton Ave    </span></td><td>TA1306000026</td><td>41.93125</td><td>-87.64434</td><td>41.92557</td><td>-87.65842</td><td>member</td><td>00:11:36</td><td>7</td><td>Saturday </td></tr>\n",
       "\t<tr><th scope=row>3</th><td>7C2EB7AF669066E3</td><td>electric_bike</td><td>2023-09-25 18:30:11</td><td>2023-09-25 18:41:39</td><td>Financial Pl &amp; Ida B Wells Dr</td><td><span style=white-space:pre-wrap>SL-010      </span></td><td><span style=white-space:pre-wrap>Racine Ave &amp; 15th St          </span></td><td><span style=white-space:pre-wrap>13304       </span></td><td>41.87506</td><td>-87.63314</td><td>41.86127</td><td>-87.65663</td><td>member</td><td>00:11:28</td><td>2</td><td><span style=white-space:pre-wrap>Monday   </span></td></tr>\n",
       "\t<tr><th scope=row>4</th><td>57D197B010269CE3</td><td>classic_bike </td><td>2023-09-13 15:30:49</td><td>2023-09-13 15:39:18</td><td><span style=white-space:pre-wrap>Clark St &amp; Drummond Pl       </span></td><td>TA1307000142</td><td><span style=white-space:pre-wrap>Racine Ave &amp; Belmont Ave      </span></td><td>TA1308000019</td><td>41.93125</td><td>-87.64434</td><td>41.93974</td><td>-87.65887</td><td>member</td><td>00:08:29</td><td>4</td><td>Wednesday</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>8A2CEA7C8C8074D8</td><td>classic_bike </td><td>2023-09-18 15:58:58</td><td>2023-09-18 16:05:04</td><td><span style=white-space:pre-wrap>Halsted St &amp; Wrightwood Ave  </span></td><td>TA1309000061</td><td><span style=white-space:pre-wrap>Racine Ave &amp; Fullerton Ave    </span></td><td>TA1306000026</td><td>41.92914</td><td>-87.64908</td><td>41.92557</td><td>-87.65842</td><td>member</td><td>00:06:06</td><td>2</td><td><span style=white-space:pre-wrap>Monday   </span></td></tr>\n",
       "\t<tr><th scope=row>6</th><td>40D9EF382CC6C53D</td><td>classic_bike </td><td>2023-09-17 11:58:50</td><td>2023-09-17 12:08:36</td><td><span style=white-space:pre-wrap>Kedzie Ave &amp; Milwaukee Ave   </span></td><td><span style=white-space:pre-wrap>13085       </span></td><td>California Ave &amp; Milwaukee Ave</td><td><span style=white-space:pre-wrap>13084       </span></td><td>41.92957</td><td>-87.70786</td><td>41.92269</td><td>-87.69715</td><td>member</td><td>00:09:46</td><td>1</td><td><span style=white-space:pre-wrap>Sunday   </span></td></tr>\n",
       "\t<tr><th scope=row>7</th><td>3812B98E9406040E</td><td>classic_bike </td><td>2023-09-12 16:01:28</td><td>2023-09-12 16:17:47</td><td>Financial Pl &amp; Ida B Wells Dr</td><td><span style=white-space:pre-wrap>SL-010      </span></td><td><span style=white-space:pre-wrap>Adler Planetarium             </span></td><td><span style=white-space:pre-wrap>13431       </span></td><td>41.87502</td><td>-87.63309</td><td>41.86610</td><td>-87.60727</td><td>member</td><td>00:16:19</td><td>3</td><td><span style=white-space:pre-wrap>Tuesday  </span></td></tr>\n",
       "\t<tr><th scope=row>8</th><td>EBA56298CB3C803F</td><td>classic_bike </td><td>2023-09-24 13:17:23</td><td>2023-09-24 13:50:43</td><td><span style=white-space:pre-wrap>Clark St &amp; Schreiber Ave     </span></td><td>KA1504000156</td><td><span style=white-space:pre-wrap>Oakley Ave &amp; Touhy Ave        </span></td><td><span style=white-space:pre-wrap>RP-004      </span></td><td>41.99990</td><td>-87.67007</td><td>42.01234</td><td>-87.68824</td><td>member</td><td>00:33:20</td><td>1</td><td><span style=white-space:pre-wrap>Sunday   </span></td></tr>\n",
       "\t<tr><th scope=row>9</th><td>C6BD5AF648F11D11</td><td>electric_bike</td><td>2023-09-28 18:09:40</td><td>2023-09-28 18:15:04</td><td><span style=white-space:pre-wrap>Halsted St &amp; Wrightwood Ave  </span></td><td>TA1309000061</td><td><span style=white-space:pre-wrap>Halsted St &amp; Roscoe St        </span></td><td>TA1309000025</td><td>41.92919</td><td>-87.64914</td><td>41.94367</td><td>-87.64895</td><td>member</td><td>00:05:24</td><td>5</td><td>Thursday </td></tr>\n",
       "\t<tr><th scope=row>10</th><td>585C82FA2E006DE9</td><td>classic_bike </td><td>2023-09-22 12:30:41</td><td>2023-09-22 12:42:21</td><td><span style=white-space:pre-wrap>Halsted St &amp; Wrightwood Ave  </span></td><td>TA1309000061</td><td><span style=white-space:pre-wrap>Halsted St &amp; Roscoe St        </span></td><td>TA1309000025</td><td>41.92914</td><td>-87.64908</td><td>41.94367</td><td>-87.64895</td><td>member</td><td>00:11:40</td><td>6</td><td><span style=white-space:pre-wrap>Friday   </span></td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 10 × 16\n",
       "\\begin{tabular}{r|llllllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual & ride\\_length & day\\_of\\_week & day\\_of\\_week\\_name\\\\\n",
       "  & <chr> & <chr> & <dttm> & <dttm> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <time> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & 011C1903BF4E2E28 & classic\\_bike  & 2023-09-23 00:27:50 & 2023-09-23 00:33:27 & Halsted St \\& Wrightwood Ave   & TA1309000061 & Sheffield Ave \\& Wellington Ave & TA1307000052 & 41.92914 & -87.64908 & 41.93625 & -87.65266 & member & 00:05:37 & 7 & Saturday \\\\\n",
       "\t2 & 87DB80E048A1BF9F & classic\\_bike  & 2023-09-02 09:26:43 & 2023-09-02 09:38:19 & Clark St \\& Drummond Pl        & TA1307000142 & Racine Ave \\& Fullerton Ave     & TA1306000026 & 41.93125 & -87.64434 & 41.92557 & -87.65842 & member & 00:11:36 & 7 & Saturday \\\\\n",
       "\t3 & 7C2EB7AF669066E3 & electric\\_bike & 2023-09-25 18:30:11 & 2023-09-25 18:41:39 & Financial Pl \\& Ida B Wells Dr & SL-010       & Racine Ave \\& 15th St           & 13304        & 41.87506 & -87.63314 & 41.86127 & -87.65663 & member & 00:11:28 & 2 & Monday   \\\\\n",
       "\t4 & 57D197B010269CE3 & classic\\_bike  & 2023-09-13 15:30:49 & 2023-09-13 15:39:18 & Clark St \\& Drummond Pl        & TA1307000142 & Racine Ave \\& Belmont Ave       & TA1308000019 & 41.93125 & -87.64434 & 41.93974 & -87.65887 & member & 00:08:29 & 4 & Wednesday\\\\\n",
       "\t5 & 8A2CEA7C8C8074D8 & classic\\_bike  & 2023-09-18 15:58:58 & 2023-09-18 16:05:04 & Halsted St \\& Wrightwood Ave   & TA1309000061 & Racine Ave \\& Fullerton Ave     & TA1306000026 & 41.92914 & -87.64908 & 41.92557 & -87.65842 & member & 00:06:06 & 2 & Monday   \\\\\n",
       "\t6 & 40D9EF382CC6C53D & classic\\_bike  & 2023-09-17 11:58:50 & 2023-09-17 12:08:36 & Kedzie Ave \\& Milwaukee Ave    & 13085        & California Ave \\& Milwaukee Ave & 13084        & 41.92957 & -87.70786 & 41.92269 & -87.69715 & member & 00:09:46 & 1 & Sunday   \\\\\n",
       "\t7 & 3812B98E9406040E & classic\\_bike  & 2023-09-12 16:01:28 & 2023-09-12 16:17:47 & Financial Pl \\& Ida B Wells Dr & SL-010       & Adler Planetarium              & 13431        & 41.87502 & -87.63309 & 41.86610 & -87.60727 & member & 00:16:19 & 3 & Tuesday  \\\\\n",
       "\t8 & EBA56298CB3C803F & classic\\_bike  & 2023-09-24 13:17:23 & 2023-09-24 13:50:43 & Clark St \\& Schreiber Ave      & KA1504000156 & Oakley Ave \\& Touhy Ave         & RP-004       & 41.99990 & -87.67007 & 42.01234 & -87.68824 & member & 00:33:20 & 1 & Sunday   \\\\\n",
       "\t9 & C6BD5AF648F11D11 & electric\\_bike & 2023-09-28 18:09:40 & 2023-09-28 18:15:04 & Halsted St \\& Wrightwood Ave   & TA1309000061 & Halsted St \\& Roscoe St         & TA1309000025 & 41.92919 & -87.64914 & 41.94367 & -87.64895 & member & 00:05:24 & 5 & Thursday \\\\\n",
       "\t10 & 585C82FA2E006DE9 & classic\\_bike  & 2023-09-22 12:30:41 & 2023-09-22 12:42:21 & Halsted St \\& Wrightwood Ave   & TA1309000061 & Halsted St \\& Roscoe St         & TA1309000025 & 41.92914 & -87.64908 & 41.94367 & -87.64895 & member & 00:11:40 & 6 & Friday   \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 10 × 16\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;dttm&gt; | ended_at &lt;dttm&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; | ride_length &lt;time&gt; | day_of_week &lt;dbl&gt; | day_of_week_name &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 011C1903BF4E2E28 | classic_bike  | 2023-09-23 00:27:50 | 2023-09-23 00:33:27 | Halsted St &amp; Wrightwood Ave   | TA1309000061 | Sheffield Ave &amp; Wellington Ave | TA1307000052 | 41.92914 | -87.64908 | 41.93625 | -87.65266 | member | 00:05:37 | 7 | Saturday  |\n",
       "| 2 | 87DB80E048A1BF9F | classic_bike  | 2023-09-02 09:26:43 | 2023-09-02 09:38:19 | Clark St &amp; Drummond Pl        | TA1307000142 | Racine Ave &amp; Fullerton Ave     | TA1306000026 | 41.93125 | -87.64434 | 41.92557 | -87.65842 | member | 00:11:36 | 7 | Saturday  |\n",
       "| 3 | 7C2EB7AF669066E3 | electric_bike | 2023-09-25 18:30:11 | 2023-09-25 18:41:39 | Financial Pl &amp; Ida B Wells Dr | SL-010       | Racine Ave &amp; 15th St           | 13304        | 41.87506 | -87.63314 | 41.86127 | -87.65663 | member | 00:11:28 | 2 | Monday    |\n",
       "| 4 | 57D197B010269CE3 | classic_bike  | 2023-09-13 15:30:49 | 2023-09-13 15:39:18 | Clark St &amp; Drummond Pl        | TA1307000142 | Racine Ave &amp; Belmont Ave       | TA1308000019 | 41.93125 | -87.64434 | 41.93974 | -87.65887 | member | 00:08:29 | 4 | Wednesday |\n",
       "| 5 | 8A2CEA7C8C8074D8 | classic_bike  | 2023-09-18 15:58:58 | 2023-09-18 16:05:04 | Halsted St &amp; Wrightwood Ave   | TA1309000061 | Racine Ave &amp; Fullerton Ave     | TA1306000026 | 41.92914 | -87.64908 | 41.92557 | -87.65842 | member | 00:06:06 | 2 | Monday    |\n",
       "| 6 | 40D9EF382CC6C53D | classic_bike  | 2023-09-17 11:58:50 | 2023-09-17 12:08:36 | Kedzie Ave &amp; Milwaukee Ave    | 13085        | California Ave &amp; Milwaukee Ave | 13084        | 41.92957 | -87.70786 | 41.92269 | -87.69715 | member | 00:09:46 | 1 | Sunday    |\n",
       "| 7 | 3812B98E9406040E | classic_bike  | 2023-09-12 16:01:28 | 2023-09-12 16:17:47 | Financial Pl &amp; Ida B Wells Dr | SL-010       | Adler Planetarium              | 13431        | 41.87502 | -87.63309 | 41.86610 | -87.60727 | member | 00:16:19 | 3 | Tuesday   |\n",
       "| 8 | EBA56298CB3C803F | classic_bike  | 2023-09-24 13:17:23 | 2023-09-24 13:50:43 | Clark St &amp; Schreiber Ave      | KA1504000156 | Oakley Ave &amp; Touhy Ave         | RP-004       | 41.99990 | -87.67007 | 42.01234 | -87.68824 | member | 00:33:20 | 1 | Sunday    |\n",
       "| 9 | C6BD5AF648F11D11 | electric_bike | 2023-09-28 18:09:40 | 2023-09-28 18:15:04 | Halsted St &amp; Wrightwood Ave   | TA1309000061 | Halsted St &amp; Roscoe St         | TA1309000025 | 41.92919 | -87.64914 | 41.94367 | -87.64895 | member | 00:05:24 | 5 | Thursday  |\n",
       "| 10 | 585C82FA2E006DE9 | classic_bike  | 2023-09-22 12:30:41 | 2023-09-22 12:42:21 | Halsted St &amp; Wrightwood Ave   | TA1309000061 | Halsted St &amp; Roscoe St         | TA1309000025 | 41.92914 | -87.64908 | 41.94367 | -87.64895 | member | 00:11:40 | 6 | Friday    |\n",
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
       "   end_lng   member_casual ride_length day_of_week day_of_week_name\n",
       "1  -87.65266 member        00:05:37    7           Saturday        \n",
       "2  -87.65842 member        00:11:36    7           Saturday        \n",
       "3  -87.65663 member        00:11:28    2           Monday          \n",
       "4  -87.65887 member        00:08:29    4           Wednesday       \n",
       "5  -87.65842 member        00:06:06    2           Monday          \n",
       "6  -87.69715 member        00:09:46    1           Sunday          \n",
       "7  -87.60727 member        00:16:19    3           Tuesday         \n",
       "8  -87.68824 member        00:33:20    1           Sunday          \n",
       "9  -87.64895 member        00:05:24    5           Thursday        \n",
       "10 -87.64895 member        00:11:40    6           Friday          "
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
   "id": "09831d03",
   "metadata": {
    "papermill": {
     "duration": 0.007432,
     "end_time": "2023-11-06T07:28:33.306292",
     "exception": false,
     "start_time": "2023-11-06T07:28:33.298860",
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
   "id": "d9b6ecfc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-06T07:28:33.324741Z",
     "iopub.status.busy": "2023-11-06T07:28:33.323298Z",
     "iopub.status.idle": "2023-11-06T07:29:16.216480Z",
     "shell.execute_reply": "2023-11-06T07:29:16.213386Z"
    },
    "papermill": {
     "duration": 42.904796,
     "end_time": "2023-11-06T07:29:16.218824",
     "exception": false,
     "start_time": "2023-11-06T07:28:33.314028",
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
   "id": "4a714fc4",
   "metadata": {
    "papermill": {
     "duration": 0.007878,
     "end_time": "2023-11-06T07:29:16.234792",
     "exception": false,
     "start_time": "2023-11-06T07:29:16.226914",
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
   "id": "2c971305",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-06T07:29:16.254381Z",
     "iopub.status.busy": "2023-11-06T07:29:16.252938Z",
     "iopub.status.idle": "2023-11-06T07:29:46.602107Z",
     "shell.execute_reply": "2023-11-06T07:29:46.600510Z"
    },
    "papermill": {
     "duration": 30.361528,
     "end_time": "2023-11-06T07:29:46.604376",
     "exception": false,
     "start_time": "2023-11-06T07:29:16.242848",
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
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"By Average Ride Length\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>trips_cleaned$member_casual</th><th scope=col>trips_cleaned$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>1366.7659 secs</td></tr>\n",
       "\t<tr><td>member</td><td> 727.0977 secs</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " trips\\_cleaned\\$member\\_casual & trips\\_cleaned\\$ride\\_length\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & 1366.7659 secs\\\\\n",
       "\t member &  727.0977 secs\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| trips_cleaned$member_casual &lt;chr&gt; | trips_cleaned$ride_length &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| casual | 1366.7659 secs |\n",
       "| member |  727.0977 secs |\n",
       "\n"
      ],
      "text/plain": [
       "  trips_cleaned$member_casual trips_cleaned$ride_length\n",
       "1 casual                      1366.7659 secs           \n",
       "2 member                       727.0977 secs           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"By Median Ride Length\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>trips_cleaned$member_casual</th><th scope=col>trips_cleaned$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>765</td></tr>\n",
       "\t<tr><td>member</td><td>517</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " trips\\_cleaned\\$member\\_casual & trips\\_cleaned\\$ride\\_length\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 765\\\\\n",
       "\t member & 517\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| trips_cleaned$member_casual &lt;chr&gt; | trips_cleaned$ride_length &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| casual | 765 |\n",
       "| member | 517 |\n",
       "\n"
      ],
      "text/plain": [
       "  trips_cleaned$member_casual trips_cleaned$ride_length\n",
       "1 casual                      765                      \n",
       "2 member                      517                      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"By Maximum Ride Length\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>trips_cleaned$member_casual</th><th scope=col>trips_cleaned$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>728178 secs</td></tr>\n",
       "\t<tr><td>member</td><td> 89872 secs</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " trips\\_cleaned\\$member\\_casual & trips\\_cleaned\\$ride\\_length\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & 728178 secs\\\\\n",
       "\t member &  89872 secs\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| trips_cleaned$member_casual &lt;chr&gt; | trips_cleaned$ride_length &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| casual | 728178 secs |\n",
       "| member |  89872 secs |\n",
       "\n"
      ],
      "text/plain": [
       "  trips_cleaned$member_casual trips_cleaned$ride_length\n",
       "1 casual                      728178 secs              \n",
       "2 member                       89872 secs              "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"By Minimum Ride Length\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>trips_cleaned$member_casual</th><th scope=col>trips_cleaned$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td> -3479 secs</td></tr>\n",
       "\t<tr><td>member</td><td>-10122 secs</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " trips\\_cleaned\\$member\\_casual & trips\\_cleaned\\$ride\\_length\\\\\n",
       " <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual &  -3479 secs\\\\\n",
       "\t member & -10122 secs\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 2\n",
       "\n",
       "| trips_cleaned$member_casual &lt;chr&gt; | trips_cleaned$ride_length &lt;drtn&gt; |\n",
       "|---|---|\n",
       "| casual |  -3479 secs |\n",
       "| member | -10122 secs |\n",
       "\n"
      ],
      "text/plain": [
       "  trips_cleaned$member_casual trips_cleaned$ride_length\n",
       "1 casual                       -3479 secs              \n",
       "2 member                      -10122 secs              "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>trips_cleaned$member_casual</th><th scope=col>trips_cleaned$day_of_week_name</th><th scope=col>as_hms(trips_cleaned$ride_length)</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>1334.3852 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td> 724.0071 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>1345.2952 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td> 691.9274 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>1546.5415 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td> 816.7629 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>1572.2558 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td> 815.1951 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>1197.0999 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td> 693.6336 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>1213.4091 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td> 694.6126 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>1157.1306 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td> 692.9693 secs</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " trips\\_cleaned\\$member\\_casual & trips\\_cleaned\\$day\\_of\\_week\\_name & as\\_hms(trips\\_cleaned\\$ride\\_length)\\\\\n",
       " <chr> & <chr> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & Friday    & 1334.3852 secs\\\\\n",
       "\t member & Friday    &  724.0071 secs\\\\\n",
       "\t casual & Monday    & 1345.2952 secs\\\\\n",
       "\t member & Monday    &  691.9274 secs\\\\\n",
       "\t casual & Saturday  & 1546.5415 secs\\\\\n",
       "\t member & Saturday  &  816.7629 secs\\\\\n",
       "\t casual & Sunday    & 1572.2558 secs\\\\\n",
       "\t member & Sunday    &  815.1951 secs\\\\\n",
       "\t casual & Thursday  & 1197.0999 secs\\\\\n",
       "\t member & Thursday  &  693.6336 secs\\\\\n",
       "\t casual & Tuesday   & 1213.4091 secs\\\\\n",
       "\t member & Tuesday   &  694.6126 secs\\\\\n",
       "\t casual & Wednesday & 1157.1306 secs\\\\\n",
       "\t member & Wednesday &  692.9693 secs\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 14 × 3\n",
       "\n",
       "| trips_cleaned$member_casual &lt;chr&gt; | trips_cleaned$day_of_week_name &lt;chr&gt; | as_hms(trips_cleaned$ride_length) &lt;drtn&gt; |\n",
       "|---|---|---|\n",
       "| casual | Friday    | 1334.3852 secs |\n",
       "| member | Friday    |  724.0071 secs |\n",
       "| casual | Monday    | 1345.2952 secs |\n",
       "| member | Monday    |  691.9274 secs |\n",
       "| casual | Saturday  | 1546.5415 secs |\n",
       "| member | Saturday  |  816.7629 secs |\n",
       "| casual | Sunday    | 1572.2558 secs |\n",
       "| member | Sunday    |  815.1951 secs |\n",
       "| casual | Thursday  | 1197.0999 secs |\n",
       "| member | Thursday  |  693.6336 secs |\n",
       "| casual | Tuesday   | 1213.4091 secs |\n",
       "| member | Tuesday   |  694.6126 secs |\n",
       "| casual | Wednesday | 1157.1306 secs |\n",
       "| member | Wednesday |  692.9693 secs |\n",
       "\n"
      ],
      "text/plain": [
       "   trips_cleaned$member_casual trips_cleaned$day_of_week_name\n",
       "1  casual                      Friday                        \n",
       "2  member                      Friday                        \n",
       "3  casual                      Monday                        \n",
       "4  member                      Monday                        \n",
       "5  casual                      Saturday                      \n",
       "6  member                      Saturday                      \n",
       "7  casual                      Sunday                        \n",
       "8  member                      Sunday                        \n",
       "9  casual                      Thursday                      \n",
       "10 member                      Thursday                      \n",
       "11 casual                      Tuesday                       \n",
       "12 member                      Tuesday                       \n",
       "13 casual                      Wednesday                     \n",
       "14 member                      Wednesday                     \n",
       "   as_hms(trips_cleaned$ride_length)\n",
       "1  1334.3852 secs                   \n",
       "2   724.0071 secs                   \n",
       "3  1345.2952 secs                   \n",
       "4   691.9274 secs                   \n",
       "5  1546.5415 secs                   \n",
       "6   816.7629 secs                   \n",
       "7  1572.2558 secs                   \n",
       "8   815.1951 secs                   \n",
       "9  1197.0999 secs                   \n",
       "10  693.6336 secs                   \n",
       "11 1213.4091 secs                   \n",
       "12  694.6126 secs                   \n",
       "13 1157.1306 secs                   \n",
       "14  692.9693 secs                   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>trips_cleaned$member_casual</th><th scope=col>trips_cleaned$day_of_week_name</th><th scope=col>trips_cleaned$ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>1572.2558 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td> 815.1951 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>1345.2952 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td> 691.9274 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>1213.4091 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td> 694.6126 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>1157.1306 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td> 692.9693 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>1197.0999 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td> 693.6336 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>1334.3852 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td> 724.0071 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>1546.5415 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td> 816.7629 secs</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " trips\\_cleaned\\$member\\_casual & trips\\_cleaned\\$day\\_of\\_week\\_name & trips\\_cleaned\\$ride\\_length\\\\\n",
       " <chr> & <ord> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & Sunday    & 1572.2558 secs\\\\\n",
       "\t member & Sunday    &  815.1951 secs\\\\\n",
       "\t casual & Monday    & 1345.2952 secs\\\\\n",
       "\t member & Monday    &  691.9274 secs\\\\\n",
       "\t casual & Tuesday   & 1213.4091 secs\\\\\n",
       "\t member & Tuesday   &  694.6126 secs\\\\\n",
       "\t casual & Wednesday & 1157.1306 secs\\\\\n",
       "\t member & Wednesday &  692.9693 secs\\\\\n",
       "\t casual & Thursday  & 1197.0999 secs\\\\\n",
       "\t member & Thursday  &  693.6336 secs\\\\\n",
       "\t casual & Friday    & 1334.3852 secs\\\\\n",
       "\t member & Friday    &  724.0071 secs\\\\\n",
       "\t casual & Saturday  & 1546.5415 secs\\\\\n",
       "\t member & Saturday  &  816.7629 secs\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 14 × 3\n",
       "\n",
       "| trips_cleaned$member_casual &lt;chr&gt; | trips_cleaned$day_of_week_name &lt;ord&gt; | trips_cleaned$ride_length &lt;drtn&gt; |\n",
       "|---|---|---|\n",
       "| casual | Sunday    | 1572.2558 secs |\n",
       "| member | Sunday    |  815.1951 secs |\n",
       "| casual | Monday    | 1345.2952 secs |\n",
       "| member | Monday    |  691.9274 secs |\n",
       "| casual | Tuesday   | 1213.4091 secs |\n",
       "| member | Tuesday   |  694.6126 secs |\n",
       "| casual | Wednesday | 1157.1306 secs |\n",
       "| member | Wednesday |  692.9693 secs |\n",
       "| casual | Thursday  | 1197.0999 secs |\n",
       "| member | Thursday  |  693.6336 secs |\n",
       "| casual | Friday    | 1334.3852 secs |\n",
       "| member | Friday    |  724.0071 secs |\n",
       "| casual | Saturday  | 1546.5415 secs |\n",
       "| member | Saturday  |  816.7629 secs |\n",
       "\n"
      ],
      "text/plain": [
       "   trips_cleaned$member_casual trips_cleaned$day_of_week_name\n",
       "1  casual                      Sunday                        \n",
       "2  member                      Sunday                        \n",
       "3  casual                      Monday                        \n",
       "4  member                      Monday                        \n",
       "5  casual                      Tuesday                       \n",
       "6  member                      Tuesday                       \n",
       "7  casual                      Wednesday                     \n",
       "8  member                      Wednesday                     \n",
       "9  casual                      Thursday                      \n",
       "10 member                      Thursday                      \n",
       "11 casual                      Friday                        \n",
       "12 member                      Friday                        \n",
       "13 casual                      Saturday                      \n",
       "14 member                      Saturday                      \n",
       "   trips_cleaned$ride_length\n",
       "1  1572.2558 secs           \n",
       "2   815.1951 secs           \n",
       "3  1345.2952 secs           \n",
       "4   691.9274 secs           \n",
       "5  1213.4091 secs           \n",
       "6   694.6126 secs           \n",
       "7  1157.1306 secs           \n",
       "8   692.9693 secs           \n",
       "9  1197.0999 secs           \n",
       "10  693.6336 secs           \n",
       "11 1334.3852 secs           \n",
       "12  724.0071 secs           \n",
       "13 1546.5415 secs           \n",
       "14  816.7629 secs           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 14 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>weekday</th><th scope=col>number_of_rides</th><th scope=col>average_duration</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;drtn&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Sun</td><td>256618</td><td>1572.2558 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>Mon</td><td>176520</td><td>1345.2952 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>Tue</td><td>176874</td><td>1213.4091 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>Wed</td><td>182783</td><td>1157.1306 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>Thu</td><td>201668</td><td>1197.0999 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>Fri</td><td>230996</td><td>1334.3852 secs</td></tr>\n",
       "\t<tr><td>casual</td><td>Sat</td><td>323716</td><td>1546.5415 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Sun</td><td>302414</td><td> 815.1951 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Mon</td><td>379478</td><td> 691.9274 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Tue</td><td>431666</td><td> 694.6126 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Wed</td><td>440917</td><td> 692.9693 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Thu</td><td>441710</td><td> 693.6336 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Fri</td><td>391916</td><td> 724.0071 secs</td></tr>\n",
       "\t<tr><td>member</td><td>Sat</td><td>354291</td><td> 816.7629 secs</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 14 × 4\n",
       "\\begin{tabular}{llll}\n",
       " member\\_casual & weekday & number\\_of\\_rides & average\\_duration\\\\\n",
       " <chr> & <ord> & <int> & <drtn>\\\\\n",
       "\\hline\n",
       "\t casual & Sun & 256618 & 1572.2558 secs\\\\\n",
       "\t casual & Mon & 176520 & 1345.2952 secs\\\\\n",
       "\t casual & Tue & 176874 & 1213.4091 secs\\\\\n",
       "\t casual & Wed & 182783 & 1157.1306 secs\\\\\n",
       "\t casual & Thu & 201668 & 1197.0999 secs\\\\\n",
       "\t casual & Fri & 230996 & 1334.3852 secs\\\\\n",
       "\t casual & Sat & 323716 & 1546.5415 secs\\\\\n",
       "\t member & Sun & 302414 &  815.1951 secs\\\\\n",
       "\t member & Mon & 379478 &  691.9274 secs\\\\\n",
       "\t member & Tue & 431666 &  694.6126 secs\\\\\n",
       "\t member & Wed & 440917 &  692.9693 secs\\\\\n",
       "\t member & Thu & 441710 &  693.6336 secs\\\\\n",
       "\t member & Fri & 391916 &  724.0071 secs\\\\\n",
       "\t member & Sat & 354291 &  816.7629 secs\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 14 × 4\n",
       "\n",
       "| member_casual &lt;chr&gt; | weekday &lt;ord&gt; | number_of_rides &lt;int&gt; | average_duration &lt;drtn&gt; |\n",
       "|---|---|---|---|\n",
       "| casual | Sun | 256618 | 1572.2558 secs |\n",
       "| casual | Mon | 176520 | 1345.2952 secs |\n",
       "| casual | Tue | 176874 | 1213.4091 secs |\n",
       "| casual | Wed | 182783 | 1157.1306 secs |\n",
       "| casual | Thu | 201668 | 1197.0999 secs |\n",
       "| casual | Fri | 230996 | 1334.3852 secs |\n",
       "| casual | Sat | 323716 | 1546.5415 secs |\n",
       "| member | Sun | 302414 |  815.1951 secs |\n",
       "| member | Mon | 379478 |  691.9274 secs |\n",
       "| member | Tue | 431666 |  694.6126 secs |\n",
       "| member | Wed | 440917 |  692.9693 secs |\n",
       "| member | Thu | 441710 |  693.6336 secs |\n",
       "| member | Fri | 391916 |  724.0071 secs |\n",
       "| member | Sat | 354291 |  816.7629 secs |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual weekday number_of_rides average_duration\n",
       "1  casual        Sun     256618          1572.2558 secs  \n",
       "2  casual        Mon     176520          1345.2952 secs  \n",
       "3  casual        Tue     176874          1213.4091 secs  \n",
       "4  casual        Wed     182783          1157.1306 secs  \n",
       "5  casual        Thu     201668          1197.0999 secs  \n",
       "6  casual        Fri     230996          1334.3852 secs  \n",
       "7  casual        Sat     323716          1546.5415 secs  \n",
       "8  member        Sun     302414           815.1951 secs  \n",
       "9  member        Mon     379478           691.9274 secs  \n",
       "10 member        Tue     431666           694.6126 secs  \n",
       "11 member        Wed     440917           692.9693 secs  \n",
       "12 member        Thu     441710           693.6336 secs  \n",
       "13 member        Fri     391916           724.0071 secs  \n",
       "14 member        Sat     354291           816.7629 secs  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n",
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'member_casual'. You can override using the\n",
      "`.groups` argument.\n",
      "\u001b[1m\u001b[22mDon't know how to automatically pick scale for object of type \u001b[34m<difftime>\u001b[39m.\n",
      "Defaulting to continuous.\n"
     ]
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
    },
    {
     "data": {
      "image/png": "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\nkFh6ik0ate3elz/Tpd82u2696S6b7zBqzAZfHj7omG9+uMNWp9z6zfDTH3zw0Wef++cLT95y\n1w2Xn3jCpg+++cygJU4o1kolf/TGiOXuvF7SfY3dWc8/9t/Ndz76yuIxI3dp97+zhQAAIYSi\ntjvlJo6vmrv29ttvVruxavG7kx5+reMGJSu2zzlvPhjCoNqr1eWfPPJtWcsB2zbE4VqutVEI\nT77w79lh9Za1GyefeuTt37a5/vLBQy5/pttOEz599PDam25e4rGVC9+b+tbcdhtsPPTwk4Ye\nflII4Z3Hx/bZ6Y/HnTnt7esG1My+5LFmvjqn9nLFgpfr3nl9pXuKcpd9Ri9edbXrjt9jlZIW\nnbqu3v3HfsEAAMCvXl5Rz3P6tH3/9oOe/vqHF4fdffRu++6772fptsZPLZxx7Rl/++h/16rv\nOmm3hdXJ3S7evCEO13L10zdoXvCvY0/6uOz7CKuY99KBV9zw6L87VJW+W51Ktd1w49o7l371\n4mVfLgjh+xNvi2Zet+mmm+5z4bTaO6yxyW9CCFWLqkIIJbk5ZXP+Nvt/Lxws+/bloyZ/WXvP\n5e68vtI9Y1dUVBRC5513/ukJTwCAEMLxj117w1r779hj3T2GDt64V9s3J997+5PT1xt++7AO\nK3jGrnCVogsH93lz/0N+06PFtGfue2DKJ922H3vNgFUb4nCJ3FYP3XFUrz2uWK/nwIMP2L5j\n/twHbpjwVXWzayYOL1mlaLt2Rz1zyS7H5J+0cdeSj956+cYJD/foWFTx+dQr7/zrofvu1WqN\nc7db5c9Pj91qp48O3rTvmsm5nzx4419y89udc36/EMLgYWude94rG2xz4CkHbFP59bu3jLti\nZvuC8EVVzXFLVhla987ru5B0w+6RRx6p764BgKaj+Wr7vP56q1NPveCh+296sKJgzbX6nH3D\n42ceusMK77D/+BcPnH7d1bc98OTdc1p0XvuQM2+4/JxDa18Et9IPt/pul7/zWO8Tz7/6tqvG\nliea9+2/663njT9grdYhhAenPXL04aMfvOrs2/NX3WjjzW549aNNF9/4m0HnnHzE0b/fe89m\nBa0efuOpU487+6HH73zyzkXFbTpttOV+E8++aPeuzUMI/c599urSEVdNevrkI++qTKW6bH7g\nPy6ZtcVmj39/1Jyiunde31UkUqm0zvXNmzevjltbtWpV3wNnxty5c6uqquq+T4tLxmRmmFqJ\n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\ngg=="
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
    "# Add a more descriptive name to the dataset variable\n",
    "trips_cleaned <- df_cleaned\n",
    "\n",
    "# Descriptive analysis on the ride length (figures in the format of HH:MM:SS)\n",
    "as_hms(mean(trips_cleaned$ride_length))\n",
    "as_hms(max(trips_cleaned$ride_length))\n",
    "as_hms(min(trips_cleaned$ride_length))\n",
    "\n",
    "# Compare members and casual users\n",
    "print(\"By Average Ride Length\")\n",
    "aggregate(trips_cleaned$ride_length ~ trips_cleaned$member_casual, FUN = mean)\n",
    "\n",
    "print(\"By Median Ride Length\")\n",
    "aggregate(trips_cleaned$ride_length ~ trips_cleaned$member_casual, FUN = median)\n",
    "\n",
    "print(\"By Maximum Ride Length\")\n",
    "aggregate(trips_cleaned$ride_length ~ trips_cleaned$member_casual, FUN = max)\n",
    "\n",
    "print(\"By Minimum Ride Length\")\n",
    "aggregate(trips_cleaned$ride_length ~ trips_cleaned$member_casual, FUN = min)\n",
    "\n",
    "# See the average ride time by each day for members vs casual users\n",
    "aggregate(as_hms(trips_cleaned$ride_length) ~ trips_cleaned$member_casual + trips_cleaned$day_of_week_name, FUN = mean)\n",
    "\n",
    "# Notice that the days of the week are out of order. Let's fix that.\n",
    "trips_cleaned$day_of_week_name <- ordered(trips_cleaned$day_of_week_name, levels=c(\"Sunday\", \"Monday\", \"Tuesday\", \"Wednesday\", \"Thursday\", \"Friday\", \"Saturday\"))\n",
    "\n",
    "# Now, let's run the average ride time by each day for members vs casual users\n",
    "aggregate(trips_cleaned$ride_length ~ trips_cleaned$member_casual + trips_cleaned$day_of_week_name, FUN = mean)\n",
    "\n",
    "# analyze ridership data by type and weekday\n",
    "trips_cleaned %>% \n",
    "  mutate(weekday = wday(started_at, label = TRUE)) %>%  #creates weekday field using wday()\n",
    "  group_by(member_casual, weekday) %>%  #groups by usertype and weekday\n",
    "  summarise(number_of_rides = n()\t\t\t\t\t\t\t#calculates the number of rides and average duration \n",
    "  ,average_duration = mean(ride_length)) %>% \t\t# calculates the average duration\n",
    "  arrange(member_casual, weekday)\n",
    "\n",
    "# Let's visualize the number of rides by rider type\n",
    "trips_cleaned %>% \n",
    "    mutate(weekday = wday(started_at, label = TRUE)) %>% \n",
    "    group_by(member_casual, weekday) %>% \n",
    "    summarise(number_of_rides = n(),average_duration = mean(ride_length)) %>% \n",
    "    arrange(member_casual, weekday)  %>% \n",
    "    ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +\n",
    "    geom_col(position = \"dodge\")\n",
    "\n",
    "\n",
    "# Let's create a visualization for average duration\n",
    "trips_cleaned %>% \n",
    "    mutate(weekday = wday(started_at, label = TRUE)) %>% \n",
    "    group_by(member_casual, weekday) %>% \n",
    "    summarise(number_of_rides = n(),average_duration = mean(ride_length)) %>% \n",
    "    arrange(member_casual, weekday)  %>% \n",
    "    ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +\n",
    "    geom_col(position = \"dodge\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "da5ce7ec",
   "metadata": {
    "papermill": {
     "duration": 0.010646,
     "end_time": "2023-11-06T07:29:46.626280",
     "exception": false,
     "start_time": "2023-11-06T07:29:46.615634",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "This analysis reveals a higher average ride time for casual riders and weekend rides are more favourible. Also reveals that Subscribed members take more rides. We'll export this pivoted data for visualization purposes with other tools."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "3b2b60ae",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-06T07:29:46.650764Z",
     "iopub.status.busy": "2023-11-06T07:29:46.649421Z",
     "iopub.status.idle": "2023-11-06T07:29:49.189318Z",
     "shell.execute_reply": "2023-11-06T07:29:49.187742Z"
    },
    "papermill": {
     "duration": 2.554969,
     "end_time": "2023-11-06T07:29:49.191547",
     "exception": false,
     "start_time": "2023-11-06T07:29:46.636578",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "counts <- aggregate(trips_cleaned$ride_length ~ trips_cleaned$member_casual + trips_cleaned$day_of_week_name, FUN = mean)\n",
    "write_csv(counts, file='/kaggle/working/summary_counts.csv')\n",
    "\n",
    "# This can be updated later to set up a google drive connection to export files\n",
    "# for storage and security"
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
   "duration": 155.440938,
   "end_time": "2023-11-06T07:29:49.524106",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-11-06T07:27:14.083168",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
