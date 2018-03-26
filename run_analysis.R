#
# Getting and Cleaning Data Course Project Assigment
#


# The Getting and Cleaning Data Course Project directory
GCD_dir <- "UCI HAR Dataset"

# Other variables
activity_column_name <- "Activity"
subject_column_name <- "Subject"

# Load libraries
library("curl")
library("dplyr")
library("reshape2")

#
# Functions Definitions
#

# Removes characters different than letters and numbers
removesNonWordChar <- function(c) {
	# first, replace the '-' by '_'
	new_c <- gsub("-", "_", c)
	# remove all other non word characters
	new_c <- gsub("[^a-zA-Z0-9_]", "", new_c)
}

# Loads a file into a dataframe
# Inputs are the name of the file to load ant the list of sub-directories
loadFile <- function(file, ...) {
	fpath <- file.path(..., file)
	read.table(fpath, header = FALSE)
}


#
# Main Code Start
#

# If the Getting and Cleaning Data archive does not exist, download and extract it 
zip_file <- "GCD_archive.zip"
if (!file.exists(zip_file)) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = zip_file)
  unzip(zip_file)
}

# Loads features list from file
features <- loadFile("features.txt", GCD_dir)

# Loads activity labels from file
activities_lab <- loadFile("activity_labels.txt", GCD_dir)

# Format features names
formatted_col_names <- removesNonWordChar(features$V2)

# Loads Training subjects
train_subjects <- loadFile("subject_train.txt", GCD_dir, "train") 
names(train_subjects) <- subject_column_name

# Loads Training dataset
train_sets <- loadFile("X_train.txt", GCD_dir, "train")
# Associates columns names with features
names(train_sets) <- make.names(names = formatted_col_names, unique = TRUE, allow_ = TRUE)

# Loads Training activities
train_activities <- loadFile("y_train.txt", GCD_dir, "train")
# Associates activity numbers with labels
train_activities$V1 <- factor(train_activities$V1, levels = activities_lab$V1, labels = activities_lab$V2)
names(train_activities) <- activity_column_name 

# Combines Training dataset with Subjects and Activies 
train_sets <- cbind(train_subjects, train_activities, train_sets)

# Loads Test subjects
test_subjects <- loadFile("subject_test.txt", GCD_dir, "test")
names(test_subjects) <- subject_column_name

# Loads Test dataset
test_sets <- loadFile("X_test.txt", GCD_dir, "test")
# Associates columns names with features
names(test_sets) <- make.names(names = formatted_col_names, unique = TRUE, allow_ = TRUE)

# Loads Test activities
test_activities <- loadFile("y_test.txt", GCD_dir, "test") 
# Associates activity numbers with labels
test_activities$V1 <- factor(test_activities$V1, levels = activities_lab$V1, labels = activities_lab$V2)
names(test_activities) <- activity_column_name 

# Combines Test dataset with Subjects and Activies 
test_sets <- cbind(test_subjects, test_activities, test_sets)

# Merges the training and the test sets
merged_set <- rbind(train_sets, test_sets)

# Select only mean and standard deviation columns as well as subject and activity
merged_set <- select(merged_set, one_of(subject_column_name, activity_column_name), matches("mean|std"))

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_dataset <- melt(merged_set, id = c(subject_column_name, activity_column_name)) 
tidy_dataset <- dcast(tidy_dataset, Activity + Subject ~ variable, mean)

# Save the tidy data set into a CSV file to be uploaded into Github repo 
write.table(tidy_dataset, file = "tidy_dataset.csv", sep = ",", row.names = FALSE)

