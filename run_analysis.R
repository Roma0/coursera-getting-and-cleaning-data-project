################################################################################
## Step 1. Retrives the data and load into R.
################################################################################

## Download the zip file of the project dataset if it hasn't already exsit.
zipUrl<- paste0("https://d396qusza40orc.cloudfront.net",
                 "/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
zipFile <- "UCI HAR Dataset.zip"
if(!file.exists(zipfile)){
        download.file(zipUrl, destfile = zipFile, method = "curl")
}

## Unzip zip file if data directory doesn't exist.
if(!dir.exists("UCI HAR Dataset")){
        unzip(zipFile)
}

## Load the training and test data into R.
library(dplyr)
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainActivity <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
testActivity <- read.table("./UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

################################################################################
## Step 2. Merges the training and the test sets to create one data set.
################################################################################

## Combind the separative test or trianing data repectively by column first,  
## then joint these two merged-sets by row.
humanActivity <- rbind(cbind(trainSubject, trainActivity, train),
                  cbind(testSubject, testActivity, test))

## Remove raw tables to save memory
rm(train, trainSubject, trainActivity, test, testSubject, testActivity)

################################################################################
## Step 3. Extract only the measurements on the mean and standard deviation
################################################################################

## Get most of the column names from the features table, except the first 
## two names.
features <- read.table("./UCI HAR Dataset/features.txt",
                       stringsAsFactors = FALSE)
colnames(humanActivity) <- c("SubjectID", "Activity", features[, 2])

## Extract "SubjectID", "Activity" and only the "mean" and "standard deviation" 
## value columns.
columnsKeep <- grepl("Subject|Activity|mean|std", colnames(humanActivity))
humanActivity <- humanActivity[, columnsKeep]


################################################################################
## Step 4. Use descriptive activity names to name the activities.
################################################################################

## Read the active lables data into R
activityLables <- read.table("./UCI HAR Dataset/activity_labels.txt",
                             stringsAsFactors = FALSE)

## Replace activity values with named factor levels
humanActivity$Activity <- factor(humanActivity$Activity, labels = activityLables[, 2],
                            levels = activityLables[, 1])

################################################################################
## Step 5. Appropriately label the data set with descriptive variable names.
################################################################################

## Read the column names from the humanActivity into a vector varible.
## Modify the names into a descriptive way step-by-step.
descritiveNames <- gsub("-|[()]", "", colnames(humanActivity))
descritiveNames <- gsub("Freq", "Frequency", descritiveNames)
descritiveNames <- gsub("^t", "Time", descritiveNames)
descritiveNames <- gsub("^f", "Frequency", descritiveNames)
descritiveNames <- gsub("Acc", "Accelerometr", descritiveNames)
descritiveNames <- gsub("Gyro", "Gyroscope", descritiveNames)
descritiveNames <- gsub("mean", "Mean", descritiveNames)
descritiveNames <- gsub("std", "Std", descritiveNames)
descritiveNames <- gsub("BodyBody", "Body", descritiveNames)
descritiveNames <- gsub("Mag", "Magnitude", descritiveNames)

## Put the final column names back to humanActivity.
colnames(humanActivity) <- descritiveNames

################################################################################
## Step 6. Creates a second, independent tidy data set with the average of each
## variable for each activity and each subject.
################################################################################
## Achive by 'dplyr'
humanActivityMean <- humanActivity %>% 
        group_by(SubjectID, Activity) %>% 
        summarise_all(funs(mean))

## Alternatively method by 'reshape2'.
# library("reshape2")
# humanActivityMean <- melt(humanActivity, id = c("SubjectID", "Activity")) %>%
#         dcast(SubjectID + Activity ~ variable, mean)

## Write the data into "tidy_data.txt" file.
write.table(humanActivityMean, file = "tidy_data.txt", row.names = FALSE, 
            quote = FALSE)
