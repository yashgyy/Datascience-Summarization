library(plyr)
library(dplyr)
Colname <- read.table("features.txt")
Colname <- Colname$V2
Subject_Train <- read.table("subject_train.txt",col.names=c("Id"))
Subject_Test <- read.table("subject_test.txt",col.names=c("Id"))
read.table("X_train.txt",col.names = Colname) -> X_train
read.table("X_test.txt",col.names = Colname) -> X_test
read.table("y_test.txt",col.names = c("Activity"))  -> Y_test
read.table("y_train.txt",col.names = c("Activity"))  -> Y_train
MergedAll <- X_train %>% rbind(X_test) %>% cbind(rbind(Y_train,Y_test)) %>% cbind(rbind(Subject_Train,Subject_Test))
which(grepl("mean|std",names(MergedAll))) -> Indexed
cbind(MergedAll[,Indexed],Activity=MergedAll$Activity,Subject=MergedAll$Id)-> Final1
as.factor(Final1$Activity) ->Final1$Activity
as.factor(Final1$Subject) ->Final1$Subject
revalue(Final1$Activity, c("1"="Walking", "2"="Walking_Upstairs","3"="Walking_Downstairs","4"="Sitting","5"="Standing","6"="Laying")) -> Final1$Activity
TidySet <- group_by(Final1,Subject,Activity) %>% summarise_all(funs(mean))