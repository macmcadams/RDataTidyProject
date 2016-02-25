#Set working dir to location of data
#ie setwd("C:/Users/tmcadams/Dropbox/Coursera/UCI HAR Dataset")
#NEED dplyr library


######################################1. GETTING STARTED######################################
library(dplyr)
setwd("C:/Users/tmcadams/Dropbox/Coursera/UCI HAR Dataset")
features <- read.table("features.txt")
labels <- read.table("activity_labels.txt")

###################################################2. Gathering a unique list of features required (mean and std variables only)
####################################################
colnames(features) <- c("id", "desc")
featuresdesc <- filter(features, grepl("mean", desc))
featuresdesc$meas <- "mean"
featuresdesc2 <- filter(features, grepl('std', desc))
featuresdesc2$meas <- "std"
featuresdesc <- rbind(featuresdesc, featuresdesc2)

###################################################### featuresdesc IS A LIST OF ALL THE VARIABLES I WANT STD AND MEANS


###################################################3. Loading Test files

x_test <- read.table("./test/X_test.txt")    #Test Set
subject_test <- read.table("./test/subject_test.txt")  #Subject that performed  --9 unique subjects
y_test <- read.table("./test/y_test.txt")   #Test Labels
colnames(y_test) <- c("label_id")
colnames(subject_test) <- c("subject_id")
colnames(labels) <- c("label_id", "label_activity")
test_subject_labels <- bind_cols(subject_test, y_test)
test_subject_labels <- merge(test_subject_labels, labels, by.x="label_id", by.y="label_id", all=TRUE)




########################################4. selecting from x_test only wanted columns based on featuresdesc

#set colnames equal to just the id and replace the "V"
temp_col_names <- sub("V","",names(x_test)) 
colnames(x_test) <- temp_col_names
### ##########################################now x_test columns match up with features$id
######################################BELOW IS A LIMITED DATA SET OF X_TEST OF ONLY NEEDED VARIABLES
x_test_needed_variables <- select(x_test, featuresdesc$id) 



###################################################5. Cleaning up column names###########################
#replace with just the number
##this needs to be done after we limit to just the needed columns
new_cols <- featuresdesc$desc
new_cols <- tolower(new_cols)
new_cols <- gsub("\\()-","_", new_cols)
new_cols <- gsub("-","_", new_cols)
new_cols <- gsub(",","_", new_cols)
new_cols <- gsub("\\()","", new_cols)
new_cols <- gsub("\\(","_", new_cols)
new_cols <- gsub("\\)","", new_cols)
#######new_cols  #see how they look
length(new_cols)  #79
length(names(x_test_needed_variables))  #79
colnames(x_test_needed_variables) <- new_cols

######################################################6. Binding labels and subjects with measurement data
x_test_complete <- bind_cols(x_test_needed_variables, test_subject_labels)
###test set now has readable column names, subject column, activity column



##############################################7. Loading TRAIN SET data######################################################
#####need to do same thing for train data set
x_train <- read.table("./train/X_train.txt")    #train Set
subject_train <- read.table("./train/subject_train.txt")  #Subject that performed  --9 unique subjects
y_train <- read.table("./train/y_train.txt")   #train Labels
colnames(y_train) <- c("label_id")
colnames(subject_train) <- c("subject_id")
colnames(labels) <- c("label_id", "label_activity")
train_subject_labels <- bind_cols(subject_train, y_train)
train_subject_labels <- merge(train_subject_labels, labels, by.x="label_id", by.y="label_id", all=TRUE)




######################################################8. selecting from x_train only wanted columns based on featuresdesc
#############set colnames equal to just the id and replace the "V"
temp_col_names <- sub("V","",names(x_train)) 
colnames(x_train) <- temp_col_names
### now x_train columns match up with features$id
##BELOW IS A LIMITED DATA SET OF X_train OF ONLY NEEDED VARIABLES
x_train_needed_variables <- select(x_train, featuresdesc$id) 

#################################################9. UPDATE COLUMN LABELS FOR x_train_needed_variables 
length(new_cols)  #79
length(names(x_train_needed_variables))  #79
colnames(x_train_needed_variables) <- new_cols
x_train_complete <- bind_cols(x_train_needed_variables, train_subject_labels)


###train set now has readable column names, subject column, activity column



##############################10. Combining Test and Train Data
####labeling data with original source in case subject id's cross over
x_train_complete$train_or_test <- "Train"
x_test_complete$train_or_test <- "Test"


####################################11. Validate
nrow(x_train_complete)  #7352
nrow(x_test_complete)  #2947
####combine both data sets for final set of data
test_train_mean_std <- bind_rows(x_train_complete, x_test_complete)
nrow(test_train_mean_std)
summarize(test_train_mean_std)


##########################################12. summarizing data for other dataset

#####checking table
############3summarising each variable by label by activity
mean_by_subject_by_activity <- group_by(test_train_mean_std, label_activity, subject_id) %>% summarise_each(funs(mean)) 

####you will get warnings that character columns aren't able to be averaged


##### script to validate some means against output above
xxx <- select(test_train_mean_std, subject_id, label_activity, tbodyacc_mean_x) %>% filter( subject_id == 2, label_activity == "LAYING")
yyy <- xxx$tbodyacc_mean_x
mean(yyy)



#################################################final two data sets
test_train_mean_std                 	#: 	data frame with mean and standard dev variables only, clean column names, merge of test and train data, merge of subjects, activities
mean_by_subject_by_activity		#	average of each variable for each activity and each subject.


############
#1) a tidy data set as described below, 
#2) a link to a Github repository with your script for performing the analysis, and 
#3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
#You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.





