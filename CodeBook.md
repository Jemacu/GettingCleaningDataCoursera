Code Book for run_analysis.R
===========================
#### Summary
The script 'run_analysis.R' calculates the means of mean and standard deviation values from motion data collected from the 'Smartphones' of 30 volunteers in a 2012 study (see citation below). 

The script, a README.md file and this code book are part of the requirements for the Getting and Cleaning Data course offered by Coursera. Please see the README file for an explanation of what the script does and how to run it.

####Raw Data
**Raw data source**: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

**Information** about the raw data, collection methods and study design is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and included in the zip file with the downloaded data.

**Citation**:  Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

####Columns in Output
___________________
**subject**: integer values between 1 & 30 representing the 30 subjects that took part in the study

**activity**: text description for the type of activity being measured (i.e. 'walking', 'walking upstairs', 'walking downstairs', 'sitting', 'standing' or 'laying')

**All remaining variables**, listed below, are numeric (original data collected in standard gravity units 'g') and were calculated by grouping the values in the raw data by 'subject' and 'activity' and calculating the means of the groups for each variable. Note that components of the variable names can be interpreted as follows:
- t = time domain signals
- f = frequency domain signals
- Acc = accelerometer signals
- Body = body acceleration
- Gravity = gravity acceleration
- Gyro = gyroscope 3-axial raw signals
- Mag = magnitude
- Jerk = a value derived from body linear acceleration and angular velocity [*best I can do*]

The variable names are the same as those in "...UCI HAR Dataset/features_info.txt" except that dashes/hyphens have been replaced with underscores and parentheses have been removed.
The variables are:
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
fBodyBodyGyroMag_mean        fBodyBodyGyroJerkMag_mean
fBodyBodyGyroMag_std         fBodyBodyGyroJerkMag_std
fBodyBodyGyroMag_meanFreq    fBodyBodyGyroJerkMag_meanFreq
```



