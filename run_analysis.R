## SUBMISSION FOR GETTING AND CLEANING DATA COURSE PROJECT
## DATA PREPARATION

## Downloading file
dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile()
download.file(dataUrl,temp,mode = "wb")
files <- unzip(temp, list = TRUE)

## Selecting files to extract
testSets <- files$Name[grep("/._test.txt",files$Name)]
trainSets <- files$Name[grep("/._train.txt",files$Name)]


## 1. MERGES THE TRAINING AND THE TEST SETS

## Merging features and labels of training set
train <- read.table(unz(temp, trainSets[1]))
train <- cbind(train, read.table(unz(temp, trainSets[2])))
colnames(train)[ncol(train)] <- "activityId"

## Merging subject to training set
subject_file <- files$Name[grep("/subject_train.txt",files$Name)]; subject_file
subject_train <- read.table(unz(temp, subject_file))
colnames(subject_train) <- "subject"
train <- cbind(subject_train,train)

## Merging features and labels of testing set
test <- read.table(unz(temp, testSets[1]))
test <- cbind(test, read.table(unz(temp, testSets[2])))
colnames(test)[ncol(test)] <- "activityId"

## Merging subject to testing set
subject_file <- files$Name[grep("/subject_test.txt",files$Name)]; subject_file
subject_test <- read.table(unz(temp, subject_file))
colnames(subject_test) <- "subject"
test <- cbind(subject_test,test)

## Merging training and testing sets
df <- rbind(train, test)

## Adding variable names
feature_file <- files$Name[grep("/features.txt",files$Name)]
variable_names <- read.table(unz(temp, feature_file))
colnames(df) <- c("subject",variable_names$V2,"activityId")


## 2. EXTRACTS ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION

## Extracting measurements on mean and standard deviation
df <- df[,grepl("subject|activity|\\<mean\\>()|std()", names(df))]


## 3. USE DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES

## Adding activity labels
activity_file <- files$Name[grep("/activity_labels.txt",files$Name)]
activity_labels <- read.table(unz(temp, activity_file))
colnames(activity_labels) <- c("activityId","activityName")
df <- merge(df,activity_labels)

## Re-ordering columns
df <- df[c(colnames(df)[2:1],colnames(df)[ncol(df)],colnames(df)[3:563])]


## 4. APPROPRIATELY LABELS THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES

## Replacing variable names begin with "t" and "f" by "time" and "freq" respectively; and remove () from the variable names
names(df) <- gsub("^t","time",names(df))
names(df) <- gsub("^f","freq",names(df))
names(df) <- gsub("\\(\\)","", names(df))

## 5. CREATE A SECOND, INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT

library(dplyr)
df_summary <- df |> group_by(subject, activityId, activityName) |> summarise(across(everything(), mean))
df_summary |> write.table("df_summary.txt", row.names = FALSE)