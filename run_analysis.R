run_analysis function () <- {

    ## Download the file into your working directory ("Curl" method for use on Mac)
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data", method="curl")
        unzip("data")
        setwd("UCI HAR Dataset")
            ## Folder was created from unzipping data

    ## Assignment Step 1: 
    ## Read in all the data into R tables and bind the data together
        ## Read and column bind together the test data
            subject_test <- read.table("test/subject_test.txt")
            activities_test <- read.table("test/y_test.txt")
            data_test <- read.table("test/X_test.txt")
            test <- cbind(subject_test, activities_test, data_test)
        ## Read and column bind together the train data
            subject_train <- read.table("train/subject_train.txt")
            activities_train <- read.table("train/y_train.txt")
            data_train <- read.table("train/X_train.txt")
            train <- cbind(subject_train, activities_train, data_train)
        ## Row bind both the test and the train data into one data set
            all_data <- rbind(test, train)

    ## Assignment Step 2:
    ## First add names to the columns and then extract only the columns that are a mean or standard deviation
        ## Add names to all the columns
            column_names <- read.table("features.txt")
            V1 <- c("1", "1")
            V2 <- c("id", "activity")
            df <- data.frame(V1, V2)
            col_name <- rbind(df, column_names)
                ## put id and activity as the first 2 columns before adding the features.txt names
                ## this creates NAs for the first column, but the first column will not be used in this came
            name <- col_name$V2
                ## subset only the names
            names(all_data) <- name
        ## Extracts only the measurements on the mean and standard deviation 
            relevant <- grep("[mM][eE][aA][nN]|[sS][tT][dD]", names(all_data))
                ## get all the columns in which mean or std is presend in the name     
            id_act <- c(1, 2)
            relevant <- c(id_act, relevant)
                ## add in the id and activity column
            mean_std_data <- all_data[, (relevant)]
                ## subset only relevant columns with mean/std in the name
    
    ## Assignment Step 3:
    ## Uses descriptive activity names to name the activities in the data set
            act_name <- read.table("activity_labels.txt")
            desc_data <- merge(act_name, mean_std_data, by.x="V1", by.y="activity")
                ## merge the data set to add in activity names
            names(desc_data)[2] <- "activity"
                ## rename the column as "activity"
            desc_data <- desc_data[, 2:89]
                ## remove the unnecessary activity number column
            desc_data <- desc_data[,c(2,1,3:88)]
                ## reorder by id and then activity name (not necessary but personal preference)
    
    ## Assignment Step 4: Already done in step 2 and step 3
    
    ## Assignment Step 5:
    ## Get a tidy data set with the avg for each id and activity combination   
        library(plyr)
            ## load package to use the next function
        avg_data <- ddply(desc_data, c("id", "activity"), colwise(mean))
            ## the the mean for every id and activity combination
        write.table(avg_data, "tidy_data.txt", row.name=FALSE)
            ## save the data to a tidy_data.txt file
}