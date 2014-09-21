#In Current working directory, checks for project data directory and creates one if it doesn't exist
if (!file.exists("ProjectData")){
    message("Creating data directory")
    dir.create("ProjectData")
}
#Setting current working directory to Project data directory
setwd("./ProjectData")

#load plyr library
library(plyr)

if (!file.exists("./UCI HAR Dataset")) {
    # download the data
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    zipfile="UCI_HAR_data.zip"
    message("Downloading data")
    download.file(fileURL, destfile=zipfile)
    unzip(zipfile, exdir=".")
}

#Get column names
#4. Appropriately labels the data set with descriptive variable names. 
#Note: By providing col.names, I labled columns, when extracting and creating table itself.
#To provide column names, I read from features.txt and create a vector of feature name.
feature.info <- read.table("./UCI HAR Dataset/features.txt", col.names=c("Feature_ID", "Feature_Name"))
feature.name <- feature.info[,2]

#read Train data into Table, with Column Names
#4. Appropriately labels the data set with descriptive variable names. 
#Note: By providing col.names, I labled columns, when extracting and creating table itself.
training.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names="Subject_ID")
training.y <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names="Activity_ID")
training.X <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=feature.name)
training.data.all = cbind(training.subject, training.y, training.X)

#4. Appropriately labels the data set with descriptive variable names. 
#Note: By providing col.names, I labled columns, when extracting and creating table itself.
test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names="Subject_ID")
test.y <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names="Activity_ID")
test.X <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=feature.name)
test.data.all = cbind(test.subject, test.y, test.X)

#1. Merges the training and the test sets to create one data set.
combo.data.all <- rbind(training.data.all, test.data.all)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
mean.col <- sapply(feature.name, function(x) grepl("mean()", x, fixed=T))
std.col <- sapply(feature.name, function(x) grepl("std()", x, fixed=T))
filtered.data <- combo.data.all[,(mean.col | std.col)]

#3. Uses descriptive activity names to name the activities in the data set
activity.info <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("Activity_ID", "Activity_Name"))
join.data <- join(activity.info, filtered.data,  by="Activity_ID")

#Check above for step #4

#5. From the data set in step 4, creates a second, independent tidy data set with the average of 
#   each variable for each activity and each subject.
tidy.data <- ddply(join.data, .(Subject_ID, Activity_Name), function(x) colMeans(x[,4:69]))
write.table(tidy.data, "UCI_HAR_tidy.txt", row.names=FALSE)
#For testing purpose, I created CSV file for easier view
write.csv(tidy.data, "UCI_HAR_tidy.csv", row.names=FALSE)