# Cargar librerías necesarias
library(plumber)
library(readr)
library(dplyr)

datos <- read.csv("C:/Users/helen/OneDrive/Escritorio/RECUPERACION_DS_RETO4/netflix_recuperacion.csv")

#* Transforma variable categórica en dummys
#* @param variable Nombre de la variable a transformar
#* @get /transformar
function(variable = "") {
  if (!(variable %in% colnames(datos))) {
    return(list(error = TRUE, paste("La variable", variable, "no existe en el dataset")))
  }
  columna <- datos[[variable]] #para extraer la columna
  
  #verificar si es categórica o no
  if (is.character(columna) || is.factor(columna)) {
    columna <- as.factor(columna)
    dummys <- model.matrix(~ columna - 1)
    return(as.data.frame(dummys))
  } else {
    return(list(error = TRUE, paste("La variable", variable, "no es categórica")))
  }
}

