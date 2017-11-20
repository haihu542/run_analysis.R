##download the file

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="Dataset.zip")

##unzip the file

unzip(zipfile="Dataset.zip",exdir="./data")

##Read in training set

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
sub_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

##Read in test set

x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
sub_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

##Read in features

features <- read.table('./data/UCI HAR Dataset/features.txt')

##Read in activities

activities = read.table('./data/UCI HAR Dataset/activity_labels.txt')

## Name Columns

colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(sub_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(sub_test) <- "subjectId"

colnames(activities) <- c('activityId','activityType')

##Merge training and test sets into one data set

merge_training <- cbind(y_train, sub_train, x_train)
merge_test <- cbind(y_test, sub_test, x_test)
oneset <- rbind(merge_training, merge_test)

##Extract measurements on the mean and std for each measurement

##Read in column names

colNames <- colnames(oneset)

mean_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

##Subset from oneset

subset_mean_std <- oneset[ , mean_std == TRUE]

##Apply descriptive activity names

setactivities <- merge(subset_mean_std, activities,
                              by='activityId',
                              all.x=TRUE)

##Create second tidy data set with average of each variable for each activity and subject

tidyset2 <- aggregate(. ~subjectId + activityId, setactivities, mean)
tidyset2 <- tidyset2[order(tidyset2$subjectId, tidyset2$activityId),]

write.table(tidyset2, "TidySet2.txt", row.name=FALSE)

