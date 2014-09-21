# Downloading and unzipping the file, and setting working directory
Data<-download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="Dataset.zip")
dire<-dir(getwd())
x<-length(dire)
Dataset<-unzip("dataset.zip")
dire2<-dir(getwd())
x2<-length(dire2)
setwd(dire2[x2])

# You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set (all_data)

install.packages("reshape2")
library(reshape2)
install.packages("plyr")
library(plyr)
install.packages("tidyr")
library(tidyr)
install.packages("dplyr")
library(dplyr)

## Make a table with activities 
activity_labels <- read.table("activity_labels.txt")
names(activity_labels)<-c("activity_id","activity_name")
# str(activity_labels)        
        
## Make a table with fetures
features <- read.table("features.txt")
names (features)<-  c("feature_id", "feature_name")
# str(features)

## Read and label test data
testdata <- read.table("test/X_test.txt")
colnames(testdata) <- features$feature_name
        
## Read and label subjects id that were used in test data
test_subject_id <- read.table("test/subject_test.txt")
colnames(test_subject_id) <- "subject_id"
        
## Read and label activities measured in test data
test_activity_id <- read.table("test/y_test.txt")
colnames(test_activity_id) <- "activity_id"
        
##Make on dataframe for all test data
test_data <- cbind(test_subject_id , test_activity_id , testdata)

## Read and label train data
traindata <- read.table("train/X_train.txt")
colnames(traindata) <- features$feature_name

## Read and label subjects id that were used in train data
train_subject_id <- read.table("train/subject_train.txt")
colnames(train_subject_id) <- "subject_id"
        
## Read and label activities measured in train data
train_activity_id <- read.table("train/y_train.txt")
colnames(train_activity_id) <- "activity_id"
        
##Make on dataframe for all train data
train_data <- cbind(train_subject_id , train_activity_id , traindata)

##Combine both test and train data
all_data <- rbind(train_data,test_data)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.(all_data_meanstd)

mean_col_names <- names(all_data)[grep("mean",names(all_data),ignore.case=TRUE)]
std_col_names <- names(all_data)[grep("std",names(all_data),ignore.case=TRUE)]
all_data_meanstd <-all_data[,c("subject_id","activity_id",mean_col_names,std_col_names)]

# 3. Uses descriptive activity names to name the activities in the data set

##Merge alldata_meanstd with activity_labels created in part 1 above
all_data_meanstd_activities <- merge(activity_labels,all_data_meanstd,by.x="activity_id",by.y="activity_id",all=TRUE)

# 4. Appropriately labels the data set with descriptive variable names. 

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.       

##Melt and recast the dataset
final_melt <- melt(all_data_meanstd_activities,id=c("activity_id","activity_name","subject_id"))
mean_final <- dcast(final_melt,activity_id + activity_name + subject_id ~ variable,mean)
# print (str(mean_final))

## Create a file with the new tidy dataset
write.table(mean_final, file="mean_final.txt", row.name=FALSE)
