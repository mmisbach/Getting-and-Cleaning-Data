# Readme File
This script assumes that all of the Samsung files are unzipped and included in the current working directory and not in any subdirectories

This script first determines the columns to include by looking at the features.txt file and finding the column names that include 'mean()' or 'std()'. It then sets up the test data by reading in the data from the X_test.txt, y_test.txt, and subject_test.txt folders. It then creates a single data frame that includes all of this data appropriately formatted and named in in the test data frame including only those columns that were determined to be included previously. The train data frame is then set up in the same manner as the test data frame. The train and test data frames are then merged including all of the entries from both.

Finally, another data frame called dataSummary is created that displays the mean for each of the included variables by subject and activity
