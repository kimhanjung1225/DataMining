#1 데이터의 정보에 대해 정리하라.
airquality
help(airquality)
#2 데이터의 변수이름과 자료형을 써라.
str(airquality)

#3 결측값의 존재에 대해 변수별로 정리하고 그 개수를 확인하여라.
sum(is.na(airquality))
sum(is.na(airquality$Ozone))
sum(is.na(airquality$Solar.R))
sum(is.na(airquality$Wind))
sum(is.na(airquality$Temp))
sum(is.na(airquality$Month))
sum(is.na(airquality$Day))

#4 결측치를 제거하고 데이터를 저장하여 기술통계량을 출력하라.
N_airquality<-na.omit(airquality)
is.na(N_airquality)
dim(N_airquality)
n_mean_Ozone<-mean(airquality$Ozone, na.rm = TRUE)
n_mean_Ozone
mean_Ozone<-mean(airquality$Ozone)
mean_Ozone

n_mean_Solar.R<-mean(airquality$Solar.R, na.rm = TRUE)
n_mean_Solar.R
mean_Solar.R<-mean(airquality$Solar.R)
mean_Solar.R

summary(N_airquality)

#5 
library(VIM)
S_airquality<-kNN(airquality, k=3)
dim(S_airquality)
View(S_airquality)
S_airquality
dim(airquality)
