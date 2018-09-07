# PREPARATION 

# Load dplyr and data.table packages

library(dplyr)
library(data.table)

# Create working directory, download files, unzip them

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# Get the list of files
list.files("data", recursive = TRUE)

# Read supporting metadata

featureNames <- read.table("data/UCI HAR Dataset/features.txt", header = FALSE)
activityLabels <- read.table("data/UCI HAR Dataset/activity_labels.txt", header = FALSE)

# Read training data sets

subjectTrain <- read.table("data/UCI HAR Dataset/train/subject_train.txt",header = FALSE)
featuresTrain <- read.table("data/UCI HAR Dataset/train/X_train.txt", header = FALSE)
activitiesTrain <- read.table("data/UCI HAR Dataset/train/y_train.txt", header = FALSE)

# Read testing data sets

subjectTest <- read.table("data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
featuresTest <- read.table("data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
activitiesTest <- read.table("data/UCI HAR Dataset/test/y_test.txt", header = FALSE)

###
# STEP 1 - Merge training and test data sets to create one data set
# Combine data sets according to 'subject', 'activity', 'features'
dataSubject <- rbind(subjectTrain, subjectTest)
dataActivity <- rbind(activitiesTrain, activitiesTest)
dataFeatures <- rbind(featuresTrain, featuresTest)

# Name columns of the 3 data sets
names(dataSubject) <- c("subject")
names(dataActivity) <- c("activity")
names(dataFeatures) <- featureNames$V2

# Combine 3 data sets in one: totalData
totalData <- cbind(dataFeatures, dataActivity, dataSubject)

###
# STEP 2 - Extract mean and standard deviation for each measurement
# First, create data set from columns with mean(), std() and 'subject' and 'activity'

columnstoKeep <- grepl("subject|activity|mean|std", colnames(totalData))

# Then, set the combined data from STEP 1 by 'columnstoKeep'

totalData <-totalData[,columnstoKeep]

###
# STEP 3 - Use descriptive activity names to name the activities in the data set
# Replace values from variable 'activity' with names from data set 'activityLabels'

totalData$activity <- factor(totalData$activity,
                             levels = activityLabels[, 1], labels = activityLabels[, 2])

###
# STEP 4 - Label the data set with descriptive variable names
# Remove special characters, clean up names and expand abbreviations

names(totalData) <- gsub("[\\(\\)-]", "", names(totalData))
names(totalData) <- gsub("^f", "frequency", names(totalData))
names(totalData) <- gsub("^t", "time", names(totalData))
names(totalData) <- gsub("mean", "Mean", names(totalData))
names(totalData) <- gsub("std", "StandardDeviation", names(totalData))
names(totalData) <- gsub("Mag", "Magnitude", names(totalData))
names(totalData) <- gsub("Acc", "Accelerometer", names(totalData))
names(totalData) <- gsub("Gyro", "Gyroscope", names(totalData))
names(totalData) <- gsub("BodyBody", "Body", names(totalData))
names(totalData) <- gsub("X", "-X", names(totalData))
names(totalData) <- gsub("Y", "-Y", names(totalData))
names(totalData) <- gsub("Z", "-Z", names(totalData))

###
# STEP 5 - Create data set with the average of variables for subjects and activities
tidyData <- aggregate(.~subject + activity, totalData, mean)

# Order data by subject and activity
tidyData <- tidyData[order(tidyData$subject, tidyData$activity),]

# Save data according to instructions
write.table(tidyData, file = "tidydata.txt", row.name=FALSE)
