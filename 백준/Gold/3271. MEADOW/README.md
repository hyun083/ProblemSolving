# [Gold III] MEADOW - 3271 

[문제 링크](https://www.acmicpc.net/problem/3271) 

### 성능 요약

메모리: 154872 KB, 시간: 388 ms

### 분류

기하학, 그래프 이론, 그리디 알고리즘, 최소 스패닝 트리, 피타고라스 정리

### 제출 일자

2024년 5월 26일 17:18:08

### 문제 설명

<p>As you have probably guessed, we are talking about an ordinary meadow with lot of flowers scattered all around it. Flying between them, landing on them and taking off from them are numerous industrious bees, collecting raw material known as pollen used to produce honey in their hives. Since lives and prosperity of the bee community depends heavily on it, every flower needs to be visited to collect as much pollen as possible.</p>

<p>Maya is the bee who has to make a scheduling list according to which the bees will visit all the flowers on the meadow. A scheduling list consists of several sets of flowers (their positions, actually). Each bee is given one set and it has to visit all the flowers from it in an arbitrary order. Each flower can be visited arbitrary many times. The weight of a sequence of flowers is the largest distance between two successive flowers in the sequence. The weight of a set of flowers is the minimal weight of all sequences of flowers from the set. A bee with given set of flowers will always plan its flight according to the sequence of all flowers from the set with minimal weight. The weight of a scheduling list is the maximal weight of all sets in the scheduling list.</p>

<p>Write a program that will help Maya to find a scheduling list with the lowest weight.</p>

### 입력 

 <p>The first lline of the input file consists of two natural numbers F and B; 1 ≤ F ≤ 2000, 1 ≤ B ≤ F, F is the number of flowers in the meadow and B is the number of bees available for collecting pollen.</p>

<p>Each of the next C lines contains two natural numbers X and Y, 1 ≤ X,Y ≤ 10000, the coordinates of a flower.</p>

### 출력 

 <p>The first and only line of the output file should contain the minimal possible weight of a scheduling list for the data given in the input file as described above. The result should be rounded to two decimal places. The result may differ from the correct solution by not more than 0.01.</p>

