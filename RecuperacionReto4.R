library(digest)
library(discretization)
library(dplyr)
library(EnvStats)
library(fastDummies)
library(naniar)
library(nortest)
library(readxl)
library(smoothmest)
library(VIM)
library(plumber)

datos <- read.csv("C:/Users/helen/OneDrive/Escritorio/RECU_DS_BIEN/netflix_recuperacion.csv")

# DATA DISCOVERING
summary(datos)
sd(datos$release_year, na.rm = TRUE)

length(unique(datos$listed_in))
