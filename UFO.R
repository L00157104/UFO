# Data Science First Assessment - 1
# Objective : Use the file called ufo.csv. This dataset contains over 80,000 reports of 
# unidentified flying object (UFO) sightings over the last century.

###########################################################################

#-----------------------------
# Q1
# Create a new project called UFO. Then read the UFO dataset into a new data frame 
# called ufo_data. The UFO dataset holds lots of variables that contain an empty space. 
# Replace each empty space with NA.
#-----------------------------

# Read CSV File and replaced missing content with NA

ufo_data <- read.csv("ufo.csv", na="")

# view data from data frame ufo
View(ufo_data)


#-----------------------------
# Q2
# Show the structure of the UFO data frame as well as the first 15 rows of data within the 
# data frame. Then count the number of rows within the UFO data frame to confirm there 
# are 89071 rows in it.
#-----------------------------


# view structure of the data frame ufo
str(ufo_data)

# first 15 rows of data within the data frame ufo

# using head function to avoid if there are null rows - Method - I
head(ufo_data, 15)

# using indexer but it may show if there are null rows - Method - II
ufo_data[1:15, ]

# count the number of rows within the UFO data frame
nrow(ufo_data)


#-----------------------------
# Q3
# The datetime field is currently set as a chr variable and needs to be converted to a date 
# variable. The current date structure is represented in mm/dd/yyyy format. Using the 
# relevant R command, convert the datetime variable to a date variable.
#-----------------------------

# checking structure of datetime field before conversion 
str(ufo_data$datetime)

# considerred a new field called converted_date for conversion from CHR to DATE
converted_date <- as.Date(ufo_data$datetime, "%m/%d/%y")
converted_date
str(converted_date)  


#-----------------------------
# Q4
# Update the UFO data frame with the new date structure. And prove that the date 
# structure has now changed to a date variable by displaying the new structure of the 
# UFO data frame.
#-----------------------------

ufo_data$datetime <- converted_date
str(ufo_data)
# checking structure of datetime field before conversion 
str(ufo_data$datetime)


#-----------------------------
# Q5
# The UFO data frame contains some headings that could cause future issues when 
# referencing them. Using the names() function, display the names of the UFO data
# frame. Then modify the variable names shown in the table below with their updated 
# variable names.

# Variable name Updated variable name
#     duration..seconds. DurationSeconds
#     duration..hours.min. DurationHrsMins
#     date.posted DatePosted

# Prove that the variable names have changed using the names() function once you’ve 
# modified the variable names.
#-----------------------------


# Displaying names of UFO data frame using names function before Header change
names(ufo_data)

names(ufo_data)[6] <- "DurationSeconds" 
names(ufo_data)[7] <- "DurationHrsMins" 
names(ufo_data)[9] <- "DatePosted" 

# Displaying names of UFO data frame using names function after modification
names(ufo_data)


#-----------------------------
# Q6
# The latitude variable is incorrectly defined as a chr variable when it should be a 
# numerical variable. Recode the variable so that it is a numerical variable. Then show the 
# new structure of the data frame.
#-----------------------------

# Using attach function with data frame
attach(ufo_data)

# showing variable latitude datatype before conversion into numeric
str(latitude)

# considerred a new variable called converted_latitude
# converting to numeric
converted_latitude <- as.numeric(latitude)  
str(converted_latitude)

# assigning new variable values in existing variable
latitude <- converted_latitude

# showing variable latitude datatype after conversion into numeric
str(latitude)

# structure of data frame showing
str(ufo_data)

# detaching data frame
detach(ufo_data)

#-----------------------------
# Q7
# Using the mice library, display the number of missing variables in the UFO data frame.
# Indicate in your R script file the following information:
#   • How many records have no missing data content? 
#   • How many variables have all data variables missing? 
# Save your missing variable plot into the working directory. Call the file missingvars.png.
#-----------------------------

# using complete cases
# if it is TRUE for each row which is complete and 
# if we have missing values it will show FALSE

# How many records have no missing data content? 

count_ufo_data_cc <- complete.cases(ufo_data)
count_ufo_data_cc

# it will give sum of TRUE always
sum(count_ufo_data_cc)

# rows with missing values
count_ufo_data_ncc <- !complete.cases(ufo_data)
sum(count_ufo_data_ncc)

# How many variables have all data variables missing?
sum(is.na(ufo_data))
sum(is.na(ufo_data$`Mean Value`))

# install and use Mice package to show missing vars in ufo data frame

install.packages("mice")
library(mice)
md.pattern(ufo_data)

#-----------------------------
# Q8
# Sort the UFO data frame firstly by shape and then by city. Then extract only the columns 
# datetime, city, country and shape and store the content into a data frame called 
# sorted_ufo_data. Display the first 15 rows of data in this new data frame.
#-----------------------------

sorted_data <- ufo_data[order(shape, city), ]
sorted_data

sorted_ufo_data <- sorted_data[c("datetime", "city", "country", "shape")] 
sorted_ufo_data [1:15, ]

#-----------------------------
# Q9
# Using the subset() function, find all entries in the UFO data frame where the country 
# equals “gb” and the shape variable equals “disk”. Store the contents in a data frame 
# called ufo_gb_disk.
#-----------------------------

ufo_gb_disk <- subset(ufo_data, country == "gb" & shape == "disk")
ufo_gb_disk 


#-----------------------------
# Q10
# Using the write.csv() command, save your newly modified UFO data frame as 
# modified_ufo.csv and also save your ufo_gb_disk data frame as ufo_gb.csv and the
# sorted_ufo_data as sorted_ufo.csv. Save all three files into the working directory of 
# your project. 
#-----------------------------

# save newly modified UFO data frame as modified_ufo.csv
write.csv(ufo_data, file = "modified_ufo.csv")

# save ufo_gb_disk data frame as ufo_gb.csv
write.csv(ufo_gb_disk, file = "ufo_gb.csv")

# save sorted_ufo_data as sorted_ufo.csv
write.csv(sorted_ufo_data, file = "sorted_ufo.csv")

# End Of Assessment - 1
# Thank You 