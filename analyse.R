# calcul indicateur D5C2 
# 19/02/2020 moi
# libraries
# installer une librairie si nécessaire
#install.packages("raster")
#appelle la librairie
library(raster)
# spécifier env de travail
getwd()
setwd("/home/moi/ifremer/cours_dcsmm")
#lecture du fichier chlorophylle a
chl<-stack("chl")
plot(chl)
#dimension de l'objet
dim(chl)
#affiche la 5eme image
plot(chl[[5]])
names(chl)[5]
#
plot(chl[[200]])
title(names(chl)[200])
#calcul de la moyenne et affichage
meanchl<-mean(chl,na.rm=TRUE)
plot(meanchl)
title("Chl moy 2010-2018")


