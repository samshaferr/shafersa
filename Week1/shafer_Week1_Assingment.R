# Now it is time to create your own data frame using the tools we have learned this week.
# First, resave this script as: yourlastname_Week1_Assignment [1 point]
  # e.g. mine would be Wilson_Week1_Assignment


# Create 3 numeric vectors and 2 character vectors that are each 15 values in length with the following structures: [15 points; 3 each]
  # One character vector with all unique values
a<-c('German Shapard','Golden Retriver','Pug','Boxer','Husky','Poodle','Chihuahua','Beagle','Australian Cattle','Rottweiler','Border Collie','Corgi','St. Bernard','Newfoundland','Pitbull')

  # One character vector with exactly 3 unique values
b<-c('Breakfast','Breakfast','Breakfast','Breakfast','Breakfast','Lunch','Lunch','Lunch','Lunch','Lunch','Dinner','Dinner','Dinner','Dinner','Dinner')

  # One numeric vector with all unique values
c<-c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)

  # One numeric vector with some repeated values (number of your choosing)
d<-c(1,1,1,1,1,0,0,0,0,0,1,1,1,1,1)

  # One numeric vector with some decimal values (of your choosing)
e<-c(3.14,2.718,9.81,1.62,3.71,8.887,10.44,8.89,24.79,11.15,0.62,3.22,275.4,3.65,7.24)

# Bind the vectors into a single data frame, rename the columns, and make the character vector with unique values the row names.[3 points]
data <- cbind(a,b,c,d,e)
data
df <- as.data.frame(data)
df
colnames(df) <- c("Dog Breeds", "Meals", "Factors", "Gravity of Planets")
df
colnames(df) <- c("Dog Breeds", "Meals", "Factors","Factors by 5","Gravity of Planets")
df
# Remove the character vector with unique values from the data frame.[2 points]
df[,-1]

# Add 1 row with unique numeric values to the data frame.[2 points]
add.row <- data.frame("Blue Lacey"," Dinner",16,1,4, 3.25)
df
# Export the data frame as a .csv file [2 points]

# Generate summary statistics of your data frame and copy them as text into your script under a new section heading. [2 points]

# Push your script and your .csv file to GitHub in a new "Week1" folder. [3 points]





data<-cbind(a,b,c,d,e)
data
df <- as.data.frame(data)
data
df
colnames(df)<-c('Dog Breeds','Meals','Factors','Binary','Gravity of Planets')
df
row.names(df) <- df$`Dog Breeds`
df
row.names(df) <- df$Factors
df
df[1,]
df[,-1]
