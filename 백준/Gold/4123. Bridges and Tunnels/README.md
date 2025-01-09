# [Gold IV] Bridges and Tunnels - 4123 

[문제 링크](https://www.acmicpc.net/problem/4123) 

### 성능 요약

메모리: 83240 KB, 시간: 136 ms

### 분류

데이크스트라, 그래프 이론, 최단 경로

### 제출 일자

2025년 1월 9일 22:47:53

### 문제 설명

<p>It may feel warm now, but in a few months, Waterloo will be full of snow. Luckily, many of the buildings on campus are connected by bridges and tunnels, so you do not need to go outside very much. The network of buildings can be confusing, and it is hard to know the best way to get from one building to another. A computer program could help.</p>

### 입력 

 <p>The first line of input contains three integers 0 < n <= 4000, 0 < m <= 40000, 0 < p <= 30, the number of buildings on campus, the number of (indoor or outdoor) paths between the buildings, and the number of trips that you would like to make. Buildings are numbered sequentially from 0 to n-1. Each of the next m lines describes a path between buildings with three integers and a letter. The first two integers specify the two buildings connected by the path. The path can be taken in either direction. The third integer specifies the number of seconds required to take the path from one building to the other. The number of seconds is at least 0 and at most one million. Finally, the letter is I if the path is indoors, or O if the path is outdoors. Each of the next p lines describes a trip from one building to another using two integers, the numbers of the two buildings.</p>

### 출력 

 <p>For each trip, find the optimal route between the specified two buildings. The optimal route minimizes the amount of time spent outside. Among routes that require spending the same amount of time outside, the optimal route minimizes the total time spent. For each trip, output a single line containing two integers, the time spent outside and the total time spent on the optimal route. If there is no route connecting the two specified buildings, output instead a line containing the word IMPOSSIBLE.</p>

