str(iris)
View(iris)
##apply()
column.sum
apply(iris[,1:4], 2, sum)
apply(iris[,1:4], 2, mean)
apply(iris[,1:4], 2, min)
summary(iris[,1:4])
lapply(iris[,1:4], sum)
sapply(iris[,1:4], min)
sapply(iris[,1:4], mean)
##csv
inf<-read.csv("C:/Users/user/Desktop/데이터 마이닝/infant.csv")
inf
View(inf)
setwd()
str(inf)
plot(inf$age, inf$weight) ##산점도
## head는 앞에서 6개 데이터를 보여줌
head(inf)
## linear regression
lm(inf$age~inf$weight, data = inf)
fit<- lm(inf$age~inf$weight, data = inf)
summary(fit)
abline(fit)

library(vcd)
help(package = "vcd")
head(Arthritis)
tail(Arthritis)
str(Arthritis)
names(Arthritis)
dim(Arthritis)
length(Arthritis)
colnames(Arthritis)
hist(inf$age)
hist(inf$weight)
##csv
data(Hitters)
colnames(Hitters)
Hitters<-read.csv("C:/Users/user/Desktop/데이터 마이닝/Hitters.csv")
View(Hitters)
head(Hitters)
dim(Hitters)
str(Hitters)
help(Hitters)
## 결측치 확인
is.na(Hitters)
##결측치 제거
N_Hitters<-na.omit(Hitters)
is.na(N_Hitters)
dim(N_Hitters)
n_mean_salary<-mean(Hitters$Salary, na.rm = TRUE)
n_mean_salary
mean_salary<-mean(Hitters$Salary)
mean_salary
##결측치값 대체
library(VIM)
S_Hitters<-kNN(Hitters, k=3)
dim(S_Hitters)
dim(Hitters)
View(S_Hitters)
s_mean<-mean(S_Hitters$Salary)
s_mean
