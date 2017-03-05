
#Set working directory and load dplyr library.
#Read files into R

testsubject <- read.csv("subject_test.csv", header = FALSE)
testset <- read.csv("x_test.csv", header = FALSE)
testlabels <- read.csv("y_test.csv", header = FALSE)

features <- read.csv("features.csv")

trainsubject <- read.csv("subject_train.csv", header = FALSE)
trainset <- read.csv("x_train.csv", header = FALSE)
trainlabels <- read.csv("y_train.csv", header = FALSE)

#Bind like training and test files by rows.

alldata <- rbind(testset, trainset)
activity <- rbind(testlabels, trainlabels)
subject <- rbind(testsubject, trainsubject)

#Insert column names for appropriate columns.

colnames(alldata) = features [-1, ]
colnames(activity) = "Activity"
colnames(subject) = "Subject"

#Bind all columns together to create a complete data table. 

alldata2 <- cbind(subject, activity, alldata)

#Remove duplicate columns.

alldata2 <- alldata2[ , !duplicated(colnames(alldata2))]

#Extract columns for mean and standard deviation.

mean <- select(alldata2, contains("mean"))
std <- select(alldata2, contains("std"))

#Bind subject, activity, mean, and standard columns.

extdata <- cbind(subject, activity, mean, std)

#Label activities appropriately.

extdata$Activity[which(extdata$Activity=="5")]<-"Standing"
extdata$Activity[which(extdata$Activity=="4")]<-"Sitting"
extdata$Activity[which(extdata$Activity=="3")]<-"Walking_Downstairs"
extdata$Activity[which(extdata$Activity=="2")]<-"Walking_Upstairs"
extdata$Activity[which(extdata$Activity=="1")]<-"Walking"
extdata$Activity[which(extdata$Activity=="6")]<-"Laying"

#Calculate the mean for each variable for the subject and activity.

avedata<-extdata %>%
  
  group_by(Subject, Activity) %>%
  summarise_each(funs(mean))

#Create test file.

write.table(avedata, "avedata.txt", sep=",", row.names=FALSE)
