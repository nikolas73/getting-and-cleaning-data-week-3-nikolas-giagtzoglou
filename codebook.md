A group of 30 volunteers within an age bracket of 19-48 years performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone . 

3-axial signals in the X, Y and Z directions were estimated and included in the feature vectors.




In mean_final.txt I include the following data:

activity_id: Activity identifier

activity_name: 	Activity type

subject_id : Subject identifier

feature_mean() : mean of measurements of feature. Feature can be any of the values values below.
        	
feature_std(): Standard deviation of measurements of feature. Feature can be any of the  values below.

(From feature_info.txt and feature.txt file)

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

angle(): Angle between two vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean