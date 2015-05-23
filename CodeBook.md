## Getting and Cleaning Data Course Project CodeBook ##

This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.  
* The data used for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The run_analysis.R script performs the following steps to clean the data:   

##  Reads data.
  Read "X_train.txt", "Y_train.txt" and "subject_train.txt" from the "./data/train" folder and store them in `DataTrain`, `LabelTrain` and `SubjectTrain` variables respectively.       
  Read "X_test.txt", "Y_test.txt" and "subject_test.txt" from the "./data/test" folder and store them in `DataTest`, `LabelTest` and `SubjectTest` variables respectively.  

#1.  Merges the training and the test sets to create one data set.
  Combine `LabelTest` to `LabelTrain` by row to generate `JoinLabel`, a 10299x1 data frame; combine `SubjectTest` to `SubjectTrain` by row to generate `JoinSubject`, a 10299x1 data frame; combine `DataTest` to `DataTrain` by row to generate `JoinData`, a 10299x561 data frame.  

#2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
  Read the "features.txt" file from the "/data" folder and store the data in a variable called `Features`. 
  I only extracted the measurements on the mean and standard deviation - this results in a 66 indices list, which is a subset of `JoinData` with the 66 corresponding columns, stored in a variable called `MStdIndices`.  
  Update `JoinData` variable with the 66 columns of extracted data.
  
#3.  Uses descriptive activity names to name the activities in the data set.
  Read the "activity_labels.txt" file from the "./data"" folder and store the data in a variable called `ActivityLabel`. 
  Clean the activity names in the second column of `ActivityLabel`. Transform the values of `JoinLabel` according to `ActivityLabel` dataframe.

#4.  Appropriately labels the data set with descriptive variable names.  
  Combine the `JoinSubject`, `JoinLabel` and `JoinData` by column to get a new cleaned 10299x68 data frame, `nData`. Properly name the first two columns, "Subject" and "Activity". 
  The "Subject" column contains integers that range from 1 to 30 inclusive; the "Activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.  

#5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  Write the `nData` out to "merged_data.txt" file in current working directory.  
  Generate a second independent tidy data set using  `aggregate` function in library(plyr) and store it in a variable called Data2.
  Finally, write the `Data2` out to "tidydata.txt" file in current working directory. 
  
#6.  Writes function to output tidy data set created from step 5
  Write a loop function `read_tidy_set` to make sure the entire run_analysis.R script outputs tidydata.txt in the end.
 
