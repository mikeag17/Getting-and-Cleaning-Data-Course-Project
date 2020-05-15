# Getting-and-Cleaning-Data-Course-Project

Initial Dataset UCI HAR Dataset

Operation of run_analysis.R:

1) Downdload UCI HAR Dataset in working directory
2) Run run_anlysis.R script
3) Script will load in test data via read.csv
4) Script will load in train data via read.csv
5) Script will merge test and train data using rbind and cbind
6) Filter data pertaining to means and standard deviations in data set using grep()
7)Utylize activity labels to add descriptive name to data.frame columns
8)Utylize features labels to further add descriptive names to columns
9) Create Final_Data set by ordering by test subject, activity, then find average for each activity metric
10) Use write.table() to output Final_Data.txt
