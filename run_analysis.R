## run analysis ##
# (0) #
library(dplyr)
# (1) #
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
# (2) #
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
# (3) #
test_full <- cbind(sub_test, y_test, X_test)
train_full <- cbind(sub_train, y_train, X_train)
# (4) #
full_set <- rbind(test_full,train_full)
features <- read.table("./UCI HAR Dataset/features.txt")
col_names <- c("Subject", "Activity", as.character(features[,2]))
colnames(full_set) <- col_names
# (5) #
mean_std_index <- grep("mean\\(\\)|std\\(\\)",col_names)
mean_std_only <- full_set[,c(1,2,mean_std_index)]
# (6) #
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
mean_std_only[,2] <- sapply(mean_std_only[,2], function(elm) as.character(activity_labels[elm,2]))
# (7) #
colnames(mean_std_only) <- sub("^t","time\\.",colnames(mean_std_only))
colnames(mean_std_only) <- sub("^f","freq\\.",colnames(mean_std_only))
colnames(mean_std_only) <- gsub("-","\\.",colnames(mean_std_only))
colnames(mean_std_only) <- sub("\\(\\)","",colnames(mean_std_only))
# (8) #
grouped_data <- group_by(mean_std_only, Subject, Activity)
final_data_set <- summarize_each(grouped_data, funs(mean))