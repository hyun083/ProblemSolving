# [Silver II] Alien Attack 2 - 32477 

[문제 링크](https://www.acmicpc.net/problem/32477) 

### 성능 요약

메모리: 81080 KB, 시간: 312 ms

### 분류

그래프 이론, 자료 구조, 그래프 탐색, 너비 우선 탐색, 깊이 우선 탐색, 분리 집합

### 제출 일자

2025년 7월 14일 21:05:17

### 문제 설명

<p>Aliens are visiting Earth and, as usual, they plan to abduct humans for their experiments. In the past, alien abductions have caused a lot of press coverage and wild speculation on Earth. Luckily for them, most people do not believe these stories and think that aliens are not real.</p>

<p>In order to keep a low profile in the future, the Galactic Committee for Person Captures (GCPC) has established rules for abductions. Besides a lot of boring paperwork, the aliens have to prepare the abduction carefully. While they can make multiple trips (in fact, alien travel is so fast in practice that this is not a limitation at all), they must be smart about it so that their secret is not revealed to humans. If aliens want to abduct a person, they are required to abduct all of their friends at the same time, so that no one notices that their friend is missing when they want to hang out. Of course, friendships on planet Earth are bidirectional, that is if Alice is a friend of Bob, then Bob is also a friend of Alice.</p>

<p>In preparation for the trip, the aliens have observed their targets and started taking note of all their friendships. In total, they must abduct $n$ people, including their friends. Now, they want to book a starship at their local dealership and wonder how much space they need to abduct all $n$ people. A starship's storage space is measured in terms of the number of people that can be transported simultaneously. What is the minimum storage space required to abduct all $n$ people?</p>

### 입력 

 <p>The input consists of:</p>

<ul>
	<li>One line with two integers $n$ and $m$ ($1\leq n\leq 2 \cdot 10^5$, $0\leq m\leq 2 \cdot 10^5$), the number of people and the total number of friendships between them.</li>
	<li>$m$ lines, each with two integers $i$ and $j$ ($1\leq i < j\leq n$), denoting a friendship between persons $i$ and $j$.</li>
</ul>

<p>The people are numbered from $1$ to $n$. It is guaranteed that no friendship is listed multiple times.</p>

### 출력 

 <p>Output the minimum storage space needed to abduct all people.</p>

