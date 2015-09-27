## data
The input data are 8 files following.

./UCI HAR Dataset/features.txt
./UCI HAR Dataset/activity_labels.txt
./UCI HAR Dataset/train/X_train.txt
./UCI HAR Dataset/train/Y_train.txt
./UCI HAR Dataset/train/subject_train.txt
./UCI HAR Dataset/test/X_test.txt
./UCI HAR Dataset/test/Y_test.txt
./UCI HAR Dataset/test/subject_test.txt


## processes
1.Add activity(Y_train.txt) and subject(subject_train.txt) columns in trainSet(X_train.txt).
  Labels the data set with descriptive variable names.
  The same as testSet.

2.Get the mean value and standard deviation of these signals:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

  Get the column numbers from features.txt.
  It is column
  1:6,41:46,81:86,121:126,161:166,
  201:202,214:215,227:228,240:241,253:254,
  266:271,345:350,424:429,
  503:504,516:517,529:530,542:543

3.Change the activityID into activity Name by activity_labels.txt

4.get a new tidy data set with the average of each variable for each activity and each subject.


## a new tidy data set variables
It is the average of mean and standard deviation of the following variable.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag


