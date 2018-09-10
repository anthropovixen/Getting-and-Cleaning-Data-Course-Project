# Introduction

This is the codebook for the Getting and Cleaning Data Course Project from week 4. It relates to the [tidy_data.txt](./tidy_data.txt) file of this repository.

See the [README](./README) file of the repository for more information on this data set.

The structure of the data set is described in the Data (# data)section, its variables are listed in the Variables(# variables) section, and the transformations that happened to the data set are in the Transformations(# transformations) section.

# Data

The tidy data is a data file with space-separated values. The first row contains the names of the variables and the following rows contains the values of those variables.

```
tidyData<- read.table(file = "tidydata.txt", head=TRUE)
```

The data has 180 observations of 81 variables.

```
dim(tidyData)
```

# Variables

Each row contains 79 averaged signal measurements per subject and activity.

The data set has 2 columns that act as identifiers:

- *subject*
ID from the participants in the experiment, which ranges from 1 to 30.

- *activity*
Type of activity the subject was performing when the measurement was taken.
This identifier can assum the form of 6 possible values:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING
  
 - *measurements*
 The other columns are averaged measurements taken by the Smartphone for each subject and each activity.
 The acceleration measurements from the Accelerometer were in standard gravity units 'g'.
 The Gyroscope measurements were in radians/second.
 All measurements are normalized and bounded within [-1,1] and they are classified into two domains: time and frequency.
  
  ```
  columns<-colnames(tidyData)[-c(1,2)]
  cat(paste('*', columns), sep = '\n')
  ```
  
* timeBodyAccelerometerMean-X
* timeBodyAccelerometerMean-Y
* timeBodyAccelerometerMean-Z
* timeBodyAccelerometerStandardDeviation-X
* timeBodyAccelerometerStandardDeviation-Y
* timeBodyAccelerometerStandardDeviation-Z
* timeGravityAccelerometerMean-X
* timeGravityAccelerometerMean-Y
* timeGravityAccelerometerMean-Z
* timeGravityAccelerometerStandardDeviation-X
* timeGravityAccelerometerStandardDeviation-Y
* timeGravityAccelerometerStandardDeviation-Z
* timeBodyAccelerometerJerkMean-X
* timeBodyAccelerometerJerkMean-Y
* timeBodyAccelerometerJerkMean-Z
* timeBodyAccelerometerJerkStandardDeviation-X
* timeBodyAccelerometerJerkStandardDeviation-Y
* timeBodyAccelerometerJerkStandardDeviation-Z
* timeBodyGyroscopeMean-X
* timeBodyGyroscopeMean-Y
* timeBodyGyroscopeMean-Z
* timeBodyGyroscopeStandardDeviation-X
* timeBodyGyroscopeStandardDeviation-Y
* timeBodyGyroscopeStandardDeviation-Z
* timeBodyGyroscopeJerkMean-X
* timeBodyGyroscopeJerkMean-Y
* timeBodyGyroscopeJerkMean-Z
* timeBodyGyroscopeJerkStandardDeviation-X
* timeBodyGyroscopeJerkStandardDeviation-Y
* timeBodyGyroscopeJerkStandardDeviation-Z
* timeBodyAccelerometerMagnitudeMean
* timeBodyAccelerometerMagnitudeStandardDeviation
* timeGravityAccelerometerMagnitudeMean
* timeGravityAccelerometerMagnitudeStandardDeviation
* timeBodyAccelerometerJerkMagnitudeMean
* timeBodyAccelerometerJerkMagnitudeStandardDeviation
* timeBodyGyroscopeMagnitudeMean
* timeBodyGyroscopeMagnitudeStandardDeviation
* timeBodyGyroscopeJerkMagnitudeMean
* timeBodyGyroscopeJerkMagnitudeStandardDeviation
* frequencyBodyAccelerometerMean-X
* frequencyBodyAccelerometerMean-Y
* frequencyBodyAccelerometerMean-Z
* frequencyBodyAccelerometerStandardDeviation-X
* frequencyBodyAccelerometerStandardDeviation-Y
* frequencyBodyAccelerometerStandardDeviation-Z
* frequencyBodyAccelerometerMeanFreq-X
* frequencyBodyAccelerometerMeanFreq-Y
* frequencyBodyAccelerometerMeanFreq-Z
* frequencyBodyAccelerometerJerkMean-X
* frequencyBodyAccelerometerJerkMean-Y
* frequencyBodyAccelerometerJerkMean-Z
* frequencyBodyAccelerometerJerkStandardDeviation-X
* frequencyBodyAccelerometerJerkStandardDeviation-Y
* frequencyBodyAccelerometerJerkStandardDeviation-Z
* frequencyBodyAccelerometerJerkMeanFreq-X
* frequencyBodyAccelerometerJerkMeanFreq-Y
* frequencyBodyAccelerometerJerkMeanFreq-Z
* frequencyBodyGyroscopeMean-X
* frequencyBodyGyroscopeMean-Y
* frequencyBodyGyroscopeMean-Z
* frequencyBodyGyroscopeStandardDeviation-X
* frequencyBodyGyroscopeStandardDeviation-Y
* frequencyBodyGyroscopeStandardDeviation-Z
* frequencyBodyGyroscopeMeanFreq-X
* frequencyBodyGyroscopeMeanFreq-Y
* frequencyBodyGyroscopeMeanFreq-Z
* frequencyBodyAccelerometerMagnitudeMean
* frequencyBodyAccelerometerMagnitudeStandardDeviation
* frequencyBodyAccelerometerMagnitudeMeanFreq
* frequencyBodyAccelerometerJerkMagnitudeMean
* frequencyBodyAccelerometerJerkMagnitudeStandardDeviation
* frequencyBodyAccelerometerJerkMagnitudeMeanFreq
* frequencyBodyGyroscopeMagnitudeMean
* frequencyBodyGyroscopeMagnitudeStandardDeviation
* frequencyBodyGyroscopeMagnitudeMeanFreq
* frequencyBodyGyroscopeJerkMagnitudeMean
* frequencyBodyGyroscopeJerkMagnitudeStandardDeviation
* frequencyBodyGyroscopeJerkMagnitudeMeanFreq

# Transformations

To go from the Raw Data found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to the Tidy Data set, the following transformations were made:
1. Merged the training and the test sets to create one data set.
2. Extracted measurements with mean or standard deviation on their names and discarded the others.
3. Used descriptive names for the activity identifiers, replacing the original values (integers from 1 to 6) with them.
4. Labeled the data set with descriptive variable names
  - special characters were removed
  - the `f`and `t` were replaced by `frequency` and `time` respectively
  - `mean` was replaced by `Mean`
  - `std`was replaced by `StandardDeviation`
  - `Mag`, `Acc`, `Gyro` were replaced by `Magnitude`, `Accelerometer`, and `Gyroscope` respectively
  - `BodyBody` was corrected as `Body`
  - Added a `-` before X, Y and Z
5. Created a second, independent tidy data set with the average of each variable for each activity and each subject
6. Wrote the data set to the tidy_data.txt file

The R script for this transformation can be found [here](./run_analysis.R).


