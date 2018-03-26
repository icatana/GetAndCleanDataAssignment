# Getting and Cleaning Data Course Project

## Objective
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 

## Content
The content of this repository is : 
1) a tidy data set called [tidy_dataset.txt](https://github.com/icatana/GetAndCleanDataAssignment/blob/master/tidy_dataset.txt) obtained from the original data set described below. In addition a csv file [tidy_dataset.csv](https://github.com/icatana/GetAndCleanDataAssignment/blob/master/tidy_dataset.csv) is also provided.
2) a R script [run_analysis.R](https://github.com/icatana/GetAndCleanDataAssignment/blob/master/run_analysis.R) that does all the data sets treatments
3) a code book called [CodeBook.md](https://github.com/icatana/GetAndCleanDataAssignment/blob/master/CodeBook.md) that describes the variables, the data, and any transformations or work performed to clean up the data.

## Description

### Origin of the Data Set
This project it concerns one of the most exciting areas in all of data science right now, and this is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 

The data linked to from this project represents data collected from the accelerometers from the Samsung Galaxy S smartphone. 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the following data was captured: 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### R script functionality
The R script [run_analysis.R](https://github.com/icatana/GetAndCleanDataAssignment/blob/master/run_analysis.R) does the following:
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set.
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
