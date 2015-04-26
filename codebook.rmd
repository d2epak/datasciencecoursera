## Overview

* I.   Provide the story behind the variables

* II.  Describe the Subject Variable

* III. Describe the Subject Variable

* IV.  Describe the remaining 86 variables by categorizing them into sections of Means, Standard Deviations, Magnitudes and Angles


### I. Storyboard

* This codebook explains the variables in the final output.

* The output contains 88 variables derived from an experiment in which 30 participants participated

* The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (

* WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

* The Original dataset contained 563 variables but the final output contains 86 of the original continuous variables and 2 categorical variables

* The 86 variables have been categorized broadly as those having 

* The signlas measured using the participants Samsung Galaxy S II phone and its embedded accelerometer and gyroscope. These metrics have the text 'Accelerometer' or 'Gyroscope' in them.

* All such signals were either measured on the Time or Frequency domain, specified by the texts 'Time' or 'Frequency' embedded in the text respectively.

* Accelerometer based calculations had unique body and gravity components, identified by the text 'Body' or 'Gravity' in the metric names.

* Further classification was made on whethere it was a scalar or a vector

* If it was deemed a scalar its magnitude was measured or the angle between the features was measured, such metrics had the text 'magnituude' in them.

* **22 variables** were scalars and had a magnitude component

* If it was a vector the measurements were made along X, Y and Z Axis respectively, each such vector had the text 'X','Y' or 'Z' in them. Some vectors were measured using the Jerk signal and in some cases weighted means were calculated. Metrics with Jerk signlas had the text 'Jerk' embedded and the ones with weighted means had the text 'Mean' towards the end of the metric. 

* Along the X, Y and Z Axis **57 variables** were measured

* **7 variables** had the an angle measured, such metrics began with the text 'Angle'



### II.  Describe the Subject Variable:

* Subject : This variable contains the number of people who participated in the experiment (from 1 to 30)

### III. Describe the Activity Variable:

* Activity: This variable contains the various activities measured for each participant
*    WALKING
*    WALKING_UPSTAIRS
*    WALKING_DOWNSTAIRS
*    SITTING
*    STANDING
*    LAYING
    
### IV. Describe the remaing variables:

* Finally for the submission I have collected 86 metrics in my final submission that contain the text std or mean. As I noted that some text contained 'Mean' 
, I have collected those variables as well. After collecting the 86 variables I have computed the mean of each variable and henceforth these shall be called
metrics. 
* The 86 metrics can be broken down into the following Sections. Each Indentation has been provided to give a flow of what calculations have been applied to
calculate each metric. Each of the 86 metrics below are prefixed with **.

#### The table below lists the variables


|  Number	|	Variable Name	|
|---------|:--------------|
|	1	|	TimeGravityAccelerometerstdZ	|
|	2	|	TimeGravityAccelerometerstdY	|
|	3	|	TimeGravityAccelerometerstdX	|
|	4	|	TimeGravityAccelerometerMeanZ	|
|	5	|	TimeGravityAccelerometerMeanY	|
|	6	|	TimeGravityAccelerometerMeanX	|
|	7	|	TimeGravityAccelerometerMagnitudestd	|
|	8	|	TimeGravityAccelerometerMagnitudeMean	|
|	9	|	TimeBodyGyroscopestdZ	|
|	10	|	TimeBodyGyroscopestdY	|
|	11	|	TimeBodyGyroscopestdX	|
|	12	|	TimeBodyGyroscopeMeanZ	|
|	13	|	TimeBodyGyroscopeMeanY	|
|	14	|	TimeBodyGyroscopeMeanX	|
|	15	|	TimeBodyGyroscopeMagnitudestd	|
|	16	|	TimeBodyGyroscopeMagnitudeMean	|
|	17	|	TimeBodyGyroscopeJerkstdZ	|
|	18	|	TimeBodyGyroscopeJerkstdY	|
|	19	|	TimeBodyGyroscopeJerkstdX	|
|	20	|	TimeBodyGyroscopeJerkMeanZ	|
|	21	|	TimeBodyGyroscopeJerkMeanY	|
|	22	|	TimeBodyGyroscopeJerkMeanX	|
|	23	|	TimeBodyGyroscopeJerkMagnitudestd	|
|	24	|	TimeBodyGyroscopeJerkMagnitudeMean	|
|	25	|	TimeBodyAccelerometerstdZ	|
|	26	|	TimeBodyAccelerometerstdY	|
|	27	|	TimeBodyAccelerometerstdX	|
|	28	|	TimeBodyAccelerometerMeanZ	|
|	29	|	TimeBodyAccelerometerMeanY	|
|	30	|	TimeBodyAccelerometerMeanX	|
|	31	|	TimeBodyAccelerometerMagnitudestd	|
|	32	|	TimeBodyAccelerometerMagnitudeMean	|
|	33	|	TimeBodyAccelerometerJerkstdZ	|
|	34	|	TimeBodyAccelerometerJerkstdY	|
|	35	|	TimeBodyAccelerometerJerkstdX	|
|	36	|	TimeBodyAccelerometerJerkMeanZ	|
|	37	|	TimeBodyAccelerometerJerkMeanY	|
|	38	|	TimeBodyAccelerometerJerkMeanX	|
|	39	|	TimeBodyAccelerometerJerkMagnitudestd	|
|	40	|	TimeBodyAccelerometerJerkMagnitudeMean	|
|	41	|	FrequencyBodyGyroscopestdZ	|
|	42	|	FrequencyBodyGyroscopestdY	|
|	43	|	FrequencyBodyGyroscopestdX	|
|	44	|	FrequencyBodyGyroscopeMeanZ	|
|	45	|	FrequencyBodyGyroscopeMeanY	|
|	46	|	FrequencyBodyGyroscopeMeanX	|
|	47	|	FrequencyBodyGyroscopeMeanFreqZ	|
|	48	|	FrequencyBodyGyroscopeMeanFreqY	|
|	49	|	FrequencyBodyGyroscopeMeanFreqX	|
|	50	|	FrequencyBodyGyroscopeMagnitudestd	|
|	51	|	FrequencyBodyGyroscopeMagnitudeMeanFreq	|
|	52	|	FrequencyBodyGyroscopeMagnitudeMean	|
|	53	|	FrequencyBodyGyroscopeJerkMagnitudestd	|
|	54	|	FrequencyBodyGyroscopeJerkMagnitudeMeanFreq	|
|	55	|	FrequencyBodyGyroscopeJerkMagnitudeMean	|
|	56	|	FrequencyBodyAccelerometerstdZ	|
|	57	|	FrequencyBodyAccelerometerstdY	|
|	58	|	FrequencyBodyAccelerometerstdX	|
|	59	|	FrequencyBodyAccelerometerMeanZ	|
|	60	|	FrequencyBodyAccelerometerMeanY	|
|	61	|	FrequencyBodyAccelerometerMeanX	|
|	62	|	FrequencyBodyAccelerometerMeanFreqZ	|
|	63	|	FrequencyBodyAccelerometerMeanFreqY	|
|	64	|	FrequencyBodyAccelerometerMeanFreqX	|
|	65	|	FrequencyBodyAccelerometerMagnitudestd	|
|	66	|	FrequencyBodyAccelerometerMagnitudeMeanFreq	|
|	67	|	FrequencyBodyAccelerometerMagnitudeMean	|
|	68	|	FrequencyBodyAccelerometerJerkstdZ	|
|	69	|	FrequencyBodyAccelerometerJerkstdY	|
|	70	|	FrequencyBodyAccelerometerJerkstdX	|
|	71	|	FrequencyBodyAccelerometerJerkMeanZ	|
|	72	|	FrequencyBodyAccelerometerJerkMeanY	|
|	73	|	FrequencyBodyAccelerometerJerkMeanX	|
|	74	|	FrequencyBodyAccelerometerJerkMeanFreqZ	|
|	75	|	FrequencyBodyAccelerometerJerkMeanFreqY	|
|	76	|	FrequencyBodyAccelerometerJerkMeanFreqX	|
|	77	|	FrequencyBodyAccelerometerJerkMagnitudestd	|
|	78	|	FrequencyBodyAccelerometerJerkMagnitudeMeanFreq	|
|	79	|	FrequencyBodyAccelerometerJerkMagnitudeMean	|
|	80	|	AngleTimeBodyAccelerometerJerkMeanGravityMean	|
|	81	|	AngleTimeBodyAccelerometerMeanGravity	|
|	82	|	AngleTimeBodyGyroscopeJerkMeanGravityMean	|
|	83	|	AngleTimeBodyGyroscopeMeanGravityMean	|
|	84	|	AngleXGravityMean	|
|	85	|	AngleYGravityMean	|
|	86	|	AngleZGravityMean	|
