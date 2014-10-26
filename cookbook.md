
# Cookbook

This cookbook describes the variables, the tidy data set, and any transformations or work that I have beed performed to clean up the original data. The original data we transformed in this project represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description of this data sey is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

The original data we used for this project was obtained with the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

Please also read the [README.txt](UCI HAR Dataset/README.txt) file for more information about the original data set.

## Transformations

The [run_analysis.R](run_analysis.R) program performs 5 steps to clean and transform the data into a tidy data set [tidyDataSet.txt](tidyDataSet.txt):

1. **In the first step, we merged the training and the test sets to create one data set.**
 - We read and merge the 'subject', 'X' and 'y' text files from the ***test*** and ***train*** data set into three data frames **dataSubject** (for **subject_test.txt** and **subject_train.txt**), **dataActivity** (for **y_test.txt** and **y_train.txt**)' and **data** (for **X_test.txt** and **X_train.txt**).
   
2. **In the second step, we extracted only the measurements (features) on the mean and standard deviation for each measurement** (feature).
 - We read the [features.txt](UCI HAR Dataset/features.txt) to get all the possible features.
 - We filtered the feature representing a mean and a standard deviation using regular expressions.
 - We removed from the **data** data frame the features not related to a mean or a standard deviation.
 - We renamed the **data** columns using the filtered feature names.

3. **In the third step, we used descriptive activity names to name the activities in the data set**
 - We read the [activity_labels.txt](UCI HAR Dataset/activity_labels.txt) to get the actibity IDs and activity names.
 - We renamed the **dataActivity** column to prepare for the *join*
 - We joined the data based on the activity ID and keep the activity name column.
 
4. **In the fourth step, we appropriately labeled the data set with descriptive variable names.**
 - We renamed the **dataSubject** column before merging the three data frames.
 - We merged the three data frames **dataSubject**, **data** and **dataActivity** into one.  
 - We renamed the column names of the tidy data set to comply to the convention discussed in the *Getting and Cleaning Data Course*.
 
5. **We created a second, independent tidy data set with the average of each variable for each activity and each subject.**
 - We calculated the mean of each variable in **tidyData** (i.e., *lapply(.SD,mean)*) per activity and subject (i.e, *by="Subject,Activity"*). Note that *.SD* represents all the columns not in the grouping (i.e, *"Subject,Activity"*).
 - We wrote the tidy data set into [tidyDataSet.txt](tidyDataSet.txt) and removed the row name.

## Tidy Data Set

The resulting tidy data set [tidyDataSet.txt](tidyDataSet.txt) is the result of the above mentionned transformations. It contains 10299 rows and 68 variables. The 68 variables are described in the next section, where each of the variable representing a feature (the last 66 variables) is the average of each of the original feature variable per activity and subject.  

## Variables

As discribed above we only kept in this tidy data set 68 variables from from the original data set. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. Here are the vairable of [tidyDataSet.txt](tidyDataSet.txt).


1. **Subject**: The ID of the subjects. 
2. **Actvity**: The names of activity:  
  - STANDING           
  - SITTING            
  - LAYING             
  - WALKING            
  - WALKING_DOWNSTAIRS 
  - WALKING_UPSTAIRS

**Features**: (66 variables)

The orginal feature variable descriptions are specified in the [features_info.txt](UCI HAR Dataset/features_info.txt) file and the complete list of variables of each feature vector is available in [features.txt](UCI HAR Dataset/features.txt). Please also read the [README.md](UCI HAR Dataset/README.md) file for more information about the original data set.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

We only selected for the tidy data set features representing a mean and a standard deviation (66 features). After that we renamed these variables. For instance, the *tBodyAcc-mean()-X* (*tBodyAcc-std()-X*) as been renamed to *tBodyAccMeanX* (*tBodyAccStdX*) to comply to the tidy data set convention discussed in the *Getting and Cleaning Data Course*. Moreover, these feature variables in the tidy data set are the average of its original feature per activity and subject. Here are the variables. 

 tBodyAccMeanX            tBodyAccMeanY           
 tBodyAccMeanZ            tBodyAccStdX             tBodyAccStdY             tBodyAccStdZ            
 tGravityAccMeanX         tGravityAccMeanY         tGravityAccMeanZ         tGravityAccStdX         
 tGravityAccStdY          tGravityAccStdZ          tBodyAccJerkMeanX        tBodyAccJerkMeanY       
 tBodyAccJerkMeanZ        tBodyAccJerkStdX         tBodyAccJerkStdY         tBodyAccJerkStdZ        
 tBodyGyroMeanX           tBodyGyroMeanY           tBodyGyroMeanZ           tBodyGyroStdX           
 tBodyGyroStdY            tBodyGyroStdZ            tBodyGyroJerkMeanX       tBodyGyroJerkMeanY      
 tBodyGyroJerkMeanZ       tBodyGyroJerkStdX        tBodyGyroJerkStdY        tBodyGyroJerkStdZ       
 tBodyAccMagMean          tBodyAccMagStd           tGravityAccMagMean       tGravityAccMagStd       
 tBodyAccJerkMagMean      tBodyAccJerkMagStd       tBodyGyroMagMean         tBodyGyroMagStd         
 tBodyGyroJerkMagMean     tBodyGyroJerkMagStd      fBodyAccMeanX            fBodyAccMeanY           
 fBodyAccMeanZ            fBodyAccStdX             fBodyAccStdY             fBodyAccStdZ            
 fBodyAccJerkMeanX        fBodyAccJerkMeanY        fBodyAccJerkMeanZ        fBodyAccJerkStdX        
 fBodyAccJerkStdY         fBodyAccJerkStdZ         fBodyGyroMeanX           fBodyGyroMeanY          
 fBodyGyroMeanZ           fBodyGyroStdX            fBodyGyroStdY            fBodyGyroStdZ           
 fBodyAccMagMean          fBodyAccMagStd           fBodyBodyAccJerkMagMean  fBodyBodyAccJerkMagStd  
 fBodyBodyGyroMagMean     fBodyBodyGyroMagStd      fBodyBodyGyroJerkMagMean fBodyBodyGyroJerkMagStd
 
 