library(plyr)
library(data.table)

#1. Merges the training and the test sets to create one data set.

#Usefull variables to read the data
type <- c("test", "train")
directory <- "source/"

#Empty data frames
dataSubject <- data.frame()
dataActivity <- data.frame()
data <- data.frame()

#Read and merge the 'subject', 'X' and 'y' from the test and train data set into three data frames 
#'dataSubject', 'dataActivity' and 'data'. 

  for(t in type) 
  {

    subjects <- read.table(paste(directory,t,"/subject_",t, ".txt", sep =""))
    X <- read.table(paste(directory,t,"/x_",t, ".txt", sep =""))
    y <- read.table(paste(directory,t,"/y_",t, ".txt", sep ="")) 
  
    dataSubject<-rbind(dataSubject,subjects) 
    dataActivity<-rbind(dataActivity,y)
    data <- rbind(data,X)
  
  }
  
#2. Extracts only the measurements on the mean and standard deviation for each measurement.

features<-read.table(paste(directory,"features.txt", sep =""), header = FALSE, col.names = c("FeatureNum", "Feature"))
indices <- grep("mean\\(\\)|std\\(\\)", features[, "Feature"])
data <- data[,indices]
names(data) <- features$Feature[indices]

#3. Uses descriptive activity names to name the activities in the data set

activityLabels<-read.table(paste(directory,"activity_labels.txt", sep =""), header = FALSE, col.names = c("ActivityNum", "Activity"))
names(dataActivity) <- c("ActivityNum")
dataActivity<-join(dataActivity, activityLabels, by="ActivityNum")["Activity"]


#4. Appropriately labels the data set with descriptive variable names. 
names(dataSubject) <- c("Subject")
tidyData <- data.table(cbind(dataSubject, dataActivity, data))
setnames(tidyData, gsub("mean","Mean", gsub("std", "Std", (gsub("[-\\(\\)]", "", names(tidyData))))))
#write.table(tidyData, "firstTidyDataSet.txt", row.name=FALSE)

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

meanTidyData <- tidyData[,lapply(.SD,mean), by="Subject,Activity"]
write.table(meanTidyData, "tidyDataSet.txt", row.name=FALSE)

