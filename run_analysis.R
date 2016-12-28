library(dplyr)

# Reading data sets
X_test <- read.table('./X_test.txt')
X_train <- read.table('./X_train.txt')

# 1. Merging data sets
X_total <- rbind(X_train, X_test)

# Reading features
features <- read.table('./features.txt')

# 2. Extracting only the measurements on the mean and standard deviation for each measurement
X_total_mean_std <- X_total[,paste0("V",features[grepl('mean\\(\\)|std\\(\\)',features$V2, perl = TRUE),]$V1)]

# 4. Now we have descriptive veriable names
names(X_total_mean_std) <- features[grepl('mean\\(\\)|std\\(\\)',features$V2, perl = TRUE),]$V2

y_test <- read.table('./y_test.txt')
y_train <- read.table('./y_train.txt')
y_total <- rbind(y_train, y_test)
names(y_total) <- c("ActID")

# Now we have activity IDs as additional column
X_total_mean_std_1 <- cbind(X_total_mean_std,y_total)

activity_labels <- read.table('./activity_labels.txt')
names(activity_labels) <- c("ActID","ActivityName")

# 3. Now we have descriptive activity names in data set X_total_mean_std_2
X_total_mean_std_2 <- merge(X_total_mean_std_1,activity_labels)

# 5. Creating new data set with average of each variable for each activity
final_data_set <- tbl_df(X_total_mean_std_2) %>% select(-ActID) %>% group_by(ActivityName) %>% summarise_all(mean)
write.table(final_data_set, file = "./final_data_set.txt", row.name = FALSE)

