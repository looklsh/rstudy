#DataFrame
#만들기 : 여러개의 벡터 열로 연결된 형태, 각열은 변수로 작동
names <- c("홍길동","전우치","임꺽정","장길산")
height <- c(176,170,186,188)
weight <- c(74,65,88,90)

#각 변수 벡터의 길이 동일해야 함
thieves <- data.frame(names,height,weight)
thieves

#변수명의 사용
thieves$names
thieves['height']
thieves['weight']

#각 변수는 벡터이므로 벡터에서 사용했던 인덱싱, 슬라이싱 그대로 사용할 수 있다
thieves$height[2] #인덱싱
thieves$height[2:3] #슬라이싱

length(thieves) #컬럼의 개수
thieves
nrow(thieves)#총 관측치의 개수

#vector, Matrix에서 사용했던 통계함수도 그대로 사용
mean(thieves$height)
mean(thieves$weight)

colMeans(thieves) #통계함수 수행시에는 문자열 포함하면 안된다
colMeans(thieves[2:3])
colMeans(thieves[c("height", "weight")])
colMeans(thieves[c(-1)]) #1번 컬럼만 통계함수 적용 제외

#데이터 프레임 한번에 만들기
thieves <- data.frame(name=c("홍길동","전우치","임꺽정","장길산"),heights=c(176,170,186,188),weights=c(74,65,88,90))
thieves
#새로운 행의 연결: rbind
thief.new <- data.frame(name="일지매", heights=176, weights=63)
rbind(thieves, thief.new) #원본데이터 변결되지 않는다
thieves

#파생변수를 만들어봅시다
thieves$bmi <- thieves$weights / (thieves$heights / 100) ^ 2
#원본 데이터 프레임에 새 컬럼 추가된다
thieves

#cbind: 가로로 함치기(단순합치기)
bt <- data.frame(bloodtype=c("A","B","AB","O"))
#cbind의 경우 두 데이터 프레임의 행의 개수가 일치해야 한다
thieves <- cbind(thieves, bt)
thieves

#merge: 단순병합이 아니라 특정 컬럼을 기준으로 병합
footsizes <- data.frame(footsize = c(260,300,290,275), name=c("임꺽정","장길산","홍길동","전우치"))
#단순병합(cbind)
cbind(thieves, footsizes)
#특정 컬럼을 기준으로 병합(merge) by
merge(thieves, footsizes, by="name") #by 파라미터로 병합할 컬럼 지정

#List: 범용 자료형
#모든 데이터 타입을 제약 없이 담을 수 있다
lst <- list(name = "홍길동", #문자열 
            physical = c(176,64), #벡터 
            scores = data.frame(intellect=95, health=90) #데이터 프레임
            )
lst

#리스트 안에 담긴 객체의 수
length(lst)
str(lst) #구조의 확인

#리스트의 원소 뽑아오기
#[]->리턴값이 list, [[]]->내부 데이터 그 자체
lst['name']
is(lst)
lst[['name']]
is(lst[['name']])

lst['physical'][1] #이상태로는 내부 데이터에 접근할 수 없다
lst[['physical']][1] # 이 상태가 되어야 내부 데이터에 접근

#lapply:리스트의 여러요소에 함수를 적용하기 위한 함수
v1 <- 10:30
v2 <- 50:70

lst2 <- list(v1,v2)
lst2

lapply(lst2, median) #결과물 list로 반환한다
sapply(lst2, median) #결과물 vector로 반환한다
is(sapply(lst2, median))
sapply(lst2, median, simplify = FALSE)
#sapply 적용결과를 내부데이터와 동일한 타입으로 반환

#factor
#질적 데이터(명목형 변수, 순서형 변수를 다루는 자료형)
var1 <- c(1,2,3,2,1)
var1
var2 <- factor(c(1,2,3,2,1))
var2 #하단의 levels확인(범주)

#확인
is.factor(var1) #var1은 범주형인가
is.factor(var2) #var2는 범주형인가

#범주형은 산숭연산이 불가
var2 * 2 #error
# 범주형이 아닌 변수도 as.factor()로 범주형으로 변환할 수 있다
var3 <- as.factor(var1)
is.factor(var3)
var3

#범주 구성의 확인: levels
levels(var3)

sizes <- factor(c("medium","small","large","huge","small"))
sizes

#levels()함수 이용, factor의 표시순서를 바꿀 수 있다
#factor형 변수는 순서가 없기 때문에 표시 순서만 바뀔 뿐이다
levels(sizes) <- c("small","medium","large","huge")
sizes

#단순 순서만 바뀌는 게 아니라 매칭되는 값도 함께 바뀐다
#레벨 조정이 필요할 경우 그냥 다시 factor로 level을 지정합시다
#그냥 이렇게
sizes <- factor(sizes, levels = c("small","medium","large","huge"))
sizes
sizes > "medium"



#Ordered Factor: 순서가 있는 명목형 변수
sizes <- ordered(c("medium","small","large","huge","small"), levels = c("small","medium","large","huge"))
sizes
levels(sizes)

#ordered factor는 순서가 있으므로 대소 비교를 할 수 있다
sizes > "medium"
#내부 데이터 중에서 medium보다 큰 데이터 추출
sizes[sizes > "medium"]
