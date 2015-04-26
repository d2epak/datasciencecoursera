library(data.table)

# set working directory for data
setwd("./cleaningdata")

# read the test dataset
x_test_data<-read.table("./UCI HAR Dataset/test/x_test.txt")

# read the list of activities performed by the participants in the test dataset
y_test_data<-read.table("./UCI HAR Dataset/test/y_test.txt")

# read the number of people who are included in the test dataset
subject_test_data<-read.table("./UCI HAR Dataset/test/subject_test.txt")

#read the features, so that they can be used as column names later on
features<-read.table("./UCI HAR Dataset/features.txt")

#name the column activity to denote that activity data has been read in
colnames(y_test_data)<-"Activity"

#replaced the activity codes with descriptive text which specifies what each code means
y_test_data$Activity<-sapply(y_test_data$Activity,switch,'1'='WALKING','2'='WALKING_UPSTAIRS','3'='WALKING_DOWNSTAIRS','4'='SITTING','5'='STANDING','6'='LAYING')

#name the column subject to denote the number of people included in the test data
colnames(subject_test_data)<-"Subject"

#name all the variables according to the list of features provided, since the first column
#is the number of features and the 2nd column contains the names of the features provide
#the data from the second column as column names
colnames(x_test_data)<-features[,2]

#bind all the test data together into one dataset
test_data<-cbind(subject_test_data,y_test_data,x_test_data)

#read the training data
x_train_data<-read.table("./UCI HAR Dataset/train/x_train.txt")

#read the activity data to specify how many activities are tracked for each subject
y_train_data<-read.table("./UCI HAR Dataset/train/y_train.txt")

#read the subject data that specifies how many subjects are included in the training dataset
subject_train_data<-read.table("./UCI HAR Dataset/train/subject_train.txt")

#name the column activity to denote that this column contains data for number of activities performed
colnames(y_train_data)<-"Activity"

#replaced the activity codes with descriptive text which specifies what each code means
y_train_data$Activity<-sapply(y_train_data$Activity,switch,'1'='WALKING','2'='WALKING_UPSTAIRS','3'='WALKING_DOWNSTAIRS','4'='SITTING','5'='STANDING','6'='LAYING')

#name the column subject to denote the number of people included in the training data
colnames(subject_train_data)<-"Subject"

#name all the variables according to the list of features provided, since the first column
#is the number of features and the 2nd column contains the names of the features provide
#the data from the second column as column names

colnames(x_train_data)<-features[,2]

#bind all the test data together into one dataset

train_data<-cbind(subject_train_data,y_train_data,x_train_data)

#in order to make data tidy rename columns to denote full names and not abbreviations
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


#same criteria as above instead for the training data
names(train_data)<-gsub("\\bt","Time",names(train_data))

names(train_data)<-gsub("^f","Frequency",names(train_data))

names(train_data)<-gsub("Acc","Accelerometer",names(train_data))

names(train_data)<-gsub("Gyro","Gyroscope",names(train_data))

names(train_data)<-gsub("Mag","Magnitude",names(train_data))

names(train_data)<-gsub("BodyBody","Body",names(train_data))

names(train_data)<-gsub("gravity","Gravity",names(train_data))

names(train_data)<-gsub("angle","Angle",names(train_data))

names(train_data)<-gsub("mean","Mean",names(train_data))

names(train_data)<-gsub("\\,","",names(train_data))

names(train_data)<-gsub("\\)","",names(train_data))

names(train_data)<-gsub("\\(","",names(train_data))

names(train_data)<-gsub("\\-","",names(train_data))

names(train_data)<-gsub("\\()","",names(train_data))

#the requirement is to compute the mean for the columns that contain 'Mean','mean' or 'std' hence 
#select the column that contain the text  'Mean','mean', or 'std' and bind the resulting 
#columns together for the final test data, repeat same for training data
final_test_data<-cbind(test_data[,1:2],test_data[,(names(test_data) %like% 'std')],test_data[,(names(test_data) %like% 'mean')],test_data[,(names(test_data) %like% 'Mean')])

final_train_data<-cbind(train_data[,1:2],train_data[,(names(train_data) %like% 'std')],train_data[,(names(train_data) %like% 'mean')],train_data[,(names(train_data) %like% 'Mean')])

#once the two datasets are availble, merge the 2 datasets together so that all observations from
#training and test are included together
merged_data<-rbind(final_test_data,final_train_data)

#finally calculate the mean of each of the variables for the combination of each activity and
#subject
submit_data <- aggregate(. ~Subject+Activity, merged_data, function(x) c(mean = mean(x)))

#some variables contain the word Freq alone preceeded by Mean, hence renaming those to Frequency
names(submit_data)<-gsub("MeanFreq","MeanFrequency",names(submit_data))

#write the data to a csv file for submission
write.table(submit_data,file="./mean_of_subjects_activites.txt",quote=FALSE,sep="|",col.names=TRUE,row.names=FALSE)

