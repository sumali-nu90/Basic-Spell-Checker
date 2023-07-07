{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "984812d3",
   "metadata": {
    "papermill": {
     "duration": 0.005445,
     "end_time": "2023-07-07T07:03:42.592926",
     "exception": false,
     "start_time": "2023-07-07T07:03:42.587481",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# About the data?\n",
    "The Fitbit Fitness Tracker Data used in this case study was generated through a distributed survey conducted via Amazon Mechanical Turk. The data collection period spanned from March 12, 2016, to May 12, 2016. Thirty eligible Fitbit users voluntarily submitted their personal tracker data, which includes minute-level output for physical activity, heart rate, and sleep monitoring. The data can be parsed based on the export session ID (column A) or timestamp (column B). The variations in the data reflect the use of different types of Fitbit trackers and individual tracking behaviours and preferences.\n",
    "\n",
    "# Guiding questions\n",
    "Where is your data stored? \n",
    "The Fitbit Fitness Tracker Data used in this case study is stored locally after being downloaded from Kaggle.\n",
    "\n",
    "## How is the data organized? \n",
    "Is it in a long or wide format? The data is available in both long and wide formats. It consists of multiple datasets in CSV file format, which can be organized based on variables such as user ID, timestamp, and different types of Fitbit tracker outputs.\n",
    " \n",
    "## Are there issues with bias or credibility in this data? Does your data ROCCC? \n",
    "There might be potential issues with bias in the data due to the sample size and lack of demographic information. The dataset includes data from thirty eligible Fitbit users, which may not be fully representative of the population. Additionally, the absence of demographic information limits the generalizability of the findings. However, the credibility of the data is high as it was obtained through a distributed survey and consented to by the participants. \n",
    "\n",
    "## How are you addressing licensing, privacy, security, and accessibility? \n",
    "The Fitbit Fitness Tracker Data used in this case study is published under the CC0: Public Domain Creative Commons License, which ensures its accessibility, usability, and ability to modify, distribute, and perform the dataset without seeking permission. However, it's important to adhere to privacy and security considerations when handling the data, ensuring that personal information remains protected.\n",
    "\n",
    "## How did you verify the data’s integrity?\n",
    "The data's integrity can be verified through various means, such as checking for missing values, inconsistencies, or outliers. It is important to perform data cleaning and validation procedures to ensure the accuracy and integrity of the dataset before analysis.\n",
    "\n",
    "## How does it help you answer your question? \n",
    "The Fitbit Fitness Tracker Data provides valuable insights into the habits and behaviours of Fitbit users. By analyzing this data, we can gain insights into how consumers are using their smart devices and apply those insights to Bellabeat's marketing strategy.\n",
    "\n",
    "## Are there any problems with the data? \n",
    "There are a few limitations and problems with the data. Firstly, the data is outdated as it was collected in 2016. Additionally, the dataset covers a relatively small timeframe of 31 days, which may limit the depth of analysis. The sample size of 33 participants also poses limitations in terms of representativeness. Furthermore, the absence of demographic information restricts the ability to make targeted recommendations for marketing strategies."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "dea78593",
   "metadata": {
    "papermill": {
     "duration": 0.004207,
     "end_time": "2023-07-07T07:03:42.601711",
     "exception": false,
     "start_time": "2023-07-07T07:03:42.597504",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# 1. Loading packages & accessing libraries"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "c889a79c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-07T07:03:42.615650Z",
     "iopub.status.busy": "2023-07-07T07:03:42.612994Z",
     "iopub.status.idle": "2023-07-07T07:09:43.333441Z",
     "shell.execute_reply": "2023-07-07T07:09:43.330603Z"
    },
    "papermill": {
     "duration": 360.730156,
     "end_time": "2023-07-07T07:09:43.336113",
     "exception": false,
     "start_time": "2023-07-07T07:03:42.605957",
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
      "Warning message:\n",
      "“unable to access index for repository http://cran.rstudio.com/src/contrib:\n",
      "  cannot open URL 'http://cran.rstudio.com/src/contrib/PACKAGES'”\n",
      "Warning message:\n",
      "“package ‘tidyverse’ is not available for this version of R\n",
      "\n",
      "A version of this package for your version of R might be available elsewhere,\n",
      "see the ideas at\n",
      "https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages”\n",
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Warning message:\n",
      "“unable to access index for repository http://cran.rstudio.com/src/contrib:\n",
      "  cannot open URL 'http://cran.rstudio.com/src/contrib/PACKAGES'”\n",
      "Warning message:\n",
      "“package ‘here’ is not available for this version of R\n",
      "\n",
      "A version of this package for your version of R might be available elsewhere,\n",
      "see the ideas at\n",
      "https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages”\n",
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Warning message:\n",
      "“unable to access index for repository http://cran.rstudio.com/src/contrib:\n",
      "  cannot open URL 'http://cran.rstudio.com/src/contrib/PACKAGES'”\n",
      "Warning message:\n",
      "“package ‘skimr’ is not available for this version of R\n",
      "\n",
      "A version of this package for your version of R might be available elsewhere,\n",
      "see the ideas at\n",
      "https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages”\n",
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Warning message:\n",
      "“unable to access index for repository http://cran.rstudio.com/src/contrib:\n",
      "  cannot open URL 'http://cran.rstudio.com/src/contrib/PACKAGES'”\n",
      "Warning message:\n",
      "“package ‘janitor’ is not available for this version of R\n",
      "\n",
      "A version of this package for your version of R might be available elsewhere,\n",
      "see the ideas at\n",
      "https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages”\n",
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Warning message:\n",
      "“unable to access index for repository http://cran.rstudio.com/src/contrib:\n",
      "  cannot open URL 'http://cran.rstudio.com/src/contrib/PACKAGES'”\n",
      "Warning message:\n",
      "“package ‘lubridate’ is not available for this version of R\n",
      "\n",
      "A version of this package for your version of R might be available elsewhere,\n",
      "see the ideas at\n",
      "https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages”\n",
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Warning message:\n",
      "“unable to access index for repository http://cran.rstudio.com/src/contrib:\n",
      "  cannot open URL 'http://cran.rstudio.com/src/contrib/PACKAGES'”\n",
      "Warning message:\n",
      "“package ‘ggrepel’ is not available for this version of R\n",
      "\n",
      "A version of this package for your version of R might be available elsewhere,\n",
      "see the ideas at\n",
      "https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages”\n"
     ]
    }
   ],
   "source": [
    "install.packages(\"tidyverse\")\n",
    "install.packages(\"here\")\n",
    "install.packages(\"skimr\")\n",
    "install.packages(\"janitor\")\n",
    "install.packages(\"lubridate\")\n",
    "install.packages(\"ggrepel\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "be9d40bb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-07T07:09:43.410300Z",
     "iopub.status.busy": "2023-07-07T07:09:43.372543Z",
     "iopub.status.idle": "2023-07-07T07:09:44.707431Z",
     "shell.execute_reply": "2023-07-07T07:09:44.705455Z"
    },
    "papermill": {
     "duration": 1.368025,
     "end_time": "2023-07-07T07:09:44.710277",
     "exception": false,
     "start_time": "2023-07-07T07:09:43.342252",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.2     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.2     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.2     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.1     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n",
      "here() starts at /kaggle/working\n",
      "\n",
      "\n",
      "Attaching package: ‘janitor’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:stats’:\n",
      "\n",
      "    chisq.test, fisher.test\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘gridExtra’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:dplyr’:\n",
      "\n",
      "    combine\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)\n",
    "library(here)\n",
    "library(skimr)\n",
    "library(janitor)\n",
    "library(lubridate)\n",
    "library(ggrepel)\n",
    "library(gridExtra)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "66723d81",
   "metadata": {
    "papermill": {
     "duration": 0.00855,
     "end_time": "2023-07-07T07:09:44.725842",
     "exception": false,
     "start_time": "2023-07-07T07:09:44.717292",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# 2. Importing and viewing the Data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "ae181a40",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-07T07:09:44.744012Z",
     "iopub.status.busy": "2023-07-07T07:09:44.741685Z",
     "iopub.status.idle": "2023-07-07T07:09:44.828836Z",
     "shell.execute_reply": "2023-07-07T07:09:44.826750Z"
    },
    "papermill": {
     "duration": 0.099012,
     "end_time": "2023-07-07T07:09:44.831608",
     "exception": false,
     "start_time": "2023-07-07T07:09:44.732596",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Import data\n",
    "activity <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/dailyActivity_merged.csv\")\n",
    "calories <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/dailyCalories_merged.csv\")\n",
    "intensities <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/dailyIntensities_merged.csv\")\n",
    "sleep <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/sleepDay_merged.csv\")\n",
    "weight <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/weightLogInfo_merged.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "7ba81930",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-07T07:09:44.849837Z",
     "iopub.status.busy": "2023-07-07T07:09:44.848022Z",
     "iopub.status.idle": "2023-07-07T07:09:44.982494Z",
     "shell.execute_reply": "2023-07-07T07:09:44.980677Z"
    },
    "papermill": {
     "duration": 0.146507,
     "end_time": "2023-07-07T07:09:44.985044",
     "exception": false,
     "start_time": "2023-07-07T07:09:44.838537",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Daily activity\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>ActivityDate</th><th scope=col>TotalSteps</th><th scope=col>TotalDistance</th><th scope=col>TrackerDistance</th><th scope=col>LoggedActivitiesDistance</th><th scope=col>VeryActiveDistance</th><th scope=col>ModeratelyActiveDistance</th><th scope=col>LightActiveDistance</th><th scope=col>SedentaryActiveDistance</th><th scope=col>VeryActiveMinutes</th><th scope=col>FairlyActiveMinutes</th><th scope=col>LightlyActiveMinutes</th><th scope=col>SedentaryMinutes</th><th scope=col>Calories</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>4/12/2016</td><td>13162</td><td>8.50</td><td>8.50</td><td>0</td><td>1.88</td><td>0.55</td><td>6.06</td><td>0</td><td>25</td><td>13</td><td>328</td><td> 728</td><td>1985</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>4/13/2016</td><td>10735</td><td>6.97</td><td>6.97</td><td>0</td><td>1.57</td><td>0.69</td><td>4.71</td><td>0</td><td>21</td><td>19</td><td>217</td><td> 776</td><td>1797</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>4/14/2016</td><td>10460</td><td>6.74</td><td>6.74</td><td>0</td><td>2.44</td><td>0.40</td><td>3.91</td><td>0</td><td>30</td><td>11</td><td>181</td><td>1218</td><td>1776</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>4/15/2016</td><td> 9762</td><td>6.28</td><td>6.28</td><td>0</td><td>2.14</td><td>1.26</td><td>2.83</td><td>0</td><td>29</td><td>34</td><td>209</td><td> 726</td><td>1745</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>4/16/2016</td><td>12669</td><td>8.16</td><td>8.16</td><td>0</td><td>2.71</td><td>0.41</td><td>5.04</td><td>0</td><td>36</td><td>10</td><td>221</td><td> 773</td><td>1863</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>4/17/2016</td><td> 9705</td><td>6.48</td><td>6.48</td><td>0</td><td>3.19</td><td>0.78</td><td>2.51</td><td>0</td><td>38</td><td>20</td><td>164</td><td> 539</td><td>1728</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 15\n",
       "\\begin{tabular}{r|lllllllllllllll}\n",
       "  & Id & ActivityDate & TotalSteps & TotalDistance & TrackerDistance & LoggedActivitiesDistance & VeryActiveDistance & ModeratelyActiveDistance & LightActiveDistance & SedentaryActiveDistance & VeryActiveMinutes & FairlyActiveMinutes & LightlyActiveMinutes & SedentaryMinutes & Calories\\\\\n",
       "  & <dbl> & <chr> & <int> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 4/12/2016 & 13162 & 8.50 & 8.50 & 0 & 1.88 & 0.55 & 6.06 & 0 & 25 & 13 & 328 &  728 & 1985\\\\\n",
       "\t2 & 1503960366 & 4/13/2016 & 10735 & 6.97 & 6.97 & 0 & 1.57 & 0.69 & 4.71 & 0 & 21 & 19 & 217 &  776 & 1797\\\\\n",
       "\t3 & 1503960366 & 4/14/2016 & 10460 & 6.74 & 6.74 & 0 & 2.44 & 0.40 & 3.91 & 0 & 30 & 11 & 181 & 1218 & 1776\\\\\n",
       "\t4 & 1503960366 & 4/15/2016 &  9762 & 6.28 & 6.28 & 0 & 2.14 & 1.26 & 2.83 & 0 & 29 & 34 & 209 &  726 & 1745\\\\\n",
       "\t5 & 1503960366 & 4/16/2016 & 12669 & 8.16 & 8.16 & 0 & 2.71 & 0.41 & 5.04 & 0 & 36 & 10 & 221 &  773 & 1863\\\\\n",
       "\t6 & 1503960366 & 4/17/2016 &  9705 & 6.48 & 6.48 & 0 & 3.19 & 0.78 & 2.51 & 0 & 38 & 20 & 164 &  539 & 1728\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 15\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | ActivityDate &lt;chr&gt; | TotalSteps &lt;int&gt; | TotalDistance &lt;dbl&gt; | TrackerDistance &lt;dbl&gt; | LoggedActivitiesDistance &lt;dbl&gt; | VeryActiveDistance &lt;dbl&gt; | ModeratelyActiveDistance &lt;dbl&gt; | LightActiveDistance &lt;dbl&gt; | SedentaryActiveDistance &lt;dbl&gt; | VeryActiveMinutes &lt;int&gt; | FairlyActiveMinutes &lt;int&gt; | LightlyActiveMinutes &lt;int&gt; | SedentaryMinutes &lt;int&gt; | Calories &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 4/12/2016 | 13162 | 8.50 | 8.50 | 0 | 1.88 | 0.55 | 6.06 | 0 | 25 | 13 | 328 |  728 | 1985 |\n",
       "| 2 | 1503960366 | 4/13/2016 | 10735 | 6.97 | 6.97 | 0 | 1.57 | 0.69 | 4.71 | 0 | 21 | 19 | 217 |  776 | 1797 |\n",
       "| 3 | 1503960366 | 4/14/2016 | 10460 | 6.74 | 6.74 | 0 | 2.44 | 0.40 | 3.91 | 0 | 30 | 11 | 181 | 1218 | 1776 |\n",
       "| 4 | 1503960366 | 4/15/2016 |  9762 | 6.28 | 6.28 | 0 | 2.14 | 1.26 | 2.83 | 0 | 29 | 34 | 209 |  726 | 1745 |\n",
       "| 5 | 1503960366 | 4/16/2016 | 12669 | 8.16 | 8.16 | 0 | 2.71 | 0.41 | 5.04 | 0 | 36 | 10 | 221 |  773 | 1863 |\n",
       "| 6 | 1503960366 | 4/17/2016 |  9705 | 6.48 | 6.48 | 0 | 3.19 | 0.78 | 2.51 | 0 | 38 | 20 | 164 |  539 | 1728 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityDate TotalSteps TotalDistance TrackerDistance\n",
       "1 1503960366 4/12/2016    13162      8.50          8.50           \n",
       "2 1503960366 4/13/2016    10735      6.97          6.97           \n",
       "3 1503960366 4/14/2016    10460      6.74          6.74           \n",
       "4 1503960366 4/15/2016     9762      6.28          6.28           \n",
       "5 1503960366 4/16/2016    12669      8.16          8.16           \n",
       "6 1503960366 4/17/2016     9705      6.48          6.48           \n",
       "  LoggedActivitiesDistance VeryActiveDistance ModeratelyActiveDistance\n",
       "1 0                        1.88               0.55                    \n",
       "2 0                        1.57               0.69                    \n",
       "3 0                        2.44               0.40                    \n",
       "4 0                        2.14               1.26                    \n",
       "5 0                        2.71               0.41                    \n",
       "6 0                        3.19               0.78                    \n",
       "  LightActiveDistance SedentaryActiveDistance VeryActiveMinutes\n",
       "1 6.06                0                       25               \n",
       "2 4.71                0                       21               \n",
       "3 3.91                0                       30               \n",
       "4 2.83                0                       29               \n",
       "5 5.04                0                       36               \n",
       "6 2.51                0                       38               \n",
       "  FairlyActiveMinutes LightlyActiveMinutes SedentaryMinutes Calories\n",
       "1 13                  328                   728             1985    \n",
       "2 19                  217                   776             1797    \n",
       "3 11                  181                  1218             1776    \n",
       "4 34                  209                   726             1745    \n",
       "5 10                  221                   773             1863    \n",
       "6 20                  164                   539             1728    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Daily calories\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>ActivityDay</th><th scope=col>Calories</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>4/12/2016</td><td>1985</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>4/13/2016</td><td>1797</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>4/14/2016</td><td>1776</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>4/15/2016</td><td>1745</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>4/16/2016</td><td>1863</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>4/17/2016</td><td>1728</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 3\n",
       "\\begin{tabular}{r|lll}\n",
       "  & Id & ActivityDay & Calories\\\\\n",
       "  & <dbl> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 4/12/2016 & 1985\\\\\n",
       "\t2 & 1503960366 & 4/13/2016 & 1797\\\\\n",
       "\t3 & 1503960366 & 4/14/2016 & 1776\\\\\n",
       "\t4 & 1503960366 & 4/15/2016 & 1745\\\\\n",
       "\t5 & 1503960366 & 4/16/2016 & 1863\\\\\n",
       "\t6 & 1503960366 & 4/17/2016 & 1728\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 3\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | ActivityDay &lt;chr&gt; | Calories &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| 1 | 1503960366 | 4/12/2016 | 1985 |\n",
       "| 2 | 1503960366 | 4/13/2016 | 1797 |\n",
       "| 3 | 1503960366 | 4/14/2016 | 1776 |\n",
       "| 4 | 1503960366 | 4/15/2016 | 1745 |\n",
       "| 5 | 1503960366 | 4/16/2016 | 1863 |\n",
       "| 6 | 1503960366 | 4/17/2016 | 1728 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityDay Calories\n",
       "1 1503960366 4/12/2016   1985    \n",
       "2 1503960366 4/13/2016   1797    \n",
       "3 1503960366 4/14/2016   1776    \n",
       "4 1503960366 4/15/2016   1745    \n",
       "5 1503960366 4/16/2016   1863    \n",
       "6 1503960366 4/17/2016   1728    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Daily intensities\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 10</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>ActivityDay</th><th scope=col>SedentaryMinutes</th><th scope=col>LightlyActiveMinutes</th><th scope=col>FairlyActiveMinutes</th><th scope=col>VeryActiveMinutes</th><th scope=col>SedentaryActiveDistance</th><th scope=col>LightActiveDistance</th><th scope=col>ModeratelyActiveDistance</th><th scope=col>VeryActiveDistance</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>4/12/2016</td><td> 728</td><td>328</td><td>13</td><td>25</td><td>0</td><td>6.06</td><td>0.55</td><td>1.88</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>4/13/2016</td><td> 776</td><td>217</td><td>19</td><td>21</td><td>0</td><td>4.71</td><td>0.69</td><td>1.57</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>4/14/2016</td><td>1218</td><td>181</td><td>11</td><td>30</td><td>0</td><td>3.91</td><td>0.40</td><td>2.44</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>4/15/2016</td><td> 726</td><td>209</td><td>34</td><td>29</td><td>0</td><td>2.83</td><td>1.26</td><td>2.14</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>4/16/2016</td><td> 773</td><td>221</td><td>10</td><td>36</td><td>0</td><td>5.04</td><td>0.41</td><td>2.71</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>4/17/2016</td><td> 539</td><td>164</td><td>20</td><td>38</td><td>0</td><td>2.51</td><td>0.78</td><td>3.19</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 10\n",
       "\\begin{tabular}{r|llllllllll}\n",
       "  & Id & ActivityDay & SedentaryMinutes & LightlyActiveMinutes & FairlyActiveMinutes & VeryActiveMinutes & SedentaryActiveDistance & LightActiveDistance & ModeratelyActiveDistance & VeryActiveDistance\\\\\n",
       "  & <dbl> & <chr> & <int> & <int> & <int> & <int> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 4/12/2016 &  728 & 328 & 13 & 25 & 0 & 6.06 & 0.55 & 1.88\\\\\n",
       "\t2 & 1503960366 & 4/13/2016 &  776 & 217 & 19 & 21 & 0 & 4.71 & 0.69 & 1.57\\\\\n",
       "\t3 & 1503960366 & 4/14/2016 & 1218 & 181 & 11 & 30 & 0 & 3.91 & 0.40 & 2.44\\\\\n",
       "\t4 & 1503960366 & 4/15/2016 &  726 & 209 & 34 & 29 & 0 & 2.83 & 1.26 & 2.14\\\\\n",
       "\t5 & 1503960366 & 4/16/2016 &  773 & 221 & 10 & 36 & 0 & 5.04 & 0.41 & 2.71\\\\\n",
       "\t6 & 1503960366 & 4/17/2016 &  539 & 164 & 20 & 38 & 0 & 2.51 & 0.78 & 3.19\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 10\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | ActivityDay &lt;chr&gt; | SedentaryMinutes &lt;int&gt; | LightlyActiveMinutes &lt;int&gt; | FairlyActiveMinutes &lt;int&gt; | VeryActiveMinutes &lt;int&gt; | SedentaryActiveDistance &lt;dbl&gt; | LightActiveDistance &lt;dbl&gt; | ModeratelyActiveDistance &lt;dbl&gt; | VeryActiveDistance &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 4/12/2016 |  728 | 328 | 13 | 25 | 0 | 6.06 | 0.55 | 1.88 |\n",
       "| 2 | 1503960366 | 4/13/2016 |  776 | 217 | 19 | 21 | 0 | 4.71 | 0.69 | 1.57 |\n",
       "| 3 | 1503960366 | 4/14/2016 | 1218 | 181 | 11 | 30 | 0 | 3.91 | 0.40 | 2.44 |\n",
       "| 4 | 1503960366 | 4/15/2016 |  726 | 209 | 34 | 29 | 0 | 2.83 | 1.26 | 2.14 |\n",
       "| 5 | 1503960366 | 4/16/2016 |  773 | 221 | 10 | 36 | 0 | 5.04 | 0.41 | 2.71 |\n",
       "| 6 | 1503960366 | 4/17/2016 |  539 | 164 | 20 | 38 | 0 | 2.51 | 0.78 | 3.19 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityDay SedentaryMinutes LightlyActiveMinutes\n",
       "1 1503960366 4/12/2016    728             328                 \n",
       "2 1503960366 4/13/2016    776             217                 \n",
       "3 1503960366 4/14/2016   1218             181                 \n",
       "4 1503960366 4/15/2016    726             209                 \n",
       "5 1503960366 4/16/2016    773             221                 \n",
       "6 1503960366 4/17/2016    539             164                 \n",
       "  FairlyActiveMinutes VeryActiveMinutes SedentaryActiveDistance\n",
       "1 13                  25                0                      \n",
       "2 19                  21                0                      \n",
       "3 11                  30                0                      \n",
       "4 34                  29                0                      \n",
       "5 10                  36                0                      \n",
       "6 20                  38                0                      \n",
       "  LightActiveDistance ModeratelyActiveDistance VeryActiveDistance\n",
       "1 6.06                0.55                     1.88              \n",
       "2 4.71                0.69                     1.57              \n",
       "3 3.91                0.40                     2.44              \n",
       "4 2.83                1.26                     2.14              \n",
       "5 5.04                0.41                     2.71              \n",
       "6 2.51                0.78                     3.19              "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Daily sleep\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>SleepDay</th><th scope=col>TotalSleepRecords</th><th scope=col>TotalMinutesAsleep</th><th scope=col>TotalTimeInBed</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>4/12/2016 12:00:00 AM</td><td>1</td><td>327</td><td>346</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>4/13/2016 12:00:00 AM</td><td>2</td><td>384</td><td>407</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>4/15/2016 12:00:00 AM</td><td>1</td><td>412</td><td>442</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>4/16/2016 12:00:00 AM</td><td>2</td><td>340</td><td>367</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>4/17/2016 12:00:00 AM</td><td>1</td><td>700</td><td>712</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>4/19/2016 12:00:00 AM</td><td>1</td><td>304</td><td>320</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & Id & SleepDay & TotalSleepRecords & TotalMinutesAsleep & TotalTimeInBed\\\\\n",
       "  & <dbl> & <chr> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 4/12/2016 12:00:00 AM & 1 & 327 & 346\\\\\n",
       "\t2 & 1503960366 & 4/13/2016 12:00:00 AM & 2 & 384 & 407\\\\\n",
       "\t3 & 1503960366 & 4/15/2016 12:00:00 AM & 1 & 412 & 442\\\\\n",
       "\t4 & 1503960366 & 4/16/2016 12:00:00 AM & 2 & 340 & 367\\\\\n",
       "\t5 & 1503960366 & 4/17/2016 12:00:00 AM & 1 & 700 & 712\\\\\n",
       "\t6 & 1503960366 & 4/19/2016 12:00:00 AM & 1 & 304 & 320\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 5\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | SleepDay &lt;chr&gt; | TotalSleepRecords &lt;int&gt; | TotalMinutesAsleep &lt;int&gt; | TotalTimeInBed &lt;int&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 4/12/2016 12:00:00 AM | 1 | 327 | 346 |\n",
       "| 2 | 1503960366 | 4/13/2016 12:00:00 AM | 2 | 384 | 407 |\n",
       "| 3 | 1503960366 | 4/15/2016 12:00:00 AM | 1 | 412 | 442 |\n",
       "| 4 | 1503960366 | 4/16/2016 12:00:00 AM | 2 | 340 | 367 |\n",
       "| 5 | 1503960366 | 4/17/2016 12:00:00 AM | 1 | 700 | 712 |\n",
       "| 6 | 1503960366 | 4/19/2016 12:00:00 AM | 1 | 304 | 320 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         SleepDay              TotalSleepRecords TotalMinutesAsleep\n",
       "1 1503960366 4/12/2016 12:00:00 AM 1                 327               \n",
       "2 1503960366 4/13/2016 12:00:00 AM 2                 384               \n",
       "3 1503960366 4/15/2016 12:00:00 AM 1                 412               \n",
       "4 1503960366 4/16/2016 12:00:00 AM 2                 340               \n",
       "5 1503960366 4/17/2016 12:00:00 AM 1                 700               \n",
       "6 1503960366 4/19/2016 12:00:00 AM 1                 304               \n",
       "  TotalTimeInBed\n",
       "1 346           \n",
       "2 407           \n",
       "3 442           \n",
       "4 367           \n",
       "5 712           \n",
       "6 320           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Daily weight\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 8</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>Date</th><th scope=col>WeightKg</th><th scope=col>WeightPounds</th><th scope=col>Fat</th><th scope=col>BMI</th><th scope=col>IsManualReport</th><th scope=col>LogId</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>5/2/2016 11:59:59 PM </td><td> 52.6</td><td>115.9631</td><td>22</td><td>22.65</td><td>True </td><td>1.462234e+12</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>5/3/2016 11:59:59 PM </td><td> 52.6</td><td>115.9631</td><td>NA</td><td>22.65</td><td>True </td><td>1.462320e+12</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1927972279</td><td>4/13/2016 1:08:52 AM </td><td>133.5</td><td>294.3171</td><td>NA</td><td>47.54</td><td>False</td><td>1.460510e+12</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>2873212765</td><td>4/21/2016 11:59:59 PM</td><td> 56.7</td><td>125.0021</td><td>NA</td><td>21.45</td><td>True </td><td>1.461283e+12</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>2873212765</td><td>5/12/2016 11:59:59 PM</td><td> 57.3</td><td>126.3249</td><td>NA</td><td>21.69</td><td>True </td><td>1.463098e+12</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>4319703577</td><td>4/17/2016 11:59:59 PM</td><td> 72.4</td><td>159.6147</td><td>25</td><td>27.45</td><td>True </td><td>1.460938e+12</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 8\n",
       "\\begin{tabular}{r|llllllll}\n",
       "  & Id & Date & WeightKg & WeightPounds & Fat & BMI & IsManualReport & LogId\\\\\n",
       "  & <dbl> & <chr> & <dbl> & <dbl> & <int> & <dbl> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 5/2/2016 11:59:59 PM  &  52.6 & 115.9631 & 22 & 22.65 & True  & 1.462234e+12\\\\\n",
       "\t2 & 1503960366 & 5/3/2016 11:59:59 PM  &  52.6 & 115.9631 & NA & 22.65 & True  & 1.462320e+12\\\\\n",
       "\t3 & 1927972279 & 4/13/2016 1:08:52 AM  & 133.5 & 294.3171 & NA & 47.54 & False & 1.460510e+12\\\\\n",
       "\t4 & 2873212765 & 4/21/2016 11:59:59 PM &  56.7 & 125.0021 & NA & 21.45 & True  & 1.461283e+12\\\\\n",
       "\t5 & 2873212765 & 5/12/2016 11:59:59 PM &  57.3 & 126.3249 & NA & 21.69 & True  & 1.463098e+12\\\\\n",
       "\t6 & 4319703577 & 4/17/2016 11:59:59 PM &  72.4 & 159.6147 & 25 & 27.45 & True  & 1.460938e+12\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 8\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | Date &lt;chr&gt; | WeightKg &lt;dbl&gt; | WeightPounds &lt;dbl&gt; | Fat &lt;int&gt; | BMI &lt;dbl&gt; | IsManualReport &lt;chr&gt; | LogId &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 5/2/2016 11:59:59 PM  |  52.6 | 115.9631 | 22 | 22.65 | True  | 1.462234e+12 |\n",
       "| 2 | 1503960366 | 5/3/2016 11:59:59 PM  |  52.6 | 115.9631 | NA | 22.65 | True  | 1.462320e+12 |\n",
       "| 3 | 1927972279 | 4/13/2016 1:08:52 AM  | 133.5 | 294.3171 | NA | 47.54 | False | 1.460510e+12 |\n",
       "| 4 | 2873212765 | 4/21/2016 11:59:59 PM |  56.7 | 125.0021 | NA | 21.45 | True  | 1.461283e+12 |\n",
       "| 5 | 2873212765 | 5/12/2016 11:59:59 PM |  57.3 | 126.3249 | NA | 21.69 | True  | 1.463098e+12 |\n",
       "| 6 | 4319703577 | 4/17/2016 11:59:59 PM |  72.4 | 159.6147 | 25 | 27.45 | True  | 1.460938e+12 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         Date                  WeightKg WeightPounds Fat BMI  \n",
       "1 1503960366 5/2/2016 11:59:59 PM   52.6    115.9631     22  22.65\n",
       "2 1503960366 5/3/2016 11:59:59 PM   52.6    115.9631     NA  22.65\n",
       "3 1927972279 4/13/2016 1:08:52 AM  133.5    294.3171     NA  47.54\n",
       "4 2873212765 4/21/2016 11:59:59 PM  56.7    125.0021     NA  21.45\n",
       "5 2873212765 5/12/2016 11:59:59 PM  57.3    126.3249     NA  21.69\n",
       "6 4319703577 4/17/2016 11:59:59 PM  72.4    159.6147     25  27.45\n",
       "  IsManualReport LogId       \n",
       "1 True           1.462234e+12\n",
       "2 True           1.462320e+12\n",
       "3 False          1.460510e+12\n",
       "4 True           1.461283e+12\n",
       "5 True           1.463098e+12\n",
       "6 True           1.460938e+12"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# View data\n",
    "print(\"Daily activity\")\n",
    "head(activity)\n",
    "\n",
    "print(\"Daily calories\")\n",
    "head(calories)\n",
    "\n",
    "print(\"Daily intensities\")\n",
    "head(intensities)\n",
    "\n",
    "print(\"Daily sleep\")\n",
    "head(sleep)\n",
    "\n",
    "print(\"Daily weight\")\n",
    "head(weight)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5003cf6e",
   "metadata": {
    "papermill": {
     "duration": 0.008674,
     "end_time": "2023-07-07T07:09:45.002672",
     "exception": false,
     "start_time": "2023-07-07T07:09:44.993998",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# 3. Sort and Filter Data"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "23f34457",
   "metadata": {
    "papermill": {
     "duration": 0.008616,
     "end_time": "2023-07-07T07:09:45.020077",
     "exception": false,
     "start_time": "2023-07-07T07:09:45.011461",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "As seen in the headers, all of the date data has been formatted as character during the import. We have to fix this by changing the format of the date columns in each of our 5 columns."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "d2506b9d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-07T07:09:45.041524Z",
     "iopub.status.busy": "2023-07-07T07:09:45.039869Z",
     "iopub.status.idle": "2023-07-07T07:09:45.113884Z",
     "shell.execute_reply": "2023-07-07T07:09:45.112007Z"
    },
    "papermill": {
     "duration": 0.088333,
     "end_time": "2023-07-07T07:09:45.117208",
     "exception": false,
     "start_time": "2023-07-07T07:09:45.028875",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Reformat dates in tables using lubridate\n",
    "activity$ActivityDate <- mdy(activity$ActivityDate)\n",
    "calories$ActivityDay <- mdy(calories$ActivityDay)\n",
    "intensities$ActivityDay <- mdy(intensities$ActivityDay)\n",
    "sleep$SleepDay <- mdy_hms(sleep$SleepDay)\n",
    "weight$Date <- mdy_hms(weight$Date)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "2289b9f6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-07T07:09:45.138444Z",
     "iopub.status.busy": "2023-07-07T07:09:45.136780Z",
     "iopub.status.idle": "2023-07-07T07:09:45.270909Z",
     "shell.execute_reply": "2023-07-07T07:09:45.268502Z"
    },
    "papermill": {
     "duration": 0.148181,
     "end_time": "2023-07-07T07:09:45.274073",
     "exception": false,
     "start_time": "2023-07-07T07:09:45.125892",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Daily activity\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>ActivityDate</th><th scope=col>TotalSteps</th><th scope=col>TotalDistance</th><th scope=col>TrackerDistance</th><th scope=col>LoggedActivitiesDistance</th><th scope=col>VeryActiveDistance</th><th scope=col>ModeratelyActiveDistance</th><th scope=col>LightActiveDistance</th><th scope=col>SedentaryActiveDistance</th><th scope=col>VeryActiveMinutes</th><th scope=col>FairlyActiveMinutes</th><th scope=col>LightlyActiveMinutes</th><th scope=col>SedentaryMinutes</th><th scope=col>Calories</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>2016-04-12</td><td>13162</td><td>8.50</td><td>8.50</td><td>0</td><td>1.88</td><td>0.55</td><td>6.06</td><td>0</td><td>25</td><td>13</td><td>328</td><td> 728</td><td>1985</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>2016-04-13</td><td>10735</td><td>6.97</td><td>6.97</td><td>0</td><td>1.57</td><td>0.69</td><td>4.71</td><td>0</td><td>21</td><td>19</td><td>217</td><td> 776</td><td>1797</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>2016-04-14</td><td>10460</td><td>6.74</td><td>6.74</td><td>0</td><td>2.44</td><td>0.40</td><td>3.91</td><td>0</td><td>30</td><td>11</td><td>181</td><td>1218</td><td>1776</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>2016-04-15</td><td> 9762</td><td>6.28</td><td>6.28</td><td>0</td><td>2.14</td><td>1.26</td><td>2.83</td><td>0</td><td>29</td><td>34</td><td>209</td><td> 726</td><td>1745</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>2016-04-16</td><td>12669</td><td>8.16</td><td>8.16</td><td>0</td><td>2.71</td><td>0.41</td><td>5.04</td><td>0</td><td>36</td><td>10</td><td>221</td><td> 773</td><td>1863</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>2016-04-17</td><td> 9705</td><td>6.48</td><td>6.48</td><td>0</td><td>3.19</td><td>0.78</td><td>2.51</td><td>0</td><td>38</td><td>20</td><td>164</td><td> 539</td><td>1728</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 15\n",
       "\\begin{tabular}{r|lllllllllllllll}\n",
       "  & Id & ActivityDate & TotalSteps & TotalDistance & TrackerDistance & LoggedActivitiesDistance & VeryActiveDistance & ModeratelyActiveDistance & LightActiveDistance & SedentaryActiveDistance & VeryActiveMinutes & FairlyActiveMinutes & LightlyActiveMinutes & SedentaryMinutes & Calories\\\\\n",
       "  & <dbl> & <date> & <int> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 2016-04-12 & 13162 & 8.50 & 8.50 & 0 & 1.88 & 0.55 & 6.06 & 0 & 25 & 13 & 328 &  728 & 1985\\\\\n",
       "\t2 & 1503960366 & 2016-04-13 & 10735 & 6.97 & 6.97 & 0 & 1.57 & 0.69 & 4.71 & 0 & 21 & 19 & 217 &  776 & 1797\\\\\n",
       "\t3 & 1503960366 & 2016-04-14 & 10460 & 6.74 & 6.74 & 0 & 2.44 & 0.40 & 3.91 & 0 & 30 & 11 & 181 & 1218 & 1776\\\\\n",
       "\t4 & 1503960366 & 2016-04-15 &  9762 & 6.28 & 6.28 & 0 & 2.14 & 1.26 & 2.83 & 0 & 29 & 34 & 209 &  726 & 1745\\\\\n",
       "\t5 & 1503960366 & 2016-04-16 & 12669 & 8.16 & 8.16 & 0 & 2.71 & 0.41 & 5.04 & 0 & 36 & 10 & 221 &  773 & 1863\\\\\n",
       "\t6 & 1503960366 & 2016-04-17 &  9705 & 6.48 & 6.48 & 0 & 3.19 & 0.78 & 2.51 & 0 & 38 & 20 & 164 &  539 & 1728\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 15\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | ActivityDate &lt;date&gt; | TotalSteps &lt;int&gt; | TotalDistance &lt;dbl&gt; | TrackerDistance &lt;dbl&gt; | LoggedActivitiesDistance &lt;dbl&gt; | VeryActiveDistance &lt;dbl&gt; | ModeratelyActiveDistance &lt;dbl&gt; | LightActiveDistance &lt;dbl&gt; | SedentaryActiveDistance &lt;dbl&gt; | VeryActiveMinutes &lt;int&gt; | FairlyActiveMinutes &lt;int&gt; | LightlyActiveMinutes &lt;int&gt; | SedentaryMinutes &lt;int&gt; | Calories &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 2016-04-12 | 13162 | 8.50 | 8.50 | 0 | 1.88 | 0.55 | 6.06 | 0 | 25 | 13 | 328 |  728 | 1985 |\n",
       "| 2 | 1503960366 | 2016-04-13 | 10735 | 6.97 | 6.97 | 0 | 1.57 | 0.69 | 4.71 | 0 | 21 | 19 | 217 |  776 | 1797 |\n",
       "| 3 | 1503960366 | 2016-04-14 | 10460 | 6.74 | 6.74 | 0 | 2.44 | 0.40 | 3.91 | 0 | 30 | 11 | 181 | 1218 | 1776 |\n",
       "| 4 | 1503960366 | 2016-04-15 |  9762 | 6.28 | 6.28 | 0 | 2.14 | 1.26 | 2.83 | 0 | 29 | 34 | 209 |  726 | 1745 |\n",
       "| 5 | 1503960366 | 2016-04-16 | 12669 | 8.16 | 8.16 | 0 | 2.71 | 0.41 | 5.04 | 0 | 36 | 10 | 221 |  773 | 1863 |\n",
       "| 6 | 1503960366 | 2016-04-17 |  9705 | 6.48 | 6.48 | 0 | 3.19 | 0.78 | 2.51 | 0 | 38 | 20 | 164 |  539 | 1728 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityDate TotalSteps TotalDistance TrackerDistance\n",
       "1 1503960366 2016-04-12   13162      8.50          8.50           \n",
       "2 1503960366 2016-04-13   10735      6.97          6.97           \n",
       "3 1503960366 2016-04-14   10460      6.74          6.74           \n",
       "4 1503960366 2016-04-15    9762      6.28          6.28           \n",
       "5 1503960366 2016-04-16   12669      8.16          8.16           \n",
       "6 1503960366 2016-04-17    9705      6.48          6.48           \n",
       "  LoggedActivitiesDistance VeryActiveDistance ModeratelyActiveDistance\n",
       "1 0                        1.88               0.55                    \n",
       "2 0                        1.57               0.69                    \n",
       "3 0                        2.44               0.40                    \n",
       "4 0                        2.14               1.26                    \n",
       "5 0                        2.71               0.41                    \n",
       "6 0                        3.19               0.78                    \n",
       "  LightActiveDistance SedentaryActiveDistance VeryActiveMinutes\n",
       "1 6.06                0                       25               \n",
       "2 4.71                0                       21               \n",
       "3 3.91                0                       30               \n",
       "4 2.83                0                       29               \n",
       "5 5.04                0                       36               \n",
       "6 2.51                0                       38               \n",
       "  FairlyActiveMinutes LightlyActiveMinutes SedentaryMinutes Calories\n",
       "1 13                  328                   728             1985    \n",
       "2 19                  217                   776             1797    \n",
       "3 11                  181                  1218             1776    \n",
       "4 34                  209                   726             1745    \n",
       "5 10                  221                   773             1863    \n",
       "6 20                  164                   539             1728    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Daily calories\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>ActivityDay</th><th scope=col>Calories</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>2016-04-12</td><td>1985</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>2016-04-13</td><td>1797</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>2016-04-14</td><td>1776</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>2016-04-15</td><td>1745</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>2016-04-16</td><td>1863</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>2016-04-17</td><td>1728</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 3\n",
       "\\begin{tabular}{r|lll}\n",
       "  & Id & ActivityDay & Calories\\\\\n",
       "  & <dbl> & <date> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 2016-04-12 & 1985\\\\\n",
       "\t2 & 1503960366 & 2016-04-13 & 1797\\\\\n",
       "\t3 & 1503960366 & 2016-04-14 & 1776\\\\\n",
       "\t4 & 1503960366 & 2016-04-15 & 1745\\\\\n",
       "\t5 & 1503960366 & 2016-04-16 & 1863\\\\\n",
       "\t6 & 1503960366 & 2016-04-17 & 1728\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 3\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | ActivityDay &lt;date&gt; | Calories &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| 1 | 1503960366 | 2016-04-12 | 1985 |\n",
       "| 2 | 1503960366 | 2016-04-13 | 1797 |\n",
       "| 3 | 1503960366 | 2016-04-14 | 1776 |\n",
       "| 4 | 1503960366 | 2016-04-15 | 1745 |\n",
       "| 5 | 1503960366 | 2016-04-16 | 1863 |\n",
       "| 6 | 1503960366 | 2016-04-17 | 1728 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityDay Calories\n",
       "1 1503960366 2016-04-12  1985    \n",
       "2 1503960366 2016-04-13  1797    \n",
       "3 1503960366 2016-04-14  1776    \n",
       "4 1503960366 2016-04-15  1745    \n",
       "5 1503960366 2016-04-16  1863    \n",
       "6 1503960366 2016-04-17  1728    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Daily intensities\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 10</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>ActivityDay</th><th scope=col>SedentaryMinutes</th><th scope=col>LightlyActiveMinutes</th><th scope=col>FairlyActiveMinutes</th><th scope=col>VeryActiveMinutes</th><th scope=col>SedentaryActiveDistance</th><th scope=col>LightActiveDistance</th><th scope=col>ModeratelyActiveDistance</th><th scope=col>VeryActiveDistance</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>2016-04-12</td><td> 728</td><td>328</td><td>13</td><td>25</td><td>0</td><td>6.06</td><td>0.55</td><td>1.88</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>2016-04-13</td><td> 776</td><td>217</td><td>19</td><td>21</td><td>0</td><td>4.71</td><td>0.69</td><td>1.57</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>2016-04-14</td><td>1218</td><td>181</td><td>11</td><td>30</td><td>0</td><td>3.91</td><td>0.40</td><td>2.44</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>2016-04-15</td><td> 726</td><td>209</td><td>34</td><td>29</td><td>0</td><td>2.83</td><td>1.26</td><td>2.14</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>2016-04-16</td><td> 773</td><td>221</td><td>10</td><td>36</td><td>0</td><td>5.04</td><td>0.41</td><td>2.71</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>2016-04-17</td><td> 539</td><td>164</td><td>20</td><td>38</td><td>0</td><td>2.51</td><td>0.78</td><td>3.19</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 10\n",
       "\\begin{tabular}{r|llllllllll}\n",
       "  & Id & ActivityDay & SedentaryMinutes & LightlyActiveMinutes & FairlyActiveMinutes & VeryActiveMinutes & SedentaryActiveDistance & LightActiveDistance & ModeratelyActiveDistance & VeryActiveDistance\\\\\n",
       "  & <dbl> & <date> & <int> & <int> & <int> & <int> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 2016-04-12 &  728 & 328 & 13 & 25 & 0 & 6.06 & 0.55 & 1.88\\\\\n",
       "\t2 & 1503960366 & 2016-04-13 &  776 & 217 & 19 & 21 & 0 & 4.71 & 0.69 & 1.57\\\\\n",
       "\t3 & 1503960366 & 2016-04-14 & 1218 & 181 & 11 & 30 & 0 & 3.91 & 0.40 & 2.44\\\\\n",
       "\t4 & 1503960366 & 2016-04-15 &  726 & 209 & 34 & 29 & 0 & 2.83 & 1.26 & 2.14\\\\\n",
       "\t5 & 1503960366 & 2016-04-16 &  773 & 221 & 10 & 36 & 0 & 5.04 & 0.41 & 2.71\\\\\n",
       "\t6 & 1503960366 & 2016-04-17 &  539 & 164 & 20 & 38 & 0 & 2.51 & 0.78 & 3.19\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 10\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | ActivityDay &lt;date&gt; | SedentaryMinutes &lt;int&gt; | LightlyActiveMinutes &lt;int&gt; | FairlyActiveMinutes &lt;int&gt; | VeryActiveMinutes &lt;int&gt; | SedentaryActiveDistance &lt;dbl&gt; | LightActiveDistance &lt;dbl&gt; | ModeratelyActiveDistance &lt;dbl&gt; | VeryActiveDistance &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 2016-04-12 |  728 | 328 | 13 | 25 | 0 | 6.06 | 0.55 | 1.88 |\n",
       "| 2 | 1503960366 | 2016-04-13 |  776 | 217 | 19 | 21 | 0 | 4.71 | 0.69 | 1.57 |\n",
       "| 3 | 1503960366 | 2016-04-14 | 1218 | 181 | 11 | 30 | 0 | 3.91 | 0.40 | 2.44 |\n",
       "| 4 | 1503960366 | 2016-04-15 |  726 | 209 | 34 | 29 | 0 | 2.83 | 1.26 | 2.14 |\n",
       "| 5 | 1503960366 | 2016-04-16 |  773 | 221 | 10 | 36 | 0 | 5.04 | 0.41 | 2.71 |\n",
       "| 6 | 1503960366 | 2016-04-17 |  539 | 164 | 20 | 38 | 0 | 2.51 | 0.78 | 3.19 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityDay SedentaryMinutes LightlyActiveMinutes\n",
       "1 1503960366 2016-04-12   728             328                 \n",
       "2 1503960366 2016-04-13   776             217                 \n",
       "3 1503960366 2016-04-14  1218             181                 \n",
       "4 1503960366 2016-04-15   726             209                 \n",
       "5 1503960366 2016-04-16   773             221                 \n",
       "6 1503960366 2016-04-17   539             164                 \n",
       "  FairlyActiveMinutes VeryActiveMinutes SedentaryActiveDistance\n",
       "1 13                  25                0                      \n",
       "2 19                  21                0                      \n",
       "3 11                  30                0                      \n",
       "4 34                  29                0                      \n",
       "5 10                  36                0                      \n",
       "6 20                  38                0                      \n",
       "  LightActiveDistance ModeratelyActiveDistance VeryActiveDistance\n",
       "1 6.06                0.55                     1.88              \n",
       "2 4.71                0.69                     1.57              \n",
       "3 3.91                0.40                     2.44              \n",
       "4 2.83                1.26                     2.14              \n",
       "5 5.04                0.41                     2.71              \n",
       "6 2.51                0.78                     3.19              "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Daily sleep\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>SleepDay</th><th scope=col>TotalSleepRecords</th><th scope=col>TotalMinutesAsleep</th><th scope=col>TotalTimeInBed</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>2016-04-12</td><td>1</td><td>327</td><td>346</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>2016-04-13</td><td>2</td><td>384</td><td>407</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>2016-04-15</td><td>1</td><td>412</td><td>442</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>2016-04-16</td><td>2</td><td>340</td><td>367</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>2016-04-17</td><td>1</td><td>700</td><td>712</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>2016-04-19</td><td>1</td><td>304</td><td>320</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & Id & SleepDay & TotalSleepRecords & TotalMinutesAsleep & TotalTimeInBed\\\\\n",
       "  & <dbl> & <dttm> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 2016-04-12 & 1 & 327 & 346\\\\\n",
       "\t2 & 1503960366 & 2016-04-13 & 2 & 384 & 407\\\\\n",
       "\t3 & 1503960366 & 2016-04-15 & 1 & 412 & 442\\\\\n",
       "\t4 & 1503960366 & 2016-04-16 & 2 & 340 & 367\\\\\n",
       "\t5 & 1503960366 & 2016-04-17 & 1 & 700 & 712\\\\\n",
       "\t6 & 1503960366 & 2016-04-19 & 1 & 304 & 320\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 5\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | SleepDay &lt;dttm&gt; | TotalSleepRecords &lt;int&gt; | TotalMinutesAsleep &lt;int&gt; | TotalTimeInBed &lt;int&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 2016-04-12 | 1 | 327 | 346 |\n",
       "| 2 | 1503960366 | 2016-04-13 | 2 | 384 | 407 |\n",
       "| 3 | 1503960366 | 2016-04-15 | 1 | 412 | 442 |\n",
       "| 4 | 1503960366 | 2016-04-16 | 2 | 340 | 367 |\n",
       "| 5 | 1503960366 | 2016-04-17 | 1 | 700 | 712 |\n",
       "| 6 | 1503960366 | 2016-04-19 | 1 | 304 | 320 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         SleepDay   TotalSleepRecords TotalMinutesAsleep TotalTimeInBed\n",
       "1 1503960366 2016-04-12 1                 327                346           \n",
       "2 1503960366 2016-04-13 2                 384                407           \n",
       "3 1503960366 2016-04-15 1                 412                442           \n",
       "4 1503960366 2016-04-16 2                 340                367           \n",
       "5 1503960366 2016-04-17 1                 700                712           \n",
       "6 1503960366 2016-04-19 1                 304                320           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Daily weight\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 8</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>Date</th><th scope=col>WeightKg</th><th scope=col>WeightPounds</th><th scope=col>Fat</th><th scope=col>BMI</th><th scope=col>IsManualReport</th><th scope=col>LogId</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dttm&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>2016-05-02 23:59:59</td><td> 52.6</td><td>115.9631</td><td>22</td><td>22.65</td><td>True </td><td>1.462234e+12</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>2016-05-03 23:59:59</td><td> 52.6</td><td>115.9631</td><td>NA</td><td>22.65</td><td>True </td><td>1.462320e+12</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1927972279</td><td>2016-04-13 01:08:52</td><td>133.5</td><td>294.3171</td><td>NA</td><td>47.54</td><td>False</td><td>1.460510e+12</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>2873212765</td><td>2016-04-21 23:59:59</td><td> 56.7</td><td>125.0021</td><td>NA</td><td>21.45</td><td>True </td><td>1.461283e+12</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>2873212765</td><td>2016-05-12 23:59:59</td><td> 57.3</td><td>126.3249</td><td>NA</td><td>21.69</td><td>True </td><td>1.463098e+12</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>4319703577</td><td>2016-04-17 23:59:59</td><td> 72.4</td><td>159.6147</td><td>25</td><td>27.45</td><td>True </td><td>1.460938e+12</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 8\n",
       "\\begin{tabular}{r|llllllll}\n",
       "  & Id & Date & WeightKg & WeightPounds & Fat & BMI & IsManualReport & LogId\\\\\n",
       "  & <dbl> & <dttm> & <dbl> & <dbl> & <int> & <dbl> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 2016-05-02 23:59:59 &  52.6 & 115.9631 & 22 & 22.65 & True  & 1.462234e+12\\\\\n",
       "\t2 & 1503960366 & 2016-05-03 23:59:59 &  52.6 & 115.9631 & NA & 22.65 & True  & 1.462320e+12\\\\\n",
       "\t3 & 1927972279 & 2016-04-13 01:08:52 & 133.5 & 294.3171 & NA & 47.54 & False & 1.460510e+12\\\\\n",
       "\t4 & 2873212765 & 2016-04-21 23:59:59 &  56.7 & 125.0021 & NA & 21.45 & True  & 1.461283e+12\\\\\n",
       "\t5 & 2873212765 & 2016-05-12 23:59:59 &  57.3 & 126.3249 & NA & 21.69 & True  & 1.463098e+12\\\\\n",
       "\t6 & 4319703577 & 2016-04-17 23:59:59 &  72.4 & 159.6147 & 25 & 27.45 & True  & 1.460938e+12\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 8\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | Date &lt;dttm&gt; | WeightKg &lt;dbl&gt; | WeightPounds &lt;dbl&gt; | Fat &lt;int&gt; | BMI &lt;dbl&gt; | IsManualReport &lt;chr&gt; | LogId &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 2016-05-02 23:59:59 |  52.6 | 115.9631 | 22 | 22.65 | True  | 1.462234e+12 |\n",
       "| 2 | 1503960366 | 2016-05-03 23:59:59 |  52.6 | 115.9631 | NA | 22.65 | True  | 1.462320e+12 |\n",
       "| 3 | 1927972279 | 2016-04-13 01:08:52 | 133.5 | 294.3171 | NA | 47.54 | False | 1.460510e+12 |\n",
       "| 4 | 2873212765 | 2016-04-21 23:59:59 |  56.7 | 125.0021 | NA | 21.45 | True  | 1.461283e+12 |\n",
       "| 5 | 2873212765 | 2016-05-12 23:59:59 |  57.3 | 126.3249 | NA | 21.69 | True  | 1.463098e+12 |\n",
       "| 6 | 4319703577 | 2016-04-17 23:59:59 |  72.4 | 159.6147 | 25 | 27.45 | True  | 1.460938e+12 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         Date                WeightKg WeightPounds Fat BMI   IsManualReport\n",
       "1 1503960366 2016-05-02 23:59:59  52.6    115.9631     22  22.65 True          \n",
       "2 1503960366 2016-05-03 23:59:59  52.6    115.9631     NA  22.65 True          \n",
       "3 1927972279 2016-04-13 01:08:52 133.5    294.3171     NA  47.54 False         \n",
       "4 2873212765 2016-04-21 23:59:59  56.7    125.0021     NA  21.45 True          \n",
       "5 2873212765 2016-05-12 23:59:59  57.3    126.3249     NA  21.69 True          \n",
       "6 4319703577 2016-04-17 23:59:59  72.4    159.6147     25  27.45 True          \n",
       "  LogId       \n",
       "1 1.462234e+12\n",
       "2 1.462320e+12\n",
       "3 1.460510e+12\n",
       "4 1.461283e+12\n",
       "5 1.463098e+12\n",
       "6 1.460938e+12"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Check data after reformating\n",
    "print(\"Daily activity\")\n",
    "head(activity)\n",
    "\n",
    "print(\"Daily calories\")\n",
    "head(calories)\n",
    "\n",
    "print(\"Daily intensities\")\n",
    "head(intensities)\n",
    "\n",
    "print(\"Daily sleep\")\n",
    "head(sleep)\n",
    "\n",
    "print(\"Daily weight\")\n",
    "head(weight)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5c11770b",
   "metadata": {
    "papermill": {
     "duration": 0.010646,
     "end_time": "2023-07-07T07:09:45.295545",
     "exception": false,
     "start_time": "2023-07-07T07:09:45.284899",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Now that the data has been correctly formatted, lets look at the data itself."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "6d788863",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-07-07T07:09:45.320514Z",
     "iopub.status.busy": "2023-07-07T07:09:45.318815Z",
     "iopub.status.idle": "2023-07-07T07:09:45.395191Z",
     "shell.execute_reply": "2023-07-07T07:09:45.392886Z"
    },
    "papermill": {
     "duration": 0.092199,
     "end_time": "2023-07-07T07:09:45.398300",
     "exception": false,
     "start_time": "2023-07-07T07:09:45.306101",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Daily activity\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "33"
      ],
      "text/latex": [
       "33"
      ],
      "text/markdown": [
       "33"
      ],
      "text/plain": [
       "[1] 33"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Daily calories\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "33"
      ],
      "text/latex": [
       "33"
      ],
      "text/markdown": [
       "33"
      ],
      "text/plain": [
       "[1] 33"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Daily intensities\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "33"
      ],
      "text/latex": [
       "33"
      ],
      "text/markdown": [
       "33"
      ],
      "text/plain": [
       "[1] 33"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Daily sleep\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "24"
      ],
      "text/latex": [
       "24"
      ],
      "text/markdown": [
       "24"
      ],
      "text/plain": [
       "[1] 24"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \"Daily weight\"\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "24"
      ],
      "text/latex": [
       "24"
      ],
      "text/markdown": [
       "24"
      ],
      "text/plain": [
       "[1] 24"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Count number of users in each table\n",
    "print(\"Daily activity\")\n",
    "n_distinct(activity$Id)\n",
    "\n",
    "print(\"Daily calories\")\n",
    "n_distinct(calories$Id)\n",
    "\n",
    "print(\"Daily intensities\")\n",
    "n_distinct(intensities$Id)\n",
    "\n",
    "print(\"Daily sleep\")\n",
    "n_distinct(sleep$Id)\n",
    "\n",
    "print(\"Daily weight\")\n",
    "n_distinct(sleep$Id)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8d57fa1a",
   "metadata": {
    "papermill": {
     "duration": 0.012779,
     "end_time": "2023-07-07T07:09:45.423170",
     "exception": false,
     "start_time": "2023-07-07T07:09:45.410391",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Based on the information provided, there seems to be a discrepancy in the number of users between the different tables in the dataset. While the activity, calories, and intensities tables have entries from 33 FitBit users, the sleep and weight tables only have entries from 24 users.\n",
    "\n",
    "This inconsistency raises a concern regarding the completeness and reliability of the dataset. It is important to ensure that the data is accurate and reliable before performing any statistical analyses. In this case, since the sleep and weight data have unique entries separate from the activity data, it may not be possible to perform valid statistical analyses involving these datasets due to the mismatch in user counts.\n",
    "\n",
    "To address this issue, it is recommended to thoroughly review and validate the dataset, identifying any potential outliers or inconsistencies. If the dataset's integrity cannot be ensured or if the missing data significantly affects the analysis, it may be necessary to explore alternative data sources or strategies to overcome these limitations.\n",
    "\n",
    "Careful consideration should be given to the reliability and completeness of the data when drawing conclusions or making recommendations based on the analysis."
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
   "duration": 366.450912,
   "end_time": "2023-07-07T07:09:45.559932",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-07-07T07:03:39.109020",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
