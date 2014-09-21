---
title: "README"
author: "Nikolaos Giagtzoglou"
date: "Sunday, September 21, 2014"
output: html_document
---

##run_analysis.R script does the following:

1. I download and unzip the file. I set the new folder, where all the data have been extracted to as the new working directory.

2. I install data manipulation packages reshape2, dplyr, tidyr, plyr. From all of this only reshape2 proved useful.

3. Merge all data after labeling the subjects and activities in train and test datasets and after labeling the feature vectors. First I make one big dataset for train and test data separately and then combine into a big one (all_)

4. Use grep function to extract only the measurements on the mean and standard deviation for each measurement (all_data_meanstd).

5. Merge the activity_labels with all_data_meanstd to establish descriptive activity names to name the activities in the data set.

6. Use melt and dcast function to create a second, independent tidy data set with the average of each variable for each activity and each subject.

7. Create a file with the new tidy dataset as follows: write.table(mean_final, file="mean_final.txt", row.name=FALSE)