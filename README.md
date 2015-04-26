## Overview

* I.   Finding and extracting raw data

* II.  Processing the Data

* III. Preparing the expected data

* IV.  Sample of expected data

### I. Finding and extracting raw data

* The course project expects unzipped data to be available in the working directory, so using the folder structure ./UCI HAR Dataset/test and ./UCI HAR Dataset/train

* I extracted data from the test and train locations respectively using read.table

* I read the actual data from the x, y and subject datasets into separate data frames, code sample below:

```
x_test_data<-read.table("./UCI HAR Dataset/test/x_test.txt")

y_test_data<-read.table("./UCI HAR Dataset/test/y_test.txt")

subject_test_data<-read.table("./UCI HAR Dataset/test/subject_test.txt")

features<-read.table("./UCI HAR Dataset/features.txt")

```
### II. Processing the Data

#### For the test dataset

* I provided column names to the data from the y file and the subject files as "Activity" and "Subject" respectively

* Since the descriptive names were available for each activity I chose to replace the numeric data with the descriptions

```
y_test_data$Activity<-sapply(y_test_data$Activity,switch,'1'='WALKING','2'='WALKING_UPSTAIRS','3'='WALKING_DOWNSTAIRS','4'='SITTING','5'='STANDING','6'='LAYING')
```

* For the data read from the x file I provided the column names from the features file by extracting the data in the 2nd column, this I accomplished using:

```
colnames(x_test_data)<-features[,2]
```

* Finally I combined the 3 datasets using a column bind since the data contained unequal number of columns

```
test_data<-cbind(subject_test_data,y_test_data,x_test_data)
```

* As per the principles of tidy data, the column names should not contain underscore characters, the variable names should be fully described, so using gsub I replaced each of the occurences of special characters with blank space and replaced abbreviations with their full names, code sample:

```
#here replace every occurance of t with time the \\b criteria is to include boundary conditions
#i.e. to replace (t and t( with time
names(test_data)<-gsub("\\bt","Time",names(test_data))

#replace every text that begins with 'f' with 'frequency'
names(test_data)<-gsub("^f","Frequency",names(test_data))

#replace every occurence of "Acc" with "Accelerometer"
names(test_data)<-gsub("Acc","Accelerometer",names(test_data))

#replace every occurence of "Gyro" with "Gyroscope"
names(test_data)<-gsub("Gyro","Gyroscope",names(test_data))

#replace every occurence of "Mag" with "Magnitude"
names(test_data)<-gsub("Mag","Magnitude",names(test_data))

#replace every occurence of "BodyBody" with "Body"
names(test_data)<-gsub("BodyBody","Body",names(test_data))

#I like Camel Capitalization hence I replaced the initial text with Caps 
names(test_data)<-gsub("gravity","Gravity",names(test_data))

#I like Camel Capitalization hence I replaced the initial text with Caps
names(test_data)<-gsub("angle","Angle",names(test_data))

#I like Camel Capitalization hence I replaced the initial text with Caps
names(test_data)<-gsub("mean","Mean",names(test_data))

#replace comma with blank space
names(test_data)<-gsub("\\,","",names(test_data))

#replace ")" with blank space
names(test_data)<-gsub("\\)","",names(test_data))

#replace "(" with blank space
names(test_data)<-gsub("\\(","",names(test_data))

#replace "-" with blank space
names(test_data)<-gsub("\\-","",names(test_data))

#replace "()" with blank space
names(test_data)<-gsub("\\()","",names(test_data))
```

* Next step I selected the columns that either contained the text 'mean' or 'std' without, I chose to include additional variables that contained 'Mean' as well as the requirement did not specify whether we should or should not differentiate between 'mean' and 'Mean'

```
final_test_data<-cbind(test_data[,1:2],test_data[,(names(test_data) %like% 'std')],test_data[,(names(test_data) %like% 'mean')],test_data[,(names(test_data) %like% 'Mean')])
```

#### I repeated the process for the training dataset as well.

### III. Preparing the expected data

#### First I merged the data together using rbind
```
merged_data<-rbind(final_test_data,final_train_data)
```
#### Then I computed the mean of each variable using aggregate function
```
submit_data <- aggregate(. ~Subject+Activity, merged_data, function(x) c(mean = mean(x)))
```

### IV. Sample of expected data

* **Dimensions of the final data, 180 Rows and 88 Columns** = 

* Each of the variables have been described in detail in the accompanying codebook 'codebook.txt'