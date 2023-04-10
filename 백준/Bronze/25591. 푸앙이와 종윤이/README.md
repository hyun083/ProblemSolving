# [Bronze IV] 푸앙이와 종윤이 - 25591 

[문제 링크](https://www.acmicpc.net/problem/25591) 

### 성능 요약

메모리: 79512 KB, 시간: 12 ms

### 분류

수학, 구현, 사칙연산

### 문제 설명

<p>푸앙이의 친구 종윤이는 수학, 과학이 굉장히 발전한 곳 중 하나인 인도에 진심이다. 한국에선 구구단을 배우지만 인도에서는 19단까지 배운다고 한다. 어떻게 두 자릿수 곱셈을 빠르게 암산하는 것일까? 푸앙이는 인도 마니아 종윤이한테 인도의 베다수학 곱셈법을 배워보기로 했다.</p>

<p style="text-align: center;"><img alt="인도 베다수학 곱셈법 예시 그림" src="" style="width: 813px; height: 500px;"></p>

<p style="text-align: center;"><인도 베다수학 곱셈법 예시 그림></p>

<p>$97×96$을 계산해보자. 각 수를 $100$에서 빼준 값을 $a$, $b$라고 하면 $$\begin{align}a=100-97=3\\b=100-96=4\end{align}$$ 그리고 $c$, $d$를 다음과 같이 정의하고 구한다. $$\begin{align}c&=100-(a+b)=100-7=93\\d&=a×b=3×4=12\end{align}$$ $c$는 곱셈 결괏값의 <span data-darkreader-inline-color="" style="color: rgb(211, 84, 0); --darkreader-inline-color:#ff8738;"><span style="">앞의 두 자릿수</span></span>, $d$는 <span data-darkreader-inline-color="" style="color: rgb(52, 152, 219); --darkreader-inline-color:#46a1de;"><span style="">뒤의 두 자릿수</span></span>에 해당한다.</p>

<p>$a$, $b$가 작을 때는 위와 같은 계산으로 끝나지만 그렇지 않은 경우도 존재한다. 만약 $d$가 두 자릿수를 넘어버린다면 다시 여기서 하위 두 자릿수만 취하고, 초과 자릿수들의 값은 $c$에 더해주면 된다. 다시 말해서, $d$를 $100$으로 나눈 몫과 나머지를 각각 $q$, $r$이라고 했을 때 $c+q$를 <span data-darkreader-inline-color="" style="color: rgb(211, 84, 0); --darkreader-inline-color:#ff8738;"><span style="">앞의 두 자릿수</span></span>, $r$을 <span data-darkreader-inline-color="" style="color: rgb(52, 152, 219); --darkreader-inline-color:#46a1de;"><span style="">뒤의 두 자릿수</span></span>로 결정한다.</p>

<p>푸앙이도 인도에 흥미가 생겼지만, 수학은 머리가 아프다. 푸앙이를 위해서 두 수가 들어왔을 때 인도의 베다수학 곱셈법을 자동으로 계산해주는 프로그램을 만들어주자.</p>

### 입력 

 <p>한 줄에 양의 정수가 $2$개 주어진다. 이 정수들은 $10$ 이상 $100$ 미만의 두 자릿수다.</p>

### 출력 

 <p>베다수학 곱셈법을 쓰는 과정에서 구하는 $a$, $b$, $c$, $d$, $q$, $r$을 첫 줄에 공백으로 구분해서 출력한다. 둘째 줄에 곱셈 결과의 <span data-darkreader-inline-color="" style="color: rgb(211, 84, 0); --darkreader-inline-color:#ff8738;"><span style="">앞의 두 자릿수</span></span>, <span data-darkreader-inline-color="" style="color: rgb(52, 152, 219); --darkreader-inline-color:#46a1de;"><span style="">뒤의 두 자릿수</span></span>를 공백으로 구분해서 출력한다. 만약 이 수들의 십의 자리가 $0$이라면 일의 자리만 출력한다.</p>

