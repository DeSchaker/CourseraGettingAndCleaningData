# Codebook Data cleaning project
J.R. Westerink  
31 mei 2016  



# Project description
During this project a clean, tidy dataset was created from the following source
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Data processing
runAnalysis.R processes the following files:

* UCI HAR Dataset/activity_labels.txt     
* UCI HAR Dataset/features.txt           
* UCI HAR Dataset/test/subject_test.txt   
* UCI HAR Dataset/test/X_test.txt        
* UCI HAR Dataset/test/y_test.txt         
* UCI HAR Dataset/train/subject_train.txt
* UCI HAR Dataset/train/X_train.txt       
* UCI HAR Dataset/train/y_train.txt 

# Creating the tidy data
The tidy data can be created by running runAnalysis.R, which takes care of downloading and processing the raw data.


# Description of the values in the tidy dataset

```
Dimensions of the tidy dataset (rows,columns):
[1] 11880     5
Variables in the tidy dataset:
[1] "activityId"          "activityDescription" "subjectId"          
[4] "Sensor"              "Average"            
```


## activityId
The activityId is the unique identifier for the activity that took place. Also see activityDescription

```
Values:
[1] 1 2 3 4 5 6
```


## activityDescription
The activityDescription contains information about the activity that took place.

```
Values:
[1] "LAYING"             "SITTING"            "STANDING"          
[4] "WALKING"            "WALKING_DOWNSTAIRS" "WALKING_UPSTAIRS"  
```

## subjectId
The subjectId is the unique identifier for the subject that participated in the experiment.

```
Values:
 [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
[24] 24 25 26 27 28 29 30
```

## Sensor
The sensor variable contains information about the sensor that took the measurement.

```
Values:
 [1] "frequencyBodyAccelerometerJerkMagnitudeMean"  
 [2] "frequencyBodyAccelerometerJerkMagnitudeStddev"
 [3] "frequencyBodyAccelerometerJerkMean-X"         
 [4] "frequencyBodyAccelerometerJerkMean-Y"         
 [5] "frequencyBodyAccelerometerJerkMean-Z"         
 [6] "frequencyBodyAccelerometerJerkStddev-X"       
 [7] "frequencyBodyAccelerometerJerkStddev-Y"       
 [8] "frequencyBodyAccelerometerJerkStddev-Z"       
 [9] "frequencyBodyAccelerometerMagnitudeMean"      
[10] "frequencyBodyAccelerometerMagnitudeStddev"    
[11] "frequencyBodyAccelerometerMean-X"             
[12] "frequencyBodyAccelerometerMean-Y"             
[13] "frequencyBodyAccelerometerMean-Z"             
[14] "frequencyBodyAccelerometerStddev-X"           
[15] "frequencyBodyAccelerometerStddev-Y"           
[16] "frequencyBodyAccelerometerStddev-Z"           
[17] "frequencyBodyGyroscopeJerkMagnitudeMean"      
[18] "frequencyBodyGyroscopeJerkMagnitudeStddev"    
[19] "frequencyBodyGyroscopeMagnitudeMean"          
[20] "frequencyBodyGyroscopeMagnitudeStddev"        
[21] "frequencyBodyGyroscopeMean-X"                 
[22] "frequencyBodyGyroscopeMean-Y"                 
[23] "frequencyBodyGyroscopeMean-Z"                 
[24] "frequencyBodyGyroscopeStddev-X"               
[25] "frequencyBodyGyroscopeStddev-Y"               
[26] "frequencyBodyGyroscopeStddev-Z"               
[27] "timeBodyAccelerometerJerkMagnitudeMean"       
[28] "timeBodyAccelerometerJerkMagnitudeStddev"     
[29] "timeBodyAccelerometerJerkMean-X"              
[30] "timeBodyAccelerometerJerkMean-Y"              
[31] "timeBodyAccelerometerJerkMean-Z"              
[32] "timeBodyAccelerometerJerkStddev-X"            
[33] "timeBodyAccelerometerJerkStddev-Y"            
[34] "timeBodyAccelerometerJerkStddev-Z"            
[35] "timeBodyAccelerometerMagnitudeMean"           
[36] "timeBodyAccelerometerMagnitudeStddev"         
[37] "timeBodyAccelerometerMean-X"                  
[38] "timeBodyAccelerometerMean-Y"                  
[39] "timeBodyAccelerometerMean-Z"                  
[40] "timeBodyAccelerometerStddev-X"                
[41] "timeBodyAccelerometerStddev-Y"                
[42] "timeBodyAccelerometerStddev-Z"                
[43] "timeBodyGyroscopeJerkMagnitudeMean"           
[44] "timeBodyGyroscopeJerkMagnitudeStddev"         
[45] "timeBodyGyroscopeJerkMean-X"                  
[46] "timeBodyGyroscopeJerkMean-Y"                  
[47] "timeBodyGyroscopeJerkMean-Z"                  
[48] "timeBodyGyroscopeJerkStddev-X"                
[49] "timeBodyGyroscopeJerkStddev-Y"                
[50] "timeBodyGyroscopeJerkStddev-Z"                
[51] "timeBodyGyroscopeMagnitudeMean"               
[52] "timeBodyGyroscopeMagnitudeStddev"             
[53] "timeBodyGyroscopeMean-X"                      
[54] "timeBodyGyroscopeMean-Y"                      
[55] "timeBodyGyroscopeMean-Z"                      
[56] "timeBodyGyroscopeStddev-X"                    
[57] "timeBodyGyroscopeStddev-Y"                    
[58] "timeBodyGyroscopeStddev-Z"                    
[59] "timeGravityAccelerometerMagnitudeMean"        
[60] "timeGravityAccelerometerMagnitudeStddev"      
[61] "timeGravityAccelerometerMean-X"               
[62] "timeGravityAccelerometerMean-Y"               
[63] "timeGravityAccelerometerMean-Z"               
[64] "timeGravityAccelerometerStddev-X"             
[65] "timeGravityAccelerometerStddev-Y"             
[66] "timeGravityAccelerometerStddev-Z"             
```

## Average
The Average variable contains the average of the measurement per person, activity and sensor.
The unit of the measures varies depending on the sensor type.




