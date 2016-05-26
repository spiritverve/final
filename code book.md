# ## Getting and Cleaning Data Course Project

### Source Data
The data used in this project was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description of the data can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data is here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


### Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


### Part 1 - Loads the file and unzip it


### Part 2 - Convert the files into corresponding tables

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

##  Part 3 - merge the files

x_combined <- rbind(x_train, x_test)
y_combined <- rbind(y_train, y_test)
subject_combined <- rbind(subject_train, subject_test)

## Part 4 - extract mean and standard deviation from combined x data  
## create subset containing only those columns and label correctly

mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])
x_combined_sub <- x_combined[, mean_and_std]
names(x_combined_sub) <- features[mean_and_std, 2]

## Part 5 - label activities and add column names

y_combined[, 1] <- activityLabels[y_combined[, 1], 2]
names(y_combined) <- "activity"
names(subject_combined) <- "subject"

## Part 6 - cbind all the data in a single data set
final <- cbind(x_combined_sub, y_combined, subject_combined)

## Part 7 - create a second, independent tidy data set with the average of each 
## variable for each activity and each subject.

avg_final <- ddply(final, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(avg_final, "avg_final.txt", row.name=FALSE)

## bring the output back into a table just to make sure :)

x_final <- read.table("avg_final.txt")
