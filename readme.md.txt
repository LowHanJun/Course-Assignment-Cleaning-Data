##Cleaning Data Course Project

Hi there! I shall endevor to explain my overall process to you; with regards to munute details you will likely find them explained in the code itself 

#Step 1
-Data is downloaded and unzipped. Text files are read individually, starting with "train". 

-Table y_train's columns are renamed with features; this is done by simple substitution. 

-The numerical values in x_train are changed to the character values in the activity_labels file. This is done by changing both to factor variables and substituting levels.

-The new x_train and individual columns are cbound to the tidier y_train

-The proccess is repeated with the 'test' files. Both 'test' and 'train' are then row bound into a dataframe tfinal. Note that tfinal posses both individual and x_train (or activity) columns which I shall use later.


#Step 2

-grep is used to locate the mean and std variables.

-the two are merged via rbind

-a new dataframe ufinal is created by substituting only columns that have either mean or std variables. First tidy dataset, bu lacks individual and activity columns as I do not need them yet.


#Step 3

-I had unknowingly completed this step in step 1, where x_train was changed to character values from numerical.

#Step 4
-gsub deployed to find and remove unneccessary characters such as () and - from the column names, overwriting ufinal. I create vfinal to reppresent this.

#Step 5

-the aggregate function is used to find the mean of each variable per activity, per individual. 

-write tidy_table.txt, final tidy data that was uploaded
##The End