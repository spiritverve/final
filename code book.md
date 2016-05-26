# Getting and Cleaning Data Course Project

### Source Data
The data used in this project was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description of the data can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data is here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Data Set Information - taken from [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


### Attribute Information - taken from [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


### Part 1 
Loads the file and unzips it


### Part 2 
Converts the files into corresponding tables


### Part 3 
Merges the x,y and subject tables using rbind


### Part 4 
Extracts mean and standard deviation from combined x data 
Create subset of the x containing only those columns with mean and standard deviation 
Label the mean and standard deviation columns


### Part 5 
Label activities 
Add column names for the y table and the subject column


### Part 6 
Create a single data set combining the mean and standard deviation table with the subjects and activities

### Part 7 
Create a second, independent tidy data set with the average of each variable for each activity and each subject.
Write that table to a text file.

avg_final <- ddply(final, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(avg_final, "avg_final.txt", row.name=FALSE)

### As a final step I bring the output back into a table just to make sure it looks like I want it to. :)

