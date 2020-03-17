#벡터의 생성 - c,seq, rep, : 등으로 작성할 수 있다
# 인덱스는 1부터 시작한다
#하나의 벡터는 단일 자료만형만 사용할 수 있다
#결측치는 NA로 사용
v<- c(1,2,3,4,5,NA,6,7,8,9,10)

#인덱싱
v[0] #0번 인덱스는 해당 벡터 그 자신을 가리킨다
#실제 내부데이터 접근을 위한 인덱스는 1부터
v[1] #첫번째 요소
#길이를 잡을 수 있다: length
length(v)
v[length(v)]#가장 마지막 요소

#결측치 포함된 벡터의 통계값 추출 -> NA
mean(v)
#결측치 포함한 벡터는 연산이 안됨
#결측치 제거하고 통계치를 추출 : na.rm = T 
mean(v, na.rm = T)

#seq함수
seq(1, 10, 3) # from, to, by - 1부터 10까지 3간격
#파라미터 이름으로 넘겨줄 경우는 순서가 중요하지 않다
seq(to=10, by=3, from=1)

#rep: 수열의 반복
rep(1:3, 3) #1,2,3수열을 3번 반복
rep(c(1,3,5), each=3) # each 개별 요소를 each만큼 반복

#인덱싱 1부터 시작하고 범위 벗어나도 오류는 없다
#인덱스 범위가 벗어나면 NA(결측치)를 반환
vec <- c(6,1,3,2,6,10,11) #총 7개의 요소
vec[1] #첫번째 요소
vec[7] #마지막 요소
vec[8] #인덱스 범위 벗어난 접근 -> 결측치로 처리

#슬라이싱
#1500~4000 사이 구간을 12로 균등분할
incomes <- seq(1500,4000, length.out = 12)
incomes
#1,3,5,7번째 인덱스의 요소들을 추출
incomes[c(1,3,5,7)]
#1,3,5,7 인덱스 제외 나머지 요소들 추출: 음수
incomes[c(-1,-3,-5,-7)]
#특정 범위의 값을 추출
incomes
#3번 인덱스부터 8번 인덱스 사이의 값을 추출
incomes[3:8]

#incomes 내부 데이터 중에서 2500보다 큰 값을 추출 ****물어볼 것
#브로드캐스팅
incomes > 2500
#인덱싱, 슬라이싱시 TRUE, FALSE 벡터를 전달
#TRUE 값인 인덱스만 추출
incomes[incomes > 2500]

#벡터의 요소의 이름
scores <- c(80,90,85)
scores
#벡터의 각 요소의 이름 확인: names함수
names(scores)
#이름의 변경
names(scores) <- c("Eng", "Math", "Science")
names(scores)
scores

#이름을 붙여주면 이름으로 요소를 참조할 수 있다
scores['Eng']
scores['Math']
scores['Science']

#벡터 관련 수치 함수들
x <- seq(1, 12, by=2) #1~12 2간격
y <- seq(2, 7)
x; y

cor(x, y) #상관계수 -1.0~1.0,  1.0에가까울수록 정상관관계
mean(x)
sd(x) #표준편차
var(x) #분산

summary(x) #통계요약
quantile(x) #4분위수
quantile(x)['25%'] #1사분위수

#벡터 산술연산
v <- 1:10
v

#벡터와 스칼라의 산술연산: broadcasting
v + 2
#벡터와 벡터의 산술연산: 같은 위치의 요소끼리 연산
v1 <- c(1,3,5)
v2 <- c(2,3,4)

v1+v2 #벡터의 합

v1==v2 #벡터의 비교연산

#벡터 인덱싱 할때 TRUE,FALSE값으로 선택할 수 있다
V2
v2
v2[c(FALSE, TRUE, TRUE)]

v3 <- seq(1,100)
v3
#v3에서 3의배수만 추출
v3 %% 3 == 0
v3[v3 %%3 == 0] #3의 배수의 벡터

#행렬
#2차원 자료형, 내부 데이터는 벡터로 취급
#벡터의 특성과 함수를 그대로 사용할 수 있다
m1 <- matrix(1:10, ncol = 2) #2열짜리 매트릭스
m1
m2 <- matrix(1:10, ncol = 2, byrow = TRUE) #행 기준으로 먼저 값을 채움
m2
m3 <- matrix(1:10, nrow = 3) 
#순환법칙에 의해 부족분을 다시 처음부터의 데이터로 채운다
m3

#인덱싱:행 기준, 열 기준
m1
m1[3,2]
m1[3,2] == 8

#행 이름과 열 이름
rownames(m1)
colnames(m1)

rownames(m1) <- paste0("row", 1:5)
colnames(m1) <- paste("col", c(1,2), sep="")
m1

#행렬의 길이 
length(m1) #총 데이터의 길이
nrow(m1) #행렬의 행 개수
ncol(m1) #행렬의 열 개수
dim(m1) #행과 열의 개수를 함께 구할 수 있다
dim(m1)[1] #행
dim(m1)[2] #열

#슬라이싱
m1
m1[2:4, 2] #2~4행, 2열
m1[2:4, 1:2] #2~4행, 1~2열
m1[2:4,] #범위를 생략하면 해당 기준 전체를 의미
m1[2:4, 1:2] == m1[2:4,]

#행렬의 연산
x <- matrix(1:4, ncol = 2, byrow = FALSE)
y <- matrix(1:4, ncol = 2, byrow = TRUE)
x; y
#같은 위치에 있는 요소끼리 연산을 수행
x+y
x*y

#선형대수에서의 행렬 곱은 %*%를 사용
x %*% y

#행렬의 주요함수들
m1
m1.colsum <- colSums(m1) #컬럼방향의 합계 벡터
m1.colsum
m1.colsum[1] #1번 컬럼의 합계
m1.colmean <- colMeans(m1) #컬럼방향의 평균 벡터
m1.colmean

rowSums(m1) #행 방형의 합계벡터
rowMeans(m1) #행방향 평균 벡터

#행렬의 전치: 행렬의 행<->열을 변환
m1
m1.t <- t(m1) #행렬의 전치
m1.t

#매트릭스 연결: rbind,cbind
#rbind -> 두 매트릭스가 열 개수가 같아야 함
#cbind -> 두 매트릭스가 행 개수가 같아야 함
m3 <- matrix(1:4, ncol = 2)
m3
rbind(m1, m3) #새로은 행을 아래에 추가
cbind(m1, m3) #새로은 열을 아래에 추가->이 경우는 에러

#apply
#matrix의 각 행 혹은 각 열에 원하는 함수를 적용하여 결과를 반환
scores.matrix <- matrix(c(80,90,70,65,75,90,80,70,85), ncol = 3)
scores.matrix
#행을 기준으로 summary함수를 실행
apply(scores.matrix, 1, FUN=summary)
#열을 기준으로 summary함수를 실행
apply(scores.matrix, MARGIN=2, summary)

#Array: 3차원 데이터
#행, 열, 매트릭스
#원본 데이터는 벡터, dim을 이용 각 차원의 크기를 설정
arr <- array(1:18, dim = c(3,3,2))#3행 3열 2매트릭스
arr 

#배열의 naming
dimnames(arr)
arr.names.col <- paste0("COL", c(1,2,3))
arr.names.row <- paste0("ROW", 1:3)
arr.names.matrix <- paste0("MATRIX", c(1,2))
arr

dimnames(arr) <- list(arr.names.row, arr.names.col, arr.names.matrix)
arr

#생성시에 미리 name을 지정 할 수 있다
arr2 <- array(1:18, dim = c(3,3,2), dimnames = list(c("ROW1", "ROW2", "ROW3"), c("COL1", "COL2", "COL3"), c("MATRIX1", "MATRIX2")))
arr2

#배열의 차원 정보 확인
dim(arr)

#배열의 인덱싱: 행, 열, 매트릭스 (인덱스)
arr[2,2,2] #배열의 2행 2열 2번 매트릭스
arr[3,2,1] #배열의 3행 2열 1번 매트릭스

#슬라이싱: 행, 열, 매트릭스 (범위) , 범위 삭제시 해당 범위 전체
arr[2:3, 1:2, 1] #1번 매트릭스의 2~3행 1~2열
#특정 범위 제외시 음수 인덱스를 부여한다
arr[c(-2), c(1,3), 1] #1번 매트릭스에서 2행은 제외 1,3열만 포함

#범위를 생략하면 해당 방향 전체를 의미한다
arr[,,2] #2번 매트릭스 전체
arr[,,] #모두 생략되었으므로 배열 전체를 복제
arr[3,,1] #1번 매트릭스의 3행 전체

#apply: 배열에서 apply를 사용하려면 margin을 이용 방향 결정
#margin==1:행 방향
#margin==2:열 방향
#margin==3:각 매트릭스 전체

apply(arr, MARGIN=3, sum) #각 매트릭스에 sum함수 적용
apply(arr, MARGIN=2, sum)#열 방향으로 sum함수 적용
apply(arr, MARGIN=1, sum)#행 방향으로 sum함수 적용
