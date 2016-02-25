THE FOLLOWING ARE INSTRUCTIONS TO MERGE THE NEEDED WEARABLE COMPUTING DATA FILES INTO A TIDY DATA 
SET FOR ANALYSIS



The following steps are performed in 

1. Getting Started: setting directories, loading libraries

2. Gathering a unique list of features required (mean and std variables only)

3. Loading and defining test files

4. selecting from x_test only wanted columns based on featuresdesc (std and mean columns only)

5. Cleaning up column names

6. Binding labels and subjects with measurement data

7. Loading TRAIN SET data

8. selecting from x_train only wanted columns based on featuresdesc

9. UPDATE COLUMN LABELS FOR x_train_needed_variables

10. 10. Combining Test and Train Data

11. 11. Validate

12. summarizing data for other dataset

final two data sets
test_train_mean_std                 	#: 	data frame with mean and standard dev variables only, clean column names, merge of test and train data, merge of subjects, activities
mean_by_subject_by_activity		#	average of each variable for each activity and each subject.

###################Below is some detail on some of the variables


All documentation on variables can be found: ttp://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The test_train_mean_std dataset contains the following variables

 [1] "tbodyacc_mean_x"               "tbodyacc_mean_y"               "tbodyacc_mean_z"              
 [4] "tgravityacc_mean_x"            "tgravityacc_mean_y"            "tgravityacc_mean_z"           
 [7] "tbodyaccjerk_mean_x"           "tbodyaccjerk_mean_y"           "tbodyaccjerk_mean_z"          
[10] "tbodygyro_mean_x"              "tbodygyro_mean_y"              "tbodygyro_mean_z"             
[13] "tbodygyrojerk_mean_x"          "tbodygyrojerk_mean_y"          "tbodygyrojerk_mean_z"         
[16] "tbodyaccmag_mean"              "tgravityaccmag_mean"           "tbodyaccjerkmag_mean"         
[19] "tbodygyromag_mean"             "tbodygyrojerkmag_mean"         "fbodyacc_mean_x"              
[22] "fbodyacc_mean_y"               "fbodyacc_mean_z"               "fbodyacc_meanfreq_x"          
[25] "fbodyacc_meanfreq_y"           "fbodyacc_meanfreq_z"           "fbodyaccjerk_mean_x"          
[28] "fbodyaccjerk_mean_y"           "fbodyaccjerk_mean_z"           "fbodyaccjerk_meanfreq_x"      
[31] "fbodyaccjerk_meanfreq_y"       "fbodyaccjerk_meanfreq_z"       "fbodygyro_mean_x"             
[34] "fbodygyro_mean_y"              "fbodygyro_mean_z"              "fbodygyro_meanfreq_x"         
[37] "fbodygyro_meanfreq_y"          "fbodygyro_meanfreq_z"          "fbodyaccmag_mean"             
[40] "fbodyaccmag_meanfreq"          "fbodybodyaccjerkmag_mean"      "fbodybodyaccjerkmag_meanfreq" 
[43] "fbodybodygyromag_mean"         "fbodybodygyromag_meanfreq"     "fbodybodygyrojerkmag_mean"    
[46] "fbodybodygyrojerkmag_meanfreq" "tbodyacc_std_x"                "tbodyacc_std_y"               
[49] "tbodyacc_std_z"                "tgravityacc_std_x"             "tgravityacc_std_y"            
[52] "tgravityacc_std_z"             "tbodyaccjerk_std_x"            "tbodyaccjerk_std_y"           
[55] "tbodyaccjerk_std_z"            "tbodygyro_std_x"               "tbodygyro_std_y"              
[58] "tbodygyro_std_z"               "tbodygyrojerk_std_x"           "tbodygyrojerk_std_y"          
[61] "tbodygyrojerk_std_z"           "tbodyaccmag_std"               "tgravityaccmag_std"           
[64] "tbodyaccjerkmag_std"           "tbodygyromag_std"              "tbodygyrojerkmag_std"         
[67] "fbodyacc_std_x"                "fbodyacc_std_y"                "fbodyacc_std_z"               
[70] "fbodyaccjerk_std_x"            "fbodyaccjerk_std_y"            "fbodyaccjerk_std_z"           
[73] "fbodygyro_std_x"               "fbodygyro_std_y"               "fbodygyro_std_z"              
[76] "fbodyaccmag_std"               "fbodybodyaccjerkmag_std"       "fbodybodygyromag_std"         
[79] "fbodybodygyrojerkmag_std"      "label_id"                      "subject_id"                   
[82] "label_activity"                "train_or_test" 



