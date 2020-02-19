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
  resultats<-quantile(input,probs=0.9,na.rm=TRUE)
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

#quantile à 90 % sur la série complète 2010-2018
q90chl<-stackApply(chl,rep(1,3287),fctquantile)
plot(q90chl,main="Q90 chl 2010-2018")
#quantile à 90 % sur la série complète 2010-2016 ?
q90chl<-stackApply(chl[[1:2557]],rep(1,2557),fctquantile)
plot(q90chl,main="Q90 chl 2010-2016")
#un truc en plus : quantile annuel ?
idyear<-substr(names(chl),1,5)
head(names(chl))
head(idyear)
q90chlyear<-stackApply(chl,idyear,fctquantile)
levelplot(q90chlyear,main="Q90 chl 2010-2018")

#série temporelle

#serie temporelle
chlts<-cellStats(chl,stat="mean",na.rm=T)
head(chlts)
#vecteur temporel
temps<-strptime(gsub("X","",names(chlts)),"%Y.%m.%d")
plot(temps,chlts,type="l")

#booléen ?
x<-c(1,2,3,5,7,9)
condition1<-x<4
x[condition1]

#
plot(q90chl)
plot(q90chl<4)






