# [Gold III] Underground Cables - 4100 

[문제 링크](https://www.acmicpc.net/problem/4100) 

### 성능 요약

메모리: 104136 KB, 시간: 216 ms

### 분류

그래프 이론, 최소 스패닝 트리

### 제출 일자

2024년 5월 27일 20:45:26

### 문제 설명

<p>A city wants to get rid of their unsightly power poles by moving their power cables underground. They have a list of points that all need to be connected, but they have some limitations. Their tunneling equipment can only move in straight lines between points. They only have room for one underground cable at any location except at the given points, so no two cables can cross.</p>

<p>Given a list of points, what is the least amount of cable necessary to make sure that every pair of points is connected, either directly, or indirectly through other points?</p>

### 입력 

 <p>There will be several test cases in the input. Each test case will begin with an integer N (2 ≤ N ≤ 1,000), which is the number of points in the city. On each of the next N lines will be two integers, X and Y (-1,000 ≤ X,Y ≤ 1,000), which are the (X,Y) locations of the N points. Within a test case, all points will be distinct. The input will end with a line with a single 0.</p>

### 출력 

 <p>For each test case, output a single real number, representing the least amount of cable the city will need to connect all of its points. Print this number with exactly two decimal places, rounded. Print each number on its own line with no spaces. Do not print any blank lines between answers.</p>

