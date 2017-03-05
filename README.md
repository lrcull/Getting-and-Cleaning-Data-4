# Getting-and-Cleaning-Data-4

Within the code file run_analysis.R, a folder was created titled R Programming Assignments. 
Data collected from wearable accelerometers linked to the Samsung Galaxy S smartphone were downloaded and unzipped from the following link: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Read files for x_train, y_train, x_test, y_test, features, and activity_labels into run_analysis.R.

The assignment requires creation of a script that does the following:
1.	Merges the training and the test sets to create one data set.

Merge the test and train data using rbind(). Also merge the test and train labels and test and train subjects using rbind().

Column names were also added at this point, using colnames(), to make the data easier to read should it be necessary to view the data. Use View() to see the table.

Merge all columns together using cbind().

2.	Extracts only the measurements on the mean and standard deviation for each measurement.

Load dplyr library and use select() to extract the columns for mean and standard deviation. If running the code results in an error, remove duplicated columns and run select() again.

3.	Uses descriptive activity names to name the activities in the data set.

Merge subject, activity, mean, and standard deviation using cbind().

Substitute the numbers found in the Activity column with the corresponding names found in the activity_labels file. 

4.	Appropriately labels the data set with descriptive variable names.

The columns and activities have appropriate labels. Further explanation of variables can be found in the Code Book.

5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Extract the mean of each variable measurement for activity and subject using group_by() and summarise_each().
