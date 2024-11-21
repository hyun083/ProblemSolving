# [Gold V] Relay race - 6054 

[문제 링크](https://www.acmicpc.net/problem/6054) 

### 성능 요약

메모리: 90684 KB, 시간: 148 ms

### 분류

데이크스트라, 그래프 이론, 구현, 최단 경로, 시뮬레이션

### 제출 일자

2024년 11월 21일 19:43:46

### 문제 설명

<p>The N (1 <= N <= 1,000) cows conveniently numbered 1..N are competing in a unique relay race during which multiple cows can run simultaneously.</p>

<p>Before time t=0, each cow is positioned at the starting line, waiting for her turn to run one lap around a circular track whose finish line is the same as the starting line.</p>

<p>At time t=0, cow 1 starts running around the track and re-crosses the starting line exactly L_1 seconds later. In general, cow i's time to run a lap is L_i (1 <= L_i <= 1,000). As soon as she re-crosses the starting line, she signals M_1 other cows numbered A_1j to start instantly. Generally, cow i signals M_i cows (0 <= M_i <= N) named A_ij (1 <= j <= M_i) to start running. Sooner or later, every cow is signaled at least once. Sometimes M_i might be 0 and no A_ij's exist.</p>

<p>Each of the signaled cows starts running and performs the signaling procedure when recrossing the starting line. Multiple cows might signal the same cow, but every cow wants to run only one lap, so signals after the first one it receives are ignored.</p>

<p>Farmer John wants you to determine the total race time (i.e., how long it takes for the final cow to complete her lap).</p>

<p>Consider a small race with 5 cows. The table below shows the Cow ID (i), her time to run a single lap (L_i), the number of signals cow i will perform when she finishes (M_i), and the (potentially empty) list of cows to be signaled (A_ij):</p>

<pre>            i   L_i  M_i   A_i*
            1    4    2    2 4
            2    3    3    1 3 4
            3    7    1    5
            4    4    2    3 5
            5    1    0</pre>

<p>Starting cow 1 at time 0 leads to this timeline of events:</p>

<pre>   TIME        Event
     0        Cow 1 starts running
     4        Cow 1 finishes; signals 2 and 4
     4        Cow 2 starts running (time to finish: +3 seconds -> 7)
     4        Cow 4 starts running (time to finish: +4 seconds -> 8)
     7        Cow 2 finishes; signals 1, 3, and 4
     7        Cows 1 and 4 ignore the duplicate signal
     7        Cow 3 starts (time to finish: +7 seconds -> 14)
     8        Cow 4 finishes; signals 3 and 5
     8        Cow 3 ignores the duplicate signal
     8        Cow 5 starts (time to finish: +1 seconds -> 9)
     9        Cow 5 finishes but has no other cows to signal
    14        Cow 3 finishes; signals 5
    14        Cow 5 ignores the duplicate signal
    14        All cows have finished</pre>

<p>Thus, the race will last 14 seconds.</p>

### 입력 

 <ul>
	<li>Line 1: A single integer: N</li>
	<li>Lines 2..N+1: Line i+1 contains multiple space-separated integers: L_i, M_i and then M_i integers A_ij</li>
</ul>

<p> </p>

### 출력 

 <ul>
	<li>Line 1: A single integer, the time the last cow finishes</li>
</ul>

<p> </p>

