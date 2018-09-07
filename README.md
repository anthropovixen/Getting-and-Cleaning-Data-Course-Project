# Getting and Cleaning Data - Course Project

This is the ReadMe for the repository created for the assignment of "Getting and Cleaning Data" course at Coursera.

This repository contains the following files:

`README.md` overview of the data set and how it was created
`CodeBook.md` contents of the data set (data, variables and transformations used to generate the data)
`run_analysis.R` R script used to create the data set
`tidy_data.txt` the final data set

## Study Design



## Summary

The objective of this exercise was to analyze with R the experimental results captured by the [Human Activity Recognition using Smartphones] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)study.

The [run_analysis.R](./run_analysis.R) script built will complete the following steps to transform the data:
- Load dplyr and data.table packages
- Download and unzip source data
- Read data
- Merge the training and the test sets to create one data set
- Extract the measurements on the mean and standard deviation for each measurement
- Use descriptive activity names to name the activities in the data set
- Label the data set with descriptive variable names
- Create a second, independent tidy data set with the average of each variable for each activity and each subject
- Write the data set to the tidy_data.txt file.

In this project, the [data from the accelerometer and gyroscope](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) of the Samsung Galaxy S smartphone was collected, worked with the [run_analysis.R](./run_analysis.R) script, and resulted in the [tidy data set](./tidy_data.txt). The R version used was the 3.4.3 on Windows 7 Professional.

## Repository Information
