#Graph함수들
#산점도 차트: 두 변수간의 관계를 파악하기 위한 그래프
?mtcars
str(mtcars)
#중량(wt)과 연비(mpg)를 scater plot으로 그려보기
plot(mtcars$wt, mtcars$mpg)
#두 변수 사이의 경향성을 확인
#역상관관계
cor(mtcars$wt, mtcars$mpg)

plot(x = mtcars$wt, y = mtcars$mpg, xlab = "차량중량", ylab = "연비", main = "중량vs연비", col = "red")

#산점도 매트릭스
#지정한 변수간 상관관계를 한 눈에 보여주는 그래프
?pairs
pairs(data = mtcars, ~wt + mpg + hp + cyl, main = "Scatterplot Matrix")

#파이 차트
#전체 중에 해당 데이터가 차지하는 비율을 표시
scores <- data.frame(grade = c("A","B","C","D"), cnt = c(3, 12, 11, 2))
scores
str(scores)

pie(scores$cnt, labels = scores$grade, radius = 1, #col = c("red","blue","yellow","green")
                                                   col = rainbow(4), main = "2019년 성적")

#Legend(범례)
#Label 대신 퍼센트 정보를 출력
scores$percent <- round(scores$cnt/sum(scores$cnt)*100, 1)
scores$percent
sum(scores$percent)

pie(scores$cnt, labels = scores$percent, col = rainbow(length(scores$cnt)), main = "2019년 성적")
legend("topright", legend = scores$grade, fill = rainbow(length(scores$cnt)))

#Bar Chart
#항목간의 값을 비교
#데이터 생성
rev <- sample(1:20, 6, rep = T)
rev
barplot(rev)
names <- c("MAR","APR","MAY","JUN","JUL","AUG")
barplot(rev, names.arg = names, xlab = "MONTH", ylab = "Revenue", main = "Revenue Chart", col = "blue", border = "red")

#Stacked Bar Chart
rev2 <- sample(1:20, 18, rep = T)
#3행 6열의 MATRIX
rev2 <- matrix(rev2, nrow = 3)
rev2
barplot(rev2, names.arg = names, xlab = "MONTH", ylab = "Revenue", main = "Revenue Chart", 
        col = c("green","orange","red"), border = "red")
#범례 표시
legend("topright", c("A","B","C"), fill = c("green","orange","red"))

#BoxPlot
#데이터의 전체적 분포를 확인
#mtcars mpg, cyl 데이터의 분포
bt.input <- mtcars[, c("mpg", "cyl")]
bt.input
boxplot(mpg~cyl, data = bt.input, xlab = "Cylinder", ylab = "MPG", col = c("green", "yellow", "orange"),
        names = c("LOW","MEDIUM","HIGH"))

#히스토그램
#특정구간별 관측횟수(비율)을 그래프로 확인할 수 있음
wstudents
wstudents$height
#히스토그램
hist(wstudents$height, main = "Height of wstudents", xlab = "Height", col = "red", border = "blue")
#frequency = false로 주면 밀도그래프로 변경가능
stat <- hist(wstudents$height, freq = FALSE, main = "Height of wstudents(Density)", xlab = "Height", 
     col = "orange", border = "black")

#R의 그래프 함수들은 단순히 그리기만 하는 것이 아니라 해당 그래프를 만들 때
#필요했던 통계치들도 함께 데이터로 담고 있다
stat
is(stat)
#히스토그램의 구간 경계값
stat$breaks
#각 구간별 데이터의 개수(빈도)
stat$counts
#각 구간별 데이터의 밀도
stat$density
#각 구간별 데이터 밀도의 합은 1
sum(stat$density * 5)

#Line 그래프
#주로 시간의 흐름에 따라 추세 혹은 트렌드변화를 표시해주는 그래프
v <- sample(10:20, 5, rep = F)
v
plot(v, type = "p") #점 그래프
plot(v, type = "l") #선 그래프
plot(v, type = "o") #점,선이 함께

plot(v, type = "o", main="Line Graph", xlab = "HORZ", ylab = "VERT", col = "red")
#legend, lines, points등의 함수는 그래프를 덧그릴 수 있다
v2 <- sample(10:20, 5, rep=T)
v2
lines(v2, type = "o", col="blue")

##ggplot2
#시각화를 위한 그래픽 라이브러리
#mpg 데이터 셋으로 그래프를 만드는 연습
library(ggplot2)
?mpg
#displ(배기량), hwy(고속도로 연비)
#그래프
plt <- ggplot(data = mpg)
plt
#레이어를 얹을때는 + 로 연결
plt + geom_point(aes(x=displ,y=hwy)) +
  xlab("배기량") + ylab("고속도로 연비")

seoul.merged
#자치구별 인구수 데이터로 시각화 연습

plt <- ggplot(seoul.merged, aes(x=자치구,y=계/1000))
plt

#데이터에 bar chart를 그려봅시다
plt <- 
plt + geom_bar(stat="identity",fill=rainbow(nrow(seoul.merged))) +
  ggtitle("서울 자치구별 인구") + xlab("자치구") + ylab("인구수") +
  theme(axis.text.x = element_text(angle = 90), axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 9))

#인터랙티브 그래프로 만들기 plotly패키지 이용
plt
install.packages("plotly")
library(plotly)

ggplotly(plt)
