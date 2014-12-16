#Getting and Cleaning Data - Course project
### Coursera Data Science Specialization 

-----------------------------------------

This data set is based on the Human Activity Recognition Using Smartphones Dataset (v1.0) from www.smartlab.ws.  The HAR data set contains 30 subjects, each of which participated in 6 different activities while measurments from a phone on the subject were recorded.  Of the over 500 features available in the HAR data set, 64 were chosen to be summarized in this data set. Those features chosen were then averaged so that we have one record per subject*activity pair.

-----------------------------------------

This data set includes the following files:

- README.md - the file you are reading
- code_book.md - contains a description of column names as well as a full list of all columns
- run_analysis.R - R-script to calculate and write 'tidy_data.txt'
- tidy_data.txt - tidy data set containing the mean values of each feature chosen from the original data set for every combination of activity and subject_id

-----------------------------------------

For each record in the data set, the following are provided:

- activity_name: which of the 6 activities the record pertains to, can be one of:
	- STANDING
    - SITTING
    - LAYING
    - WALKING
    - WALKING_DOWNSTAIRS
    - WALKING_UPSTAIRS
- subject_id: which of the 30 subjects the data was recorded from
- 64 additional feature columns, each containing a summary statistic calculated from the original data set (see `code_book.md` for more)

-----------------------------------------

###NOTES:
1. When loading the measurement files (X_test.txt and X_train.txt), I use `check.names=F` to make sure that the column names are not altered (e.g. `mean()-Y` does not get changed to `mean...Y`)

2. We want to only keep the features that are the result of calculating a mean or standard deviation on some set of measurements from the phone.  When looking at all of the features available, finding `mean` or `std` in the name was not enough to filter by, as some features, such as `angle(tBodyGyroJerkMean,gravityMean)` and `fBodyBodyGyroJerkMag-meanFreq()` do not appear to fit the desired criteria (the first represents an angle, and the second a mean **frequency**, instead of a mean **value**.)  Therefore, only those feature names that include either `mean()` or `std()` are included in the list of features to keep.
