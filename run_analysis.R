## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation 
##    for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each 
##    variable for each activity and each subject.

# Obtain the data path
path_raw <- file.path(getwd(), "UCI HAR Dataset")
path_test_raw <- file.path(path_raw,"test")
path_train_raw <- file.path(path_raw,"train")


#  Read the raw data and the data labels
test_x <- read.table(file.path(path_test_raw,"X_test.txt"))
train_x <- read.table(file.path(path_train_raw,"X_train.txt"))

test_s <- read.table(file.path(path_test_raw,"subject_test.txt"))
train_s <- read.table(file.path(path_train_raw,"subject_train.txt"))

test_y <- read.table(file.path(path_test_raw,"Y_test.txt"))
train_y <- read.table(file.path(path_train_raw,"Y_train.txt"))

featurelabels <- read.table(file.path(path_raw, "features.txt"), stringsAsFactors = FALSE)
        
# Merge the training and the test sets to one data set "data1"
test_raw <- cbind(cbind(test_x,test_s),test_y)
train_raw <- cbind(cbind(train_x,train_s),train_y)
data1 <- rbind(train_raw,test_raw)

names(data1) <- rbind(rbind(featurelabels, c(562, "Subject")), c(563, "Id"))[,2]

# Extract only the measurements on the mean and standard deviation for each measurement
data1meanstd <- data1[,grep("mean\\(\\)|std\\(\\)|Subject|Id", names(data1))]

# Read descriptive activity names and name the activities in the data set
library(plyr);
activitylabels <- read.table(file.path(path_raw,"activity_labels.txt"),col.names=c("Id", "Activity"))
data1meanstd <- join(data1meanstd, activitylabels, by="Id",match="first")
data1meanstd <- data1meanstd[,-1]

# Label the data set with descriptive activity names
names(data1meanstd) <- gsub("^t", "time", names(data1meanstd))
names(data1meanstd) <- gsub("Acc", "Accelerometer", names(data1meanstd))
names(data1meanstd) <- gsub("Gyro", "Gyroscope", names(data1meanstd))
names(data1meanstd) <- gsub("Mag", "Magnitude", names(data1meanstd))
names(data1meanstd) <- gsub("^f", "frequency", names(data1meanstd))
names(data1meanstd) <- gsub("BodyBody", "Body", names(data1meanstd))

# Create another tidy data set with the average of each variable for each activity and each subject
data2 <- ddply(data1meanstd,c("Subject","Activity"),numcolwise(mean))
names(data2) <- sapply(names(data2),paste,"_ave",sep="")

write.table(data2, file = "final tidy data.txt", row.name=FALSE)
