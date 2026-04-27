# [Silver III] Program - 8594 

[문제 링크](https://www.acmicpc.net/problem/8594) 

### 성능 요약

메모리: 120844 KB, 시간: 120 ms

### 분류

자료 구조, 스택

### 제출 일자

2026년 4월 27일 23:06:47

### 문제 설명

<p>Bajtocki kontrwywiad od dawna usiłuje przechwycić program służący pewnemu wrogiemu państwu do szyfrowania wiadomości. Właśnie udało mu się zdobyć pewną część tego programu - sekwencję wszystkich pojawiających się w nim nawiasów.</p>

<p>W treści programu pojawiają się trzy rodzaje nawiasów:</p>

<ul>
	<li>okrągłe: <code>(</code> i <code>)</code></li>
	<li>kwadratowe: <code>[</code> i <code>]</code></li>
	<li>klamrowe: <code>{</code> i <code>}</code></li>
</ul>

<p>Jakkolwiek jest to niewielka ilość informacji, bajtoccy agenci chcą wywnioskować z niej możliwie najwięcej. Najważniejszym parametrem danej sekwencji jest <i>stopień zagnieżdżenia nawiasów</i>. Przez stopień zagnieżdżenia sekwencji nawiasów rozumiemy maksymalny ciąg par nawiasów, z których każda znajduje się wewnątrz poprzedniej. Wyznaczenie stopnia zagnieżdżenia sprawiło jednak ogromną trudność bajtockim programistom, dlatego kontrwywiad zlecił to zadanie właśnie Tobie.</p>

<p>Bajtoccy agenci uprzedzili Cię, że kosztowny proces obliczania stopnia zagnieżdżenia ma sens tylko wtedy, gdy przechwycony ciąg nawiasów jest poprawny, czyli wtedy, gdy nawias otwierający każdego rodzaju można sparować z nawiasem zamykającym tego samego rodzaju, występującym dalej, tak aby ciąg nawiasów znajdujących się pomiędzy nimi również był poprawnym ciągiem nawiasowym.</p>

### 입력 

 <p>Pierwszy wiersz standardowego wejścia zawiera dokładnie jedną liczbę całkowitą $n$ ($1 ≤ n ≤ 1\,000\,000$) - jest to długość programu wroga. Drugi wiersz zawiera słowo składające się ze znaków: "<code>(</code>", "<code>)</code>", "<code>[</code>", "<code>]</code>", "<code>{</code>", "<code>}</code>". Są to kolejne nawiasy pojawiające się w programie wroga.</p>

### 출력 

 <p>Jeżeli słowo nawiasowe wczytane na wejściu jest poprawne, Twój program powinien wypisać na standardowe wyjście jedną liczbę całkowitą równą maksymalnemu poziomowi zagnieżdżenia nawiasów.</p>

<p>W przeciwnym wypadku należy wypisać jedno słowo <code>NIE</code>.</p>

