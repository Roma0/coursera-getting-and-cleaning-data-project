# Code book for Coursera Getting and Cleaning Data course project
This CodeBook is for the file named `tidy_data.txt`. 

## Raw Data
The introduction and links of the project and raw data are in the `README.md` file.

The data come from the `Accelerometer` and `Gyroscope` 3-axial(`XYZ`) raw signals. These time domain signals (prefix `Time`) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into `Body` and `Gravity` acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain `Jerk` signals. Also the `Magnitude` of these three-dimensional signals were calculated using the Euclidean norm.

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals (prefix `Frequency`).

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

## Tidy Data
The dimensions of the tidy data(not including the column names) are 180 * 81. The fist row is the descriptive variable names. The raw data included multiple measurement observations for each subject and activity, so these were averaged together in the final tidy dataset. From the second row, each row represents the 79 averaged measurements for 1 subject and 1 activty.

### Identifers
- `SubjectID`
	Identifier of subject who performed the activity, integer, ranges from 1 to 30.
- `Activity`
	Activity identifier, string with 6 possoble values:
	- `WALKING` (value `1`): subject was walking
	- `WALKING_UPSTAIRS` (value `2`): subject was walking upstairs
	- `WALKING_DOWNSTAIRS` (value `3`): subject was walking downstairs
	- `SITTING` (value `4`): subject was sitting
	- `STANDING` (value `5`): subject was stading
	- `LAYING` (value `6`): subject was laying

### Measurements
- `TimeBodyAccelerometrMeanX`
- `TimeBodyAccelerometrMeanY`
- `TimeBodyAccelerometrMeanZ`
- `TimeBodyAccelerometrStdX`
- `TimeBodyAccelerometrStdY`
- `TimeBodyAccelerometrStdZ`
- `TimeGravityAccelerometrMeanX`
- `TimeGravityAccelerometrMeanY`
- `TimeGravityAccelerometrMeanZ`
- `TimeGravityAccelerometrStdX`
- `TimeGravityAccelerometrStdY`
- `TimeGravityAccelerometrStdZ`
- `TimeBodyAccelerometrJerkMeanX`
- `TimeBodyAccelerometrJerkMeanY`
- `TimeBodyAccelerometrJerkMeanZ`
- `TimeBodyAccelerometrJerkStdX`
- `TimeBodyAccelerometrJerkStdY`
- `TimeBodyAccelerometrJerkStdZ`
- `TimeBodyGyroscopeMeanX`
- `TimeBodyGyroscopeMeanY`
- `TimeBodyGyroscopeMeanZ`
- `TimeBodyGyroscopeStdX`
- `TimeBodyGyroscopeStdY`
- `TimeBodyGyroscopeStdZ`
- `TimeBodyGyroscopeJerkMeanX`
- `TimeBodyGyroscopeJerkMeanY`
- `TimeBodyGyroscopeJerkMeanZ`
- `TimeBodyGyroscopeJerkStdX`
- `TimeBodyGyroscopeJerkStdY`
- `TimeBodyGyroscopeJerkStdZ`
- `TimeBodyAccelerometrMagnitudeMean`
- `TimeBodyAccelerometrMagnitudeStd`
- `TimeGravityAccelerometrMagnitudeMean`
- `TimeGravityAccelerometrMagnitudeStd`
- `TimeBodyAccelerometrJerkMagnitudeMean`
- `TimeBodyAccelerometrJerkMagnitudeStd`
- `TimeBodyGyroscopeMagnitudeMean`
- `TimeBodyGyroscopeMagnitudeStd`
- `TimeBodyGyroscopeJerkMagnitudeMean`
- `TimeBodyGyroscopeJerkMagnitudeStd`
- `FrequencyBodyAccelerometrMeanX`
- `FrequencyBodyAccelerometrMeanY`
- `FrequencyBodyAccelerometrMeanZ`
- `FrequencyBodyAccelerometrStdX`
- `FrequencyBodyAccelerometrStdY`
- `FrequencyBodyAccelerometrStdZ`
- `FrequencyBodyAccelerometrMeanFrequencyX`
- `FrequencyBodyAccelerometrMeanFrequencyY`
- `FrequencyBodyAccelerometrMeanFrequencyZ`
- `FrequencyBodyAccelerometrJerkMeanX`
- `FrequencyBodyAccelerometrJerkMeanY`
- `FrequencyBodyAccelerometrJerkMeanZ`
- `FrequencyBodyAccelerometrJerkStdX`
- `FrequencyBodyAccelerometrJerkStdY`
- `FrequencyBodyAccelerometrJerkStdZ`
- `FrequencyBodyAccelerometrJerkMeanFrequencyX`
- `FrequencyBodyAccelerometrJerkMeanFrequencyY`
- `FrequencyBodyAccelerometrJerkMeanFrequencyZ`
- `FrequencyBodyGyroscopeMeanX`
- `FrequencyBodyGyroscopeMeanY`
- `FrequencyBodyGyroscopeMeanZ`
- `FrequencyBodyGyroscopeStdX`
- `FrequencyBodyGyroscopeStdY`
- `FrequencyBodyGyroscopeStdZ`
- `FrequencyBodyGyroscopeMeanFrequencyX`
- `FrequencyBodyGyroscopeMeanFrequencyY`
- `FrequencyBodyGyroscopeMeanFrequencyZ`
- `FrequencyBodyAccelerometrMagnitudeMean`
- `FrequencyBodyAccelerometrMagnitudeStd`
- `FrequencyBodyAccelerometrMagnitudeMeanFrequency`
- `FrequencyBodyAccelerometrJerkMagnitudeMean`
- `FrequencyBodyAccelerometrJerkMagnitudeStd`
- `FrequencyBodyAccelerometrJerkMagnitudeMeanFrequency`
- `FrequencyBodyGyroscopeMagnitudeMean`
- `FrequencyBodyGyroscopeMagnitudeStd`
- `FrequencyBodyGyroscopeMagnitudeMeanFrequency`
- `FrequencyBodyGyroscopeJerkMagnitudeMean`
- `FrequencyBodyGyroscopeJerkMagnitudeStd`
- `FrequencyBodyGyroscopeJerkMagnitudeMeanFrequency`

### Notes
* `Mean`: Mean value
* `Std`: Standard deviation
* `MeanFrequency`: Weighted average of the frequency components to obtain a mean frequency
* The units are 'radians/second 'for the `Gyroscope` data, and standard gravity units 'g' (9.81 m/s⁻² ) for the `Accelerometer` data.
* All measurements are floating-point values, normalised and bounded within [-1,1].

## Transformation
To get the final tidy data we used the following files from the raw data:

* ‘README.txt’
* ‘features_info.txt’: Shows information about the variables used on the feature vector.
* ‘features.txt’: List of all features.
* ‘activity_labels.txt’: Links the class labels with their activity name.
* ‘train/X_train.txt’: Training set.
* ‘train/y_train.txt’: Training labels.
* ‘test/X_test.txt’: Test set.
* ‘test/y_test.txt’: Test labels.

The following transformations can be executed with the script `run_analysis.R`.

	1. Retrives the data and load into R.
	2. Merges the training and the test sets to create one data set.
	3. Extracts only the measurements on the mean and standard deviation for each measurement.
	4. Uses descriptive activity names to name the activities in the data set.
	5. Appropriately labels the data set with descriptive variable names.
	6. From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
