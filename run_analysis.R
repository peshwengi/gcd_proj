#Step 1 - get the data!
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "UCI HAR Dataset.zip", method="curl")
unzip(zipfile = "UCI HAR Dataset.zip")

features <- read.table( "UCI HAR Dataset/features.txt" )
activity_labels <- read.table( "UCI HAR Dataset/activity_labels.txt" )

X_train <- read.table( "UCI HAR Dataset/train/X_train.txt", col.names = features$V2, check.names=FALSE)
y_train <- read.table( "UCI HAR Dataset/train/y_train.txt", col.names = "activity")
subject_train <- read.table( "UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
train_data <- cbind( subject_train, y_train, X_train )

X_test <- read.table( "UCI HAR Dataset/test/X_test.txt", col.names = features$V2, check.names=FALSE)
y_test <- read.table( "UCI HAR Dataset/test/y_test.txt", col.names = "activity")
subject_test <- read.table( "UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
test_data <- cbind( subject_test, y_test, X_test )

# No intersection of subject ID which is nice
all_data <- rbind( train_data, test_data )

#Step 2 - take a subset which only contains the columns we want. See readme for reasoning.
features_needed <- as.character( features$V2[ grepl("^t.+(Acc|Gyro)-(std|mean\\()", features$V2 ) ] )
columns_needed <- c("subject", "activity", features_needed )
subset <- all_data[,columns_needed]

#Step 3 - Put meaningful activity names in
subset$activity <- activity_labels[subset$activity, 2]

#Step 4 - Descriptive Variable Names
#Not sure exactly what to do here so just giving slightly more 
#human-readable names which can be found in the codebook.
colnames(subset) <- gsub("^t", "TimeSeries", colnames(subset))
colnames(subset) <- gsub("\\(\\)", "", colnames(subset))
colnames(subset) <- gsub("-mean", "Mean", colnames(subset))
colnames(subset) <- gsub("-std", "StandardDeviation", colnames(subset))
colnames(subset) <- gsub("Acc", "Acceleration", colnames(subset))
colnames(subset) <- gsub("Gyro", "Gyroscope", colnames(subset))

#Step 5 - 
data <- aggregate( . ~ subject + activity, data = subset, mean)

write.csv( file = "output.csv", data )
