library(plyr)
# 1.Merges the training and the test sets to create one data set
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
xData <- rbind(xTrain, xTest)
yData <- rbind(yTrain, yTest)
subjData <- rbind(subjTrain, subjTest)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement
ft <- read.table("UCI HAR Dataset/features.txt")
mean_and_std_ft <- grep("-(mean|std)\\(\\)", ft[, 2])
xData <- xData[, mean_and_std_ft]
names(xData) <- ft[mean_and_std_ft, 2]

# 3.Uses descriptive activity names to name the activities in the data set
acty <- read.table("UCI HAR Dataset/activity_labels.txt")
yData[, 1] <- acty[yData[, 1], 2]
names(yData) <- "activity"

# 4.Appropriately labels the data set with descriptive variable names
names(subjData) <- "subject"
allData <- cbind(xData, yData, subjData)

# 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject
avgData <- ddply(allData, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(avgData, "second_dataset.txt", row.name=FALSE)