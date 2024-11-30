# [Gold V] Paths - 9893 

[문제 링크](https://www.acmicpc.net/problem/9893) 

### 성능 요약

메모리: 79520 KB, 시간: 8 ms

### 분류

너비 우선 탐색, 데이크스트라, 그래프 이론, 그래프 탐색, 최단 경로

### 제출 일자

2024년 11월 30일 23:12:22

### 문제 설명

<p>A graph is made up of a set of nodes and a set of links. A link connects two nodes. For example, Figure 1 shows a simple graph with 4 nodes and 5 links. In the figure, each link has a specific direction, going from the originating node to the destination node. Each link has a cost attached to it. The m nodes of a graph are identified by the integers 0, 1, ..., m − 1.</p>

<p>A path connects one node to another, following the direction of links from node to node. The length of a path is the number of links used. The cost of a path is the sum of link cost over the entire path. For a given graph, your task is to find the minimum cost among the costs of all the shortest paths between Node 0 and Node 1. A shortest path with the minimum cost is called a minimum-cost shortest path.</p>

<table class="table table-bordered" style="width:100%;">
	<tbody>
		<tr>
			<td style="width: 50%; text-align: center;"><img alt="" src="https://upload.acmicpc.net/0a1cf379-85c2-4b76-9fd3-8b62275ca673/-/preview/" style="width: 205px; height: 210px;"></td>
			<td style="width: 50%; text-align: center;"><img alt="" src="https://upload.acmicpc.net/f1426135-e289-4001-a32e-c1f909334ba0/-/preview/" style="width: 202px; height: 210px;"></td>
		</tr>
		<tr>
			<td style="width: 50%; text-align: center;">Figure 1</td>
			<td style="width: 50%; text-align: center;">Figure 2</td>
		</tr>
	</tbody>
</table>

<p>For example, again consider Figure 1. The shortest path from Node 0 to Node 1 is the 1-link path 0 → 1 with a path cost of 10. While there are cheaper paths: 0 → 2 → 1 and 0 → 3 → 1, they are longer (2 links). Therefore, 0 → 1 is the minimum-cost shortest path.</p>

<p>Consider another example, Figure 2. There are two shortest paths of length 2, the path 0 → 3 → 1 has a lower cost (cost = 4) than the path 0 → 2 → 1 (cost = 5). Another path 0 → 2 → 3 → 1 (cost = 3) is cheaper but longer. Therefore, the minimum-cost shortest path is 0 → 3 → 1.</p>

### 입력 

 <p>The first line contains two integers m and n separated by a space, where m is the number of nodes and n is the number of links. The links of the graph and their costs are given by the next n lines. Each line has three integers (with a space between two adjacent integers), denoting <em>Source-Node Destination-Node Link-Cost</em>.</p>

<p>There are at most 100 nodes, and nodes are numbered from 0 to 99. There are at most 1000 links and link cost varies between 0 and 2<sup>15</sup> − 1.</p>

### 출력 

 <p>The output file contains a single integer which is the path cost of a minimum-cost shortest path from Node 0 to Node 1.</p>

<p>Note that while there may be multiple minimum-cost shortest paths, the cost of these paths are the same.</p>

