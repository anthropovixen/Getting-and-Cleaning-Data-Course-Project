# Getting and Cleaning Data - Course Project

This is the ReadMe for the repository created for the assignment of "Getting and Cleaning Data" course at Coursera.

This repository contains the following files:

- `README.md` overview of the data set and how it was created
- `CodeBook.md` contents of the data set (data, variables and transformations used to generate the data)
- `run_analysis.R` R script used to create the data set
- `tidy_data.txt` the final data set

The objective of this exercise was to analyze with R the experimental results captured by the [Human Activity Recognition using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) study.

The [run_analysis.R](./run_analysis.R) script built will complete the following steps to transform the data:
- Load `dplyr` and `data.table` packages
- Download and unzip source data
- Read data
- Merge the training and the test sets to create one data set
- Extract the measurements on the mean and standard deviation for each measurement
- Use descriptive activity names to name the activities in the data set
- Label the data set with descriptive variable names
- Create a second, independent tidy data set with the average of each variable for each activity and each subject
- Write the data set to the tidy_data.txt file.

In this project, the [data from the accelerometer and gyroscope](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) of the Samsung Galaxy S smartphone was collected, worked with the [run_analysis.R](./run_analysis.R) script, and resulted in the [tidy data set](./tidy_data.txt). The R version used was the 3.4.3 on Windows 7 Professional.

## Study Design

The data set used as a base for this project was obtained from the study [Human Activity Recognition using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The collection of data was described by the study as it follows:

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The training and test sets were merged together, then from each measurement, the mean and standard deviation were extracted. Then, the average of each measurement and subject was calculated and that resulted in the final data set.

