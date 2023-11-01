{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "371820e9",
   "metadata": {
    "papermill": {
     "duration": 0.003706,
     "end_time": "2023-11-01T21:08:04.831096",
     "exception": false,
     "start_time": "2023-11-01T21:08:04.827390",
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
   "id": "b0cb90ef",
   "metadata": {
    "papermill": {
     "duration": 0.002404,
     "end_time": "2023-11-01T21:08:04.836168",
     "exception": false,
     "start_time": "2023-11-01T21:08:04.833764",
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
   "id": "f357af27",
   "metadata": {
    "_kg_hide-input": true,
    "execution": {
     "iopub.execute_input": "2023-11-01T21:08:04.845613Z",
     "iopub.status.busy": "2023-11-01T21:08:04.843240Z",
     "iopub.status.idle": "2023-11-01T21:08:51.376996Z",
     "shell.execute_reply": "2023-11-01T21:08:51.374904Z"
    },
    "papermill": {
     "duration": 46.541685,
     "end_time": "2023-11-01T21:08:51.380314",
     "exception": false,
     "start_time": "2023-11-01T21:08:04.838629",
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
    "install.packages('hms')\n",
    "install.packages('lubridate')\n",
    "library('tidyverse')\n",
    "library('hms')\n",
    "library('lubridate')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "3077722f",
   "metadata": {
    "_kg_hide-output": false,
    "execution": {
     "iopub.execute_input": "2023-11-01T21:08:51.425847Z",
     "iopub.status.busy": "2023-11-01T21:08:51.390737Z",
     "iopub.status.idle": "2023-11-01T21:09:28.743407Z",
     "shell.execute_reply": "2023-11-01T21:09:28.741034Z"
    },
    "papermill": {
     "duration": 37.362444,
     "end_time": "2023-11-01T21:09:28.747218",
     "exception": false,
     "start_time": "2023-11-01T21:08:51.384774",
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
   "id": "b6a6e4fa",
   "metadata": {
    "papermill": {
     "duration": 0.006686,
     "end_time": "2023-11-01T21:09:28.761934",
     "exception": false,
     "start_time": "2023-11-01T21:09:28.755248",
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
   "cell_type": "code",
   "execution_count": 3,
   "id": "ca49eb66",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-11-01T21:09:28.779158Z",
     "iopub.status.busy": "2023-11-01T21:09:28.777418Z",
     "iopub.status.idle": "2023-11-01T21:09:36.557336Z",
     "shell.execute_reply": "2023-11-01T21:09:36.555337Z"
    },
    "papermill": {
     "duration": 7.791868,
     "end_time": "2023-11-01T21:09:36.560340",
     "exception": false,
     "start_time": "2023-11-01T21:09:28.768472",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Join rows from all data sets\n",
    "# added a column ride_length calculated by subtracting the started_at timestamp from the ended_at timestamp\n",
    "# added a column day_of_week that gives the day of the week numerically given that Sunday is the first (1)\n",
    "complete_trip_data_raw <- bind_rows(trip_sep_2023, trip_aug_2023, trip_jul_2023, trip_jun_2023, trip_may_2023, trip_apr_2023, trip_mar_2023, trip_feb_2023, trip_jan_2023, trip_dec_2022, trip_nov_2022, trip_oct_2022) %>%\n",
    "    mutate(\n",
    "        ride_length=(as_hms(difftime(ended_at, started_at))), # added a column ride_length calculated by subtracting the started_at timestamp from the ended_at timestamp\n",
    "        day_of_week=wday(started_at, week_start=7)\n",
    "    )\n"
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
   "duration": 95.522317,
   "end_time": "2023-11-01T21:09:36.789510",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-11-01T21:08:01.267193",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
