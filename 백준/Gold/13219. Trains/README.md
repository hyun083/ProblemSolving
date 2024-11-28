# [Gold V] Trains - 13219 

[문제 링크](https://www.acmicpc.net/problem/13219) 

### 성능 요약

메모리: 82304 KB, 시간: 252 ms

### 분류

데이크스트라, 그래프 이론, 그래프 탐색, 최단 경로

### 제출 일자

2024년 11월 28일 23:17:31

### 문제 설명

<p>MRT Corp has recently hired you, one of the most talented programmers in the country, to assist in building MRT tracks in the country.</p>

<p>To begin with, you are given a square grid map of size N x N​, detailing the number of people, C residing in each grid segment. Since constructing your tracks would require all inhabitants of the utilised land to relocate, you are to decide on a potential railway connecting train stations A​ and B​, with the coordinates (A​<sub>x</sub>​, A<sub>y</sub>​) and (B<sub>x</sub>​, B<sub>y</sub>​) respectively, such that the number of people forced to relocate are kept to a minimum and output that number. Do note that there may be certain areas in which you cannot build your train tracks (e.g. unstable land, hills etc.).</p>

<p>You are also reminded that you cannot build diagonal train tracks and only build in the 4 main directions (e.g. left, right, up, down).</p>

### 입력 

 <p>Line 1: An integer N​, the length of the square grid of the map. (2 ≤ N​≤ 400)</p>

<p>Line 2: Four integers A​<sub>x</sub>​, A<sub>y</sub>​, B<sub>x</sub> ​and B<sub>y</sub> ​which signifies the x and y-coordinates (from top-left to bottom-right) of the two stations A and B. You will be guaranteed that the two train stations will be situated at distinct locations. (1 ≤ A​<sub>x</sub>, A<sub>y</sub>, B<sub>x</sub>, B<sub>y</sub> ≤ N)</p>

<p>Line 3 to (N+​2): N​integers with a value, C​ each detailing the number of inhabitants of a particular area and separated by spaces. Areas in which you are not allowed to build train tracks on will be given a value of -1. (-1 ≤ C​≤ 1,000,000)</p>

### 출력 

 <p>A single line stating the minimum number of inhabitants that will have to be relocated. Output -1 if it is impossible to construct the tracks without building on the areas in which you are not allowed to build tracks.</p>

