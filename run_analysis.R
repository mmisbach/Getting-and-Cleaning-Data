setwd("~/R/Coursera/Getting and Cleaning Data/Project/UCI HAR Dataset")
library(reshape2)

#Find columns to include and corresponding names
labels<-read.table('features.txt')
cols<-which(grepl('mean()',labels$V2)|grepl('std()',labels$V2))
names<-labels$V2[cols]

#Set up test data
x_test<-read.table('X_test.txt',header = FALSE)[,cols]
names(x_test)<-names
y_test<-read.table('y_test.txt',col.names = 'Activity')
subject_test<-read.table('subject_test.txt',col.names='Subject')
test<-cbind(subject_test,y_test,x_test)
rm(x_test,y_test,subject_test)

#Set up train data
x_train<-read.table('X_train.txt',header = FALSE)[,cols]
y_train<-read.table('y_train.txt',col.names = 'Activity')
names(x_train)<-names
subject_train<-read.table('subject_train.txt',col.names='Subject')
train<-cbind(subject_train,y_train,x_train)
rm(x_train,y_train,subject_train)

#Merge data
data<-rbind(test,train)
rm(test,train)

#Use descriptions for activities instead of numbers
data$Activity<-factor(data$Activity)
activities<-read.table('activity_labels.txt')
levels(data$Activity)<-activities$V2

#find mean of variables by subject and activity
melted<-melt(data,id=c("Activity","Subject"),measure.vars=names)
dataSummary<-dcast(melted,Subject + Activity ~ variable,mean)

