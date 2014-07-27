gcd_proj
========
This document explains the reasoning behind my methodology as well as what has been done.

# Obtaining Data

The data was downloaded from the link specified in the course project page at https://class.coursera.org/getdata-005/human_grading/view/courses/972582/assessments/3/submissions

The URL is accessed from within the R script (I have commented it out for the purpose of repeated runs) and was accessed for this submission at 18:25 IST on 27th July 2014.

#Variables

I have chosen to interpret the instruction to include only mean and standard deviations of "measurements" to mean
that there is no need to include derived values, such as frequency components, magnitudes etc. This cuts the values down to the below:

"tBodyAcc-mean()-X"    "tBodyAcc-mean()-Y"    "tBodyAcc-mean()-Z"    "tBodyAcc-std()-X"     "tBodyAcc-std()-Y"    
"tBodyAcc-std()-Z"     "tGravityAcc-mean()-X" "tGravityAcc-mean()-Y" "tGravityAcc-mean()-Z" "tGravityAcc-std()-X" 
"tGravityAcc-std()-Y"  "tGravityAcc-std()-Z"  "tBodyGyro-mean()-X"   "tBodyGyro-mean()-Y"   "tBodyGyro-mean()-Z"  
"tBodyGyro-std()-X"    "tBodyGyro-std()-Y"    "tBodyGyro-std()-Z"  

See the codebook for the definitions of these. Sadly the gravity and body components of the data are already separated using a low pass filter so this isn't really the "raw data".

I chose to name the variables with longer names - I don't think this is really necessary given the code book exists, but it is in the assignment instructions so I did it.

