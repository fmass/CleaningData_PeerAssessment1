---
output:
  html_document: default
  pdf_document:
    highlight: tango
---
## README

The goal of this projet is to prepare a tidy data set ([tidyDataSet.txt](tidyDataSet.txt)) that can be used for later analysis. The original data was collected from the accelerometers from the Samsung Galaxy S smartphone and was obtained through the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

Please also read this [README.txt](UCI HAR Dataset/README.txt) file for more information about the original data set.

To regenerate the [tidyDataSet.txt](tidyDataSet.txt) follow these steps.

1. If you do not have the original data set, download it from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Unzip the file and copy the [UCI HAR Dataset](UCI HAR Dataset) folder in the same folder as [run_analysis.R](run_analysis.R).  
2. Run the [run_analysis.R](run_ana ysis.R) program (using *R*) whichs the following.    
  2.1 Merge the training and the test sets to create one data set.   
  2.2 Extract only the measurements on the mean and standard deviation for each measurement.   
  2.3 Use descriptive activity names to name the activities in the data set.    
  2.4 Appropriately label the data set with descriptive variable names.    
  2.5 From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.    
3. This program will generate the [tidyDataSet.txt](tidyDataSet.txt) file.

For more information please read the [cookbook.md](cookbook.md).