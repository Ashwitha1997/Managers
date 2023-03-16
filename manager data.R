date_col <- c("10/15/18", "01/11/18", "10/21/18", "10/28/18 ", "05/01/18")
country_col <- c("US", "US", "IRL", "IRL", "IRL")
gender_col <- c("M", "F", "F", "M", "F")
age_col <- c(32, 45, 25, 39, 99)
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
q3_col <- c(5, 2, 5, 4, 1)
q4_col <- c(5, 5, 5, NA, 2)
q5_col <- c(5, 5, 2, NA, 1)

managers_data <- data.frame(date_col, 
                            country_col, 
                            gender_col, 
                            age_col, 
                            q1_col, 
                            q2_col, 
                            q3_col, 
                            q4_col, 
                            q5_col)

str(managers_data)

#changing column names for human viewing
column_names <- c("Date", 
                  "Country", 
                  "Gender", 
                  "Age", 
                  "Q1", 
                  "Q2", 
                  "Q3", 
                  "Q4", 
                  "Q5")

colnames(managers_data) <- column_names
managers_data
str(managers_data) #structure of dataframe

managers_data$Age[managers_data$Age==99] <- NA

#create new category called age_cat , 
#if <=25 then young
#if >=26 && <=44 then middle aged
#if >=45 then elder

#no loop required of if statement

managers_data$AgeCat[managers_data$Age <= 25] <- "Young"
managers_data$AgeCat[managers_data$Age >=26 & managers_data$Age <=44] <- "Middle Aged"
managers_data$AgeCat[managers_data$Age >=45] <- "Elder"

#recode agecat so that its categorical and ordinal
converted_agecat <- factor(managers_data$AgeCat,
                           order = TRUE,
                           levels = c("Young", "Middle Aged", "Elder"))
managers_data$AgeCat <=converted_agecat




#create new col called "summary col" that contains a summary of each row
#cant insert summary_col asit contains NA
managers_data$summary_col <- 
  managers_data$Q1 + 
  managers_data$Q2 + 
  managers_data$Q3 + 
  managers_data$Q4 + 
  managers_data$Q5  

summary_col
managers_data
mean_value <- rowMeans(managers_data[5:9])
mean_value
managers_data <- data.frame(managers_data, mean_value)



