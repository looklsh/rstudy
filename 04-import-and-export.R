#데이터 불러오기 와 내보내기
#내장 데이터셋 확인
?datasets
#전체 데이터셋의 확인
library(help = "datasets")

data("mtcars")
mtcars

#file목록에서 thieves.txt불러오기
#read.csv 기본적으로 , 구분자
#sep 파라미터로 구분자 지정
thieves <- read.csv("thieves.txt", sep = "\t", fileEncoding = "utf-8", header = FALSE)
thieves

#컬럼에 이름 붙이기
names(thieves)
names(thieves) <- c("Name","Height","Weight")
thieves
#저장
write.csv(thieves, fileEncoding = "utf-8", file = "thieves.csv", row.names = FALSE)
#엑셀 불러오기
#별도 패키지 필요
install.packages("readxl")
#엑셀 패키지 로드
library(readxl)
wstudents <- read_excel("wstudents.xlsx", sheet = 1)
wstudents
#class_scores.csv import -> 약간의 조작 -> .rda 파일로 저장
class_scores <- read.csv("class_scores.csv")
class_scores
str(class_scores) #데이터셋의 구조 확인

#총 몇 개의 변수가 있는가
length(class_scores)
#총 몇개의 관측치가 있는가
nrow(class_scores)
#2학년 데이터만 추출
class_scores$grade == 2
#class_scores.grade2 <- class_scores[class_scores$grade == 2]
class_scores.grade2 <- class_scores[class_scores$grade == 2,]
nrow(class_scores.grade2)
#grade2인 학생의 데이터를 rda파일로 저장
#rda는 R전용 파일 협업에 용이
save(class_scores.grade2, file = "class_scores.grade2.rda")
#class_scores-grade2객체를 삭제
rm(class_scores.grade2)
class_scores.grade2 #없음->삭제했으므로

#rda파일로부터 다시 복원
load("class_scores.grade2.rda")
class_scores.grade2
