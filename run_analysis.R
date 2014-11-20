#
#use setwd("<path_to/>UCI HAR Dataset") where <path_to> is replaced by the path on user's computer
# the Y_test.txt, X_test.txt, subject_test.txt, Y_train.txt, X_train.txt, subject_train.txt files must be in your working directory (not in sub-folder)
#    [Windows, Mac & Linux treat paths differently so to avoid any issues better to not have to use specify sub-folders]

#read and merge test and training datasets
x_test <- read.table("X_test.txt", stringsAsFactors=FALSE, header=FALSE, colClasses="numeric", nrows=3000)
y_test <- read.table("Y_test.txt", stringsAsFactors=FALSE, header=FALSE)
subject_test <- read.table("subject_test.txt", stringsAsFactors=FALSE, header=FALSE)

test_data <- cbind(subject_test, y_test, x_test)
colnames(test_data)[1] <- "subject"
colnames(test_data)[2] <- "activity_code"

x_train <- read.table("X_train.txt", stringsAsFactors=FALSE, header=FALSE, colClasses="numeric", nrows=7400)
y_train <- read.table("Y_train.txt", stringsAsFactors=FALSE, header=FALSE)
subject_train <- read.table("subject_train.txt", stringsAsFactors=FALSE, header=FALSE)

train_data <- cbind(subject_train, y_train, x_train)
colnames(train_data)[1] <- "subject"
colnames(train_data)[2] <- "activity_code"

merged_data <- rbind(test_data, train_data)

#extract mean and std columns
#I don't really know what this data is so I just took all the columns with "mean" or "std" in the name except where inside parentheses - that gives 
#79 columns plus the subject and activity columns?wrote
means_sds <- merged_data[, c("subject", "activity_code", "V1", "V2", "V3", "V4", "V5", "V6", 
                                                     "V41", "V42", "V43", "V44", "V45", "V46", 
                                                     "V81", "V82", "V83", "V84", "V85", "V86",
                                                     "V121", "V122", "V123", "V124", "V125", "V126",
                                                     "V161", "V162", "V163", "V164", "V165", "V166",
                                                      "V201", "V202", "V214", "V215", "V227", "V228", "V240", "V241", "V253", "V254",
                                                     "V266", "V267", "V268", "V269", "V270", "V271", 
                                                     "V294", "V295", "V296",
                                                     "V345", "V346", "V347", "V348", "V349", "V350",
                                                      "V373", "V374", "V375",
                                                     "V424", "V425", "V426", "V427", "V428", "V429",
                                                     "V452", "V453", "V454", "V503", "V504", "V513", 
                                                     "V516", "V517", "V526", "V529", "V530", "V539",
                                                      "V542", "V543", "V552")]

#change column names to descriptive names
colnames(means_sds) <- c("subject", "activity_code", "tBodyAcc_meanX", "tBodyAcc_meanY", "tBodyAcc_meanZ",
                                      "tBodyAcc_stdX", "tBodyAcc_stdY", "tBodyAcc_stdZ", "tGravityAcc_meanX", "tGravityAcc_meanY",
                                      "tGravityAcc_meanZ", "tGravityAcc_stdX", "tGravityAcc_stdY" ,"tGravityAcc_stdZ", "tBodyAccJerk_meanX",
                                      "tBodyAccJerk_meanY", "tBodyAccJerk_meanZ", "tBodyAccJerk_stdX", "tBodyAccJerk_stdY", "tBodyAccJerk_stdZ",
                                      "tBodyGyro_meanX", "tBodyGyro_meanY", "tBodyGyro_meanZ", "tBodyGyro_stdX", "tBodyGyro_stdY",
                                      "tBodyGyro_stdZ", "tBodyGyroJerk_meanX", "tBodyGyroJerk_meanY", "tBodyGyroJerk_meanZ",
                                      "tBodyGyroJerk_stdX", "tBodyGyroJerk_stdY", "tBodyGyroJerk_stdZ", "tBodyAccMag_mean", "tBodyAccMag_std",
                                      "tGravityAcc_mean", "tGravityAcc_std", "tBodyAccJerk_mean", "tBodyAccJerk_std", "tBodyGyroMag_mean",
                                      "tBodyGyroMag_std", "tBodyGyroJerkMag_mean", "tBodyGyroJerkMag_std", "fBodyAcc_meanX",
                                       "fBodyAcc_meanY", "fBodyAcc_meanZ", "fBodyAcc_stdX", "fBodyAcc_stdY", "fBodyAcc_stdZ",
                                       "fBodyAcc_meanFreqX", "fBodyAcc_meanFreqY", "fBodyAcc_meanFreqZ", "fBodyAccJerk_meanX",
                                       "fBodyAccJerk_meanY", "fBodyAccJerk_meanZ", "fBodyAccJerk_stdX", "fBodyAccJerk_stdY",
                                       "fBodyAccJerk_stdZ", "fBodyAccJerk_meanFreqX", "fBodyAccJerk_meanFreqY", "fBodyAccJerk_meanFreqZ",
                                       "fBodyGyro_meanX",  "fBodyGyro_meanY", "fBodyGyro_meanZ", "fBodyGyro_stdX", "fBodyGyro_stdY",
                                       "fBodyGyro_stdZ", "fBodyGyro_meanFreqX", "fBodyGyro_meanFreqY", "fBodyGyro_meanFreqZ",
                                       "fBodyAccMag_mean", "fBodyAccMag_std", "fBodyAccMag_meanFreq", "fBodyAccMag_mean",
                                       "fBodyAccMag_std", "fBodyBodyAccJerkMag_meanFreq", "fBodyBodyGyroMag_mean", "fBodyBodyGyroMag_std",
                                       "fBodyBodyGyroMag_meanFreq",  "fBodyBodyGyroJerkMag_mean", "fBodyBodyGyroJerkMag_std",
                                       "fBodyBodyGyroJerkMag_meanFreq")

#create new column and make values labels for activities
means_sds$activity = "walking"
means_sds[means_sds$activity_code==2, "activity"]="walking upstairs"
means_sds[means_sds$activity_code==3, "activity"]="walking downstairs"
means_sds[means_sds$activity_code==4, "activity"]="sitting"
means_sds[means_sds$activity_code==5, "activity"]="standing"
means_sds[means_sds$activity_code==6, "activity"]="laying"

#reorder columns so activity label is first and drop activity_code column
means_sds <- means_sds[, c(82,1,3:81)]

#load data.table package and convert data.frame to data.table
library(data.table)
DTmeans_sds <- data.table(means_sds)
rm(means_sds)

#summarize data by subject and activity
summeans <- DTmeans_sds[, lapply(.SD, mean), by=c("subject", "activity")]

#write result to text file
write.table(summeans, "tidyHARsmmrzd.txt", sep =" ", row.names=FALSE)
print ("Table of means of mean and standard deviation values")
print ("grouped by subject and activity have been saved to a file")
print ("called tidyHARsmmrzd.txt in the current working directory")



   
