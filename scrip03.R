####limpiamos memoria####
rm(list = ls())

####cargar la data####
library(ggplot2)
library(car)

data("Salaries")
str(Salaries)
summary(Salaries)


ggplot(Salaries, aes(x=salary,y=..density..))+
  geom_histogram(colour='grey60',fill="cornsilk")+
  geom_density(colour=NA,fill="blue",alpha=0.2)+
  geom_line(stat = "density",colour="red")+
  xlim(45000,250000)

#/////////////////////////////
#los intervalos de clase
hs<-hist(Salaries$salary)
hs$breaks[2]-hs$breaks[1]#longitud del intervalo de clase
hs$counts

hs2<-hist(Salaries$salary,breaks=seq(40000,240000,15*1000))
hs2$breaks



ggplot(Salaries, aes(x=salary,y=..density..))+
  geom_histogram(binwidth = hs2$breaks[2]-hs2$breaks[1],colour='grey60',fill="cornsilk")+
  geom_density(colour=NA,fill="blue",alpha=0.2)+
  geom_line(stat = "density",colour="red")+
  xlim(45000,250000)



#////////////////////////////////












