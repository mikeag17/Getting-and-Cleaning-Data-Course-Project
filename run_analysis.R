#Week 4 Course Project
#Unzip data located in current working Directory
data <- unzip("getdata_projectfiles_UCI HAR Dataset.zip")

#Read in test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
#test<- data.frame(subject_test,y_test,x_test)

#Read in train data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
#train<- data.frame(subject_train,y_train,x_train)

#Read in activity and feature labels
activity_lbls <- read.table("UCI HAR Dataset/activity_labels.txt")
features_lbls <- read.table("UCI HAR Dataset/features.txt")

#1) Merge training and test data
merged_x <- rbind(x_test,x_train)
merged_y <- rbind(y_test,y_train)
merged_subject<- rbind(subject_test,subject_train)




#2) Extract only measures on mean and standard deviation

#Create an index or feature lbls with mean or standard deviation in title
idx<-grep("-(mean|std)\\(\\)",features_lbls[,2])
#Use index to filter data set pulling measurements on mean and STD
merged_x<-merged_x[,idx]
merged_all <-cbind(merged_subject,merged_y,merged_x)

#3 Add descriptive names to variable names
#utylize activity lables to replace second column in filtered data table
merged_all[,2]<-activity_lbls[merged_all[,2],2]

#4 Label the data set with descriptive variable names
#Label first column as subject line
names(merged_all)[1]<-"Subject"
#Label second column as Activity
names(merged_all)[2]<-"Activity"
#Utylize features to label remaning columns
Labels <- features_lbls[idx,2]
names(merged_all)[3:68]<-Labels

#5 Second indepedent tidy data set
Final_Data<-aggregate(merged_all[3:68],list(merged_all$Subject,merged_all$Activity),mean)
names(Final_Data)[1]<-"Subject"
names(Final_Data)[2]<-"Activity"
#Order data by subject
Final_Data<-Final_Data[order(Final_Data$Subject),]
write.table(Final_Data,file = "Final_Data.txt",row.names = FALSE)