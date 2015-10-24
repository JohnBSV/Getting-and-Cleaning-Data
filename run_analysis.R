#Initially all relevant files will be read into R.

X.test<-read.table("./test/X_test.txt"  
                   ,header = F)        #Reads test data
y.test<-read.table("./test/y_test.txt"
                   ,header = F)        #Reads test labels
features<-read.table("features.txt",
                     header = F)       #Reads all the features names
