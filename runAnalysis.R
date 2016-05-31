#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement.
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names.
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Set working directory for project
setwd("~/R/Projecten/Coursera/Course3Project")

#Get the data, and unzip
if(!file.exists("Dataset.zip")) {
  fileurl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileurl,"Dataset.zip",method="curl")
  unzip("Dataset.zip")
}

#Get list of files and create a list of files that are needed for extraction
ListOfFiles <- dir(pattern="*.txt",recursive=TRUE)
ListOfFilesNeeded <- subset(ListOfFiles,!grepl("Inertial|README|features_info",ListOfFiles))

#Extract dataframe names from the list of needed files
NamesOfDataframes <- sapply(strsplit(ListOfFilesNeeded,split="/"),tail,1)
NamesOfDataframes <- sub("\\.txt","",tolower(NamesOfDataframes))

#Create a list of dataframes from the needed files
my_list <- list()
for(i in 1:length(NamesOfDataframes)) {
  
  tmp <- read.table(ListOfFilesNeeded[i])
  print(class(tmp))
  my_list[[i]] <- tmp
  
}
#set the list item names to the names of the data frame textfiles 
names(my_list) <- c(NamesOfDataframes)

#adjust columnnames
colnames(my_list$subject_train) <- colnames(my_list$subject_test) <- c("subjectId")
colnames(my_list$activity_labels) <- c("activityId","activityDescription")
colnames(my_list$x_train) <- colnames(my_list$x_test) <- my_list$features[,2]
colnames(my_list$y_train) <- colnames(my_list$y_test) <- "activityId"

#combine all available data to a final dataset
trainingdata <- cbind(my_list$y_train,my_list$subject_train,my_list$x_train)
testdata <- cbind(my_list$y_test,my_list$subject_test,my_list$x_test)
finaldata <- rbind(trainingdata,testdata)

#only keep activityId, SubjectId, mean and standard deviation
finaldata <- finaldata[,grepl("activityId|subjectId|mean\\(|std\\(",colnames(finaldata))] 

#add the activity labels
finaldata <- merge(finaldata,my_list$activity_labels,by="activityId")

#make colnames readable
colnames <- colnames(finaldata)
colnamesSave <- colnames

colnames <- sapply(colnames, function(x) sub("^(t)","time",x)) #change t to time   
colnames <- sapply(colnames, function(x) sub("^(f)","frequency",x)) #change f to freq
colnames <- sapply(colnames, function(x) sub("\\()","",x)) #remove ()
colnames <- sapply(colnames, function(x) sub("Acc","Accelerometer",x)) 
colnames <- sapply(colnames, function(x) sub("Gyro","Gyroscope",x))
colnames <- sapply(colnames, function(x) sub("Mag","Magnitude",x))
colnames <- sapply(colnames, function(x) sub("BodyBody","Body",x))
colnames <- sapply(colnames, function(x) sub("-mean","Mean",x))
colnames <- sapply(colnames, function(x) sub("-std","Stddev",x))
names(finaldata) <- colnames


#create tidy dataset and write it to tidy.csv
library(dplyr)
library(tidyr)

tblFinal <- tbl_df(finaldata) %>% 
    gather("Sensor","Value",3:68) %>%
    group_by(activityId,activityDescription, subjectId, Sensor)  %>%
   summarise(Average=mean(Value)) 

write.table(tblFinal,"tidy.txt",row.names=FALSE)
