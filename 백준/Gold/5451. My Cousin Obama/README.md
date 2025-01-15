# [Gold IV] My Cousin Obama - 5451 

[문제 링크](https://www.acmicpc.net/problem/5451) 

### 성능 요약

메모리: 94940 KB, 시간: 184 ms

### 분류

0-1 너비 우선 탐색, 데이크스트라, 그래프 이론, 최단 경로

### 제출 일자

2025년 1월 15일 21:34:51

### 문제 설명

<p>When Barack Obama was elected president of the United States of America, the city of Leiden was proud to announce that his ancestors Thomas Blossom and Anne Eldson had lived in Leiden between 1609 and 1629. They were members of over 125 protestants which had fled from England to Holland, seeking religious freedom, and which later became known as the ‘Pilgrim Fathers’. Father and son Bush (earlier presidents of the USA) were descendants from the same Leiden couple.</p>

<p>Of course, we wish Leiden joy of having a relation with Barack Obama, but Leiden is probably not the only city in the world with such a relation. Given that every person has two (biological) parents, and that you get a new generation every, say, thirty years, Barack Obama probably has several thousands of ancestors from the early seventeenth century.</p>

<p>It would be more interesting if the relation of Obama with Leiden would be entirely along the male line of ancestry.<sup>1</sup> This is not the case: Obama’s father is from Kenia, and in the fact, the line towards Thomas Blossom and Anne Eldson started from Obama’s mother.</p>

<p>In general, when some person A0 descends from some person B0 living centuries ago, there is not necessarily a unique line of ancestry. Far relatives may get married without even knowing that they are relatives. In such a case, it would be interesting to find the line of ancestry from A0 to B0 containing as few women as possible.</p>

<p>You are asked to find this line of ancestry, from a database with ancestor information. In particular, you are asked for the smallest number of women on a line of ancestry from A0 to B0. For the sake of simplicity, the database does not contain real names, but numbers between 1 and a certain maximum N to identify individuals.</p>

### 입력 

 <p>The first line of the input contains a single number: the number of test cases to follow. Each test case has the following format:</p>

<ul>
	<li>One line with one integer N, satisfying 2 ≤ N ≤ 100, 000: the number of persons in the database.</li>
	<li>One line with two different integers A0 and B0, satisfying 1 ≤ A0,B0 ≤ N: the ID numbers of the two persons we are interested in.</li>
	<li>N lines, each with two integers f and m, satisfying 0 ≤ f,m ≤ N. The integers on line i are the ID numbers of the father (f) and the mother (m) of the person with ID number i. An ID number f = 0 (or m = 0) indicates that the father (or mother) of person i is not known.</li>
</ul>

<p>Integers on the same line are separated by single spaces.</p>

<p>The integers f and m on the N lines are gender-consistent: no person is registered both as father and as mother (of the same or different persons).<sup>2</sup> We do not assume age limits; for example, a man and a woman who are ten generations apart, may have a child together. Of course, the ancestor information in the input does not describe cycles.</p>

### 출력 

 <p>For every test case in the input, the output should contain a single line, containing the smallest number of women on a line of ancestry from A0 to B0 (not counting A0 and B0 if either of them is a woman) if B0 is an ancestor of A0 according to the database, or containing the string "no ancestor" otherwise.</p>

