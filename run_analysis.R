# load data
features <- read.table("./UCI HAR Dataset/features.txt")
activity <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                       col.names = c("activityID", "activity"))

trainSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainSetLabels <- read.table("./UCI HAR Dataset/train/Y_train.txt")
trainSetSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                               col.names = "subject")

testSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
testSetLabels <- read.table("./UCI HAR Dataset/test/Y_test.txt")
testSetSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                              col.names = "subject")


## 1.Merges the training and the test sets to create one data set.
# merge train sets and test sets
names(trainSet) <- features$V2
trainSet$activityID <- trainSetLabels$V1
trainSet$subject <- trainSetSubjects$subject

names(testSet) <- features$V2
testSet$activityID <- testSetLabels$V1
testSet$subject <- testSetSubjects$subject

mergeSet <- rbind(trainSet, testSet)


## 2.Extracts only the measurements on the mean and standard deviation for each 
##   measurement.
# the column numbers of mean and sd are from features.txt
# 562 is activity ID and 563 is subject
meanANDsdSet = mergeSet[,c(1:6,41:46,81:86,121:126,161:166,
                 201:202,214:215,227:228,240:241,253:254,
                 266:271,345:350,424:429,
                 503:504,516:517,529:530,542:543,
                 562:563)]


## 3.Uses descriptive activity names to name the activities in the data set
# add activity name
meanANDsdSet <- merge(meanANDsdSet,activity,by="activityID",all=TRUE)
# delete activity ID
meanANDsdSet <- meanANDsdSet[,2:69]


## 4.Appropriately labels the data set with descriptive variable names.
# have done in step 1


## 5.From the data set in step 4, creates a second, independent tidy data set
##   with the average of each variable for each activity and each subject.
s <- split(meanANDsdSet,meanANDsdSet[,67:68])
# the columns of tidyDataSet : subject.activity
# the rows of tidyDataSet : each variable
# each cell of tidyDataSet : the average of one variable for one activity and
#                            one subject
tidyDataSet <- sapply(s, function(x) colMeans(x[,1:66]))
# row-column exchange, for meets the tidy data principles(Each variable you
# measure should be in one column, Each different observation of that variable
# should be in a different row)
tidyDataSet <- t(tidyDataSet)


## export data set as a txt file created with write.table() using row.name=FALSE
write.table(tidyDataSet, file = "tidyData.txt", row.names = FALSE)
