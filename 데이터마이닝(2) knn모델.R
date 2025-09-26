
##1. 미 프로 야구 선수 6명에 대해 두 시즌간의 기록이 다음해의 득점에 미치는 영향을 알아보기 위해 knn회귀를 수행하라.

##1) 5명 선수자료를 훈련용으로 하고 Bonds Barry를 검증용으로 사용하여 knn회귀를 수행하라. 결과를 요약하라.

install.packages("FNN")
library(FNN)

# 데이터 입력
players <- data.frame(
  name = c("McGwire Mark", "Bonds Barry", "Helton Todd", 
           "Walker Larry", "Pujols Albert", "Pedroia Dustin"),
  lag1 = c(100, 90, 75, 89, 95, 70),
  lag2 = c(120, 80, 95, 79, 92, 90),
  Runs = c(65, 120, 105, 99, 65, 100)
)

# Bonds Barry를 test, 나머지 5명을 train으로 설정
train <- players[players$name != "Bonds Barry", ]
test  <- players[players$name == "Bonds Barry", ]

# 특징(설명변수)과 목표변수 분리
train_x <- train[, c("lag1", "lag2")]
train_y <- train$Runs
test_x  <- test[, c("lag1", "lag2")]

# k=2로 knn 회귀 수행
knn_result <- knn.reg(train = train_x, test = test_x, y = train_y, k = 2)

# 예측값 출력
cat("예측값:", knn_result$pred, "\n")
cat("실제값:", test$Runs, "\n")


##2) Bonds 선수와 가장 가까운 2개의 인접값을 구하고 예측값을 계산하여라.

# 최근접 이웃 찾기 (k=2)
neighbors <- get.knnx(train_x, test_x, k = 2)

# 최근접 선수 이름과 거리 출력
cat("가장 가까운 2명의 선수:\n")
print(train$name[neighbors$nn.index])
cat("각 거리:\n")
print(neighbors$nn.dist)

# 예측값은 위에서 구한 knn_result$pred (자동으로 평균/가중평균 계산됨)
cat("k=2에서의 예측값:", knn_result$pred, "\n")


##3) Bonds선수와 가장 인접한 2 선수를 구하고, 사용한 거리공식이 무엇인지 밝혀라.

# 가장 가까운 2명의 선수
closest_players <- train$name[neighbors$nn.index]
cat("가장 인접한 2명의 선수:", closest_players, "\n")

# 거리 공식은 유클리드 거리 사용
cat("사용한 거리식: d = sqrt((x1 - x2)^2 + (y1 - y2)^2)\n")


## 패키지 : CLASS,  함수명 : knn(),  옵션 설명 및 사용 예 : k-최근접 이웃(KNN) 분류 함수
## 패키지 : caret,  함수명 : createDataPartition(),  옵션 설명 및 사용 예 : 데이터셋을 train/test로 나눔
## 패키지 : caret,  함수명 : preProcess(),  옵션 설명 및 사용 예 : 데이터 전처리(표준화, 정규화 등)
## 패키지 : caret,  함수명 : trainControl(),  옵션 설명 및 사용 예 : 교차검증, 재표본추출 방법 설정