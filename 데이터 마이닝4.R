trees
str(trees)
dim(trees)
View(trees)
is.na(trees)
head(trees)
names(trees)
hist(trees$Girth)
hist(trees$Height)
stem(trees$Girth)
stem(trees$Height)
stem(trees$Volume)
boxplot(trees$Girth, trees$Height, trees$Volume)
boxplot(trees$Height)
boxplot(trees$Volume)

## correlation coefficient 상관관계
cor(trees)
plot(trees$Girth, trees$Height)
plot(trees$Girth, trees$VOlume)
## linear Regression 1차 직선회귀모델
##lm(y - x)
fit<-lm(trees$Volume~trees$Girth, data = trees)
abline(fit)
summary(fit)
predict(fit)

fit2<-lm(trees$Volume~trees$Height, data = trees)
summary(fit2)
predict(fit2)
hist()
plot(trees$Height, trees$Volume)
abline(fit2)

fit3<-lm(trees$Height~trees$Girth, data = trees)
summary(fit3)
predict(fit3)
plot(trees$Girth, trees$Height)
abline(fit3)

## 정규성 검정
library(psych)
qqnorm(trees$Volume)
qqline(trees$Volume)
## 왜도와 첨도가 나옴
describe(trees$Volume)
## p-value 값이 나옴
shapiro.test(trees$Volume)
