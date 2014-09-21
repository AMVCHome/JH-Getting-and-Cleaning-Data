# Introduction

The script `run_analysis.R`
- creats ProjectData folder if it does not exist.
- downloads the required data from: http://archive.ics.uci.edu/ml/index.html
- read downloaded files into data table and appropriately labels the columns with descriptive names
- (combo.data.all) merges (cbind and then rbing) the training and test sets to create one data set
- (filtered.data) extracts only the measurements (features) on the mean and standard deviation for each measurement
- (join.data) replaces `activity` values in the dataset with descriptive activity names by joining activity info
- (tidy.data) creates a second, independent tidy dataset with an average of each variable for each each activity and each subject. 
- (UCI_HAR_tidy.txt) The processed tidy data set is exported as txt and csv file for easy view.
  
# run_analysis.R

- The script assumes that `plyr` library is already installed.
- The script is sequenced to perfoem all the steps mentioned above in that order. 
- To excute, run this R file in any directory, where you have acess to write. 

# The original data set

- (test, train) The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
- (x_test, x_train) A 561-feature vector with time and frequency domain variables. 
- (y_test, y_train) Its activity label. 
- (subject_test, subject_train)An identifier of the subject who carried out the experiment.
- for further details: read README.txt under downloaded folder


# Getting and cleaning data

- If the data is not already available in the `ProjectData` directory, it is downloaded from UCI repository.
- The first step of the preprocessing is to merge the training and test sets. Two sets combined, there are 10,299 instances where each instance contains 561 features (560 measurements and subject identifier).
- Then mean and standard deviation features are extracted for further processing. Out of 560 measurement features, 33 mean and 33 standard deviations features are extracted.
- Next, the activity labels are replaced with descriptive activity names, defined in `activity_labels.txt` by joining.
- The final step creates a tidy data set with the average of each variable for each activity and each subject.
- The tidy data set is exported to `UCI_HAR_tidy.txt' and 'UCI_HAR_tidy.csv` where the first row is the header containing the names for each column.
