# 1. 정규 분포

library(ggplot2)
# 정규분포를 위한 파라미터 설정
x<-seq(-3,3,0.01)
print(x)
plot(x,dnorm(x), type = 'l', main="Standard Normal Distribution", xlab="x", ylab="Probability Desity Function f(x)")

# 데이터 설정
df <- data.frame(x = seq(-4, 4, length.out = 1000))
df$y_norm1<- dnorm(df$x, mean = 0, sd = 1)
df$y_norm2<- dnorm(df$x, mean = 0, sd = 0.5)
df$y_norm3<- dnorm(df$x, mean = -1, sd = 1)

# ggplot으로 그리기
ggplot(df, aes(x=x)) + geom_line(aes(y = y_norm1, color = "N(0,1)"), size = 1) + geom_line(aes(y = y_norm2, color = "N(0,0.5)"), size = 1) + geom_line(aes(y = y_norm3, color = "N(-1,1)"), size = 1) + labs(title = "정규분포 곡선", x = "x", y = "확률밀도", color = "분포")


# 2. 감마 분포

x_g<-seq(0,12,0.1)
print(x_g)
plot(x_g, dgamma(x_g, shape = 3, scale = 1),type = 'l', main="Gamma Distribution", xlab="x", ylab="Probability Density Function f(x)")

# 데이터 생성
df_g <- data.frame(x = seq(0, 30, length.out = 1000))
df_g$y_dgamma1<- dgamma(df_g$x, shape = 2, scale = 1)
df_g$y_dgamma2<- dgamma(df_g$x, shape = 10, scale = 1)
df_g$y_dgamma3<- dgamma(df_g$x, shape = 20, scale = 1)

# ggplot으로 그리기
ggplot(df_g, aes(x=x)) + geom_line(aes(y = y_dgamma1, color = "G(2,1)"), size = 1) + ggplot(df_g, aes(x=x)) + geom_line(aes(y = y_dgamma2, color = "G(10,1)"), size = 1) + ggplot(df_g, aes(x=x)) + geom_line(aes(y = y_dgamm3, color = "G(20,1)"), size = 1) + labs(title = "감마 분포 곡선" , x = "x", y = "확률밀도", color = "분포")

# 감마 분포의 특징

# 1) 양의 값만 갖는다.
# 2) 양의 왜도값을 갖는다.(오른쪽으로 꼬리가 긴 분포)
# 3) 평균 : shape * scale, 분산 : shape * scale*scale
# 4) shape 이 클수록 종모양에 가깝고 20 이상이 되면 정규분포의 모양 : 중심 극한 정리
# 5) 감마분포를 따르는 사건
#     a. 대기 시간 모델링
#     b. 강우량 분포, 홍수나 가뭄의 지속시간
#     c. 보험 및 금융; 보험 청구액 크기, 손실 분포 모델링, 금융자산의 수익률
#     d. 의학 및 생물학 : 약물 대사 시간, 세포 생존 시간, 회복 시간 등
#     e. 신뢰성 공학 : 부품이나 시스템의 수명, 전자 장치의 고장시간,정비 시간
#     f. 물리학 : 방사성 물질의 붕괴 과정. 입자 충돌 시간 간격, 에너지 분포
#     g. 마케팅 : 고객 구매 간격, 제품 사용 수명

# 3. 지수 분포
x_e<-seq(0,5,0.001)
print(x_e)
plot(x_e, dexp(x_e, rate = 1),type = 'l', main="Exponential Distribution", xlab="x", ylab="Probability Density Function f(x)")

# 지수 분포의 특징
#  1) x=0에서 최대값을 갖는다.
#  2) 양의 왜도값을 갖는다.(오른쪽으로 꼬리가 긴 분포)
#  3) 평균 : 1/rate, 분산 : 1/rate*rate
#  4) Rate값이 커질수록 원점 쪽으로 집중되는 모양
#  5) 감마분포의 shape = 1 인 경우
#  6) 지수 분포를 따르는 사건
#     a. 대기 시간 모델링 ; 포아송의 연속된 사건 사이의 시간 간격
#     b. 콜센터에 다음 고객이 전화를 걸 때까지의 시간
#     c. 웹 사이트에 다음 방문자가 접속할 때까지의 시간
#     d. 은행, 매장, 식당에서의 서비스 시간
#     e. 고객 응대 시간
#     f. 시스템 처리 시간

# 4. 베타 분포

# 베타 분포 그리기
x_b<-seq(0,1,0.01)
print(x_b)

##1. U모양
plot(x_b, dbeta(x_b, shape1 = 0.5, shape2 = 0.5), type = 'l', main = "Beta Distribution", xlab="x", ylab = "Probability Density Function f(x)")

##2. 균등 모양
plot(x_b, dbeta(x_b, shape1 = 1, shape2 = 1), type = 'l', main = "Beta Distribution", xlab="x", ylab = "Probability Density Function f(x)")

##3. 대칭, 종모양
plot(x_b, dbeta(x_b, shape1 = 2, shape2 = 2), type = 'l', main = "Beta Distribution", xlab="x", ylab = "Probability Density Function f(x)")

##4. 오른쪽으로 치우침
plot(x_b, dbeta(x_b, shape1 = 2, shape2 = 5), type = 'l', main = "Beta Distribution", xlab="x", ylab = "Probability Density Function f(x)")

##5. 왼쪽으로 치우침
plot(x_b, dbeta(x_b, shape1 = 5, shape2 = 2), type = 'l', main = "Beta Distribution", xlab="x", ylab = "Probability Density Function f(x)")

##6. 좁은 종모양
plot(x_b, dbeta(x_b, shape1 = 5, shape2 = 5), type = 'l', main = "Beta Distribution", xlab="x", ylab = "Probability Density Function f(x)")

# 데이터 생성
df_b <- data.frame(x = seq(0,1, by = 0.001))
df_b$y_dbeta1<- dbeta(df_b$x, shape1 = 4, shape2 = 7)
df_b$y_dbeta2<- dbeta(df_b$x, shape1 = 4, shape2 = 4)
df_b$y_dbeta3<- dbeta(df_b$x, shape1 = 8, shape2 = 3)

# ggplot으로 그리기
ggplot(df_b, aes(x=x)) + geom_line(aes(y = y_dbeta1, color = "B(4,7)"), size = 1) + geom_line(aes(y = y_dbeta2, color = "B(4,4)"), size = 1) + geom_line(aes(y = y_dbeta3, color = "B(8,3)"), size = 1) + labs(title = "지수 분포 곡선",x= "x", y = "확률밀도", color = "분포")



library(vcd)
data("Arthritis")
str(Arthritis)

table(Arthritis$Treatment, Arthritis$Improved)

xtabs(~ Treatment + Improved, data = Arthritis)

table1<-table(Arthritis$Treatment, Arthritis$Improved)
chisq.test(table1)

table2<-xtabs(~ Treatment + Improved, data = Arthritis)
chisq.test(table2)

