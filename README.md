# Getting-Cleaning-Data-Project

(See "run_analysis.R" for enumeration of script components)

# (0) #
-Loads the dplyr package

# (1) #
the three files comprising the Test data are loaoded as R objects

# (2) #
the three files comprising the Training data are loaded as R objects

# (3) #
the two sets of three objects from (1) and (2) are combined into two 
new objects, test_full and train_full

# (4) # 
the two objects from (3) are combined into a single object, full_set.
the column names of full_set are then replaced with the variable names
from features.txt

# (5) #
using the grep() function columns whose name contains one of two strings,
std() or mean(), are used to create a new object containing only the mean 
and standard deviation data.  *note: the first two columns, Subject and 
Activity, are also retained

# (6) #
the Activity indices are replaced with the names of the activities from
the activity_labels.txt

# (7) #
the column names are made "tidy" by relpacing 'f' with 'freq', 't' with 'time', and removing dashes and parentheses 

# (8) # 
using the group_by() and summarize_each() functions the final tiday dataset,
final_data_set, is created
