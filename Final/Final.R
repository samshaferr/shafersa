################################ Final Code Project#####################################
getwd()
setwd("C:/GitHub/shafersa/Final")

library(readxl)
CastScalingdown <- read_excel("CastScalingdown.xlsx", 
                              sheet = "Major Source - Fed vs NonFed")
View(CastScalingdown)
colnames(CastScalingdown)
CleanCAST <- CastScalingdown[ -(12:22), -(27:36) ]


library(readr)
Chesapeake_Bay_Pollution_Loads_Sediment_20241121 <- read_csv("Chesapeake_Bay_Pollution_Loads_-_Sediment_20241121.csv")
View(Chesapeake_Bay_Pollution_Loads_Sediment_20241121)



CastScalingdown<-sapply(strsplit(CastScalingdown$Geography, ', '), "[[", 1)
strsplit(CastScalingdown$Geography, ', ')

?merge
merged<-merge(CastScalingdown, Chesapeake_Bay_Pollution_Loads_Sediment_20241121,
      by.x = "Geography" , by.y = "County" , all = FALSE)


