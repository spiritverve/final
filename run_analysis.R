##library(plyr) - tony1234

## Load the file and unzip it

fileurl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

if (!file.exists("data")) {
        dir.create("data")
}

download.file(fileurl, mode='wb',destfile = "./data/datazip.zip")


dateDownloaded_zip<- date()

unzip("./data/datazip.zip")


## put the files into corresponding tables


activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

## merge the files

x_combined <- rbind(x_train, x_test)
y_combined <- rbind(y_train, y_test)
subject_combined <- rbind(subject_train, subject_test)



## extract mean and standard deviation

# find and subset columns
mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])
x_combined_sub <- x_combined[, mean_and_std]

# write the column names
names(x_combined_sub) <- features[mean_and_std, 2]


## label activities and add column name

y_combined[, 1] <- activityLabels[y_combined[, 1], 2]

names(y_combined) <- "activity"

## create a second, independent tidy data set with the average of each 
## variable for each activity and each subject.

