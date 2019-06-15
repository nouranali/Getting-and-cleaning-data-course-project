# run_analysis.R

library(dplyr)

##Getting data from zip file
zipfile <- "UCI_HAR_Dataset.zip"
if (!file.exists(zipfile)){
   zipurl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
   download.file(zipurl,zipfile,method = "curl")
   }
dataname<- "UCI HAR Dataset"
if(!file.exists(dataname)){
        unzip(zipfile)
}
##Reading data

#features
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))

activity<- read.table("UCI HAR Dataset/activity_labels.txt",col.names = c("code", "activity"))
#training
trainsubj <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names = "subject")
trainvalues <- read.table("UCI HAR Dataset/train/X_train.txt",col.names = features$functions)
trainact <- read.table("UCI HAR Dataset/train/Y_train.txt",col.names = "code")

#testa
testsubj <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
testvalues <- read.table("UCI HAR Dataset/test/X_test.txt",col.names = features$functions)
testact <- read.table("UCI HAR Dataset/test/Y_test.txt",col.names = "code")

#colnames(activity) <- c("activityId", "activitylabel")

##Step 1 : merge training and test

X<- rbind(trainvalues,testvalues)
Y<-rbind(trainact,testact)
subject <-rbind(trainsubj,testsubj)
merged_res <- cbind(X,Y,subject)
##step2 : Extract

tidydata<- merged_res%>%select(subject,code,contains("mean"),contains("std"))

##step3 : Uses descriptive activity names to name the activities in the data set
tidydata$code <- activity[tidydata$code,2]
##step4 :Appropriately labels the data set with descriptive variable names
names(tidydata[2]) <- "activity"
names(tidydata) <- gsub("Acc","Accelerometer",names(tidydata))
names(tidydata) <- gsub("Gyro","Gyroscope",names(tidydata))
names(tidydata) <- gsub("Mag","Magnitude",names(tidydata))
names(tidydata) <- gsub("BodyBody","Body",names(tidydata))
names(tidydata) <- gsub("^t","Time",names(tidydata))
names(tidydata) <- gsub("^f","frequency",names(tidydata))
names(tidydata)<-gsub("tBody", "TimeBody", names(tidydata))
names(tidydata)<-gsub("-mean()", "Mean", names(tidydata), ignore.case = TRUE)
names(tidydata)<-gsub("-std()", "STD", names(tidydata), ignore.case = TRUE)
names(tidydata)<-gsub("-freq()", "Frequency", names(tidydata), ignore.case = TRUE)
names(tidydata)<-gsub("angle", "Angle", names(tidydata))
names(tidydata)<-gsub("gravity", "Gravity", names(tidydata))

##step5: final data set
finalds<- tidydata%>% group_by(subject,code)%>%
        summarise_all(funs(mean))
write.table(finalds,"Final.txt",row.names = F)