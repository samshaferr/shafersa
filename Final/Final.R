################################ Final Code Project#####################################
getwd()
setwd("C:/GitHub/shafersa/Final")

library(readxl)
CastScalingdown <- read_excel("CastScalingdown.xlsx", 
                              sheet = "Major Source - Fed vs NonFed")
View(CastScalingdown)
colnames(CastScalingdown)

##Remove rows that do not pertain to sediment loads. These row had Nitrogen and Phosphorus loads included
CleanCAST <- CastScalingdown[ ,-(12:21) ]
CleanCAST <- CastScalingdown[ ,-(27:36)]

##I want to be able to visualize how each sector accumulates sediment 
ag_data_CAST <- subset(CleanCAST, Sector == "Agriculture")
developed_data_CASt <- subset(CleanCAST, Sector == "Developed")
natural_data_CAST_CAST <- subset(CleanCAST, Sector == "Natural")
spetic_data_CAST <- subset(CleanCAST, Sector == "Septic")
wastewater_data_CAST <- subset(CleanCAST, Sector == "Wastewater")

hist(ag_data_CAST)


library(readr)
MD_Sed_Loads<- read_csv("Chesapeake_Bay_Pollution_Loads_-_Sediment_20241121.csv")
View(Chesapeake_Bay_Pollution_Loads_Sediment_20241121)

ag_data_MD <- subset(MD_Sed_Loads, "Source Sector" == "Agriculture")
developed_data_MD <- subset(MD_Sed_Loads, 'Source Sector' == "Forest")
natural_data_MD <- subset(MD_Sed_Loads, 'Source Sector' == "Non-Tidal Atm")
spetic_data_MD <- subset(MD_Sed_Loads, 'Source Sector' == "Septic")
wastewater_data_MD <- subset(MD_Sed_Loads, 'Source Sector' == "Wastewater")

scatter.smooth(MD_Sed_Loads$`Total Sediment, 1985 (T)`)
scatter.smooth(MD_Sed_Loads$`Total Sediment, 2007 (T)`)
scatter.smooth(MD_Sed_Loads$`Total Sediment, 2009 (T)`)
scatter.smooth(MD_Sed_Loads$`Total Sediment, 2010 (T)`)
scatter.smooth(MD_Sed_Loads$`Total Sediment, 2011 (T)`)
scatter.smooth(MD_Sed_Loads$`Total Sediment, 2012 (T)`)
scatter.smooth(MD_Sed_Loads$`Total Sediment, 2013 (T)`)
scatter.smooth(MD_Sed_Loads$`Total Sediment, 2014 (T)`)
scatter.smooth(MD_Sed_Loads$`Total Sediment, 2016 (T)`)

CastScalingdown<-sapply(strsplit(CastScalingdown$Geography, ', '), "[[", 1)
strsplit(CastScalingdown$Geography, ', ')

?merge
merged<-merge(CastScalingdown, Chesapeake_Bay_Pollution_Loads_Sediment_20241121,
      by.x = "Geography" , by.y = "County" , all = FALSE)


