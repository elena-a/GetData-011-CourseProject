## Summary
  This repository contains a script for taking the data collected for the "Human Activity Recognition Using Smartphones" experiment and creating a tidy data set that summarizes the data. The experiment used the accelerometer and gyroscope built into the smartphone to collect data for 30 individuals as they performed various activities. A full description of the experiment as well as the original data can be found at the site below:
  
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
    
  The data set used can be downloaded directly with the following link: (This is not necessary since the run_analysis.R script will download and upzip the file for you.)
  
    https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    
  In short, the run_analysis.R file merges the train and test data found in the zip file into one data set, and then extracts only data dealing with the mean and standard deviation measurements. The variables, columns names, and activity numbers are updated to ensure that the data makes sense and it is easy to read. Finally, the script creates a tidy data set that consists of the average of each variable for each activity and each subject (since for some subjects multiple observations were taken for the same activity). This tidy data set is then saved as a txt file. 
  
## Running the Script

In order to run the run_analysis.R script, you are required to have the following things:

* R or R Studio downloaded to run the script
* The plyr package : This can be installed using the command install.packages("plyr")    

Running the script:

* Open R Studio and set your working directory. The data will be downloaded and unzipped inside this directory. 
* Save the run_analysis.R in your working directory.
* Load the script so you can call it, which can be done with the command : source("run_analysis.R")
* Call the function by typing run_analysis()
* This will create a txt file with a tidy data set
