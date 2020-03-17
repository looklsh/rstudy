#주석: 인터프리터가 해석하지 않는다

#산술연산: +-*/
#제곱:^,**
7^5
# 두개의 ㅇ상의 명령을 한꺼번에 샐행할경우만 ;필요
7^5;7**5

#나눗셈의 몫과 나머지
#몫: %/% ,나머지 %%
7%/%5 #몫
7%%5 #나머지

#비교연산: <, <=, >, >=, ==, !=
#논리값: true or false -> T OR F 줄여쓸 수 있다
7==5 # equal
7!=5 #not equal

#논리 연산: |, (OR), &(AND), !(NOT)
#OR연산->둘 중에 하나면 참이면 참
7>5 | 8<7
7>5 & 8<7 #AND연선->둘 다 참이어야 참참

(7>5 | 8<7) == TRUE
(7>5 | 8<7) == T #줄여쓸 수 있다

#객체
#객체 생성: 할당 방향에 따라서 <-, >-사용 가능
#명명 규칙: 문자,숫자, _, . 을 조합하여 사용
#           대소문자구분, 숫자로 시작할 수 없다
eng <- 90
80 -> math

#일반 프로그래밍 언어와 같이 = 할당 연산자도 사용할 수 있다
total = eng + math

#객체의 목록 보기: ls()
ls()
#객체의 삭제: rm()
rm(total)
ls()

#total이라는 객체가 우리 메모리 상에 있는가
"total" %in% ls()

#vector
# :동일 타입의 데이터를 묶은 1차원 데이터
v1 <- c(2,4,6,8,10) #기본적인 벡터 생성법
v1

v2 <- 1:10 #시작값:끝값값
v2

v3 <- seq(1,10) #seq함수수
v3

v4 <- seq(1,10,by=2) #1부터 10까지 2간격으로 생성성
v4

v5 <- seq(from=2, to=10, by=2) #파라미터를 이용해서 각 속성을 지정할 수 있다
v5

v6 <- seq(1,100, length.out = 12) #균등분할할
v6

#객체(벡터의 길이를 구하려면 length함수
length(v6)

#벡터는 단일 자료형을 다룬다
#여러 형태가 섞여 있ㄹ 경우 한가지 형태로 변환
v7 <- c(1,2,"3",4,5) #문자열이 섞여 있을 경우 문자열로 변환
v7
c(1,2, TRUE, FALSE, 5)

#기본 자료형
#float(numeric)
n <- 3.14159
n


#integer:뒤에 L을 부여
i = 314L
i

#complex:복소수 : 실수부+허수부
cpx = 2+3i
cpx

#문자형: ""
s <- "r programming"
s

#Date 날짜형: 문자형처럼 취급죄지만 Date형으로 변환 될 수 있다
d <- "2019-11-11"
d

v <- c(1,2,3,4,5)
#객체 확인 is()함수로 확인
is(v)
i
is(i) #값이 1개여도 r은 벡터로 처리한다

#is계열 함수: 세부적으로 데이터 타입 확인
is.numeric(v)
is.vector(v)
is.integer(v) #정수 형태로 되어 있어도 기본적으로는 float로 처리

#객체의 데이터를 변환: as 계열 함수
v
v <- as.integer(v)
v
is(v)
is.integer(v) #integer

#특수 데이터 타입들: NA(결측치), NaN(NOT A NUMBER), Inf
#NA: 결측치
scores <- c(90,80,100,NA,75)
#NA, NaN, Inf 데이터에 포함되어 있으면 통계치가 왜곡되거나 에러 발생가능
# -> 적절하게 처리 후 데이터를 분석해야 한다
is(scores)
is.na(scores)#결측치 포함여부 확인
is(na)
is(NA)
length(NA)

#NA와 NULL의 비교
is(NULL)
is.null(scores)
is.null(NULL)
length(NULL) #NA와는 다르게 NULL은 메모리 공간자체를 점유하지 않는다

#fINITE와 Infinite
is.finite(v) #유한수 여부 확인

div <- 4/0
div

is.infinite(div)#무한수인가 여부 확인

#NaN :수학적으로 불가능한 수 
1/0 #Inf
1/0 + 1/0 #Inf
1/0 - 1/0 #NaN

# 도움말(help)
help(seq)
?seq

#내장 수치함수
scores <- c(90,80,70,95,100)
scores

mean(scores)#산술평균
sum(scores)#함산함수

mean(scores) == sum(scores)/length(scores)
median(scores) #중앙값
min(scores); max(scores) #최솟값, 최댓값값

scores2 <- c(90,80,70,NA,100)
is.na(scores2)

mean(scores2)
#결측치가 포함된 벡터의 산술계산은 NA로 출력

#샘플링 함수(표본 추출출)
data = 1:45
data
#추출 size, 복원여부 replace설정 할 수 있다
sample(data, size = 10, replace = F) #복원 안했으니 중복 추출 안될것
sample(data, size = 10, replace = T) #중복 추출 허용

#문자열
#기본적인 출력함수: print
print("Hello")

#문자열 합치기: paste함수
paste("Hello", "R", "Programming")#기본적으로 공백문자 기준으로 합침
paste("Hello", "R", "Programming", sep = ",") # ,기준으로 합치기

paste("A", c(1,2,3,4,5))
paste("A", c(1,2,3,4,5), sep = "")

#sep가 없는 paste는 paste0로 별도 구분되어있다
paste0("A", c(1,2,3,4,5))

#수치 함수
pi #R의 내장객체
round(pi) #소숫점 1자리에서 반올림
round(3.678)
round(3.678, 2)

ceiling(3.678); floor(3.678) #올림, 버림

#사용자 정의 함수
stat <- function(x){
  #벡터로 return하면 여러값을 동시에 반환 할 수 있다
  return(c(min(x), max(x), sum(x), mean(x), median(x)))
}

scores
summary <- stat(scores)
summary

#패키지:  필요할 때 기능을 추가
# 패키지 설치하고 로드하면 추가된 기능을 손쉽게 사용

#설치된 패키지 확인
installed.packages()
#패키징,; 도음말 확인
library(help="base")

#패키지 설치: install.pakages()
install.packages("ggplot2")
#패키지 업데이트: update.pakages()
update.packages("ggplot2")

#라이브러리 불러오기
library("ggplot2")
x <- c("a", "b", "c", "d", "c", "b", "a")
qplot(x) #ggplot2의 퀵플롯 함수 사용할 수 있게된다

#조건분기
#if ~ elseif ~ else
x <- 10L
#객체가 양수인지,음수인지 0인지 판별하는 함수
check_positive <- function(x){
  if(x>0){
    print("x는 양수입니다")
  }else if(x<0){
    print("x는 음수입니다")
  }else{
    print("x는 0입니다")
  }
}
check_positive(x)
check_positive(0)
check_positive(-10L)

#switch: 객체의 값으로 분기
test_switch <- function(x){
  res <- switch (x,
                    "1번째 조건",
                    "2번째 조건",
                    "3번째 조건") # default는 없다
  return(res)
}

test_switch(1)
test_switch(2)
test_switch(3)
test_switch(4)

#ifelse(조건,참일때의 반환값,거짓일때 반환값)
#R에서 가장 널리 활용되는 조건절
#ifelse문으로 양수 음수 0판별 함수
test_ifelse <- function(x){
  #결과 문자열 조합
  paste("x는", ifelse(x>0, "양수입니다",
                     ifelse(x == 0, "0입니다","음수입니다"
                          )))
}
test_ifelse(10)
test_ifelse(0)
test_ifelse(-10)

#반복문
#repeat: 최소 1회는 실행
#         중단 로직은 직접 작성해야 한다
test_repeat <- function(to=9){ #9는 to의 기본값
  #1부터 to 까지 반복하면서 값을 출력
  cnt <- 1
  
  repeat{
    print(cnt)
    cnt <- cnt + 1
    
    if(cnt > to){
      break
    }
  }
}
test_repeat(5)#1~5까지
test_repeat() #t는 기본값 9가 있으므로 생략 가능
test_repeat(to=1) #repeat는 최소 1회는 수행

#while문: 특정 조건을 만족하는 종안 반복
test_while <- function(to=10){
  cnt <- 1
  #조건에 따라 단 1번도 실행되지 않을 수도 있다
  while(cnt < to){
    print(cnt)
    cnt <- cnt + 1
  }
}
test_while(to=5)
test_while() #to는 기본값이 있으므로 생략 가능
test_while(1) #while은 조건에 따라 실행되지 않을 수 있다

#for(객체 in 벡터):반복 위한 인덱스 변수는 없다
test_for <- function(){
  nums <- c(2,3,4,5,6,7,8,9)
  for(num in nums){
    print(num)
  }
}
test_for()

#구구단 만들기
test_gugu <- function(){
  #단 수 돌리기
  dans <- seq(2,9)
  for(dan in dans){
    print(paste0(dan,"단"))
    
    for(num in 1:9){
      print(paste(dan,"*", num, "=", dan * num))
    }
  }
}
test_gugu()
