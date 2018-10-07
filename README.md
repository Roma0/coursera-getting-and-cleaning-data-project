# Coursera *Getting and Cleaning Data* course project

## Project Backgroud

One of the most exciting areas in all of data science right now is wearable computing - see for [example article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

In this poject, the source data was collected from the accelerometers from the Samsung Galaxy S smartphone for Human Activity Recognition and described as follows:

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

A full description is available at the [website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the [source data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) was obtained. 

## This repository contains the following files:

- `README.md`, this file, which gives an overview of the project and explains the connection of all the files in the repo.
- `run_analysis.R`, R script, which provides performing the analysis as following:
1. Retrives the data and load into R.
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Uses descriptive activity names to name the activities in the data set.
5. Appropriately labels the data set with descriptive variable names.
6. From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- `tidy_data.txt`, the tidy data set file .
- `CodeBook.md`, the code book file, which describes the contents of the tidy data set(variables, the data, and transformations used to generate the data).

The `tidy_data.txt` in this repository was created by running `run_analysis.R` script with R *version 3.3.3 (2017-03-06)* on *x86_64-apple-darwin13.4.0* platform.


