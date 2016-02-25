# RDataTidyProject
Tidying Samsung Movement Data

THE FOLLOWING ARE INSTRUCTIONS TO MERGE THE NEEDED WEARABLE COMPUTING DATA FILES INTO A TIDY DATA SET FOR ANALYSIS

Load R

Run UCIHAR_TidyingScripts.r script

final two data sets
test_train_mean_std                 	
#: 	data frame with mean and standard dev variables only, clean column names, merge of test and train data, merge of subjects, activities

mean_by_subject_by_activity		
#	average of each variable for each activity and each subject.

Detailed instructions and description below

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


