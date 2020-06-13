setwd(dir = "C:/Users/catpo/Desktop/r_data_science/clase03")
rm(list = ls())
#### datos y librerias####
library(dplyr)

#desarrollado por hadley wikham (rstudio)
#dyplyr: gramatica para manipulacion de datos

#### cargar data:storms, pollution, tb ####
storms <-read.csv(file = "https://raw.githubusercontent.com/robintux/Datasets4StackOverFlowQuestions/master/storms.csv")
#velocidades maximas  de viento para 6 huracanes
pollution <-read.csv(file = "https://raw.githubusercontent.com/robintux/Datasets4StackOverFlowQuestions/master/pollution.csv")
#nivel promedio de contaminacion del aire por particular(ciudad de ny,london)

tb <-read.csv(file ="https://raw.githubusercontent.com/robintux/Datasets4StackOverFlowQuestions/master/tb.csv")
#numero de casos de tuberculosis


####algunas funciones de dyplyr####
class(storms)
dim(storms)[1]
head(storms,n=2)
tail(storms,n=3)
colnames(storms)
names(storms)
str(storms)

#es notorio que la variable $date debe ser una varaible que represente  a una linea de tiempo
class(storms$date)
storms$date<-as.Date(storms$date)

####funcion select####
#permite seleccionar columna (2da dimension) de un dataframe
#seleccionar las variables "storm" y "pressure"
help("select")

select(storms,storm,pressure)
select(storms,colnames(storms)[1],colnames(storms)[3])

#verifiquemos que el resultado es un objetoto de tipo data frame
class(select(storms,storm,pressure))

#utilizando la sintais matricial
storms[,c(1,3)]


#para excluir una clumna utilizamos el operador(unario):-
select(storms,-storm)

#con notacion matricial
storms[,-1] #storm[,-c(1,3)]
storms[,-c(1,3)]

#podemos utilizar la notacion : para seleccionar el rango de una columna 
select(storms,wind:date)

#utilizando los operadores : y - de forma conjunta podemos hacer mas cosas
select(storms,-(storm:wind))

#selecciona columnas cuyo nombre contineen un patron 
select(storms,starts_with("w"))

#seleccionar las columnas cuyo nombre termina en la letra "e" 
select(storms,ends_with("e"))


#selecciona todas las columnas 

select(storms,everything())
#selecciona columnas cuyo nombre contiene un string 
select(storms,contains("essure"))


#algunas funciones de select son bastantes  utiles
#-
#:
#contains()
#star_with()
#ends_with()
#everything()

help("contains")

####filter####
#la funcion filter nos permite filtrar filas segun una condicion
filter(storms,wind>=50)
filter(storms,wind>=50,storm %in% c("Alberto","Alex","Allison"))

#el siguinete ejmeplo filtra aquellas filas con wind >=50 y pressure <1010
filter(storms,wind>=50 & pressure<1010)

####arrange####
#la funcion arrange se utiliza para ordenar las filas de un dataframe
#decuerdo  a una o varias columnas (variables)
#por defecto arrange orderna de forma ascendente

#para ordenar las filas por la varaible wind de forma ascendente
arrange(storms,wind)

#si las queremos orderna r de forma desendente
arrange(storms,desc(wind))

####rename####
names(storms)
rename(storms,tormenta=storm,viento=wind, pression=pressure,fecha=date)

####mutate####
#conla funcion  mutate podemos computar /calcular tranformaciones de varaibles 
#de un dataframe. a menudo  tendremos la necesidad de crear nuevas variables 
#que se calculan a partir de varcibles existentes. mutate()proporciona
#una interfase para realizar estre tipo de operaciones
#deseo calcular una varaibels ratio que sea definida como el cociente entre 
#presion y viento

stroms_nuevo<-mutate(storms,ratio=pressure/wind)

#mutate nos permite encadenar varias expresiones
stormsnuevo<-mutate(storms,ratio=pressure/wind,inverse=ratio*-1)

stormsnuevo$wind
mean(stormsnuevo$wind)

summary(stormsnuevo)


####summarise####
#funciona de forma analoga a la funcion mutate, excepto que en lugar de añadir nuevas 
#columnas crea un nuevo dataframe

#para calcular la mediana y la varianza de la variable amount del 
#dataframe pollution
summarise(pollution,mediana=median(amount),variance=var(amount))
class(summarise(pollution,mediana=median(amount),variance=var(amount)))

####operador pipe####
#el uso es bastate sencillo   y sirve para concatenar  expresiones
# de la gratica dyply
pollution%>%summarise(mediana2=median(amount),varianza=var(amount))




#funciones que trabajan conjuntamente con summarise
#base : min,max, median,mean, sum, var ,sd
#dylyr: first,last,n,n_distinct,nth

####group_by ####
pollution
group_by(pollution,city)
class(group_by(pollution,city))


pollution%>%group_by(city)%>%summarise(media=mean(amount),suma=sum(amount),n=n())

infor<-pollution%>%group_by(city)%>%summarise(media=mean(amount),suma=sum(amount),n=n())

class(infor)






















































