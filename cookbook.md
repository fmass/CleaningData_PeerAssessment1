
# Cookbook

This cookbook describes the variables, the tidy data set, and any transformations or work that I have performed to clean up the original data. The original data I transformed in this project was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description of this data set is available on the website where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

The original dat I used for this project was obtained through the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

Please also read the [README.txt](UCI HAR Dataset/README.txt) file for more information about the original data set.

## Transformations

The [run_analysis.R](run_analysis.R) program performs 5 steps to clean and transform the data into a tidy data set [tidyDataSet.txt](tidyDataSet.txt):

1. **In the first step, I merged the training and the test sets to create one data set.**
 - The program reads and merges the 'subject', 'X' and 'y' text files from the ***test*** and ***train*** data sets into three data frames **dataSubject** (for **subject_test.txt** and **subject_train.txt**), **dataActivity** (for **y_test.txt** and **y_train.txt**)' and **data** (for **X_test.txt** and **X_train.txt**).
   
2. **In the second step, I extracted only the measurements (features) on the mean and standard deviation for each measurement** (feature).
 - The program reads the [features.txt](UCI HAR Dataset/features.txt) to get all the possible features.
 - The program removes from the **data** data frame the features not related to a mean or a standard deviation.
 - The program renames the **data** columns using the filtered feature names.

3. **In the third step, I used descriptive activity names to name the activities in the data set**
 - The program reads the [activity_labels.txt](UCI HAR Dataset/activity_labels.txt) to get the actibity IDs and activity names.
 - The program renames the **dataActivity** column to prepare for the *join*
 - The program joins the data based on the activity ID and keeps the activity name column.
 
4. **In the fourth step, I appropriately labeled the data set with descriptive variable names.**
 - The program renames the **dataSubject** column before merging the three data frames.
 - The program merges the three data frames **dataSubject**, **data** and **dataActivity** into one.  
 - The program renames the column names of the tidy data set to comply with the convention discussed in the **Getting and Cleaning Data Course**.
 
5. **I created a second, independent tidy data set with the average of each variable for each activity and each subject.**
 - The program calculates the mean of each variable in **tidyData** (i.e., *lapply(.SD,mean)*) per activity and subject (i.e, *by="Subject,Activity"*). Note that *.SD* represents all the columns not in the grouping (i.e, *"Subject,Activity"*).
 - The program writes the tidy data set into [tidyDataSet.txt](tidyDataSet.txt) and removes the row name.

## Tidy Data Set

The resulting tidy data set [tidyDataSet.txt](tidyDataSet.txt) is the result of the above mentionned transformations. It contains 10299 rows and 68 variables. The 68 variables are described in the next section, where each of the variable representing a feature (the last 66 variables) is the average of each of the original feature variable per activity and subject.  

## Variables

As discribed above, I only kept in this tidy data set 68 variables from the original data set. The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. Here are the variables of [tidyDataSet.txt](tidyDataSet.txt).

**Subject**: The ID of the subjects (number).  
**Actvity**: The names of activity (string):    
  - STANDING           
  - SITTING            
  - LAYING             
  - WALKING            
  - WALKING_DOWNSTAIRS 
  - WALKING_UPSTAIRS

**Features**: (66 variables)

The orginal feature variable descriptions are specified in the [features_info.txt](UCI HAR Dataset/features_info.txt) file and the complete list of variables of each feature vector is available in [features.txt](UCI HAR Dataset/features.txt). Please also read the [README.txt](UCI HAR Dataset/README.txt) file for more information about the original data set.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

We only selected for the tidy data set features representing a mean and a standard deviation (66 features). After that we renamed these variables. For instance, the **tBodyAcc-mean()-X** (**tBodyAcc-std()-X**) was renamed to **tBodyAccMeanX** (**tBodyAccStdX**) to comply with the tidy data set convention discussed in the **Getting and Cleaning Data Course**. Moreover, these feature variables in the tidy data set are the average of their original feature per activity and subject.  For all these variables the units are the same as their corresponding variable found [features_info.txt](UCI HAR Dataset/features_info.txt) in the original data set. Here are the variables.

**tBodyAccMeanX**         
**tBodyAccMeanY**         
**tBodyAccMeanZ**         
**tBodyAccStdX**          
**tBodyAccStdY**          
**tBodyAccStdZ**          
**tGravityAccMeanX**      
**tGravityAccMeanY**      
**tGravityAccMeanZ**      
**tGravityAccStdX**       
**tGravityAccStdY**       
**tGravityAccStdZ**       
**tBodyAccJerkMeanX**     
**tBodyAccJerkMeanY**     
**tBodyAccJerkMeanZ**     
**tBodyAccJerkStdX**      
**tBodyAccJerkStdY**      
**tBodyAccJerkStdZ**      
**tBodyGyroMeanX**        
**tBodyGyroMeanY**        
**tBodyGyroMeanZ**        
**tBodyGyroStdX**         
**tBodyGyroStdY**         
**tBodyGyroStdZ**         
**tBodyGyroJerkMeanX**    
**tBodyGyroJerkMeanY**    
**tBodyGyroJerkMeanZ**    
**tBodyGyroJerkStdX**     
**tBodyGyroJerkStdY**     
**tBodyGyroJerkStdZ**     
**tBodyAccMagMean**        
**tBodyAccMagStd**         
**tGravityAccMagMean**     
**tGravityAccMagStd**      
**tBodyAccJerkMagMean**    
**tBodyAccJerkMagStd**     
**tBodyGyroMagMean**       
**tBodyGyroMagStd**        
**tBodyGyroJerkMagMean**   
**tBodyGyroJerkMagStd**    
**fBodyAccMeanX**         
**fBodyAccMeanY**         
**fBodyAccMeanZ**         
**fBodyAccStdX**          
**fBodyAccStdY**          
**fBodyAccStdZ**          
**fBodyAccJerkMeanX**     
**fBodyAccJerkMeanY**     
**fBodyAccJerkMeanZ**     
**fBodyAccJerkStdX**      
**fBodyAccJerkStdY**      
**fBodyAccJerkStdZ**      
**fBodyGyroMeanX**        
**fBodyGyroMeanY**        
**fBodyGyroMeanZ**        
**fBodyGyroStdX**         
**fBodyGyroStdY**         
**fBodyGyroStdZ**         
**fBodyAccMagMean**        
**fBodyAccMagStd**         
**fBodyBodyAccJerkMagMean**  
**fBodyBodyAccJerkMagStd**   
**fBodyBodyGyroMagMean**    
**fBodyBodyGyroMagStd**     
**fBodyBodyGyroJerkMagMean**  
**fBodyBodyGyroJerkMagStd**  
 
 