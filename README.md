# Getting and cleaning data project

### Coursera
### (https://class.coursera.org/getdata-013/human_grading/view/courses/973500/assessments/3/submissions)

## Abstract

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project:

(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


The goal of the project is to prepare tidy data that can be used for later analysis. 

## The project contains
1) a tidy data set and a second independent tidy data set, 
2) a link to a Github repository with my script for performing the analysis, 
3) a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data called [CodeBook.md].
Also, this [README.md] repo explains how all of the scripts work and how they are connected.

## The function of [run_analysis.R] 
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How to run this project
* clone this repo
* download compressed raw data, unzip, and copy the whole directory to the cloned repo directory
* run R and set the working directory to the repo directory
* run run_analysis.R script
