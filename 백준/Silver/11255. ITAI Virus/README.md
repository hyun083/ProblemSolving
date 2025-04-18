# [Silver IV] ITAI Virus - 11255 

[문제 링크](https://www.acmicpc.net/problem/11255) 

### 성능 요약

메모리: 79652 KB, 시간: 16 ms

### 분류

그래프 이론, 구현

### 제출 일자

2025년 4월 18일 20:15:10

### 문제 설명

<p>“Insane Transferable Abnormal Illness” or ITAI for short, is a new viral disease first discovered in a southern part of some city. The symptom is that persons contract with virus will continuously and uncontrollably scream “Itai, itai!”</p>

<p>When this virus was discovered at any city, it will perform binary division and spread through all roads connected to initial city. (The original city will have virus even though it has spread). But the ITAI virus is quite weak; after it has travelled to another city it will degenerate into “weak virus” that cannot spread anymore.</p>

<p>In a country, there is total of N cities, numbered from 1 to N, and has M road. The Ministry of Health has conducted an inspection and found this virus in K cities (All are new virus that can still spread)</p>

<p>To find out how many cities have virus after all virus has finished spreading. </p>

### 입력 

 <p>First line has number of question: T (1 ⩽ T ⩽ 10)</p>

<p>For question i (1 ⩽ i ⩽ T)</p>

<ul>
	<li>First line of question #i has three integer, N (number of city) M (number of road) and K (number that has virus) (1 ⩽ N ⩽ 1000; 1 ⩽ M ⩽ 2N; 0 ⩽ K ⩽ N)</li>
	<li>Next M lines of question #i has integer A and B, represent the road connecting city A to city B.</li>
	<li>Next line has K integers, each one is the initial cities found to have cirus. </li>
</ul>

### 출력 

 <p>Has T lines, each line have the total number of city that has virus for question #i.</p>

