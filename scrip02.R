####limpiamos memoria####
rm(list = ls())

####cargar la data####
library(ggplot2)
library(car)

data("Salaries")
str(Salaries)
summary(Salaries)

####primero pasos con ggplot2####
#creacion del grafico: agregar la data y configuramos las variables
ggplot(data = Salaries,aes(x=yrs.service,y=salary))


#creemos un diagrama de dispersion
p<-ggplot(data = Salaries,aes(x=yrs.service,y=salary))
class(p)

#agregamos una geometria
p+geom_point()

#modifiquemos nuestro objeto p(lienzo vacio): vamos a modificar la estetica
p<-ggplot(data = Salaries,aes(x=yrs.service,y=salary,fill=sex))
p + geom_point()
# grafico 1
p + geom_point(shape=25,size=1.8)

#grafico 2
p+geom_point(aes(shape=sex,col=sex),size=3)

#grafico 3
p+geom_point(aes(shape=sex,col=sex),size=3)+
  scale_shape_manual(values = c(4,21))+
  scale_color_manual(values = c("red","#5C7A54"))+
  #theme(legend.position = "left")+
  #theme(legend.position = "top")+
  #theme(legend.position = "bottom")+
  theme(legend.position = c(0.95,0.5))


help(ggsave)
ggsave(filename = "grafico3.png",width = 16,height = 9,units = "cm")

#grafico 4
p+geom_point(aes(shape=sex,col=sex),size=3)+
  scale_shape_manual(values = c(4,21))+
  scale_color_manual(values = c("red","#5C7A54"))+
  theme(legend.position = "left")+
  theme(legend.background = element_rect(fill = "#A2AFC9",
                                         colour = "darkblue",
                                         linetype = "dashed"))


#grafico 5
graph5<- p+geom_point(aes(shape=sex,col=sex),size=3)+
  scale_shape_manual(values = c(4,21))+
  scale_color_manual(values = c("red","#5C7A54"))+
  theme(legend.position = "left")+
  theme(legend.background = element_rect(fill = "#A2AFC9"))+
  scale_y_continuous(labels = scales::scientific)


#grafico 6
graph5+geom_smooth()

#grafico 7
graph5+geom_smooth(method = "lm",formula = y ~ poly(x,3))
#grafico 8
graph5+geom_smooth(method = "lm",formula = y ~ poly(x,3))+
  facet_grid(~sex)


#grafico 9
help("Salaries")

p1<-ggplot(data = Salaries,aes(x=yrs.service,y=salary,colour=rank))

p1+geom_point()

p1+geom_point()+
  geom_smooth(aes(gruop=rank),method="lm",color="black",size=0.5)+
  facet_grid( ~ sex)


#grafico 10
p1<-ggplot(data = Salaries,aes(x=yrs.service,y=salary,fill=rank))
p1+geom_point(shape=21)+
  geom_smooth(method = "lm",
              color="black",
              size=0.5,
              se=FALSE)+
  facet_grid(~ sex)


library(gridExtra)
#grafico 11
plt1<-ggplot(Salaries,aes(x=rank))+geom_bar()
plt2<-ggplot(Salaries,aes(x=sex))+geom_bar()
plt3<-ggplot(Salaries,aes(x=yrs.service,y=salary))+geom_point()
grid.arrange(plt1,plt2,plt3,ncol=3)



























