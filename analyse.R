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

plot(c(1,2,3))

#calcul de la mediane et affichage ?
medianchl<-stackApply(chl,rep(1,3287),median,na.rm=TRUE)
plot(medianchl)
title("Chl median 2010-2018")
#comment définir une fonction ?
fctquantile<-function(input,na.rm=TRUE){
  resultats<-quantile(input,probs=0.5,na.rm=TRUE)
  return(resultats)
}
#test de la fonction
#median(c(1,2,3))
#fctquantile(c(1,2,3))
#calcul le quantile à 50% (la médiane quoi) avec la fonction !
q50chl<-stackApply(chl,rep(1,3287),fctquantile)
plot(q50chl)
#affichage joli
library(rasterVis)
levelplot(q50chl)
levelplot(q50chl,margin=F,zscale=F,contour=T,par.settings= viridisTheme,main="Q50 2010-2018")
levelplot(q50chl,margin=F,zscale=T,contour=T,par.settings= viridisTheme,main="Q50 2010-2018")



