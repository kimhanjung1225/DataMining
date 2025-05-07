# 1. trees 데이터의 변수간 상관관계를 분석하고 상관관계가 가장 높은 두 변수를 찾아라.

data(trees)
str(cars)
class(trees)
head(trees)
cor(trees)
library(psych)
cor.plot(trees)
cor.test(trees$Girth, trees$Volume)

# 2. 회귀분석의 정의와 목적에 대해 서술하고, 회귀 분석의 타당성 검토 항목을 쓰고 설명하라.

# 회귀분석이란 하나 이상의 독립변수로부터 종속변수를 예측하는 방법

# 회귀분석의 목적
#1. 종속변수와 연관된 독립변수를 발견
#2. 관련된 변수들의 관계의 형태를 서술
#3. 독립 변수로부터 종속변수를 예측하는 방정식 제시

# 타당성 검토 항목
#1. 잔차의 선형성 : 잔차의 평균은 0
#2. 잔차의 등분산성 : 잔차의 분산이 일정해야 한다.
#3. 잔차의 정규성 : 정규분포를 따라야 한다.
#4. 독립성 : 잔차는 영향을 받으면 안되고 독립적이어야 한다.

# 3. 종속변수가 정규분포를 이루지 않았을 때 선형성을 높이기 위해 사용하는 방법을 써라.

# 데이터가 정규분포가 아닐 때,log(), sqrt()로 종속변수(Y)를 변환시켜 선형으로 만든다.

# 4.cars 데이터에서 속도에 따른 거리에 대해 회귀분석 모형을 만드려고 한다. 
#   거리의 정규성을 검정하고 log 변환과 제곱근 변환을 각각 실시하여 모형을 비교 분석하라.

data(cars)
str(cars)
library(psych)
describe(cars)

# 정규성 검정
hist(cars$dist)
qqnorm(cars$dist)
qqline(cars$dist, col = 'red')
shapiro.test(cars$dist)

#회귀식 모형 분석
fit1<-lm(dist~speed, data = cars)
summary(fit1)
abline(fit1,col = 'red')

#로그변환 회귀식 모형 분석
plot(log(cars$dist)~cars$speed);fit2<-lm(log(cars$dist)~cars$speed);summary(fit2);abline(fit2)

#제곱근변환 회귀식 모형 분석
plot(sqrt(cars$dist)~cars$speed);fit3<-lm(sqrt(cars$dist)~cars$speed);summary(fit3);abline(fit3)

# 5. state.x77데이터에서 자살률에 대해 회귀분석을 실시하려고 한다. 모형의 타당성을 분석하고,
#    모든 변수를 사용한 모형과 유의미한 변수만 사용한 모형에 대해 아노바 분석과 AIC값을 비교하라.

class(state.x77)
attributes(state.x77)
states<-data.frame(state.x77[,c("Income", "Illiteracy", "Murder", "Frost")])
head(states)

# 상관관계 그림 그리기
library(psych)
cor.plot(state.x77)

library(psych)
cor.plot(states)

fit<-lm(Murder~Income+Illiteracy+Frost, data = states)
summary(fit)

#잔차의 독립성
library(car)
durbinWatsonTest(fit)

#변수 추가하여 적합모델 찾기
states2<-data.frame(state.x77[, c("Population", "Income", "Illiteracy", "Murder", "Frost")])
fit2<-lm(Murder~Population+Income+Illiteracy+Frost, data = states2)
op<-par(mfrow = c(2,2))
plot(fit2)
par(op)
outlierTest(fit2)

#이상치에 대해 조사
qqPlot(fit2, labels = row.names(states2), simulate = T)
rownames(states2)
fit3<-lm(Murder~Population+Income+Illiteracy+Frost, data = states2[-28, ])
summary(fit3)

#모형 비교 및 최선의 모형 선택
anova(fit, fit2)

AIC(fit, fit2)

library(MASS)
stepAIC(fit2)
