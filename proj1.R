#loading packages

library(dplyr)
library(reshape2)

#downloading and loading the dataset


temp <- tempfile()

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)


#unzip

unzip(temp)
unlink(temp)


#importing data 

X_train <- read.table("UCI HAR Dataset/train/X_train.txt", quote="\"")
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt", quote="\"")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", quote="\"")

X_test <- read.table("UCI HAR Dataset/test/X_test.txt", quote="\"")
Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt", quote="\"")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", quote="\"")


labels <- read.table("UCI HAR Dataset/activity_labels.txt", quote="\"")

variables_x <- read.table("UCI HAR Dataset/features.txt", quote="\"")

#setting variable names and labels

names(X_train) <- variables_x$V2
names(X_test) <- variables_x$V2
names(labels)[2] <- "activity_name"


#merging
X_merged <- rbind(X_train, X_test)
Y_merged <- rbind(Y_train, Y_test)
subjects <- rbind(subject_train, subject_test)
names(subjects)[1] <- "Id"



#Extracting mean and std dev for each measurements

extract_features <- grepl("mean|std", features[,2], ignore.case=T)

X_merged2 <- X_merged[, extract_features]


#adding activity names 

Y_merged2 <- merge(Y_merged, labels, by="V1", all.x=T)


#adding subject ids and activities to the DF

X_merged3 <- cbind(subjects,Y_merged2$activity_name,X_merged2)
head(X_merged3)
names(X_merged3)[2] <- "Activity_name"

# creating tidy dataset


id_labels  <-  c("Id", "Activity_name")
data_labels  <- setdiff(colnames(X_merged3), id_labels)
X_merged4 <- melt(X_merged3, id = id_labels, measure.vars = data_labels)

tidy_data  <-  dcast(X_merged4, Id + Activity_name ~ variable, mean)

#export data
write.table(tidy_data, file = "./tidy_data.txt", row.name=F)





