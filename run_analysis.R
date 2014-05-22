## get the data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile="Data.zip", method="curl")
uzip("Data.zip")
## load and clean features to be used as column names for both datasets
features <- read.table("./Data/features.txt")
coln <- gsub("(\\.)+$", "", make.names(features[, 2]))  # remove end dots
coln <- gsub("\\.+", ".", coln)  # remove consecutive dots
## load test dataset
test <- read.table("./Data/test/X_test.txt", strip.white=T)
colnames(test) <- coln  ## features are not unique, so i don't use col.names
## load train dataset
train <- read.table("./Data/train/X_train.txt", strip.white=T)
colnames(train) <- coln
## 1) Merges the training and the test sets to create one data set.
allData <- rbind(test, train)
## 2) Extracts only the measurements on the mean and standard deviation for
## each measurement.
meanAndSdIndex <- c(grep("mean", features[, 2]), grep("std", features[, 2]))
meanAndSd <- allData[, meanAndSdIndex]
## 3) Uses descriptive activity names to name the activities in the data set
activity <- read.table("Data/activity_labels.txt", col.names=c("lable","name"))
activityTest <- read.table("Data/test/y_test.txt", col.names="lable")
activityTrain <- read.table("Data/train/y_train.txt", col.names="lable")
allActivity <- rbind(activityTest, activityTrain)
allActivity <- merge(activity, allActivity, by="lable")
allData <- cbind(allData, activity=allActivity)
write.table(allData, file = "Data.txt")
## 4) Appropriately labels the data set with descriptive activity names.
subjectTest <- read.table("./Data/test/subject_test.txt", col.names="subject")
subjectTrain <- read.table("./Data/train/subject_train.txt", col.names="subject")
allSubject <- rbind(subjectTest, subjectTrain)
allData <- cbind(allData, allSubject)
## 5) Creates a second, independent tidy data set with the average of each
## variable for each activity and each subject.
newData <- allData[, c(1:562,564)]   ## exclude activity names
newData <- aggregate(newData, by=list(allData$activity.lable, allData$subject),
                     FUN=mean)
newData <- newData[, 3:ncol(newData)]  ## first two columns are redundent
write.table(newData, file = "Datamean.txt")
