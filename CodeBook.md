# Getting and cleaning data project

### Coursera
### (https://class.coursera.org/getdata-013/human_grading/view/courses/973500/assessments/3/submissions)


## CodeBook
This code book describe the variables, the data, and any transformations or work that were performed to clean up the data.


## Raw data
Source of the raw data:
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
Full Description at the site where the data was obtained:
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


## Variables

### The first tidy data set includes variables:
text_x - table contents of X_test.txt
train_x - table contents of X_train.txt
text_s - table contents of subject_test.txt
train_s - table contents of subject_train.txt
text_y - table contents of Y_test.txt
train_y - table contents of Y_train.txt
featurelabels - table contents of features.txt
test_raw - combined raw test data
train_raw - combined raw train data
data1 - merged train and test data
data1meanstd - extracted measurements on the mean and standard deviation for each measurement
activitylabels - descriptive activity names

### The second tidy data set includes the variable:
data2 - tidy data set with the average of each variable for each activity and each subject


## Data

### The first tidy data set: data1meanstd
* A 10299X68 data frame
* The first 66 columns are measurements
* The second last column is subject ID, from 1 to 30.
* The last column contains activity names.

### The second tidy data set
* A 180X68 data frame
* The first column is subject ID, from 1 to 30.
* The second column contains activity names.
* The last 66 columns are measurements. 


## Transformation of work
The script [run_analysis.R] performs the following transformations:
1. Merge the training and test sets to create one data set.
2. Reads [features.txt] and uses only the measurements on the mean and standard deviation for each measurement.
3. Reads [activity_labels.txt] and names the activities in the data set.
4. Labels the data set with descriptive names.
5. [final tidy data.txt] stores the final tidy data set where numeric variables are averaged for each activity and each subject.


