{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "df0a9342",
   "metadata": {
    "papermill": {
     "duration": 0.004327,
     "end_time": "2023-11-02T13:01:48.060255",
     "exception": false,
     "start_time": "2023-11-02T13:01:48.055928",
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
   "id": "430a94ed",
   "metadata": {
    "papermill": {
     "duration": 0.003211,
     "end_time": "2023-11-02T13:01:48.066823",
     "exception": false,
     "start_time": "2023-11-02T13:01:48.063612",
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
   "id": "c48d2ace",
   "metadata": {
    "_kg_hide-input": true,
    "_kg_hide-output": true,
    "execution": {
     "iopub.execute_input": "2023-11-02T13:01:48.077439Z",
     "iopub.status.busy": "2023-11-02T13:01:48.075683Z",
     "iopub.status.idle": "2023-11-02T13:02:12.964909Z",
     "shell.execute_reply": "2023-11-02T13:02:12.963520Z"
    },
    "papermill": {
     "duration": 24.896386,
     "end_time": "2023-11-02T13:02:12.966953",
     "exception": false,
     "start_time": "2023-11-02T13:01:48.070567",
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
    "library('stringr')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "570fb76a",
   "metadata": {
    "_kg_hide-output": true,
    "execution": {
     "iopub.execute_input": "2023-11-02T13:02:13.020133Z",
     "iopub.status.busy": "2023-11-02T13:02:12.976630Z",
     "iopub.status.idle": "2023-11-02T13:02:39.432055Z",
     "shell.execute_reply": "2023-11-02T13:02:39.430792Z"
    },
    "papermill": {
     "duration": 26.464032,
     "end_time": "2023-11-02T13:02:39.435105",
     "exception": false,
     "start_time": "2023-11-02T13:02:12.971073",
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
   "id": "7032d386",
   "metadata": {
    "papermill": {
     "duration": 0.006285,
     "end_time": "2023-11-02T13:02:39.447416",
     "exception": false,
     "start_time": "2023-11-02T13:02:39.441131",
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
   "id": "3628cb7b",
   "metadata": {
    "papermill": {
     "duration": 0.007181,
     "end_time": "2023-11-02T13:02:39.460861",
     "exception": false,
     "start_time": "2023-11-02T13:02:39.453680",
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
   "id": "fdf58629",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-02T13:02:39.475581Z",
     "iopub.status.busy": "2023-11-02T13:02:39.474361Z",
     "iopub.status.idle": "2023-11-02T13:02:44.835950Z",
     "shell.execute_reply": "2023-11-02T13:02:44.834309Z"
    },
    "papermill": {
     "duration": 5.371848,
     "end_time": "2023-11-02T13:02:44.838628",
     "exception": false,
     "start_time": "2023-11-02T13:02:39.466780",
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
   "id": "87680514",
   "metadata": {
    "papermill": {
     "duration": 0.005433,
     "end_time": "2023-11-02T13:02:44.850102",
     "exception": false,
     "start_time": "2023-11-02T13:02:44.844669",
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
   "id": "0ce5b60f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-02T13:02:44.863726Z",
     "iopub.status.busy": "2023-11-02T13:02:44.862465Z",
     "iopub.status.idle": "2023-11-02T13:02:44.892844Z",
     "shell.execute_reply": "2023-11-02T13:02:44.890899Z"
    },
    "papermill": {
     "duration": 0.039262,
     "end_time": "2023-11-02T13:02:44.894685",
     "exception": false,
     "start_time": "2023-11-02T13:02:44.855423",
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
   "id": "505a499a",
   "metadata": {
    "papermill": {
     "duration": 0.005643,
     "end_time": "2023-11-02T13:02:44.906290",
     "exception": false,
     "start_time": "2023-11-02T13:02:44.900647",
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
   "id": "c86031a4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-02T13:02:44.920495Z",
     "iopub.status.busy": "2023-11-02T13:02:44.919186Z",
     "iopub.status.idle": "2023-11-02T13:02:45.099085Z",
     "shell.execute_reply": "2023-11-02T13:02:45.097729Z"
    },
    "papermill": {
     "duration": 0.189408,
     "end_time": "2023-11-02T13:02:45.101399",
     "exception": false,
     "start_time": "2023-11-02T13:02:44.911991",
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
   "id": "ec1ad543",
   "metadata": {
    "papermill": {
     "duration": 0.005971,
     "end_time": "2023-11-02T13:02:45.113668",
     "exception": false,
     "start_time": "2023-11-02T13:02:45.107697",
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
   "id": "baed56fb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-02T13:02:45.128553Z",
     "iopub.status.busy": "2023-11-02T13:02:45.127378Z",
     "iopub.status.idle": "2023-11-02T13:02:45.629843Z",
     "shell.execute_reply": "2023-11-02T13:02:45.628432Z"
    },
    "papermill": {
     "duration": 0.512508,
     "end_time": "2023-11-02T13:02:45.632130",
     "exception": false,
     "start_time": "2023-11-02T13:02:45.119622",
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
   "id": "c4b71d65",
   "metadata": {
    "papermill": {
     "duration": 0.005886,
     "end_time": "2023-11-02T13:02:45.644201",
     "exception": false,
     "start_time": "2023-11-02T13:02:45.638315",
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
   "id": "2f61fded",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-02T13:02:45.658743Z",
     "iopub.status.busy": "2023-11-02T13:02:45.657500Z",
     "iopub.status.idle": "2023-11-02T13:02:47.061143Z",
     "shell.execute_reply": "2023-11-02T13:02:47.059736Z"
    },
    "papermill": {
     "duration": 1.413285,
     "end_time": "2023-11-02T13:02:47.063242",
     "exception": false,
     "start_time": "2023-11-02T13:02:45.649957",
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
   "id": "a17dea6d",
   "metadata": {
    "papermill": {
     "duration": 0.006015,
     "end_time": "2023-11-02T13:02:47.075694",
     "exception": false,
     "start_time": "2023-11-02T13:02:47.069679",
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
   "id": "c51097db",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-02T13:02:47.090441Z",
     "iopub.status.busy": "2023-11-02T13:02:47.089320Z",
     "iopub.status.idle": "2023-11-02T13:02:53.756551Z",
     "shell.execute_reply": "2023-11-02T13:02:53.755187Z"
    },
    "papermill": {
     "duration": 6.677276,
     "end_time": "2023-11-02T13:02:53.758990",
     "exception": false,
     "start_time": "2023-11-02T13:02:47.081714",
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
   "id": "d6db1e52",
   "metadata": {
    "papermill": {
     "duration": 0.006206,
     "end_time": "2023-11-02T13:02:53.771719",
     "exception": false,
     "start_time": "2023-11-02T13:02:53.765513",
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
   "id": "95605c80",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-02T13:02:53.787349Z",
     "iopub.status.busy": "2023-11-02T13:02:53.785681Z",
     "iopub.status.idle": "2023-11-02T13:02:53.819930Z",
     "shell.execute_reply": "2023-11-02T13:02:53.818130Z"
    },
    "papermill": {
     "duration": 0.044175,
     "end_time": "2023-11-02T13:02:53.821998",
     "exception": false,
     "start_time": "2023-11-02T13:02:53.777823",
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
   "duration": 68.961429,
   "end_time": "2023-11-02T13:02:54.046693",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-11-02T13:01:45.085264",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
