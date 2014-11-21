Course Project - Getting and Cleaning Data
===========================

###Instructions/explanations:
_______________________

run_analysis.R:
> To run this script, the 'UCI HAR Dataset' directory must be in the current working directory on your computer.
> Set the working directory with `setwd("<path on your computer to directory containing 'UCI HAR Dataset'>")`

> The required data can be downloaded from this url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
> More information about the the *Human Activity Recognition Using Smartphones Dataset Version 1.0* and its authors can be found in the README.txt file included in the download or on the project website at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


The run_analysis.R script,
- merges the data from the files in '.../UCI HAR Dataset/test' and '.../UCI HAR Dataset/train',
- extracts 81 columns ('subject', 'activity' and columns with mean or std in the feature name, but excluding the angle measurements in the last 6 columns),
- calculates the means of all the measurement values grouped by subject and activity, (that is, there will be a row for each subject/activity combination with the mean value of all measurements for that subject/activity combination),
- replaces the activity codes (values 1-6) with the names of the activities (e.g. 'walking', 'walking upstairs', 'standing', etc.),
- labels the columns with names corresponding to the field names given in 'UCI HAR Dataset/features.txt', and
- saves the resulting table to a text file called tidyHARsmmrzd.txt in the current working directory

The result is a tidy dataset in wide format as described in the Getting and Cleaning Data course materials. The table has 180 rows and 81 columns and is written to a text file in the current working directory with:
`write.table(summeans, "tidyHARsmmrzd.txt", sep =" ", row.names=FALSE)`
The table will remain as a data.table in R (called 'summeans') but the table can also be reloaded from the text file with:
`UICHARsummary <- read.table("tidyHARsmmrzd.txt", stringsAsFactors = FALSE, nrows=190, header=TRUE)`
