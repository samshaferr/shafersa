################################ Final Code Project#####################################
getwd()
setwd("C:/GitHub/shafersa/Final")

library(readxl)
CastScalingdown <- read_excel("CastScalingdown.xlsx", 
                              sheet = "Major Source - Fed vs NonFed")
View(CastScalingdown)
Clean_CAST<-CastScalingdown


install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all()
display.brewer.pal()

Clean_CAST$`Source Sector` <- factor(Clean_CAST$`Source Sector`)
Clean_CAST$County <- factor(Clean_CAST$County)

# Check unique levels in 'Sector' (5 levels)
num_sectors <- length(levels(Clean_CAST$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))

# Ensure that there are enough colors for each sector (5 in this case)
color_palette <- brewer.pal(min(num_sectors, 12), "Set2")  # Set3 has 12 colors, use as many as needed

# Create the plot with color assignment for sectors
scatter.smooth(x = Clean_CAST$County,
     y = Clean_CAST$`1985 Progress_SLoadEOT`,
     col = color_palette[as.numeric(Clean_CAST$`Source Sector`)],  # Ensure color is mapped using numeric version of 'Sector'
     pch = 16,
     xaxt = 'n',
     main = "Sectors and MD Counties Estimating Sediment Loads in 1985")  # Suppress default x-axis for customization
    ylab= "Esimated Sediment Loads from 1985"
# Custom x-axis with geography (county) names
axis(1, at = 1:length(levels(Clean_CAST$County)), 
     labels = levels(Clean_CAST$County),  
     las = 2,  # Rotate labels for better readability
     cex.axis = 0.7)  # Adjust the size of axis labels

# Add a legend to show sector-color mapping
legend("topright",                               
       legend = levels(Clean_CAST$`Source Sector`),  
       fill = color_palette[1:num_sectors],  # Match the number of colors to sectors
       cex = 0.8,                               
       title = "Sector")

################################################################################################

Clean_CAST$Sector <- factor(Clean_CAST$`Source Sector`)
Clean_CAST$Geography <- factor(Clean_CAST$County)

# Check unique levels in 'Sector' (5 levels)
num_sectors <- length(levels(Clean_CAST$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))

# Ensure that there are enough colors for each sector (5 in this case)
color_palette <- brewer.pal(min(num_sectors, 12), "Set2")  # Set3 has 12 colors, use as many as needed

# Create the plot with color assignment for sectors
scatter.smooth(x = Clean_CAST$County,
               y = Clean_CAST$`2007 Progress_SLoadEOT`,
               col = color_palette[as.numeric(Clean_CAST$`Source Sector`)],  # Ensure color is mapped using numeric version of 'Sector'
               pch = 16,
               xaxt = 'n',
               main = "Sectors and MD Counties Estimating Sediment Loads in 2007")  # Suppress default x-axis for customization
ylab= "Esimated Sediment Loads from 2007"
# Custom x-axis with geography (county) names
axis(1, at = 1:length(levels(Clean_CAST$County)), 
     labels = levels(Clean_CAST$County),  
     las = 2,  # Rotate labels for better readability
     cex.axis = 0.7)  # Adjust the size of axis labels

# Add a legend to show sector-color mapping
legend("topright",                               
       legend = levels(Clean_CAST$`Source Sector`),  
       fill = color_palette[1:num_sectors],  # Match the number of colors to sectors
       cex = 0.8,                               
       title = "Sector")

#############################################################################################

Clean_CAST$Sector <- factor(Clean_CAST$`Source Sector`)
Clean_CAST$Geography <- factor(Clean_CAST$County)

# Check unique levels in 'Sector' (5 levels)
num_sectors <- length(levels(Clean_CAST$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))

# Ensure that there are enough colors for each sector (5 in this case)
color_palette <- brewer.pal(min(num_sectors, 12), "Set2")  # Set3 has 12 colors, use as many as needed

# Create the plot with color assignment for sectors
scatter.smooth(x = Clean_CAST$County,
               y = Clean_CAST$`2009 Progress_SLoadEOT`,
               col = color_palette[as.numeric(Clean_CAST$`Source Sector`)],  # Ensure color is mapped using numeric version of 'Sector'
               pch = 16,
               xaxt = 'n',
               main = "Sectors and MD Counties Estimating Sediment Loads in 2009")  # Suppress default x-axis for customization
ylab= "Esimated Sediment Loads from 1985"
# Custom x-axis with geography (county) names
axis(1, at = 1:length(levels(Clean_CAST$County)), 
     labels = levels(Clean_CAST$County),  
     las = 2,  # Rotate labels for better readability
     cex.axis = 0.7)  # Adjust the size of axis labels

# Add a legend to show sector-color mapping
legend("topright",                               
       legend = levels(Clean_CAST$`Source Sector`),  
       fill = color_palette[1:num_sectors],  # Match the number of colors to sectors
       cex = 0.8,                               
       title = "Sector")
###########################################################################################################
Clean_CAST$Sector <- factor(Clean_CAST$`Source Sector`)
Clean_CAST$Geography <- factor(Clean_CAST$County)

# Check unique levels in 'Sector' (5 levels)
num_sectors <- length(levels(Clean_CAST$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))

# Ensure that there are enough colors for each sector (5 in this case)
color_palette <- brewer.pal(min(num_sectors, 12), "Set2")  # Set3 has 12 colors, use as many as needed

# Create the plot with color assignment for sectors
scatter.smooth(x = Clean_CAST$County,
               y = Clean_CAST$`2010 Progress_SLoadEOT`,
               col = color_palette[as.numeric(Clean_CAST$`Source Sector`)],  # Ensure color is mapped using numeric version of 'Sector'
               pch = 16,
               xaxt = 'n',
               main = "Sectors and MD Counties Estimating Sediment Loads in 2010")  # Suppress default x-axis for customization
# Custom x-axis with geography (county) names
axis(1, at = 1:length(levels(Clean_CAST$County)), 
     labels = levels(Clean_CAST$County),  
     las = 2,  # Rotate labels for better readability
     cex.axis = 0.7)  # Adjust the size of axis labels

# Add a legend to show sector-color mapping
legend("topright",                               
       legend = levels(Clean_CAST$`Source Sector`),  
       fill = color_palette[1:num_sectors],  # Match the number of colors to sectors
       cex = 0.8,                               
       title = "Sector")
################################################################################################

Clean_CAST$Sector <- factor(Clean_CAST$`Source Sector`)
Clean_CAST$Geography <- factor(Clean_CAST$County)

# Check unique levels in 'Sector' (5 levels)
num_sectors <- length(levels(Clean_CAST$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))

# Ensure that there are enough colors for each sector (5 in this case)
color_palette <- brewer.pal(min(num_sectors, 12), "Set2")  # Set3 has 12 colors, use as many as needed

# Create the plot with color assignment for sectors
scatter.smooth(x = Clean_CAST$County,
               y = Clean_CAST$`2012 Progress_SLoadEOT`,
               col = color_palette[as.numeric(Clean_CAST$`Source Sector`)],  # Ensure color is mapped using numeric version of 'Sector'
               pch = 16,
               xaxt = 'n',
               main = "Sectors and MD Counties Estimating Sediment Loads in 2012")  # Suppress default x-axis for customization
# Custom x-axis with geography (county) names
axis(1, at = 1:length(levels(Clean_CAST$County)), 
     labels = levels(Clean_CAST$County),  
     las = 2,  # Rotate labels for better readability
     cex.axis = 0.7)  # Adjust the size of axis labels

# Add a legend to show sector-color mapping
legend("topright",                               
       legend = levels(Clean_CAST$`Source Sector`),  
       fill = color_palette[1:num_sectors],  # Match the number of colors to sectors
       cex = 0.8,                               
       title = "Sector")

##############################################################################################
library(readr)
Chesapeake_Bay_Pollution_Loads_Sediment_20241121 <- read_csv("Chesapeake_Bay_Pollution_Loads_-_Sediment_20241121.csv")
MD_Sed_Loads<-Chesapeake_Bay_Pollution_Loads_Sediment_20241121

MD_Sed_Loads$`Source Sector` <- factor(MD_Sed_Loads$`Source Sector`)
MD_Sed_Loads$County <- factor(MD_Sed_Loads$County)

# Check unique levels in 'Sector' (5 levels)
num_sectors <- length(levels(MD_Sed_Loads$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))

# Ensure that there are enough colors for each sector (5 in this case)
color_palette <- brewer.pal(min(num_sectors, 12), "Dark2")  # Set3 has 12 colors, use as many as needed

# Create the plot with color assignment for sectors
scatter.smooth(x = MD_Sed_Loads$County,
               y = MD_Sed_Loads$`Total Sediment, 1985 (T)`,
               col = color_palette[as.numeric(MD_Sed_Loads$`Source Sector`)],  # Ensure color is mapped using numeric version of 'Sector'
               pch = 16,
               xaxt = 'n',
               main = "Sectors and MD Counties Estimating True Loads in 1985")  # Suppress default x-axis for customization
# Custom x-axis with geography (county) names
axis(1, at = 1:length(levels(MD_Sed_Loads$County)), 
     labels = levels(MD_Sed_Loads$County),  
     las = 2,  # Rotate labels for better readability
     cex.axis = 0.7)  # Adjust the size of axis labels

# Add a legend to show sector-color mapping
legend("topright",                               
       legend = levels(MD_Sed_Loads$`Source Sector`),  
       fill = color_palette[1:num_sectors],  # Match the number of colors to sectors
       cex = 0.8,                               
       title = "Sector")

##################################################################################################
MD_Sed_Loads$`Source Sector` <- factor(MD_Sed_Loads$`Source Sector`)
MD_Sed_Loads$County <- factor(MD_Sed_Loads$County)

# Check unique levels in 'Sector' (5 levels)
num_sectors <- length(levels(MD_Sed_Loads$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))

# Ensure that there are enough colors for each sector (5 in this case)
color_palette <- brewer.pal(min(num_sectors, 12), "Dark2")  # Set3 has 12 colors, use as many as needed

# Create the plot with color assignment for sectors
scatter.smooth(x = MD_Sed_Loads$County,
               y = MD_Sed_Loads$`Total Sediment, 2007 (T)`,
               col = color_palette[as.numeric(MD_Sed_Loads$`Source Sector`)],  # Ensure color is mapped using numeric version of 'Sector'
               pch = 16,
               xaxt = 'n',
               main = "Sectors and MD Counties Estimating True Loads in 2007")  # Suppress default x-axis for customization
# Custom x-axis with geography (county) names
axis(1, at = 1:length(levels(MD_Sed_Loads$County)), 
     labels = levels(MD_Sed_Loads$County),  
     las = 2,  # Rotate labels for better readability
     cex.axis = 0.7)  # Adjust the size of axis labels

# Add a legend to show sector-color mapping
legend("topright",                               
       legend = levels(MD_Sed_Loads$`Source Sector`),  
       fill = color_palette[1:num_sectors],  # Match the number of colors to sectors
       cex = 0.8,                               
       title = "Sector")
#################################################################################################
MD_Sed_Loads$`Source Sector` <- factor(MD_Sed_Loads$`Source Sector`)
MD_Sed_Loads$County <- factor(MD_Sed_Loads$County)

# Check unique levels in 'Sector' (5 levels)
num_sectors <- length(levels(MD_Sed_Loads$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))

# Ensure that there are enough colors for each sector (5 in this case)
color_palette <- brewer.pal(min(num_sectors, 12), "Dark2")  # Set3 has 12 colors, use as many as needed

# Create the plot with color assignment for sectors
scatter.smooth(x = MD_Sed_Loads$County,
               y = MD_Sed_Loads$`Total Sediment, 2009 (T)`,
               col = color_palette[as.numeric(MD_Sed_Loads$`Source Sector`)],  # Ensure color is mapped using numeric version of 'Sector'
               pch = 16,
               xaxt = 'n',
               main = "Sectors and MD Counties Estimating True Loads in 2009")  # Suppress default x-axis for customization
# Custom x-axis with geography (county) names
axis(1, at = 1:length(levels(MD_Sed_Loads$County)), 
     labels = levels(MD_Sed_Loads$County),  
     las = 2,  # Rotate labels for better readability
     cex.axis = 0.7)  # Adjust the size of axis labels

# Add a legend to show sector-color mapping
legend("topright",                               
       legend = levels(MD_Sed_Loads$`Source Sector`),  
       fill = color_palette[1:num_sectors],  # Match the number of colors to sectors
       cex = 0.8,                               
       title = "Sector")
#################################################################################################
MD_Sed_Loads$`Source Sector` <- factor(MD_Sed_Loads$`Source Sector`)
MD_Sed_Loads$County <- factor(MD_Sed_Loads$County)

# Check unique levels in 'Sector' (5 levels)
num_sectors <- length(levels(MD_Sed_Loads$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))

# Ensure that there are enough colors for each sector (5 in this case)
color_palette <- brewer.pal(min(num_sectors, 12), "Dark2")  # Set3 has 12 colors, use as many as needed

# Create the plot with color assignment for sectors
scatter.smooth(x = MD_Sed_Loads$County,
               y = MD_Sed_Loads$`Total Sediment, 2010 (T)`,
               col = color_palette[as.numeric(MD_Sed_Loads$`Source Sector`)],  # Ensure color is mapped using numeric version of 'Sector'
               pch = 16,
               xaxt = 'n',
               main = "Sectors and MD Counties Estimating True Loads in 2010")  # Suppress default x-axis for customization
# Custom x-axis with geography (county) names
axis(1, at = 1:length(levels(MD_Sed_Loads$County)), 
     labels = levels(MD_Sed_Loads$County),  
     las = 2,  # Rotate labels for better readability
     cex.axis = 0.7)  # Adjust the size of axis labels

# Add a legend to show sector-color mapping
legend("topright",                               
       legend = levels(MD_Sed_Loads$`Source Sector`),  
       fill = color_palette[1:num_sectors],  # Match the number of colors to sectors
       cex = 0.8,                               
       title = "Sector")
#################################################################################################
MD_Sed_Loads$`Source Sector` <- factor(MD_Sed_Loads$`Source Sector`)
MD_Sed_Loads$County <- factor(MD_Sed_Loads$County)

# Check unique levels in 'Sector' (5 levels)
num_sectors <- length(levels(MD_Sed_Loads$`Source Sector`))
print(paste("Number of unique sectors:", num_sectors))

# Ensure that there are enough colors for each sector (5 in this case)
color_palette <- brewer.pal(min(num_sectors, 12), "Dark2")  # Set3 has 12 colors, use as many as needed

# Create the plot with color assignment for sectors
scatter.smooth(x = MD_Sed_Loads$County,
               y = MD_Sed_Loads$`Total Sediment, 2012 (T)`,
               col = color_palette[as.numeric(MD_Sed_Loads$`Source Sector`)],  # Ensure color is mapped using numeric version of 'Sector'
               pch = 16,
               xaxt = 'n',
               main = "Sectors and MD Counties Estimating True Loads in 2012")  # Suppress default x-axis for customization
# Custom x-axis with geography (county) names
axis(1, at = 1:length(levels(MD_Sed_Loads$County)), 
     labels = levels(MD_Sed_Loads$County),  
     las = 2,  # Rotate labels for better readability
     cex.axis = 0.7)  # Adjust the size of axis labels

# Add a legend to show sector-color mapping
legend("topright",                               
       legend = levels(MD_Sed_Loads$`Source Sector`),  
       fill = color_palette[1:num_sectors],  # Match the number of colors to sectors
       cex = 0.8,                               
       title = "Sector")
#################################################################################################

merged_data <- merge(Clean_CAST, MD_Sed_Loads, by = c("County"), suffixes = c('_cAST', '_Loads'),all=TRUE)
merged_data[is.na(merged_data$Clean_CAST) | is.na(merged_data$MD_Sed_loads), ]


unique(Clean_CAST$County)
unique(MD_Sed_Loads$County)
#################################################################################################
CastScalingdown<-sapply(strsplit(CastScalingdown$Geography, ', '), "[[", 1)
strsplit(CastScalingdown$Geography, ', ')

?merge
merged<-merge(CastScalingdown, Chesapeake_Bay_Pollution_Loads_Sediment_20241121,
      by.x = "Geography" , by.y = "County" , all = FALSE)


