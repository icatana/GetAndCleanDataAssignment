# Code Book - Getting And Cleaning Data

## Objective
This code book describes the variables, the data, and any transformations or work performed to clean up the data from the original data set described here below.

## Data Set and Variables

### Source Reference
The source of the data that was processed can be found at the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Details
This data set concerns the Human Activity Recognition Using Smartphones Dataset project, described here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The Smartlab has developed a new publicly available database of daily human activities that has been recorded using accelerometer and gyroscope data from a waist-mounted Android-OS smartphone (Samsung Galaxy S II). The six studied activities are: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing and Laying down.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

#### For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#### List of files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent:
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

### Features Selection
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 
* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

## Transformations
As mentionned in [run_analysis.R](https://github.com/icatana/GetAndCleanDataAssignment/blob/master/run_analysis.R) script functionalities, the main transformations are listed here below:
* Merging into one dataset of the training and the test sets.
* Extraction of the measurements on the mean and standard deviation for each measurement.
* Use of descriptive activity names and labels to increase readability of the data set.
* Creation of an independent tidy data set with the average of each variable for each activity and each subject.

### Algorithm
1) Load features list and activities labels into memory. A function was created that loads a file into a dataframe. Inputs are the name of the file to load ant the list of sub-directories.
2) Format features names. A function was created that removes characters different than letters and numbers.
3) Load the training subjects into memory and change the column name to 'Subject'.
4) Load the training data set into memory and associate the column names with the features names from step n°2
5) Load the training activities into memory and associate the activity numbers with labels. Also change the column name of the data frame to 'Activity'.
6) Combine the training data set with corresponding subjects and activies into one data frame using cbind function.
7) Do the previous four steps for test measures.
8) Merge the training and the test sets using rbind function.
9) Select only mean and standard deviation columns as well as subject and activity
10) Creates a second, independent tidy data set with the average of each variable for each activity and each subject
11) Save the tidy data set into a txt file called [tidy_dataset.txt](https://github.com/icatana/GetAndCleanDataAssignment/blob/master/tidy_dataset.txt)
12) In addition to the txt file, a tidy data set in CSV format is also generated in the file called [tidy_dataset.csv](https://github.com/icatana/GetAndCleanDataAssignment/blob/master/tidy_dataset.csv)




