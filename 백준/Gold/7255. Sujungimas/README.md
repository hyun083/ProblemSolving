# [Gold IV] Sujungimas - 7255 

[문제 링크](https://www.acmicpc.net/problem/7255) 

### 성능 요약

메모리: 98364 KB, 시간: 112 ms

### 분류

자료 구조, 분리 집합, 그래프 이론, 그리디 알고리즘, 최소 스패닝 트리, 정렬

### 제출 일자

2024년 5월 13일 07:09:23

### 문제 설명

<p>Bitlandijoje pertvarkoma traukinių infrastruktūra. Šis darbas paskirtas Bitlandijos Traukinių Kompanijos vadovui Martynui.</p>

<p>Pirmiausia Martynas įvertino į kiekvieną miestą i atvykstančių keleivių srautą S<sub>i</sub>. Martynas tarp miestų projektuoja geležinkelio linijas, tokias kad:</p>

<ul>
	<li>Iš kiekvieno Bitlandijos miesto geležinkeliu būtų galima nukeliauti į bet kurį kitą Bitlandijos miestą (nebūtinai tiesiogiai).</li>
	<li>Nutiesti vieną traukinių liniją tarp miestų i ir j kainuoja S<sub>i</sub> × S<sub>j</sub> biteurų – didesnis srautas reikalauja daugiau investicijų (didesnė stotis, didesnis parkingas ir t.t.).</li>
</ul>

<p>Dalis geležinkelių Bitlandijoje jau nutiesti, bet sumažėjus biudžetui Martynas nori nutiesti trūkstamas linijas už kuo mažesnę kainą.</p>

<p>Nustatykite, už kokią mažiausią kainą galima nutiesti likusias geležinkelio linijas, taip kad būtų tenkinami Martyno iškelti reikalavimai.</p>

### 입력 

 <p>Pirmoje eilutėje pateikiami tarpu atskirti skaičiai N ir M – Bitlandijos miestų bei jau nutiestų geležinkelio linijų skaičius.</p>

<p>Antroje eilutėje pateikiami N tarpais atskirti skaičiai S<sub>i</sub>.</p>

<p>Tolimesnėse M eilučių pateikiama po du skaičius v<sub>i</sub> ir u<sub>i</sub>, reiškiančius, kad tarp miestų v<sub>i</sub> ir u<sub>i</sub> jau nutiesta tiesioginė geležinkelio linija.</p>

### 출력 

 <p>Išveskite kiek mažiausiai biteurų kainuos likusių geležinkelio linijų nutiesimas.</p>

