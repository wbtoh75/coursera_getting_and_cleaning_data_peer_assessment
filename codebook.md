# Brief Introduction

'run_analysis.R' performs the below as per described in the course project's definition.

* 1.Files having the same number of columns and referring to the same entities is merged using the 'rbind()' function. 
* 2.Only those columns with the mean and standard deviation measures are taken from the whole dataset. 
* 3.After extracting these columns, they are given the correct names reference from 'features.txt'.
* 4.Activity data is addressed with values 1:6, we take the activity names and IDs from 'activity_labels.txt' and they are substituted in the dataset.
* 5.Those columns with vague column names are also corrected.
* 6.Lastly, a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows) are generated. 
* 7.The output file from point 6 is called 'second_dataset.txt', and uploaded to this repository.

# Variables Information

* 'xTrain', 'yTrain', 'xTest', 'yTest', 'subjTrain' and 'subjTest' holds data from the downloaded files.
* 'xData', 'yData' and 'subjData' are used to hold merge datasets for further analysis.
* 'ft' holds the correct names for the 'xData' dataset, which are later applied to the column names stored in 'mean_and_std_ft'
* 'mean_and_std_ft' is a numeric vector used to extract the desired data.
* Same approach from above is perform with activity names through the 'acty' variable.
* 'allData' holds merged data from 'xData', 'yData' and 'subjData' in a big dataset.
* 'avgData' contains the relevant averages which will be later stored into 'second_dataset.txt' file. 
* 'ddply()' from the plyr package is used to apply 'colMeans()' to ease the development code.
