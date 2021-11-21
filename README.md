## Submission for Getting and Cleaning Data course project
Submitted by: MIN THEIN AUNG

The repo contains run_analysis.R script which download "Human Activity Recognition Using Smartphones Dataset" from UCI Maching Learning Repository. The link for the dataset is: "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".

===================================================================================================
Human Activity Recognition Using Smartphones Dataset
===================================================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

===================================================================================================

The downloaded dataset contains:

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

===================================================================================================

### Data Processing

After downloading the dataset, the script transform the data in the following order:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Add descriptive activity names

4. Labels the data set with descriptive variable names. 

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

6. Write "df_summary.txt" file for requirement in step 5.
