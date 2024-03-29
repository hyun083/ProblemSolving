# [Gold III] 배수로 - 25587 

[문제 링크](https://www.acmicpc.net/problem/25587) 

### 성능 요약

메모리: 91836 KB, 시간: 104 ms

### 분류

자료 구조, 분리 집합

### 문제 설명

<p>ChAOS 나라에는 총 $N$개의 도시가 있고 각각 $1, 2, 3, …, N$번 도시라고 부른다. ChAOS 나라에 각 도시에는 홍수를 막기 위해 배수로가 설치되어 있다. $i$번 도시의 배수로는 강수량이 $A_i$이하일 때만 홍수를 막을 수 있다. 추가로 한 도시에만 폭우가 올 때를 대비해, 두 개의 도시를 정해서 양쪽 도시의 배수로 용량을 공유할 수 있는 공사를 하기로 했다. 예를 들어 1번 도시와 2번 도시에 공사를 하고 난 후, 1번 도시와 2번 도시의 강수량의 합이 $A_1 + A_2$이하라면 1, 2번 도시 모두에 홍수가 나는 것을 막을 수 있고, 그렇지 않다면 1, 2번 도시 모두에 홍수가 나게 된다. 그 후 2, 3번 도시에도 공사를 하면, 세 도시의 강수량의 합이 $A_1 + A_2 + A_3$이하라면 1, 2, 3번 도시 모두에 홍수가 나는 것을 막을 수 있고, 그렇지 않다면 1, 2, 3번 도시 모두에 홍수가 나게 된다.</p>

<p>그리고 현재 ChAOS 나라에는 전국적으로 폭우가 오고 있다. 현재 $i$번 도시의 강수량은 $B_i$다. 여기서 두 가지의 쿼리를 처리하는 프로그램을 작성하자.</p>

<ul>
	<li>$1$ $x$ $y$ : $x$번 도시와 $y$번 도시에 공사를 한다.</li>
	<li>$2$ : 현재 상태에서 홍수가 날 도시의 개수를 출력한다.</li>
</ul>

<p>단, $2$번 쿼리는 최소 한 개 주어진다.</p>

### 입력 

 <p>첫 번째 줄에 도시의 개수인 정수 $N$ $(3 ≤ N ≤ 100\,000)$과 쿼리의 개수인 정수 $M$ $(1 \leq M \leq 100\,000)$이 주어진다.</p>

<p>두 번째 줄에는 $i$번 도시의 배수로 용량을 의미하는 $N$개의 정수 $A_1, A_2, A_3,..., A_N$이 주어진다. $(0 \leq A​_i \leq 1\,000)$</p>

<p>세 번째 줄에는 $i$번 도시의 강수량을 의미하는 $N$개의 정수 $B_1, B_2, B_3,..., B_N$이 주어진다. $(0 \leq B_i \leq 1\,000)$</p>

<p>네 번째 줄부터 $M + 3$번째 줄까지는 $1$ $x$ $y$ 또는 $2$ 형태의 쿼리 $M$개가 한 줄에 하나씩 주어진다. $(1 \leq x, y \leq N)$</p>

### 출력 

 <p>각각의 $2$번 쿼리마다 정답을 한 줄에 하나씩 출력한다.</p>

