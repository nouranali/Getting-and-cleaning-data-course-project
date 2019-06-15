## The run_analysis.R perfroms the following tasks
### 1. Downloading data from this link [https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project]
### 2. Merges the training and the test sets to create one data set 
#### features.txt <- features has 561 obs(columns) with 2 variables (rows) The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ

#### activity_labels.txt <- activity has 6 columns and 2 rows ist of activities performed when the corresponding measurements were taken and its codes

#### subject_test <- test/subject_test.txt : 2947 rows, 1 column contains test data of 9/30 volunteer test subjects being observed
#### x_test <- test/X_test.txt : 2947 rows, 561 columns contains recorded test data
#### y_test <- test/y_test.txt : 2947 rows, 1 columns contains test data of activities’code labels
#### subject_train <- test/subject_train.txt : 7352 rows, 1 column contains train data of 21/30 volunteer subjects being observed
#### x_train <- test/X_train.txt : 7352 rows, 561 columns contains recorded features train data
#### y_train <- test/y_train.txt : 7352 rows, 1 columns contains train data of activities’code labels

### 3. Extracts only the measurements on the mean and standard deviation for each measurement.
#### subject contains 10299 columns and only 1 row
#### code 10299 columns and 1 row
#### TidyData (10299 rows, 88 columns) is created by subsetting Merged_Data, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

### 4. Uses descriptive activity names to name the activities in the data set
#### Entire numbers in code column of the TidyData replaced with corresponding activity taken from second column of the  activities variable

### 5. Appropriately labels the data set with descriptive variable names.
#### changing all appreviations in column names

### 6. creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#### finalds 88 columns with 180 rows, Export FinalData into FinalData.txt file

