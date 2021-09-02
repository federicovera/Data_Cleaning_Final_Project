# Getting and Cleaning Data Project John Hopkins Coursera

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Load Packages and get the Data

path <- getwd()
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, file.path(path, "dataFiles.zip"))
unzip(zipfile = "dataFiles.zip")


## files downloaded and uncompressed

## assigning labels to table features

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))

## assigning labels to table activities

activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))


## assigning labels to table subject_test

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")


## assigning labels to table x_test

x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)


## assigning labels to table y_test

y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")


## assigning labels to table subject_train

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

## assigning labels to table x_train

x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)

## assigning labels to table y_train

y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")


## ending labels assignament

##-----------------------

## Merging data tables

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

##-------------------


TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))


##---------------------------------

## Rename variable names

names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

##--------------------

## Final Tidy Data Set

FinalData <- TidyData %>%
        group_by(subject, activity) %>%
        summarise_all(list(mean=mean))
write.table(FinalData, "FinalTidyData.txt", row.name=FALSE)
