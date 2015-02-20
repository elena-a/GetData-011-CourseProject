Codebook Provided with the Original Date
=========================================
The following codebook was provided with the original data. (Please see the features_info.txt file downloaded with the data.)

### Feature Selection

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

##### The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation 

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values. 

iqr(): Interquartile range 

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal 

kurtosis(): kurtosis of the frequency domain signal 

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

angle(): Angle between to vectors.

##### Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean

##### The complete list of variables of each feature vector is available in 'features.txt'

Transformation of the Original Data 
=============================

### Summary

The tidy data set produced by running the script in this repo merges the train and test data provided into one data set, extracts only the mean and the standard deviation measurements, and then provides an average for each subject and activity combination. These averages are sorted first by subject id number and second by activity. Below is a step by step explanation of all the transformations performed on the data.

### Step By Step Breakdown

1. Download the data file and unzip the data. (Note: Method is defined as "curl" to run on a mac.) Unzipping creates the folder "UCI HAR Dataset". The first part of the code then also changes the current directory to that folder.

2. The data txt files for both test and train are then read in using the read.table function and assigned to a variable so they can later be merged. The files read in are: subject_test.txt, y_test.txt, X_test.txt, subject_train.txt, y_train.txt, and X_train.txt.

3. The test files (subject_test, activities_test, data_test) are binded together by columns, and then the train files (subject_train, activities_train, data_train). This creates too larger databases that are assigned to variables.

4. Finally, all the data is pulled into one giant data set by row binding test and train data together. 

5. Next, the columns are renamed so that the name reflects the information they contain. Column one is named "id" and refers to the id number assigned to the participants (1-30), and column two is named "activity" and states the number of the activity that was performed while the data was collected. The rest of the column names are taken from the features.txt file that is downloaded with the data.

6. Once all the columns have been correctly named, we extract only the column names that contain the word "mean" or "std" (and also retain the "id" and "activity" columns.)

7. Next, we read in the activity names (activity_labels.txt) into a table with the read.table() function. They are as follows:
  * 1 WALKING
  * 2 WALKING_UPSTAIRS
  * 3 WALKING_DOWNSTAIRS
  * 4 SITTING
  * 5 STANDING
  * 6 LAYING
  
8. Using the merge() function we then merge the activity labels with the data set using the activity numbers.

9. To keep the data concise and organized, the now redundant activity numbers column is removed. The order of the columns is also switched around to maintain the "id" "activity" "rest of the numeric data" organization. 

10. Using the ddply() function found in the plyr package, we then take the mean or average of every column by id and activity. Instead of multiple WALKING observations for person one, we now have one value, the average. 

11. Finally we take the data set and export it out as a txt file using the write.table function. This saves the data inside the "UCI HAR Dataset" folder. 




