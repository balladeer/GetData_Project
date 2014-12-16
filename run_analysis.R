### Getting and Cleaning Data Course Project

## This script assumes that the UCI HAR Dataset folder is in the current working directory
nrows <- -1  # Set to a number > 0 if you want to only read a part of each data set, -1 for full file


#=================================================================
# Load data
#=================================================================
## Load the feature names
features <- read.table("UCI HAR Dataset\\features.txt", col.names=c("number", "name"), stringsAsFactors=F)

## Load the testing data
test_df <- read.table("UCI HAR Dataset\\test\\X_test.txt", col.names=features$name, check.names=F, nrows=nrows)  # See code_book [1]
subject_test <- read.table("UCI HAR Dataset\\test\\subject_test.txt", col.names="subject_id", nrows=nrows)
activity_test <- read.table("UCI HAR Dataset\\test\\y_test.txt", col.names="value", nrows=nrows)

## Load the training data
train_df <- read.table("UCI HAR Dataset\\train\\X_train.txt", col.names=features$name, check.names=F, nrows=nrows)  # See code_book [1]
subject_train <- read.table("UCI HAR Dataset\\train\\subject_train.txt", col.names="subject_id", nrows=nrows)
activity_train <- read.table("UCI HAR Dataset\\train\\y_train.txt", col.names="value", nrows=nrows)


#=================================================================
# Filter and merge raw data sets
#=================================================================
## Keep only those columns that have "mean()" or "std()" in them
desired_features <- grep("mean\\(\\)|std\\(\\)", features$name, value=T)  # See code_book [2]
test_df <- test_df[, desired_features]
train_df <- train_df[, desired_features]

## Convert the filtered column names to valid variable names, so that we can reshape later
valid_features <- make.names(desired_features, unique=T)
names(test_df) <- valid_features
names(train_df) <- valid_features

## Add in the subject ID (from subject_test.txt and subject_train.txt)
test_df$subject_id <- subject_test$subject_id
train_df$subject_id <- subject_train$subject_id

## Add in the activity categories as a new column in both the test and train data sets
test_df$activity_id <- activity_test$value
train_df$activity_id <- activity_train$value

## Merge the test and train data.frames into one data.frame
full_df <- rbind(test_df, train_df)

## Add in the activity names as a factor variable
activity <- read.table("UCI HAR Dataset\\activity_labels.txt", col.names=c("id", "names"), stringsAsFactors=F)
full_df$activity_name <- factor(full_df$activity_id, labels=activity$names)


#=================================================================
## Create new, tidy data set: split the data by activity_name and subject_id, then get the mean for each feature in "valid_features"
#=================================================================
library(plyr)
tidy <- ddply(full_df, c("activity_name", "subject_id"), colwise(mean, .cols=valid_features))


#=================================================================
# Convert the feature-names into more meaningful names
#=================================================================
## Cleanup
final_feature_names <- gsub("\\.*", "", valid_features)  # Remove all periods, we'll add them back in in more appropriate spots later
final_feature_names <- gsub("BodyBody", "Body", final_feature_names)  # Replace the erroneous 'BodyBody' with 'Body'
final_feature_names <- gsub("mean(.*?$)", "\\1mean", final_feature_names)  # Move the originally estimated 'mean' to the end of the name (for later use)
final_feature_names <- gsub("std(.*?$)", "\\1std", final_feature_names)  # Move the originally estimated 'std' to the end of the name (for later use)

## Domain - 'time' or 'frequency'
final_feature_names <- gsub("^t", "time.", final_feature_names)  # Replace 't' with 'time.', e.g. tBodyAcc --> time.BodyAcc
final_feature_names <- gsub("^f", "frequency.", final_feature_names)  # Replace 'f' with 'frequcney', e.g. fBodyAcc --> frequency.BodyAcc

## Signal sources and measurment names
## Sources: body, gravity, or gyro
## Measurments: linear_acceleration, angular_velocity, or jerk
final_feature_names <- gsub("BodyAccJerk", "body.jerk.", final_feature_names)
final_feature_names <- gsub("BodyGyroJerk", "gyro.jerk.", final_feature_names)
final_feature_names <- gsub("BodyGyro", "gyro.angular_velocity.", final_feature_names)
final_feature_names <- gsub("BodyAcc", "body.linear_acceleration.", final_feature_names)
final_feature_names <- gsub("GravityAcc", "gravity.linear_acceleration.", final_feature_names)

# Axis - x, y, z, or magnitude
final_feature_names <- gsub("X", "x.", final_feature_names)
final_feature_names <- gsub("Y", "y.", final_feature_names)
final_feature_names <- gsub("Z", "z.", final_feature_names)
final_feature_names <- gsub("Mag", "magnitude.", final_feature_names)

# Original summary estimation ('mean' or 'std') are already in the right place

# Add the type of summary statistic calculated specifically for this data set (mean, in all cases)
final_feature_names <- paste("mean.", final_feature_names, sep="")

# Apply the final_features names to the tidy dataset
names(tidy) <- append(c("activity_name", "subject_id"), final_feature_names)
names(tidy)

## Write tidy data set to file
write.table(tidy, "tidy_data.txt", row.names=F)
