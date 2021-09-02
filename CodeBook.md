---
title: "Code Book"
author: "Federico Vera"
date: "31/8/2021"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Code Book

__1. Download the dataset from an url__

The dataset is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

and uncompressed to the folder UCI HAR Dataset

__2.   Files__

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.



__3 Merges the training and test data set to create one data set__

Merged_data --> 'data.frame':	10299 obs. of  563 variables:

__4 Extracts only the measurements on the mean and standard deviation for each measurement __

TidyData 'data.frame':	10299 obs. of  88 variables:
it's created by subsetting Merged_Data selecting subject, code, and the mean and 
standar of the measurements



__5 Uses descriptive activity names to name the activities in the data set__

Entire numbers in code column of the TidyData replaced with corresponding activity taken from second column of the activities variable

__6 Appropriately labels the data set with descriptive variable names __

the code changes the following columns names:

TidyData)--> activity
Acc --> Accelerometer
Gyro --> Gyroscope
BodyBody --> Body
Mag --> Magnitude
t --> Time
f --> Frequency
tBody --> TimeBody
angle --> Angle
gravity --> Gravity


__7 From the data set in step 6, creates a second, independent tidy data set with the average of each variable for each activity and each subject__

grouped_df [180 x 88] (S3: grouped_df/tbl_df/tbl/data.frame)

__8 Export Data file__

the file is FinalTidyData.txt

