
##Part 1
download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
", destfile="a.zip", mode='wb', cacheOK=FALSE)

unzip("a.zip")

# I now read them individually
#start with train
t1<-read.table("UCI HAR Dataset/train/subject_train.txt")
t2<-read.table("UCI HAR Dataset/train/X_train.txt")
t3<-read.table("UCI HAR Dataset/train/Y_train.txt")
t4<-read.table("UCI HAR Dataset/features.txt")
t5<-read.table("UCI HAR Dataset/activity_labels.txt")

# turning the column names txt file into column names
names(t1)<-"subject"
names(t3)<-"y"
t4<-t4[2]
t5<-as.factor(t5$V2)
t6<-as.factor(t3$y)
levels(t6)<-t5#sub in levels of factor

tnames<-t(t4) #transpose to horizontal
colnames(t2)<-tnames#give names to columns
#substitute numerical values for names in rows
ta<-cbind(t6,t1,t2)

#repeat process for test


# read them individually

t1<-read.table("UCI HAR Dataset/test/subject_test.txt")
t2<-read.table("UCI HAR Dataset/test/X_test.txt")
t3<-read.table("UCI HAR Dataset/test/Y_test.txt")
t4<-read.table("UCI HAR Dataset/features.txt")
t5<-read.table("UCI HAR Dataset/activity_labels.txt")

# turning the column names txt file into column names
names(t1)<-"subject"
names(t3)<-"y"
t4<-t4[2]
t5<-as.factor(t5$V2)
t6<-as.factor(t3$y)
levels(t6)<-t5#sub in levels of factor

tnames<-t(t4) #transpose to horizontal
colnames(t2)<-tnames#give names to columns
#substitute numerical values for names in rows
tb<-cbind(t6,t1,t2)#obviously have tb instead of ta so that a new data.frame does not overwrite the old

tfinal<-rbind(ta,tb)#row  bind both test and train together



##Part2!!
tnames<-as.character(tnames)

u1<-tnames[grep("mean",tnames)]
u2<-tnames[grep("std",tnames)]
u1<-(data.frame(u1))
u2<-(data.frame(u2))
names(u1)<-"a" 
names(u2)<-"a" 
u3<-rbind(u1, u2)
u4<-c(as.character(u3$a))

ufinal<-tfinal[u4]#the new dataframe with only mean and std



##Part 3


##It would seem that I have already accomplished this


##part 4

names(ufinal)<-gsub("-"," ",names(ufinal))
names(ufinal)<-gsub("\\()"," ",names(ufinal))
vfinal<-ufinal

##part 5
#add back the activity and subject columns
w1<-cbind(tfinal[1],tfinal[2], ufinal)
names(w1)[1]<-"activity"

wfinal<-aggregate(ufinal,as.list(w1[2:1]), mean)

write.table(wfinal,file="tidy_table.txt",row.name=FALSE)
