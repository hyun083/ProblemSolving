# [Silver V] 성적표 - 14721 

[문제 링크](https://www.acmicpc.net/problem/14721) 

### 성능 요약

메모리: 79516 KB, 시간: 12 ms

### 분류

브루트포스 알고리즘

### 제출 일자

2025년 11월 8일 15:14:37

### 문제 설명

<p>동하는 이번 학기에도 F 학점을 받아 학사경고를 받았다. 더 이상 학사경고를 받지 않기 위해 동하는 공부를 하기로 결심했다.</p>

<p>동하는 공부를 얼만큼 하면 얼만큼 성적이 나오는지 궁금했다. 그래서 동하는 N명의 학생들에 대해 공부시간과 그에 따른 시험점수를 조사했다.</p>

<p>동하는 i번째 학생은 x<sub>i</sub>시간의 공부를 했고, y<sub>i</sub>점의 점수를 받았다는 사실을 알았다.</p>

<p>이 데이터로부터 공부를 x시간 했으면 시험 성적은 f(x) = ax + b일 것이라고 추정하려 한다. 동하를 위해 a와 b를 구해주자.</p>

<p style="text-align:center"><img alt="" src="https://onlinejudgeimages.s3-ap-northeast-1.amazonaws.com/problem/14721/1.png" style="height:262px; width:397px"></p>

<p>공부시간에 따른 시험성적을 예측하는 함수 f(x)는, 데이터 (x<sub>i</sub>, y<sub>i</sub>)에 대해, f(x<sub>i</sub>)와 y<sub>i</sub>의 차가 작아야 할 것이다. (I = 1, 2, 3, …, N)</p>

<p>이 개념을 수학적으로 형식화한 것이 RSS(Residual Sum of Squares)이다. RSS가 작으면 예측모형이 데이터에 잘 맞는 것이라고 할 수 있다.</p>

<p style="text-align:center"><mjx-container class="MathJax" jax="CHTML" display="true" style="font-size: 109%; position: relative;"> <mjx-math display="true" class="MJX-TEX" aria-hidden="true" style="margin-left: 0px; margin-right: 0px;"><mjx-mtext class="mjx-n"><mjx-c class="mjx-c52"></mjx-c><mjx-c class="mjx-c53"></mjx-c><mjx-c class="mjx-c53"></mjx-c></mjx-mtext><mjx-mo class="mjx-n" space="4"><mjx-c class="mjx-c3D"></mjx-c></mjx-mo><mjx-munderover space="4"><mjx-over style="padding-bottom: 0.192em; padding-left: 0.51em;"><mjx-texatom size="s" texclass="ORD"><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D45B TEX-I"></mjx-c></mjx-mi></mjx-texatom></mjx-over><mjx-box><mjx-munder><mjx-row><mjx-base><mjx-mo class="mjx-lop"><mjx-c class="mjx-c2211 TEX-S2"></mjx-c></mjx-mo></mjx-base></mjx-row><mjx-row><mjx-under style="padding-top: 0.167em; padding-left: 0.148em;"><mjx-texatom size="s" texclass="ORD"><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D456 TEX-I"></mjx-c></mjx-mi><mjx-mo class="mjx-n"><mjx-c class="mjx-c3D"></mjx-c></mjx-mo><mjx-mn class="mjx-n"><mjx-c class="mjx-c31"></mjx-c></mjx-mn></mjx-texatom></mjx-under></mjx-row></mjx-munder></mjx-box></mjx-munderover><mjx-texatom space="2" texclass="ORD"><mjx-mo class="mjx-n"><mjx-c class="mjx-c28"></mjx-c></mjx-mo><mjx-msub><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D466 TEX-I"></mjx-c></mjx-mi><mjx-script style="vertical-align: -0.15em;"><mjx-mi class="mjx-i" size="s"><mjx-c class="mjx-c1D456 TEX-I"></mjx-c></mjx-mi></mjx-script></mjx-msub><mjx-mo class="mjx-n" space="3"><mjx-c class="mjx-c2212"></mjx-c></mjx-mo><mjx-mi class="mjx-i" space="3"><mjx-c class="mjx-c1D453 TEX-I"></mjx-c></mjx-mi><mjx-mo class="mjx-n"><mjx-c class="mjx-c28"></mjx-c></mjx-mo><mjx-msub><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D465 TEX-I"></mjx-c></mjx-mi><mjx-script style="vertical-align: -0.15em;"><mjx-mi class="mjx-i" size="s"><mjx-c class="mjx-c1D456 TEX-I"></mjx-c></mjx-mi></mjx-script></mjx-msub><mjx-mo class="mjx-n"><mjx-c class="mjx-c29"></mjx-c></mjx-mo><mjx-msup><mjx-mo class="mjx-n"><mjx-c class="mjx-c29"></mjx-c></mjx-mo><mjx-script style="vertical-align: 0.413em;"><mjx-mn class="mjx-n" size="s"><mjx-c class="mjx-c32"></mjx-c></mjx-mn></mjx-script></mjx-msup></mjx-texatom></mjx-math><mjx-assistive-mml unselectable="on" display="block"><math xmlns="http://www.w3.org/1998/Math/MathML" display="block"><mtext>RSS</mtext><mo>=</mo><munderover><mo data-mjx-texclass="OP">∑</mo><mrow data-mjx-texclass="ORD"><mi>i</mi><mo>=</mo><mn>1</mn></mrow><mrow data-mjx-texclass="ORD"><mi>n</mi></mrow></munderover><mrow data-mjx-texclass="ORD"><mo stretchy="false">(</mo><msub><mi>y</mi><mi>i</mi></msub><mo>−</mo><mi>f</mi><mo stretchy="false">(</mo><msub><mi>x</mi><mi>i</mi></msub><mo stretchy="false">)</mo><msup><mo stretchy="false">)</mo><mn>2</mn></msup></mrow></math></mjx-assistive-mml><span aria-hidden="true" class="no-mathjax mjx-copytext">\[\text{RSS} = \sum_{i=1}^{n}{(y_i - f(x_i))^2}\]</span> </mjx-container></p>

<p>100이하의 모든 양의 정수 a와 b중, RSS를 최소화하는 a와 b를 구하여라. 오버플로우에 주의하여라.</p>

### 입력 

 <p>첫 번째 줄에는 데이터의 수 N이 주어진다. (2 ≤ N ≤ 100)</p>

<p>두 번째 줄부터 N+1 번째 줄까지, 각 줄에는 i번 학생의 공부시간 x<sub>i</sub>와 시험점수 y<sub>i</sub>가 순서대로 주어진다. (1 ≤ x<sub>i</sub>, y<sub>i</sub> ≤ 1000, x<sub>i</sub>와 y<sub>i</sub>는 정수)</p>

### 출력 

 <p>RSS가 최소인 a와 b를 한 줄에 공백으로 구분하여 출력하여라.</p>

<p>RSS가 최소인 쌍 (a, b)가 여러 개인 경우는 입력으로 주어지지 않는다.</p>

