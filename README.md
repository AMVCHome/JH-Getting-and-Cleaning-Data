JH-Getting-and-Cleaning-Data
============================

# Getting and Cleaning Data - Project

- This repository contains R code that downloads and does some preprocessing on Human Activity Recognition data set. 
- A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
- Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# Introduction

The script `run_analysis.R`
- creates ProjectData folder, if it does not exist in current working directory.
- downloads required data from: http://archive.ics.uci.edu/ml/index.html
- reads downloaded files into data table and appropriately labels columns with descriptive names
- merges (using cbind and then rbing) training and test sets to create one data set (combo.data.all) 
- extracts only the measurements (features) on the mean and standard deviation for each measurement (filtered.data) 
- replaces `activity` values in the dataset with descriptive activity names by joining activity info (join.data) 
- creates a second tidy dataset with an average of each variable for each each activity and each subject. (tidy.data) 
- outputs the processed tidy data set as txt and csv file for easy view.(UCI_HAR_tidy.txt & (UCI_HAR_tidy.csv)
  
# run_analysis.R

- The script assumes that `plyr` library is already installed.
- The script is sequenced to perfoem all the steps mentioned above in that order. 
- To excute, run this R file in current working directory, where you have acess to write. 

# The original data set

- (test, train) The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
- (x_test, x_train) A 561-feature vector with time and frequency domain variables. 
- (y_test, y_train) Its activity label. 
- (subject_test, subject_train)An identifier of the subject who carried out the experiment.
- for further details: read README.txt under downloaded folder


# Getting and cleaning data

- If input data is not already available in the `ProjectData` directory, it will be downloaded from UCI repository.
- The first step of the preprocessing is to merge the training and test sets. Two sets combined, there are 10,299 instances where each instance contains 561 features (560 measurements and subject identifier).
- Next, mean and standard deviation features are extracted for further processing. Out of 560 measurement features, 33 mean and 33 standard deviations features are extracted.
- Next, the activity labels are replaced with descriptive activity names, defined in `activity_labels.txt` by joining.
- Finally, it creates a tidy data set with the average of each variable for each activity and each subject.
- The tidy data set is exported to `UCI_HAR_tidy.txt' and 'UCI_HAR_tidy.csv` where the first row is the header containing the names for each column.
