# Description
One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
# Script
R script called `run_analysis.R` does the following:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive activity names. 
  5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

to run `run_analysis.R` no external package is needed and simple `source("run_analysis.R")` is adequate.
# Data
input data can be reached from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). there are two output dataset. first one is called `data.txt` which contains both test and train dataset alongside three new columns called "activity.lable", "activity.name" and "subject". "activity.lable" variable contains lable for each observation and "activity.name" is simply human readable name for each activity lable. for more information about these new variables, see readme of original dataset which is provided in the dataset zip file. second dataset called `DataMean.txt` contains average of each variable with same column name for each activity and each subject. note that unlike the original dataset, first line of both output datasets is considered header for that dataset.
