######################################################################
##        This R script is used for improving my concepts           ##
##        of R and performing some basic data manipulation          ##
##Author : Essa Ray     Course : ADSM-IIMK    Year : 2020-2021      ##
######################################################################

#Setting the working directory 
setwd(dir = "C:\\Essa\\IIM-KDataScience\\11-28-2020\\selfstudy")

#To see what is the current working directory
getwd()


#################   Creating an array  ##################################
dim1 <- c("A1", "A2")
dim2 <- c("B1", "B2", "B3")
dim3 <- c("C1", "C2", "C3", "C4")
z <- array(1:24, c(2,3,4), dimnames = list(dim1, dim2, dim3))
z
#######################  Creating a dataframe      ########################
patientId <- c(1, 2, 3, 4)
age <- c(22, 23, 24, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Good", "Needs Improvement", "Excellent", "Improved")
patientdata <- data.frame(patientId, age, diabetes, status)
View (patientdata)

#######################  Specifying elements of a dataframe - Type1      ########################
patientdata[1:2,] ####### Display rows 1-2 for all columns
patientdata[1:2]  ####### Display rows all for 1-2 columns
patientdata[,2:3] ####### Display rows all for 2-3 columns
patientdata[,,]   ####### Display rows all for all columns

#######################  Specifying elements of a dataframe - Type3      ########################
patientdata[c("diabetes", "age")] ####### Display rows all for columns = "diabetes", "age"

#######################  Specifying elements of a dataframe - Type2      ########################
patientdata$diabetes ####### Display all attributes stored for diabetes

#######################  Declaring a cross table of diabetes and patient status     ########################
table(patientdata$diabetes, patientdata$status)

#######################  Accessing elements of a table using attach, detach, with     ########################
View(mtcars)
attach(mtcars)
summary(mpg)
plot(mpg, disp)
plot(mpg, wt)

### Accessing using "with"
with(mtcars, {
  summary(mpg)
  plot(mpg, disp)
  plot(mpg, wt)
})

with(mtcars, {
  stats <- summary(mpg)
  stats #### This will not throw an error because this is within the scope of the "with" block
})
stats #### This will throw error because the scope of variable stats is within the "with" block

##### Assigning variables using the special assignment operator to allow access to the variable outside of with block
with(mtcars, {
  stats <<- summary(mpg)
  
})
stats

#############################  Case Identifiers #############################
patientdata2 <- data.frame(patientId, age, diabetes, status, row.names = patientId) ### the row.names identifies the label to be used in subsequent plots
View(patientdata2)
plot(age)

####################### Nominal and Ordinal Variables  #########################
## Nominal variables are categorical variables without an implied order
## Ordinal variables imply order but not amount

diabetes <- factor(diabetes)  ### This is a nominal variable
diabetes

status <- factor(status)  ### This is a ordinal variable
status

status <- c("Good", "Needs Improvement", "Excellent", "Improved")
status <- factor(status, order = TRUE, levels = c("Needs Improvement", "Improved", "Good", "Excellent"))
status

########################## Reading and writing to a CSV ###########################
csv_data <- read.csv ("data1.csv")
View(csv_data)

mtcars
write.csv(mtcars, "mtcars.csv")

###################### End of Exercise #############################################
