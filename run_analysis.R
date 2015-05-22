 path <- file.path("UCI HAR Dataset")
    
    LabelTrain <- read.table(file.path(path, "train", "Y_train.txt"),header = FALSE)
    LabelTest <- read.table(file.path(path, "test", "Y_test.txt"),header = FALSE)
    
    SubjectTrain <- read.table(file.path(path, "train", "subject_train.txt"),header = FALSE)
    SubjectTest <- read.table(file.path(path, "test", "subject_test.txt"),header = FALSE)
    
    DataTrain <- read.table(file.path(path, "train", "X_train.txt"),header = FALSE)
    DataTest <- read.table(file.path(path, "test", "X_test.txt"),header = FALSE)
    
#1  Merges the training and the test sets to create one data set.
    JoinLabel<- rbind(LabelTrain, LabelTest)    
    JoinSubject <- rbind(SubjectTrain, SubjectTest)
    JoinData<- rbind(DataTrain, DataTest)

    dim(JoinLabel)  # 10299*1, Y
    dim(JoinSubject)  # 10299*1, Subject
    dim(JoinData)  # 10299*561, X
    
    Data <- cbind(JoinLabel, JoinSubject, JoinData)

#2  Extracts only the measurements on the mean and standard deviation for each measurement. 
    Features <- read.table(file.path(path, "features.txt"), header = FALSE)
    dim(Features) # 561*2
    
    MStdIndices <- grep("mean\\(\\)|std\\(\\)", Features[, 2])
    length(MStdIndices) #66
    
    JoinData <- JoinData[, MStdIndices]
    dim(JoinData) #10299*66

#3  Uses descriptive activity names to name the activities in the data set
    ActivityLabel <- read.table(file.path(path, "activity_labels.txt"), header = FALSE)
    Activity <- ActivityLabel[JoinLabel[, 1], 2]
    JoinLabel[, 1] <- Activity
    names(JoinLabel) <- "Activity"

#4  Appropriately labels the data set with descriptive variable names. 
    names(JoinSubject) <- "Subject"
    nData <- cbind(JoinSubject, JoinLabel, JoinData)
    dim(nData) #10299*68

    write.table(nData, "merged_data.txt")

#5  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    library(plyr)
    Data2<-aggregate(. ~subject + activity, nData, mean)
    Data2<-Data2[order(Data2$Subject,Data2$Activity),]

    write.table(Data2, file = "tidydata.txt",row.name=FALSE)
