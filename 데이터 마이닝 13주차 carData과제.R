library(carData)
library(pROC)

# 데이터 확인
data("TitanicSurvival")
str(TitanicSurvival)

# 데이터 전처리 (결측 제거 등)
df <- na.omit(TitanicSurvival)

# 변수 확인: survived, sex, age, passengerClass 등 사용
# 로지스틱 회귀 모델 적합
model <- glm(survived ~ sex + age + passengerClass, data = df, family = "binomial")

# 요약 결과 확인
summary(model)

# 성능 평가 지표 확인
# ① Null deviance, residual deviance, AIC
model$null.deviance     # Null deviance
model$deviance          # Residual deviance
AIC(model)              # AIC

# ② 반복 횟수 (Fisher Scoring Iterations)
model$iter

# ③ ROC 곡선 그리기
# 예측값 추출
pred <- predict(model, type = "response")

# 실제값을 0, 1로 변환
actual <- ifelse(df$survived == "yes", 1, 0)

# ROC 커브 및 AUC
roc_obj <- roc(actual, pred)
plot(roc_obj, col = "blue", main = "ROC Curve")
auc(roc_obj)  # AUC 값 확인