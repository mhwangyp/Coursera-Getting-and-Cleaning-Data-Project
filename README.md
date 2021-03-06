# Coursera-Getting-and-Cleaning-Data-Project #

# Description:

This repository hosts the R code and documentation files for Coursera's "Getting and Cleaning data" course project.

The dataset used is: "Human Activity Recognition Using Smartphones" 

# Files in this repo:

run_analysis.R contains all the code to perform the analyses described in the 5 steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity 

The output of this script is the tidy data set created from step 5 - the function read_tidy_set at the end of the script is created to output the tidy data set. 

CodeBook.md describes the variables, the data, and any transformations or work that was performed to clean up the data.



