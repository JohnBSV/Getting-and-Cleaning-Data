#Initially all relevant files will be read into R.


y.test<-read.table("./test/y_test.txt"
                   ,header = F)        #Reads test labels

features<-read.table("features.txt",
                     header = F,
                     colClasses = c("numeric","character"))#Reads all the features names

X.test<-read.table("./test/X_test.txt"  
                   ,header = F,
                   col.names = features[[2]])#Reads test data and assigns col.names

#Reading train data

X.train<-read.table("./train/X_train.txt",
                    header = F,
                    col.names = features[[2]])#Reads train data and assigns col.names

means<-grep("mean()",features[[2]])#Will create a vector of indexes of all names that
                                       #contain the word mean()

stds<-grep("std()",features[[2]])#idem as above but for std


#vectors stds and means will be used to subset feature colnames

mean_features<-features[[2]][means]
std_features<-features[[2]][stds]

#both featurs vectors will be used to subset data

#train data
mean.train<-X.train[,mean_features]
std.train<-X.train[,std_features]

#test data
mean.test<-X.test[,mean_features]
std.test<-X.test[,std_features]

#First we will combine test data to a total and then combine train data to a total

total.test<-cbind(mean.test,
                  std.test) #Combines mean and std test data into 1 df.

total.train<-cbind(mean.train,
                   std.train) #Combines mean and std train data into 1 df

#lastly we combine both total data frames into a final data frame

total.data<-rbind(total.train,
                  total.test)


