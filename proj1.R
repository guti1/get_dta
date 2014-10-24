
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

variables_x <- read.table("UCI HAR Dataset/features.txt", quote="\"")

#setting variable names

names(X_train) <- variables_x$V2
names(X_test) <- variables_x$V2


#merging
X_merged <- rbind(X_train, X_test)
Y_merged <- rbind(Y_train, Y_test)








