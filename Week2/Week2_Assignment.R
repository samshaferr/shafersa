# With the data frame you created last week you will:
a<-c('German Shapard','Golden Retriver','Pug','Boxer','Husky','Poodle','Chihuahua','Beagle','Australian Cattle','Rottweiler','Border Collie','Corgi','St. Bernard','Newfoundland','Pitbull')
b<-c('Breakfast','Breakfast','Breakfast','Breakfast','Breakfast','Lunch','Lunch','Lunch','Lunch','Lunch','Dinner','Dinner','Dinner','Dinner','Dinner')
c<-c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)
d<-c(1,2,3,1,2,3,1,2,3,1,2,3,1,2,3)
e<-c(3.14,2.718,9.81,1.62,3.71,8.887,10.44,8.89,24.79,11.15,0.62,3.22,275.4,3.65,7.24)
df <- as.data.frame(cbind(a,b,c,d,e))
df
df$c<- as.numeric(as.character(df$c))
df$c <- as.numeric(as.character(df$c))
df$e <- as.numeric(as.character(df$e))
df
colnames(add.row) <- colnames(df)    
df
row.names(df) <- df$a
df <- df[,-1]
df


row.names(df) <- df$a
df <- df[,-1]
df

# Create a barplot for one numeric column, grouped by the character vector with 3 unique values (10 points)
df.mean <- aggregate(df$c ,df$b, FUN = "mean")
df.mean
colnames(df1.mean) <- c("Factor","Mean")
df.mean 
 # Add error bars with mean and standard deviation to the plot
df.sd <- aggregate(df1$rep.num ~df1$group.char, FUN = "sd")
df.sd
colnames(df.sd) <- c("Factor","Mean")

# Change the x and y labels and add a title
  # Export the plot as a PDF that is 4 inches wide and 7 inches tall.

# Create a scatter plot between two of your numeric columns. (10 points)
  # Change the point shape and color to something NOT used in the example.
  # Change the x and y labels and add a title
  # Export the plot as a JPEG by using the "Export" button in the plotting pane.

# Upload both plots with the script used to create them to GitHub. (5 points)
  # Follow the same file naming format as last week for the script.
  # Name plots as Lastname_barplot or Lastname_scatterplot. Save them to your "plots" folder. (5 points)
