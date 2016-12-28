This README describes how script run_analysis.R works. 

First we read './X_test.txt' and './X_train.txt' data sets. 

Next we union these data sets. 

To select only "mean" and "std" features we read './features.txt'. 

At the next step we select only features we are interested in and give the columns appropriate names. 

In order to apply descriptive activity names we read './y_test.txt', './y_train.txt' and './activity_labels.txt' data sets. 

Then we use combination of rbind() and merge() statements. Now we have descriptive activity names.

Finally, we group data set by activity names and apply mean function to all variables. 

