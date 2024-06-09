# [Gold III] Ringsõit - 7211 

[문제 링크](https://www.acmicpc.net/problem/7211) 

### 성능 요약

메모리: 92792 KB, 시간: 492 ms

### 분류

그래프 이론, 최소 스패닝 트리

### 제출 일자

2024년 6월 9일 16:55:36

### 문제 설명

<p>Bytelandi valitseja otsustas hiljuti minna ringsõidule läbi oma maa kõigi linnade, et näha, kuidas ka kaugemad piirkonnad arenevad. Tema eelmine selline ringsõit oli juba päris ammu ja vahepeal on riigi linnade ja teede süsteem oluliselt muutunud. Bytelandis on N linna, millest mõned on omavahel maanteedega ühendatud. M teed kuuluvad riigile, ülejäänud K on eravalduses. Kõiki teid mööda võib sõita mõlemas suunas. On teada, et mistahes kahe linna vahel on ülimalt ¨ uks tee. Samuti on teada, et igast linnast on võimalik sõita igasse teise, kusjuures selleks võib vaja olla kasutada nii riiklikke kui ka erateid.</p>

<p>Valitseja tahab oma ringsõidul kasutada ainult riiklikke teid. Sellega seoses uurisid Bytelandi ministrid eraomanikelt välja, millise hinnaga oleks võimalik iga erateed riigi valdusse osta. Samuti mõistavad ministrid, et kõik riigiteed ei pruugi ringsõiduks vajalikud olla ja seega võiks mõned neist maha müüa, et sellest teenitud raha kasutada erateede ostmiseks ja nii vältida riigikassa täielikku laostamist.</p>

<p>Ringsõidu korraldamiseks on vaja välja arendada selline teede süsteem, et valitseja saaks külas- tada kõiki linnu (võimalik, et mõnda neist ka mitu korda, kui kujunenud teedevõrk seda nõuab), ja seejuures kulutatakse riigikassast võimalikult vähe raha. Kui ministrid mõne riigitee maha müüvad, kasutavad nad erateede ostmiseks esmalt selle eest saadud raha ja riigikassa kallale lähevad alles siis, kui sellest ei jätku. Kui pärast riigiteede müümist ja erateede ostmist raha üle jääb, siis seda riigikassasse tagasi ei anta.</p>

<p>Linnade ja teede süsteem on küllaltki keeruline, sellepärast pöördusid ringsõidu korraldajad optimaalse plaani koostamiseks Sinu kui Bytelandi parima programmeerija poole. Kirjutada neile programm, mis etteantud linnade ja teede süsteemi põhjal leiab minimaalse summa, mis tuleb riigikassast võtta, valitseja saaks külastada kõiki linnu.</p>

### 입력 

 <p>Tekstifaili esimesel real on tühikutega eraldatud täisarvud N, M ja K (1 ≤ N ≤ 10<sup>5</sup>, 1 ≤ M ≤ 10<sup>5</sup>, 1 ≤ K ≤ 10<sup>5</sup>), vastavalt linnade ning riiklike ja erateede arvud. Järgmisel M real on igaühel kolm täisarvu X, Y ja S<sub>X,Y</sub> (1 ≤ X < Y ≤ N, 0 ≤ S<sub>X,Y</sub> ≤ 10<sup>9</sup>), ühe riigiteega ühendatud linnade numbrid ja selle tee müügihind. Järgmisel K real on igaühel kolm täisarvu X, Y ja B<sub>X,Y</sub> (1 ≤ X < Y ≤ N, 0 ≤ B<sub>X,Y</sub> ≤ 10<sup>9</sup>), ühe erateega ühendatud linnade numbrid ja selle tee ostuhind.</p>

### 출력 

 <p>Tekstifaili väljastada üks mittenegatiivne t äisarv, minimaalne summa, mille peab riigikassast võtma, et luua nõutud teedevõrk.</p>

