# [Silver V] 효정과 새 모니터 - 20949 

[문제 링크](https://www.acmicpc.net/problem/20949) 

### 성능 요약

메모리: 79516 KB, 시간: 12 ms

### 분류

정렬

### 제출 일자

2025년 2월 15일 20:00:44

### 문제 설명

<p>효정은 새해를 맞이하여 새 모니터를 구매하고자 한다. 효정은 돈이 많기 때문에 77인치 모니터를 구매할 것이다. 모니터를 구경하던 효정은 놀라 자빠질 수밖에 없었다. 모니터가 너무 많아 고를 수가 없었기 때문이다. 이왕이면 고해상도가 좋은 법, 효정은 PPI가 가장 높은 모니터를 구매할 것이다. 우선 효정은 PPI가 높은 순으로 모니터들을 정렬하기로 결심하였다.</p>

<p>PPI는 Pixels Per Inch의 약자로 인치당 몇 개의 픽셀이 존재하는지를 수치로 표현한 것이다. PPI는 다음과 같이 계산할 수 있다.</p>

<p><mjx-container class="MathJax" jax="CHTML" display="true" style="font-size: 109%; position: relative;"> <mjx-math display="true" class="MJX-TEX" aria-hidden="true" style="margin-left: 0px; margin-right: 0px;"><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D443 TEX-I"></mjx-c></mjx-mi><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D443 TEX-I"></mjx-c></mjx-mi><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D43C TEX-I"></mjx-c></mjx-mi><mjx-mo class="mjx-n" space="4"><mjx-c class="mjx-c3D"></mjx-c></mjx-mo><mjx-mfrac space="4"><mjx-frac type="d"><mjx-num><mjx-nstrut type="d"></mjx-nstrut><mjx-msqrt><mjx-sqrt><mjx-surd><mjx-mo class="mjx-n"><mjx-c class="mjx-c221A"></mjx-c></mjx-mo></mjx-surd><mjx-box style="padding-top: 0.087em;"><mjx-msup><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D44A TEX-I"></mjx-c></mjx-mi><mjx-script style="vertical-align: 0.289em; margin-left: 0.055em;"><mjx-mn class="mjx-n" size="s"><mjx-c class="mjx-c32"></mjx-c></mjx-mn></mjx-script></mjx-msup><mjx-mo class="mjx-n" space="3"><mjx-c class="mjx-c2B"></mjx-c></mjx-mo><mjx-msup space="3"><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D43B TEX-I"></mjx-c></mjx-mi><mjx-script style="vertical-align: 0.289em; margin-left: 0.053em;"><mjx-mn class="mjx-n" size="s"><mjx-c class="mjx-c32"></mjx-c></mjx-mn></mjx-script></mjx-msup></mjx-box></mjx-sqrt></mjx-msqrt></mjx-num><mjx-dbox><mjx-dtable><mjx-line type="d"></mjx-line><mjx-row><mjx-den><mjx-dstrut type="d"></mjx-dstrut><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D437 TEX-I"></mjx-c></mjx-mi></mjx-den></mjx-row></mjx-dtable></mjx-dbox></mjx-frac></mjx-mfrac></mjx-math><mjx-assistive-mml unselectable="on" display="block"><math xmlns="http://www.w3.org/1998/Math/MathML" display="block"><mi>P</mi><mi>P</mi><mi>I</mi><mo>=</mo><mfrac><msqrt><msup><mi>W</mi><mn>2</mn></msup><mo>+</mo><msup><mi>H</mi><mn>2</mn></msup></msqrt><mi>D</mi></mfrac></math></mjx-assistive-mml><span aria-hidden="true" class="no-mathjax mjx-copytext">$$PPI=\frac{\sqrt{W^2+H^2}}{D}$$</span> </mjx-container></p>

<p>여기서 W는 가로 픽셀 수, H는 세로 픽셀 수, D는 대각선의 길이(인치)이다. 예를 들어, Full HD 해상도는 가로 픽셀 수가 1920, 세로 픽셀 수가 1080이다. 따라서 24인치 Full HD 모니터의 PPI는 다음과 같다.</p>

<p><mjx-container class="MathJax" jax="CHTML" display="true" style="font-size: 109%; position: relative;"> <mjx-math display="true" class="MJX-TEX" aria-hidden="true" style="margin-left: 0px; margin-right: 0px;"><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D443 TEX-I"></mjx-c></mjx-mi><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D443 TEX-I"></mjx-c></mjx-mi><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D43C TEX-I"></mjx-c></mjx-mi><mjx-mo class="mjx-n" space="4"><mjx-c class="mjx-c3D"></mjx-c></mjx-mo><mjx-mfrac space="4"><mjx-frac type="d"><mjx-num><mjx-nstrut type="d"></mjx-nstrut><mjx-msqrt><mjx-sqrt><mjx-surd><mjx-mo class="mjx-sop"><mjx-c class="mjx-c221A TEX-S1"></mjx-c></mjx-mo></mjx-surd><mjx-box style="padding-top: 0.135em;"><mjx-msup><mjx-mn class="mjx-n"><mjx-c class="mjx-c31"></mjx-c><mjx-c class="mjx-c39"></mjx-c><mjx-c class="mjx-c32"></mjx-c><mjx-c class="mjx-c30"></mjx-c></mjx-mn><mjx-script style="vertical-align: 0.393em;"><mjx-mn class="mjx-n" size="s"><mjx-c class="mjx-c32"></mjx-c></mjx-mn></mjx-script></mjx-msup><mjx-mo class="mjx-n" space="3"><mjx-c class="mjx-c2B"></mjx-c></mjx-mo><mjx-msup space="3"><mjx-mn class="mjx-n"><mjx-c class="mjx-c31"></mjx-c><mjx-c class="mjx-c30"></mjx-c><mjx-c class="mjx-c38"></mjx-c><mjx-c class="mjx-c30"></mjx-c></mjx-mn><mjx-script style="vertical-align: 0.393em;"><mjx-mn class="mjx-n" size="s"><mjx-c class="mjx-c32"></mjx-c></mjx-mn></mjx-script></mjx-msup></mjx-box></mjx-sqrt></mjx-msqrt></mjx-num><mjx-dbox><mjx-dtable><mjx-line type="d"></mjx-line><mjx-row><mjx-den><mjx-dstrut type="d"></mjx-dstrut><mjx-mn class="mjx-n"><mjx-c class="mjx-c32"></mjx-c><mjx-c class="mjx-c34"></mjx-c></mjx-mn></mjx-den></mjx-row></mjx-dtable></mjx-dbox></mjx-frac></mjx-mfrac></mjx-math><mjx-assistive-mml unselectable="on" display="block"><math xmlns="http://www.w3.org/1998/Math/MathML" display="block"><mi>P</mi><mi>P</mi><mi>I</mi><mo>=</mo><mfrac><msqrt><msup><mn>1920</mn><mn>2</mn></msup><mo>+</mo><msup><mn>1080</mn><mn>2</mn></msup></msqrt><mn>24</mn></mfrac></math></mjx-assistive-mml><span aria-hidden="true" class="no-mathjax mjx-copytext">$$PPI=\frac{\sqrt{1920^2+1080^2}}{24}$$</span> </mjx-container></p>

<p>N개의 모니터가 주어졌을 때, PPI가 높은 순으로 모니터들을 정렬하는 프로그램을 작성하시오. 모든 모니터의 크기는 77인치로 동일하다.</p>

### 입력 

 <p>첫 번째 줄에 모니터의 개수 N이 주어진다.</p>

<p>이후 N개의 줄 중 i(1 ≤ i ≤ N)번째 줄에는 i번 모니터의 가로 픽셀 수 W<sub>i</sub>와 세로 픽셀 수 H<sub>i</sub>가 주어진다.</p>

<p>모든 입력은 정수이며 공백으로 구분되어 주어진다.</p>

### 출력 

 <p>N개의 줄에 걸쳐 모니터의 번호를 PPI가 높은 순으로 한 줄에 하나씩 출력한다.</p>

<p>PPI가 동일한 경우 번호가 더 작은 모니터를 먼저 출력한다.</p>

