---
title: "Readme"
author: "János Gutmayer"
date: "Friday, October 24, 2014"
output: html_document
---

# Getting and cleaning data - Course project


The R script called run_analysis.R that does the following.

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement.
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive activity names.
  5. Creates a second, independent tidy data set with the average of each variable for each activity 




# Steps taken in run_analysis.r

  1. Dowloanding data, unzip in the current working directory (creating the subfolder UCI HAR Dataset containing the .txt files for the analysis)
  2. Import the .txt files
  3. Setting the proper variable names, selecting relevant variables for further steps
  4. Merging training and testing data sets
  5. Creating new tidy data set with means for the selected variables for each activity
  6. Write tidy_data.txt file into the working directory

