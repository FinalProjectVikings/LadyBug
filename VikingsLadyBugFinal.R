library(readxl)
library(tidyverse)
library(hrbrthemes)
library(viridis)
library(tidytext)
library(dplyr)
library(lubridate)
library(ggplot2)
library(psych)
 library(zoo)

setwd("~/Desktop/Data 331/Final Project/Project-Insect-Carnivore-main/data")
df <- read_excel("Ladybug Data.xlsx")
df1 <-read.csv("Scan Ladybug Data.csv")

#Renaming columns
colnames(df)[8] <- "SCAN"
colnames(df1)[8] <- "SCAN"
colnames(df)[6] <- "collectorName"
colnames(df)[7] <-"identifierName"
#Combining data
merged <- left_join(df, df1%>% dplyr::select(SCAN,genus),
                    by = "SCAN")
# cleaning data

merged<- merged %>% #**
  dplyr::mutate(Species = ifelse((Species =='Coccinella semtempuncta')|(Species == 'coccinella semptempuncata')|(Species == 'coccinella septempunctata')|(Species == 'Coccinella septempunctata')|(Species == 'Coccinella semtempuncata')|(Species == 'Coccinella Septempunctata'), 'Coccinella septempunctata', Species))%>%
  dplyr::mutate(Species = ifelse((Species == 'coleomegilla maculata') | (Species == 'Colemegilla maculata'), 'Coleomegilla maculata', Species)) %>%
  dplyr::mutate(Species = ifelse((Species == 'Propylea quatuordecimpunctata')|(Species =='Propylea quatuordecimpuncata'), 'Propylea quatuordecimpunctata', Species))%>%
  dplyr::mutate(Species = ifelse((Species == 'cycloneda munda') | (Species =='Cycloneda Munda'), 'Cycloneda munda', Species))%>%
  dplyr::mutate(Species = ifelse((Species == 'Harminia axyridis')|(Species == 'harmonia axyrids')|(Species == 'Harmonia axyrisis') | (Species == 'harmonia axyridis'),  "Harmonia axyridis",Species))%>%
  dplyr::mutate(Species = ifelse((Species == "hippodamia convergens") | (Species == "Hippodamia covergence"), "Hippodamia convergens", Species))%>%
  dplyr::mutate(Species = ifelse((Species == 'hippodamia parenthesis'), 'Hippodamia parenthesis',Species))%>%
  dplyr::mutate(collectorName= ifelse((collectorName== 'J Hughes')|(collectorName =='J. Hughees')|(collectorName== 'j. hughes')|(collectorName== 'j. Hughes')|(collectorName== 'J. hughes')|(collectorName== 'jack hughes')|(collectorName== 'J. Hughes'),'Jack Hughes', collectorName))%>%
  dplyr::mutate(collectorName= ifelse((collectorName== "m gorsegner")|(collectorName =="M. Gorsegner")|(collectorName== "m. gorsegner")|(collectorName== "M. gorsegner")|(collectorName== "M.Gorsegner"), "Marissa Gorsegner",collectorName))%>%
  dplyr::mutate(collectorName= ifelse((collectorName== 'O. Ruffatto')|(collectorName== 'o. ruffattto')|(collectorName== 'o. ruffatto')|(collectorName== 'O. ruffatto')|(collectorName== 'OliviaRuffatto'), "Olivia Ruffatto", collectorName))%>%
  dplyr::mutate(collectorName= ifelse((collectorName== 'v cervantes')|(collectorName== 'V. Cervantes')|(collectorName== 'v. cervantes')|(collectorName== 'V. cervantes')|(collectorName== 'V.Cervantes')|(collectorName== 'VeronicaCervatnes'), "Veronica Cervantes",collectorName))%>%
  drop_na()
  dplyr::mutate(plot = ifelse((plot == 'Lp-PR-5'), "LP-PR-5",plot))%>%
  dplyr::select('Species','plot','A_E_V','date','coordinates','collectorName','identifierName','SCAN')
 #counting number of species and collectorName
df_numSpecies <- merged %>%
  dplyr::count(Species)
df_numcollectors <- merged %>%
  dplyr::count(collectorName)

#to look up the cleaned data using function head
head(merged)

#finding summary statistics
summary(merged)

#changing values
merged$plot <- str_replace_all(merged$plot, c("-1" = "", "-2"="","-3" = "", "-4" = "", "-5"=""))

df_species_count <-merged %>%
  count(Species,plot)
df_species_count2 <-merged %>%
  count(Species)

#drawing the graph for species by population

df_species_count %>%
  ggplot(aes(x= Species, y=n, fill = plot)) +
  geom_col()+
  theme(text = element_text(size=10))+
  scale_x_reordered() +
  coord_flip() +
  facet_wrap(~plot) +
  labs( title = "Species by Population",x="Species", y="Count")
  
#graph for plot by population
df_plot_count <-merged %>%
  count(plot)

df_plot_count %>%
  ggplot(aes(x= plot, y=n, fill = plot)) +
  geom_col()+
  scale_x_reordered() +
  coord_flip() +
  labs(title= "Plot by Population", x="plot", y="Count")
#graphing plot by month
require(zoo)
merged$ym <- as.yearmon(merged$date,"%Y %m")

merged %>%
  ggplot(aes(ym,plot,group_by(Species)))+
  geom_point(aes(color=Species))+
 scale_color_manual(values=c('Red','Orange','Green','Yellow', 'Violet','Dark Orange','Blue','Dark Blue','Dark Green','Grey','Brown','Purple','Pink','Black','Light Yellow','Light Pink'))

