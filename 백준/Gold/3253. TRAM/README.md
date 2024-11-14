# [Gold V] TRAM - 3253 

[문제 링크](https://www.acmicpc.net/problem/3253) 

### 성능 요약

메모리: 79516 KB, 시간: 8 ms

### 분류

0-1 너비 우선 탐색, 데이크스트라, 그래프 이론, 그래프 탐색, 최단 경로

### 제출 일자

2024년 11월 14일 19:54:42

### 문제 설명

<p>Tram network in Zagreb consists of a number of intersections and rails connecting some of them. In every intersection there is a switch pointing to the one of the rails going out of the intersection. When the tram enters the intersection it can leave only in the direction the switch is pointing. If the driver wants to go some other way, he/she has to manually change the switch.</p>

<p>When a driver has do drive from intersection A to the intersection B he/she tries to choose the route that will minimize the number of times he/she will have to change the switches manually.</p>

<p>Write a program that will calculate the minimal number of switch changes necessary to travel from intersection A to intersection B.</p>

### 입력 

 <p>The first line of the input file contains integers N, A and B, separated by a single blank character, 2 ≤ N ≤ 100, 1 ≤ A, B ≤ N, N is the number of intersections in the network, and intersections are numbered from 1 to N.</p>

<p>Each of the following N lines contain a sequence of integers separated by a single blank character. First number in the i-th line, Ki (0 ≤ Ki ≤ N-1), represents the number of rails going out of the i-th intersection. Next Ki numbers represents the intersections directly connected to the i-th intersection. Switch in the i-th intersection is initially pointing in the direction of the first intersection listed.</p>

### 출력 

 <p>The first and only line of the output file should contain the target minimal number. If there is no route from A to B the line should contain the integer ‘-1’.</p>

