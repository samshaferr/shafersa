################################ Final Code Project#####################################
getwd()
setwd("C:/GitHub/shafersa/Final")

library(readxl)
CASTfile <- read_excel("CASTfile.xlsx")
View(CASTfile)

library(readr)
Chesapeake_Bay_Pollution_Loads_Sediment_20241121 <- read_csv("Chesapeake_Bay_Pollution_Loads_-_Sediment_20241121.csv")
View(Chesapeake_Bay_Pollution_Loads_Sediment_20241121)


?merge
merged<-merge(CASTfile, Chesapeake_Bay_Pollution_Loads_Sediment_20241121,
      by.x = "Sector" , by.y = "Source Sector" , all = FALSE)

