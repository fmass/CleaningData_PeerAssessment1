
# Cookbook

This cookbook describes the variables, the tidy data set, and any transformations or work that I have performed to clean up the original data. The original data we transformed in this project represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description of this data sey is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

The original data we used for this project was obtained with the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

Please also read the [README.md]("./UCI HAR Dataset/README.md") file for more information about the original data set.

## Transformations

The **run_analysis.R** script performs the 5 steps to clean and transform the data into a tidy data set:

1. **In the first step, we merges the training and the test sets to create one data set.**
 - We read and merge the 'subject', 'X' and 'y' text files from the ***test*** and ***train*** data set into three data frames *dataSubject* (for *subject_test.txt* and *subject_train.txt*), *dataActivity* (for *y_test.txt* and *y_train.txt*)' and *data* (for *X_test.txt* and *X_train.txt*). 
   
2. **In the second step, we extract only the measurements (features) on the mean and standard deviation for each measurement** (feature).
 - We read the *features.txt* to get all the possible features.
 - We filter the feature representing a mean and a standard deviation usign regular expressions.
 - We remove from the *data* data frame the features not related to a mean or a standard deviation.
 - We rename the *data* columns using the filtered feature names.

3. **In the third step, we use descriptive activity names to name the activities in the data set**
 - We read the *activity_labels.txt* to get the actibity ID and activity name.
 - We rename the *dataActivity* column to prepare for the *join*
 - We join the data based on the activity ID and keep the activity name column.
 
4. **In the fourth step, we appropriately labels the data set with descriptive variable names.**
 - We rename the *dataSubject* column before merging the three data frames.
 - We merge the three data frames *dataSubject*, *data* and *dataActivity*.  
 - We rename the column names of the tidy data set to comply to the convention discussed in the *Getting and Cleaning Data Course*.
 
5. **We create a second, independent tidy data set with the average of each variable for each activity and each subject.**
 - We calculate the mean of each variable in *tidyData* (i.e., *lapply(.SD,mean)*) per activity and subject (i.e, *by="Subject,Activity"*). Note that *.SD* represent all the columns not in the grouping (i.e, *"Subject,Activity"*).
 - We write the tidy data set into *tidyDataSet.txt* and remove the row name.

## Tidy Data Set

The resulting tidy data set *tidyDataSet.txt* is the result of the above mentionned transformations. It contains 68 variables, described in the next section, where each of the variable representing a feature (66 variables) is the average of each of the original feature variable per activity and subject.  

## Variables

As discribed above we only kept in this tidy data set these variables (68 variables) taken from the original data set.

**Subject**: The ID of the subjects.  
**Actvity**: The names of activity:  
  - STANDING           
  - SITTING            
  - LAYING             
  - WALKING            
  - WALKING_DOWNSTAIRS 
  - WALKING_UPSTAIRS

**Features**: (66 variables)

The orginal measure variable descriptions are specified in the [features_info.txt]("./UCI HAR Dataset/features_info.txt") file and the complete list of variables of each feature vector is available in [features.txt]("./UCI HAR Dataset/features.txt"). Please also read the [README.md]("./UCI HAR Dataset/README.md") file for more information about the original data set.

For instance, the *tBodyAcc-mean()-X* (*tBodyAcc-std()-X*) as been renamed to *tBodyAccMeanX* (*tBodyAccStdX*) to comply to the tidy data set convention discussed in the *Getting and Cleaning Data Course*. Moreover, these feature variables are the average of each variable for each activity and each subject. 