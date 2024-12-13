################################ Final Code Project#####################################
getwd()
setwd("C:/GitHub/shafersa/Final")

library(readxl)
CastScalingdown <- read_excel("CastScalingdown.xlsx", 
                              sheet = "Major Source - Fed vs NonFed")
View(CastScalingdown)
Clean_CAST<-CastScalingdown [, - (7:36) ]
colnames(Clean_CAST)
#I wanted yo add fun colors in!
install.packages("RColorBrewer")
library(RColorBrewer)

#I took the time to break down my data this way because I wanted to visually see the differences between counties and each sector.
#I did this for each year for each data set. and then you will see later that I merged the two data sets together and preformed an R squared analysis to determine variance between the two data sets 

Clean_CAST$`Source Sector` <- factor(Clean_CAST$`Source Sector`)
Clean_CAST$County <- factor(Clean_CAST$County)

# Check unique levels in 'Sector' (5 levels)
num_sectors <- length(levels(Clean_CAST$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))

# Ensure that there are enough colors for each sector (5 in this case)
color_palette <- brewer.pal(min(num_sectors, 12), "Set2")  # Set3 has 12 colors

# Create the plot with color assignment for sectors
scatter.smooth(x = Clean_CAST$County,
     y = Clean_CAST$`1985 Progress_SLoadEOT`,
     col = color_palette[as.numeric(Clean_CAST$`Source Sector`)],  # Ensure color is mapped using numeric version of 'Sector'
     pch = 16,
     xaxt = 'n',
     main = "Sectors and MD Counties Estimating Sediment Loads in 1985")  # Suppress default x-axis for customization
    ylab= "Esimated Sediment Loads from 1985"
# Custom x-axis with county names
axis(1, at = 1:length(levels(Clean_CAST$County)), 
     labels = levels(Clean_CAST$County),  
     las = 2,  
     cex.axis = 0.7)  

# Add a legend to show sector-color mapping
legend("topright",                               
       legend = levels(Clean_CAST$`Source Sector`),  
       fill = color_palette[1:num_sectors],  
       cex = 0.8,                               
       title = "Sector")

#################################################################################################

Clean_CAST$Sector <- factor(Clean_CAST$`Source Sector`)
Clean_CAST$Geography <- factor(Clean_CAST$County)


num_sectors <- length(levels(Clean_CAST$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))


color_palette <- brewer.pal(min(num_sectors, 12), "Set2")  

scatter.smooth(x = Clean_CAST$County,
               y = Clean_CAST$`2007 Progress_SLoadEOT`,
               col = color_palette[as.numeric(Clean_CAST$`Source Sector`)], 
               pch = 16,
               xaxt = 'n',
               main = "Sectors and MD Counties Estimating Sediment Loads in 2007")  
ylab= "Esimated Sediment Loads from 2007"

axis(1, at = 1:length(levels(Clean_CAST$County)), 
     labels = levels(Clean_CAST$County),  
     cex.axis = 0.7)  


legend("topright",                               
       legend = levels(Clean_CAST$`Source Sector`),  
       fill = color_palette[1:num_sectors],  
       cex = 0.8,                               
       title = "Sector")

#################################################################################################

Clean_CAST$Sector <- factor(Clean_CAST$`Source Sector`)
Clean_CAST$Geography <- factor(Clean_CAST$County)

 
num_sectors <- length(levels(Clean_CAST$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))

 
color_palette <- brewer.pal(min(num_sectors, 12), "Set2")   

 
scatter.smooth(x = Clean_CAST$County,
               y = Clean_CAST$`2009 Progress_SLoadEOT`,
               col = color_palette[as.numeric(Clean_CAST$`Source Sector`)],  
               pch = 16,
               xaxt = 'n',
               main = "Sectors and MD Counties Estimating Sediment Loads in 2009")   
ylab= "Esimated Sediment Loads from 1985"
# Custom x-axis with geography (county) names
axis(1, at = 1:length(levels(Clean_CAST$County)), 
     labels = levels(Clean_CAST$County),  
     las = 2,  # Rotate labels for better readability
     cex.axis = 0.7)  # Adjust the size of axis labels

 
legend("topright",                               
       legend = levels(Clean_CAST$`Source Sector`),  
       fill = color_palette[1:num_sectors],  # Match the number of colors to sectors
       cex = 0.8,                               
       title = "Sector")
#################################################################################################
Clean_CAST$Sector <- factor(Clean_CAST$`Source Sector`)
Clean_CAST$Geography <- factor(Clean_CAST$County)

 
num_sectors <- length(levels(Clean_CAST$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))

 
color_palette <- brewer.pal(min(num_sectors, 12), "Set2")   

 
scatter.smooth(x = Clean_CAST$County,
               y = Clean_CAST$`2010 Progress_SLoadEOT`,
               col = color_palette[as.numeric(Clean_CAST$`Source Sector`)],  
               pch = 16,
               xaxt = 'n',
               main = "Sectors and MD Counties Estimating Sediment Loads in 2010")   
# Custom x-axis with geography (county) names
axis(1, at = 1:length(levels(Clean_CAST$County)), 
     labels = levels(Clean_CAST$County),  
     las = 2,  # Rotate labels for better readability
     cex.axis = 0.7)  # Adjust the size of axis labels

 
legend("topright",                               
       legend = levels(Clean_CAST$`Source Sector`),  
       fill = color_palette[1:num_sectors],  # Match the number of colors to sectors
       cex = 0.8,                               
       title = "Sector")
#################################################################################################

Clean_CAST$Sector <- factor(Clean_CAST$`Source Sector`)
Clean_CAST$Geography <- factor(Clean_CAST$County)

 
num_sectors <- length(levels(Clean_CAST$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))

 
color_palette <- brewer.pal(min(num_sectors, 12), "Set2")   

 
scatter.smooth(x = Clean_CAST$County,
               y = Clean_CAST$`2012 Progress_SLoadEOT`,
               col = color_palette[as.numeric(Clean_CAST$`Source Sector`)],  
               pch = 16,
               xaxt = 'n',
               main = "Sectors and MD Counties Estimating Sediment Loads in 2012")   
# Custom x-axis with geography (county) names
axis(1, at = 1:length(levels(Clean_CAST$County)), 
     labels = levels(Clean_CAST$County),  
     las = 2,  # Rotate labels for better readability
     cex.axis = 0.7)  # Adjust the size of axis labels

 
legend("topright",                               
       legend = levels(Clean_CAST$`Source Sector`),  
       fill = color_palette[1:num_sectors],  # Match the number of colors to sectors
       cex = 0.8,                               
       title = "Sector")

#################################################################################################
library(readr)
Chesapeake_Bay_Pollution_Loads_Sediment_20241121 <- read_csv("Chesapeake_Bay_Pollution_Loads_-_Sediment_20241121.csv")
View(Chesapeake_Bay_Pollution_Loads_Sediment_20241121)
colnames(MD_Sed_Loads)
MD_Sed_Loads_1<-Chesapeake_Bay_Pollution_Loads_Sediment_20241121 [,-(13:18)]
MD_Sed_Loads<-MD_Sed_Loads_1 [,-(2)]
MD_Sed_Loads$`Source Sector` <- factor(MD_Sed_Loads$`Source Sector`)
MD_Sed_Loads$County <- factor(MD_Sed_Loads$County)

 
num_sectors <- length(levels(MD_Sed_Loads$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))

 
color_palette <- brewer.pal(min(num_sectors, 12), "Dark2")   

 
scatter.smooth(x = MD_Sed_Loads$County,
               y = MD_Sed_Loads$`Total Sediment, 1985 (T)`,
               col = color_palette[as.numeric(MD_Sed_Loads$`Source Sector`)],  
               pch = 16,
               xaxt = 'n',
               main = "Sectors and MD Counties Estimating True Loads in 1985")   
# Custom x-axis with geography (county) names
axis(1, at = 1:length(levels(MD_Sed_Loads$County)), 
     labels = levels(MD_Sed_Loads$County),  
     las = 2,  # Rotate labels for better readability
     cex.axis = 0.7)  # Adjust the size of axis labels

 
legend("topright",                               
       legend = levels(MD_Sed_Loads$`Source Sector`),  
       fill = color_palette[1:num_sectors],  # Match the number of colors to sectors
       cex = 0.8,                               
       title = "Sector")

#################################################################################################
MD_Sed_Loads$`Source Sector` <- factor(MD_Sed_Loads$`Source Sector`)
MD_Sed_Loads$County <- factor(MD_Sed_Loads$County)

 
num_sectors <- length(levels(MD_Sed_Loads$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))

 
color_palette <- brewer.pal(min(num_sectors, 12), "Dark2")   

 
scatter.smooth(x = MD_Sed_Loads$County,
               y = MD_Sed_Loads$`Total Sediment, 2007 (T)`,
               col = color_palette[as.numeric(MD_Sed_Loads$`Source Sector`)],  
               pch = 16,
               xaxt = 'n',
               main = "Sectors and MD Counties Estimating True Loads in 2007")   
# Custom x-axis with geography (county) names
axis(1, at = 1:length(levels(MD_Sed_Loads$County)), 
     labels = levels(MD_Sed_Loads$County),  
     las = 2,  # Rotate labels for better readability
     cex.axis = 0.7)  # Adjust the size of axis labels

 
legend("topright",                               
       legend = levels(MD_Sed_Loads$`Source Sector`),  
       fill = color_palette[1:num_sectors],  # Match the number of colors to sectors
       cex = 0.8,                               
       title = "Sector")
#################################################################################################
MD_Sed_Loads$`Source Sector` <- factor(MD_Sed_Loads$`Source Sector`)
MD_Sed_Loads$County <- factor(MD_Sed_Loads$County)

 
num_sectors <- length(levels(MD_Sed_Loads$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))

 
color_palette <- brewer.pal(min(num_sectors, 12), "Dark2")   

 
scatter.smooth(x = MD_Sed_Loads$County,
               y = MD_Sed_Loads$`Total Sediment, 2009 (T)`,
               col = color_palette[as.numeric(MD_Sed_Loads$`Source Sector`)],  
               pch = 16,
               xaxt = 'n',
               main = "Sectors and MD Counties Estimating True Loads in 2009")   
# Custom x-axis with geography (county) names
axis(1, at = 1:length(levels(MD_Sed_Loads$County)), 
     labels = levels(MD_Sed_Loads$County),  
     las = 2,  # Rotate labels for better readability
     cex.axis = 0.7)  # Adjust the size of axis labels

 
legend("topright",                               
       legend = levels(MD_Sed_Loads$`Source Sector`),  
       fill = color_palette[1:num_sectors],  # Match the number of colors to sectors
       cex = 0.8,                               
       title = "Sector")
#################################################################################################
MD_Sed_Loads$`Source Sector` <- factor(MD_Sed_Loads$`Source Sector`)
MD_Sed_Loads$County <- factor(MD_Sed_Loads$County)

 
num_sectors <- length(levels(MD_Sed_Loads$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))

 
color_palette <- brewer.pal(min(num_sectors, 12), "Dark2")   

 
scatter.smooth(x = MD_Sed_Loads$County,
               y = MD_Sed_Loads$`Total Sediment, 2010 (T)`,
               col = color_palette[as.numeric(MD_Sed_Loads$`Source Sector`)],  
               pch = 16,
               xaxt = 'n',
               main = "Sectors and MD Counties Estimating True Loads in 2010")   
# Custom x-axis with geography (county) names
axis(1, at = 1:length(levels(MD_Sed_Loads$County)), 
     labels = levels(MD_Sed_Loads$County),  
     las = 2,  # Rotate labels for better readability
     cex.axis = 0.7)  # Adjust the size of axis labels

 
legend("topright",                               
       legend = levels(MD_Sed_Loads$`Source Sector`),  
       fill = color_palette[1:num_sectors],  # Match the number of colors to sectors
       cex = 0.8,                               
       title = "Sector")
#################################################################################################
MD_Sed_Loads$`Source Sector` <- factor(MD_Sed_Loads$`Source Sector`)
MD_Sed_Loads$County <- factor(MD_Sed_Loads$County)

 
num_sectors <- length(levels(MD_Sed_Loads$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))

 
color_palette <- brewer.pal(min(num_sectors, 12), "Dark2")   

 
scatter.smooth(x = MD_Sed_Loads$County,
               y = MD_Sed_Loads$`Total Sediment, 2012 (T)`,
               col = color_palette[as.numeric(MD_Sed_Loads$`Source Sector`)],  
               pch = 16,
               xaxt = 'n',
               main = "Sectors and MD Counties Estimating True Loads in 2012")   
# Custom x-axis with geography (county) names
axis(1, at = 1:length(levels(MD_Sed_Loads$County)), 
     labels = levels(MD_Sed_Loads$County),  
     las = 2,  # Rotate labels for better readability
     cex.axis = 0.7)  # Adjust the size of axis labels

 
legend("topright",                               
       legend = levels(MD_Sed_Loads$`Source Sector`),  
       fill = color_palette[1:num_sectors],  # Match the number of colors to sectors
       cex = 0.8,                               
       title = "Sector")
#################################################################################################
## The dreadful merge. I merged by county in this instance. It seems like the most logical way to have these data sets over lap
# Check for unique values in the 'County' column from both data sets
unique(Clean_CAST$County)
unique(MD_Sed_Loads$County)

Clean_CAST$County <- tolower(trimws(Clean_CAST$County))
MD_Sed_Loads$County <- tolower(trimws(MD_Sed_Loads$County))

# Check for any whitespace differences
sum(trimws(Clean_CAST$County) != Clean_CAST$County)
sum(trimws(MD_Sed_Loads$County) != MD_Sed_Loads$County)

missing_counties <- setdiff(Clean_CAST$County, MD_Sed_Loads$County)
print(missing_counties)


merged_data <- merge(Clean_CAST, MD_Sed_Loads, by = "County", all=TRUE)

#################################################################################################
##Again I did this for each year, and then with the newly merged data I could perform the r squared. 
colnames(merged_data)
# Extract relevant columns
sediment_data_1985 <- merged_data[, c("County", "1985 Progress_SLoadEOT", "Total Sediment, 1985 (T)")]

# Rename columns for clarity
colnames(sediment_data_1985) <- c("County", "1985 Progress_SLoadEOT", "Total Sediment, 1985 (T)")

# Reshape the data to long format
reshaped_data_1985 <- reshape(sediment_data_1985, 
                         varying = c("1985 Progress_SLoadEOT", "Total Sediment, 1985 (T)"), 
                         v.names = "sediment_load",    # New column for sediment load
                         timevar = "measurement_type",  # Type of measurement (ProgressSLoad EOT or Total Sediment)
                         times = c("1985 Progress_SLoadEOT", "Total Sediment, 1985 (T)"),  # Specify the two measurement types
                         direction = "long")
#had a typo in this one
# Inspect the reshaped data
head(reshaped_data_1985)
# Convert 'County' and 'measurement_type' to factors
reshaped_data_1985$County <- factor(reshaped_data_1985$County)
reshaped_data_1985$measurement_type <- factor(reshaped_data_1985$measurement_type)


# Plot the data: Counties on x-axis, Sediment Load on y-axis
plot(reshaped_data_1985$County, reshaped_data_1985$sediment_load, 
     col = colors[reshaped_data_1985$measurement_type],   # Color points by measurement type
     pch = 19,                                       
     xlab = "County", ylab = "Sediment Load",        
     main = "Sediment Load by County (1985)",         
     xaxt = "n",                                     
     ylim = c(0, max(reshaped_data_1985$sediment_load, na.rm = TRUE) * 1.1))  


axis(1, at = 1:length(unique(reshaped_data_1985$County)), labels = levels(reshaped_data_1985$County), las = 2)

#################################################################################################
colnames(merged_data)
 
sediment_data_2007 <- merged_data[, c("County", "2007 Progress_SLoadEOT", "Total Sediment, 2007 (T)")]

 
colnames(sediment_data_2007) <- c("County", "2007 Progress_SLoadEOT", "Total Sediment, 2007 (T)")

 
reshaped_data_2007 <- reshape(sediment_data_2007, 
                         varying = c("2007 Progress_SLoadEOT", "Total Sediment, 2007 (T)"), 
                         v.names = "sediment_load",     
                         timevar = "measurement_type",   
                         times = c("2007 Progress_SLoadEOT", "Total Sediment, 2007 (T)"),   
                         direction = "long")

 #same typo...did you run this?
head(reshaped_data_2007)
 
reshaped_data_2007$County <- factor(reshaped_data_2007$County)
reshaped_data_2007$measurement_type <- factor(reshaped_data_2007$measurement_type)

 
plot(reshaped_data_2007$County, reshaped_data_2007$sediment_load, 
     col = colors[reshaped_data_2007$measurement_type],   
     pch = 19,                                       
     xlab = "County", ylab = "Sediment Load",        
     main = "Sediment Load by County (2007)",        
     xaxt = "n",                                     
     ylim = c(0, max(reshaped_data_2007$sediment_load, na.rm = TRUE) * 1.1))  
#Same error - how did you get this to work?

axis(1, at = 1:length(unique(reshaped_data_2007$County)), labels = levels(reshaped_data_2007$County), las = 2)
#################################################################################################
colnames(merged_data)
 
sediment_data_2009 <- merged_data[, c("County", "2009 Progress_SLoadEOT", "Total Sediment, 2009 (T)")]

 
colnames(sediment_data_2009) <- c("County", "2009 Progress_SLoadEOT", "Total Sediment, 2009 (T)")

 
reshaped_data_2009 <- reshape(sediment_data_2009, 
                              varying = c("2009 Progress_SLoadEOT", "Total Sediment, 2009 (T)"), 
                              v.names = "sediment_load",     
                              timevar = "measurement_type",   
                              times = c("2009 Progress_SLoadEOT", "Total Sediment, 2009 (T)"),   
                              direction = "long")

 
head(reshaped_data_2009)
 
reshaped_data_2009$County <- factor(reshaped_data_2009$County)
reshaped_data_2009$measurement_type <- factor(reshaped_data_2009$measurement_type)

 
plot(reshaped_data_2009$County, reshaped_data_2009$sediment_load, 
     col = colors[reshaped_data_2009$measurement_type],   
     pch = 19,                                       
     xlab = "County", ylab = "Sediment Load",        
     main = "Sediment Load by County (2009)",        
     xaxt = "n",                                     
     ylim = c(0, max(reshaped_data_2009$sediment_load, na.rm = TRUE) * 1.1))  


axis(1, at = 1:length(unique(reshaped_data_2009$County)), labels = levels(reshaped_data_2009$County), las = 2)
#################################################################################################
colnames(merged_data)
 
sediment_data_2010 <- merged_data[, c("County", "2010 Progress_SLoadEOT", "Total Sediment, 2010 (T)")]

 
colnames(sediment_data_2010) <- c("County", "2010 Progress_SLoadEOT", "Total Sediment, 2010 (T)")

 
reshaped_data_2010 <- reshape(sediment_data_2010, 
                              varying = c("2010 Progress_SLoadEOT", "Total Sediment, 2010 (T)"), 
                              v.names = "sediment_load",     
                              timevar = "measurement_type",   
                              times = c("2010 Progress_SLoadEOT", "Total Sediment, 2010 (T)"),   
                              direction = "long")

 
head(reshaped_data_2010)
 
reshaped_data_2010$County <- factor(reshaped_data_2010$County)
reshaped_data_2010$measurement_type <- factor(reshaped_data_2010$measurement_type)

 
plot(reshaped_data_2010$County, reshaped_data_2010$sediment_load, 
     col = colors[reshaped_data_2007$measurement_type],   

     xlab = "County", ylab = "Sediment Load",        
     main = "Sediment Load by County (2010)",         
     xaxt = "n",                                      
     ylim = c(0, max(reshaped_data_2010$sediment_load, na.rm = TRUE) * 1.1))  


axis(1, at = 1:length(unique(reshaped_data_2010$County)), labels = levels(reshaped_data_2010$County), las = 2)
#################################################################################################
colnames(merged_data)
 
sediment_data_2012 <- merged_data[, c("County", "2012 Progress_SLoadEOT", "Total Sediment, 2012 (T)")]

 
colnames(sediment_data_2012) <- c("County", "2012 Progress_SLoadEOT", "Total Sediment, 2012 (T)")

 
reshaped_data_2012 <- reshape(sediment_data_2012, 
                              varying = c("2012 Progress_SLoadEOT", "Total Sediment, 2012 (T)"), 
                              v.names = "sediment_load",     
                              timevar = "measurement_type",   
                              times = c("2012 Progress_SLoadEOT", "Total Sediment, 2012 (T)"),   
                              direction = "long")

 
head(reshaped_data_2012)
 
reshaped_data_2012$County <- factor(reshaped_data_2012$County)
reshaped_data_2012$measurement_type <- factor(reshaped_data_2012$measurement_type)

 
plot(reshaped_data_2012$County, reshaped_data_2012$sediment_load, 
     col = colors[reshaped_data_2007$measurement_type],   
     pch = 19,                                       
     xlab = "County", ylab = "Sediment Load",        
     main = "Sediment Load by County (2012)",         
     xaxt = "n",                                     
     ylim = c(0, max(reshaped_data_2012$sediment_load, na.rm = TRUE) * 1.1))  


axis(1, at = 1:length(unique(reshaped_data_2012$County)), labels = levels(reshaped_data_2012$County), las = 2)
#################################################################################################
##Finally we can get to the point where the data is sufficiently clean and we can run our analysis

# Check for any missing data in the relevant columns 
sum(is.na(sediment_data_1985$`1985 Progress_SLoadEOT`))  # Check for NAs in the predicted values
sum(is.na(sediment_data_1985$`Total Sediment, 1985 (T)`))  # Check for NAs in the actual values

# Remove rows with missing data to ensure consistency between the columns
clean_data_1985 <- sediment_data_1985[!is.na(sediment_data_1985$`1985 Progress_SLoadEOT`) &
                                        !is.na(sediment_data_1985$`Total Sediment, 1985 (T)`), ]

# Fit a linear regression model
model <- lm(`Total Sediment, 1985 (T)` ~ `1985 Progress_SLoadEOT`, data = clean_data_1985)

# Print the summary of the model to inspect coefficients and R-squared
model_summary_1985 <- summary(model)
print(model_summary_1985)
## the significant p value represent that my data points are significantly related but the poor R squared value is say that there is a lot of variance between data points meaning that the CAST assessment tool is not doing a great job of predicting sediment loads


# Extract the R-squared value
r_squared <- model_summary_1985$r.squared
print(paste("R-squared: ", round(r_squared, 2)))

# Predict the sediment loads using the model
predicted_values_1985 <- predict(model)

# Plot the predicted vs actual sediment loads
plot(clean_data_1985$`Total Sediment, 1985 (T)`, predicted_values_1985,
     xlab = "Actual Sediment Load (Total Sediment, 1985 (T))",
     ylab = "Predicted Sediment Load (1985 Progress_SLoadEOT)",
     main = paste("Predicted vs Actual Sediment Loads (1985) (R² =", round(r_squared, 2), ")"),
     pch = 19,  # Solid points
     col = "blue")  # Points color

# Add a line representing perfect predictions (where predicted = actual)
abline(a = 0, b = 1, col = "red", lty = 2)  # Line of perfect prediction

#################################################################################################

# Check for any missing data in the relevant columns (optional)
sum(is.na(sediment_data_2007$`2007 Progress_SLoadEOT`))  # Check for NAs in the predicted values
sum(is.na(sediment_data_2007$`Total Sediment, 2007 (T)`))  # Check for NAs in the actual values

# Remove rows with missing data (if any) to ensure consistency between the columns
clean_data_2007 <- sediment_data_2007[!is.na(sediment_data_2007$`2007 Progress_SLoadEOT`) &
                                        !is.na(sediment_data_2007$`Total Sediment, 2007 (T)`), ]

# Fit a linear regression model
model <- lm(`Total Sediment, 2007 (T)` ~ `2007 Progress_SLoadEOT`, data = clean_data_2007)

# Print the summary of the model to inspect coefficients and R-squared
model_summary_2007 <- summary(model)
print(model_summary_2007)
## the significant p value represent that my data points are significantly related but the poor R squared value is say that there is a lot of variance between data points meaning that the CAST assessment tool is not doing a great job of predicting sediment loads


# Extract the R-squared value
r_squared <- model_summary_2007$r.squared
print(paste("R-squared: ", round(r_squared, 2)))

# Predict the sediment loads using the model
predicted_values_2007 <- predict(model)

# Plot the predicted vs actual sediment loads
plot(clean_data_2007$`Total Sediment, 2007 (T)`, predicted_values_2007,
     xlab = "Actual Sediment Load (Total Sediment, 2007 (T))",
     ylab = "Predicted Sediment Load (2007 Progress_SLoadEOT)",
     main = paste("Predicted vs Actual Sediment Loads (2007) (R² =", round(r_squared, 2), ")"),
     pch = 19,  # Solid points
     col = "blue")  # Points color

# Add a line representing perfect predictions (where predicted = actual)
abline(a = 0, b = 1, col = "red", lty = 2)  # Line of perfect prediction



#################################################################################################

# Check for any missing data in the relevant columns (optional)
sum(is.na(sediment_data_2009$`2009 Progress_SLoadEOT`))  # Check for NAs in the predicted values
sum(is.na(sediment_data_2009$`Total Sediment, 2009 (T)`))  # Check for NAs in the actual values

# Remove rows with missing data (if any) to ensure consistency between the columns
clean_data_2009 <- sediment_data_2009[!is.na(sediment_data_2009$`2009 Progress_SLoadEOT`) &
                                        !is.na(sediment_data_2009$`Total Sediment, 2009 (T)`), ]

# Fit a linear regression model
model <- lm(`Total Sediment, 2009 (T)` ~ `2009 Progress_SLoadEOT`, data = clean_data_2009)

# Print the summary of the model to inspect coefficients and R-squared
model_summary_2009 <- summary(model)
print(model_summary_2009)
## the significant p value represent that my data points are significantly related but the poor R squared value is say that there is a lot of variance between data points meaning that the CAST assessment tool is not doing a great job of predicting sediment loads


# Extract the R-squared value
r_squared <- model_summary_2009$r.squared
print(paste("R-squared: ", round(r_squared, 2)))

# Predict the sediment loads using the model
predicted_values_2009 <- predict(model)

# Plot the predicted vs actual sediment loads
plot(clean_data_2009$`Total Sediment, 2009 (T)`, predicted_values_2009,
     xlab = "Actual Sediment Load (Total Sediment, 2009 (T))",
     ylab = "Predicted Sediment Load (2009 Progress_SLoadEOT)",
     main = paste("Predicted vs Actual Sediment Loads (2009) (R² =", round(r_squared, 2), ")"),
     pch = 19,  # Solid points
     col = "blue")  # Points color

# Add a line representing perfect predictions (where predicted = actual)
abline(a = 0, b = 1, col = "red", lty = 2)  # Line of perfect prediction


#################################################################################################

# Check for any missing data in the relevant columns (optional)
sum(is.na(sediment_data_2010$`2010 Progress_SLoadEOT`))  # Check for NAs in the predicted values
sum(is.na(sediment_data_2010$`Total Sediment, 2010 (T)`))  # Check for NAs in the actual values

# Remove rows with missing data (if any) to ensure consistency between the columns
clean_data_2010 <- sediment_data_2010[!is.na(sediment_data_2010$`2010 Progress_SLoadEOT`) &
                                   !is.na(sediment_data_2010$`Total Sediment, 2010 (T)`), ]

# Fit a linear regression model
model <- lm(`Total Sediment, 2010 (T)` ~ `2010 Progress_SLoadEOT`, data = clean_data_2010)

# Print the summary of the model to inspect coefficients and R-squared
model_summary_2010 <- summary(model)
print(model_summary_2010)
## the significant p value represent that my data points are significantly related but the poor R squared value is say that there is a lot of variance between data points meaning that the CAST assessment tool is not doing a great job of predicting sediment loads


# Extract the R-squared value
r_squared <- model_summary_2010$r.squared
print(paste("R-squared: ", round(r_squared, 2)))

# Predict the sediment loads using the model
predicted_values_2010 <- predict(model)

# Plot the predicted vs actual sediment loads
plot(clean_data_2010$`Total Sediment, 2010 (T)`, predicted_values_2010,
     xlab = "Actual Sediment Load (Total Sediment, 2010 (T))",
     ylab = "Predicted Sediment Load (2010 Progress_SLoadEOT)",
     main = paste("Predicted vs Actual Sediment Loads (2010) (R² =", round(r_squared, 2), ")"),
     pch = 19,  # Solid points
     col = "blue")  # Points color

# Add a line representing perfect predictions (where predicted = actual)
abline(a = 0, b = 1, col = "red", lty = 2)  # Line of perfect prediction


#################################################################################################
# Check for any missing data in the relevant columns (optional)
# Check for any missing data in the relevant columns (optional)
sum(is.na(sediment_data_2012$`2012 Progress_SLoadEOT`))  # Check for NAs in the predicted values
sum(is.na(sediment_data_2012$`Total Sediment, 2012 (T)`))  # Check for NAs in the actual values

# Remove rows with missing data (if any) to ensure consistency between the columns
clean_data_2012 <- sediment_data_2012[!is.na(sediment_data_2012$`2012 Progress_SLoadEOT`) &
                                        !is.na(sediment_data_2012$`Total Sediment, 2012 (T)`), ]

# Fit a linear regression model
model <- lm(`Total Sediment, 2012 (T)` ~ `2012 Progress_SLoadEOT`, data = clean_data_2012)

# Print the summary of the model to inspect coefficients and R-squared
model_summary_2012 <- summary(model)
print(model_summary_2012)
## the significant p value represent that my data points are significantly related but the poor R squared value is say that there is a lot of variance between data points meaning that the CAST assessment tool is not doing a great job of predicting sediment loads


# Extract the R-squared value
r_squared <- model_summary_2012$r.squared
print(paste("R-squared: ", round(r_squared, 2)))

# Predict the sediment loads using the model
predicted_values_2012 <- predict(model)

# Plot the predicted vs actual sediment loads
plot(clean_data_2012$`Total Sediment, 2012 (T)`, predicted_values_2012,
     xlab = "Actual Sediment Load (Total Sediment, 2012 (T))",
     ylab = "Predicted Sediment Load (2012 Progress_SLoadEOT)",
     main = paste("Predicted vs Actual Sediment Loads (2012) (R² =", round(r_squared, 2), ")"),
     pch = 19,  # Solid points
     col = "blue")  # Points color

# Add a line representing perfect predictions (where predicted = actual)
abline(a = 0, b = 1, col = "red", lty = 2)  # Line of perfect prediction

# Optionally, plot the residuals to check for any patterns
residuals_2012 <- residuals(model)
plot(predicted_values_2012, residuals,
     xlab = "Predicted Sediment Load", 
     ylab = "Residuals", 
     main = "Residuals vs Predicted Values (2012)",
     pch = 19, 
     col = "blue")
abline(h = 0, col = "red", lty = 2)  # Horizontal line at 0 for residuals
#################################################################################################



