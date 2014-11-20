Course Project - Getting and Cleaning Data
===========================

###Instructions/explanations:
_______________________

run_analysis.R:
> To run this script, the 'UCI HAR Dataset' directory must be in the current working directory on your computer.
> Set the working directory with `setwd("<path on your computer to directory containing 'UCI HAR Dataset'>")`

> The data can be downloaded from this url: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


The run_analysis.R script,
- merges the data from the files in '.../UCI HAR Dataset/test' and '.../UCI HAR Dataset/train',
- extracts 81 columns ('subject', 'activity' and columns with mean or std in the feature name but excluding the angle measurements -last 6 columns),
- calculates the means of all the values grouped by subject and activity,
- replaces the activity codes (values 1-6) with the names of the activities (e.g. 'walking', 'walking upstairs', 'standing', etc.),
- labels the columns with names corresponding to the field names given in 'UCI HAR Dataset/features.txt', and
- saves the resulting table to a text file called tidyHARsmmrzd.txt in the current working directory

The result is a table with 180 rows and 81 columns which is written to a text file in the current working directory with:
`write.table(summeans, "tidyHARsmmrzd.txt", sep =" ", row.names=FALSE)`
The table will remain as data.table in R (called 'summeans') but the table can also be reloaded with:
`UICHARsummary <- read.table("tidyHARsmmrzd.txt", stringsAsFactors = FALSE, nrows=190, header=TRUE)`
