#loading packages

library(dplyr)


#downloading and loading the dataset


temp <- tempfile()

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)


#unzip

unzip(temp)
unlink(temp)


#importing data 

X_train <- read.table("UCI HAR Dataset/train/X_train.txt", quote="\"")
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt", quote="\"")

X_test <- read.table("UCI HAR Dataset/test/X_test.txt", quote="\"")
Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt", quote="\"")

labels <- read.table("UCI HAR Dataset/activity_labels.txt", quote="\"")

variables_x <- read.table("UCI HAR Dataset/features.txt", quote="\"")

#setting variable names and labels

names(X_train) <- variables_x$V2
names(X_test) <- variables_x$V2



#merging
X_merged <- rbind(X_train, X_test)
Y_merged <- rbind(Y_train, Y_test)



data <- cbind(y)


#Extracting mean and std dev for each measurements

extract_features <- grepl("mean|std", features[,2], ignore.case=T)

X_merged2 <- X_merged[, extract_features]











