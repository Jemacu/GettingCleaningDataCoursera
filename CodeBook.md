Code Book
===========================


####Raw Data
**Raw data source**: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

**Additional information** about the raw data is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and included in the zip file with the downloaded data.

####Columns in result
___________________
**subject**: integer values between 1 & 30 representing the 30 subjects that took part in the study

**activity**: text description for the type of activity being measured (i.e. 'walking', 'walking upstairs', 'walking downstairs', 'sitting', 'standing' or 'laying')

**All remaining variables**, listed below, are numeric and were calculated by grouping the values in the raw data by 'subject' and 'activity' and calculating the means of the groups for each variable. The remaining variables are

```
tBodyAcc_meanX       tGravityAcc_meanX       tBodyAccJerk_meanX
tBodyAcc_meanY       tGravityAcc_meanY       tBodyAccJerk_meanY
tBodyAcc_meanZ       tGravityAcc_meanZ       tBodyAccJerk_meanZ
tBodyAcc_stdX        tGravityAcc_stdX        tBodyAccJerk_stdX
tBodyAcc_stdY        tGravityAcc_stdY        tBodyAccJerk_stdY
tBodyAcc_stdZ        tGravityAcc_stdZ        tBodyAccJerk_stdZ
```
```
tBodyGyro_meanX       tBodyGyroJerk_meanX       tBodyAccMag_mean
tBodyGyro_meanY       tBodyGyroJerk_meanY       tBodyAccMag_std
tBodyGyro_meanZ       tBodyGyroJerk_meanZ       tGravityAccMag_mean
tBodyGyro_stdX        tBodyGyroJerk_stdX        tGravityAccMag_std
tBodyGyro_stdY        tBodyGyroJerk_stdY        tBodyAccJerkMag_mean
tBodyGyro_stdZ        tBodyGyroJerk_stdZ        tBodyAccJerkMag_std
```
```
tBodyGyroMag_mean         fBodyAcc_meanX       fBodyAccJerk_meanX
tBodyGyroMag_std          fBodyAcc_meanY       fBodyAccJerk_meanY
tBodyGyroJerkMag_mean     fBodyAcc_meanZ       fBodyAccJerk_meanZ
tBodyGyroJerkMag_std      fBodyAcc_stdX        fBodyAccJerk_stdX
fBodyAcc_meanFreqX        fBodyAcc_stdY        fBodyAccJerk_stdY
fBodyAcc_meanFreqY        fBodyAcc_stdZ        fBodyAccJerk_stdZ
fBodyAcc_meanFreqZ
```
```
fBodyAccJerk_meanFreqX       fBodyGyro_meanX       fBodyAccMag_mean
fBodyAccJerk_meanFreqY       fBodyGyro_meanY       fBodyAccMag_std
fBodyAccJerk_meanFreqZ       fBodyGyro_meanZ       fBodyAccMag_meanFreq
fBodyGyro_meanFreqX          fBodyGyro_stdX        fBodyBodyAccJerkMag_mean
fBodyGyro_meanFreqY          fBodyGyro_stdY        fBodyBodyAccJerkMag_std
fBodyGyro_meanFreqZ          fBodyGyro_stdZ        fBodyBodyAccJerkMag_meanFreq
```
```
fBodyBodyGyroMag_mean       fBodyBodyGyroJerkMag_mean
fBodyBodyGyroMag_std       fBodyBodyGyroJerkMag_std
fBodyBodyGyroMag_meanFreq       fBodyBodyGyroJerkMag_meanFreq
```



