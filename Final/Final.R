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
developed_data_CAST<- subset(CleanCAST, Sector == "Developed")
natural_data_CAST <- subset(CleanCAST, Sector == "Natural")
septic_data_CAST <- subset(CleanCAST, Sector == "Septic")
wastewater_data_CAST <- subset(CleanCAST, Sector == "Wastewater")


scatter.smooth(ag_data_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(developed_data_CASt$`1985 Progress_SLoadEOT`)
scatter.smooth(developed_data_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(septic_data_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(washington_CAST$`1985 Progress_SLoadEOT`)




allegany_CAST<-subset(CleanCAST, Geography == 'Allegany, MD (CBWS Portion Only)')
anne_CAST<-subset(CleanCAST, Geography == 'Anne Arundel, MD (CBWS Portion Only)')
balitmore_city_CAST<-subset(CleanCAST, Geography == 'Baltimore City, MD (CBWS Portion Only)')
calvert_CAST<-subset(CleanCAST, Geography == 'Calvert, MD (CBWS Portion Only)')
caroline_CAST<-subset(CleanCAST, Geography == 'Caroline, MD (CBWS Portion Only)')
carroll_CAST<-subset(CleanCAST, Geography == 'Carroll, MD (CBWS Portion Only)')
cecil_CAST<-subset(CleanCAST, Geography == 'Cecil, MD (CBWS Portion Only)')
charles_CAST<-subset(CleanCAST, Geography == 'Charles, MD (CBWS Portion Only)')
dorchester_CAST<-subset(CleanCAST, Geography == 'Dorchester, MD (CBWS Portion Only)')
freddy_CAST<-subset(CleanCAST, Geography == 'Frederick, MD (CBWS Portion Only)')
garrett_CAST<-subset(CleanCAST, Geography == 'Garrett, MD (CBWS Portion Only)')
harford_CAST<-subset(CleanCAST, Geography == 'Harford, MD (CBWS Portion Only)')
howard_CAST<-subset(CleanCAST, Geography == 'Howard, MD (CBWS Portion Only)')
kent_CAST<-subset(CleanCAST, Geography == 'Kent, MD (CBWS Portion Only)')
mont_CAST<-subset(CleanCAST, Geography == 'Montgomery, MD (CBWS Portion Only)')
prince_g_CAST<-subset(CleanCAST, Geography == 'Prince Georges, MD (CBWS Portion Only)')
queen_annes_CAST<-subset(CleanCAST, Geography == 'Queen Annes, MD (CBWS Portion Only)')
somerset_CAST<-subset(CleanCAST, Geography == 'Somerset, MD (CBWS Portion Only)')
st.marys_CAST<-subset(CleanCAST, Geography == 'St. Marys, MD (CBWS Portion Only)')
talbot_CAST<-subset(CleanCAST, Geography == 'Talbot, MD (CBWS Portion Only)')
washington_CAST<-subset(CleanCAST, Geography == 'Washington, MD (CBWS Portion Only)')
wicomico_CAST<-subset(CleanCAST, Geography == 'Wicomico, MD (CBWS Portion Only)')
worchester_CAST<-subset(CleanCAST, Geography == 'Worcester, MD (CBWS Portion Only)')

scatter.smooth(allegany_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(anne_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(balitmore_city_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(calvert_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(cecil_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(caroline_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(carroll_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(charles_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(dorchester_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(freddy_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(garrett_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(harford_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(howard_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(kent_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(mont_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(prince_g_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(queen_annes_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(somerset_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(st.marys_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(talbot_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(washington_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(wicomico_CAST$`1985 Progress_SLoadEOT`)
scatter.smooth(worchester_CAST$`1985 Progress_SLoadEOT`)


scatter.smooth(CleanCAST$`1985 Progress_SLoadEOT`)
scatter.smooth(CleanCAST$`2007 Progress_SLoadEOT`)
scatter.smooth(CleanCAST$`2009 Progress_SLoadEOT`)
scatter.smooth(CleanCAST$`2010 Progress_SLoadEOT`)
scatter.smooth(CleanCAST$`2012 Progress_SLoadEOT`)




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


   allegany_MD<-subset(MD_Sed_Loads, County == 'ALLEGANY')
anne_MD<-subset(MD_Sed_Loads, County == 'ANNE ARUNDEL')
balitmore_MD<-subset(MD_Sed_Loads, County == 'BALTIMORE')
balitmore_city_MD<-subset(MD_Sed_Loads, County == 'BALTIMORE CITY')
calvert_MD<-subset(MD_Sed_Loads, County == 'CALVERT')
caroline_MD<-subset(MD_Sed_Loads, County == 'CAROLINE')
carroll_MD<-subset(MD_Sed_Loads, County == 'CARROLL')
cecil_MD<-subset(MD_Sed_Loads, County == 'CECIL')
charles_MD<-subset(MD_Sed_Loads, County == 'CHARLES')
dorchester_MD<-subset(MD_Sed_Loads, County == 'DORCHESTER')
freddy_MD<-subset(MD_Sed_Loads, County == 'FREDERICK')
garrett_MD<-subset(MD_Sed_Loads, County == 'GARRETT')
harford_MD<-subset(MD_Sed_Loads, County == 'HARFORD')
howard_MD<-subset(MD_Sed_Loads, County == 'HOWARD')
kent_MD<-subset(MD_Sed_Loads, County == 'KENT')
mont_MD<-subset(MD_Sed_Loads, County == 'MONTGOMERY')
prince_g_MD<-subset(MD_Sed_Loads, County == 'PRINCE GEORGES')
queen_annes_MD<-subset(MD_Sed_Loads, County == 'QUEEN ANNES')
somerset_MD<-subset(MD_Sed_Loads, County == 'SOMERSET')
st.marys_MD<-subset(MD_Sed_Loads, County == 'ST MARYS')
talbot_MD<-subset(MD_Sed_Loads, County == 'TALBOT')
washington_MD<-subset(MD_Sed_Loads, County == 'WASHINGTON')
wicomico_MD<-subset(MD_Sed_Loads, County == 'WICOMICO')
worchester_MS<-subset(MD_Sed_Loads, County == 'WORCESTER')


CastScalingdown<-sapply(strsplit(CastScalingdown$Geography, ', '), "[[", 1)
strsplit(CastScalingdown$Geography, ', ')

?merge
merged<-merge(CastScalingdown, Chesapeake_Bay_Pollution_Loads_Sediment_20241121,
      by.x = "Geography" , by.y = "County" , all = FALSE)


