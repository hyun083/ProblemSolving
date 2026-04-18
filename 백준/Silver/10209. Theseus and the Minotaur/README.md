# [Silver IV] Theseus and the Minotaur - 10209 

[문제 링크](https://www.acmicpc.net/problem/10209) 

### 성능 요약

메모리: 79512 KB, 시간: 8 ms

### 분류

구현, 자료 구조, 문자열, 스택

### 제출 일자

2026년 4월 18일 22:29:39

### 문제 설명

<p>Theseus was one of the founding fathers of Athens, and a hero of strength, intelligence, and courage in his own right. While his life was not quite as troubled as Heracles’s, it was far from drama-free: his step mother tried to poison him, and his father committed suicide because he put up the wrong color of sail upon his return home from slaying the Minotaur. (A black sail was to indicate his death, and he forgot to change it to white.) Theseus is best known for slaying the Minotaur, a fabled half-man, half-bull monster, who lived inside a labyrinth in Crete whence Athenian youth were sent to be sacrificed. According to the legend, Ariadne of Crete fell in love with Theseus, and provided him with a string to avoid losing his place in the labyrinth. He attached it at the entrance and would unwind and rewind it as he proceeded through the labyrinth.</p>

<p>In this problem, you are to determine whether a given sequence of steps is consistent with this “string-based” approach of traversing a labyrinth, such that at the end, the entire string is rolled up again. You will be given a sequence of steps, consisting of the lowercase letters ‘l’, ‘r’, ‘u’, ‘d’, describing the four directions on a rectangular grid that Theseus walked in. For instance, if Theseus walks “urdl”, he is back where he started, but since he may have walked around a pillar, his string is not rewound.</p>

### 입력 

 <p>The first line is the number K of input data sets, followed by the K data sets, each of the following form:</p>

<p>Each data set is a single string of lowercase letters ‘l’, ‘r’, ‘u’, ‘d’, of length at most 100 characters.</p>

### 출력 

 <p>For each data set, output “Data Set x:” on a line by itself, where x is its number.</p>

<p>Then output whether the string is fully rewound by the end of the sequence, either “Yes” or “No”.</p>

<p>Each data set should be followed by a blank line.</p>

