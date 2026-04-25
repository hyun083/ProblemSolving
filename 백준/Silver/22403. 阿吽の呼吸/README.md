# [Silver V] 阿吽の呼吸 - 22403 

[문제 링크](https://www.acmicpc.net/problem/22403) 

### 성능 요약

메모리: 79508 KB, 시간: 8 ms

### 분류

구현, 자료 구조, 문자열, 스택

### 제출 일자

2026년 4월 25일 22:15:43

### 문제 설명

<p>時は進んで 2060 年，共に 70 歳を迎える前田さんと後藤さんは長い付き合いの友人であり，大学時代にACM-ICPCで共に戦った仲間でもある．</p>

<p>二人は今でもよく一緒にお茶を飲みつつ，競技プログラミングの話で盛り上がっている．</p>

<p>二人で一緒にお茶を飲む時，前田さんが 1 回<code>A</code>と言うと，その発言の後に後藤さんがちょうど 1 回<code>Un</code>と返事をする習慣がいつのまにか出来た．</p>

<p>しかし最近後藤さんは物忘れや勘違いをすることが多く，前田さんが<code>A</code>と言っても，後藤さんはたまに<code>Un</code>の返事を忘れたり，余計に返事をしたりする．</p>

<p>ついこの間も前田さんと後藤さんはお茶を飲みながら，二人のお気に入りのデータ構造について話し込んでいたようだ．</p>

<p>この時の会話の中から，<code>A</code>で表される前田さんの発言と，<code>Un</code>で表される後藤さんの返事のみからなる記録が時系列で与えられたとき，後藤さんが習慣通りに反応したとみなすことが出来るかチェックしてほしい．</p>

<p>注意点として，前田さんの発言に対し，後藤さんの返事が多少遅れても，後藤さんは習慣通りに反応したとみなせる場合がある，ということが挙げられる． 例えば，前田さんが2回連続して<code>A</code>と言った後，後藤さんが 2 回連続して<code>Un</code>と返事をして会話が終了した場合は，後藤さんが習慣通りの返事をしたとみなされる (Sample Input 2 参照)．</p>

<p>また，会話が終了した時点で，前田さんが<code>A</code>と言った回数と，後藤さんが<code>Un</code>と返事した回数が一致しても，後藤さんが習慣通りに返事をしたとはみなされない場合もあるので注意すること． 例えば，前田さんが1回<code>A</code>と言った後，後藤さんが 2 回連続して<code>Un</code>と返事し，その後で前田さんが 1 回<code>A</code>と言って会話が終了した場合は，後藤さんが習慣通りの返事をしたとはみなされない (Sample Input 3 参照)．</p>

### 입력 

 <p>入力は以下の形式で与えられる．</p>

<blockquote>
<p><mjx-container class="MathJax" jax="CHTML" style="font-size: 109%; position: relative;"> <mjx-math class="MJX-TEX" aria-hidden="true"><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D441 TEX-I"></mjx-c></mjx-mi></mjx-math><mjx-assistive-mml unselectable="on" display="inline"><math xmlns="http://www.w3.org/1998/Math/MathML"><mi>N</mi></math></mjx-assistive-mml><span aria-hidden="true" class="no-mathjax mjx-copytext">$N$</span> </mjx-container></p>

<p><mjx-container class="MathJax" jax="CHTML" style="font-size: 109%; position: relative;"> <mjx-math class="MJX-TEX" aria-hidden="true"><mjx-msub><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D446 TEX-I"></mjx-c></mjx-mi><mjx-script style="vertical-align: -0.15em; margin-left: -0.032em;"><mjx-mn class="mjx-n" size="s"><mjx-c class="mjx-c31"></mjx-c></mjx-mn></mjx-script></mjx-msub></mjx-math><mjx-assistive-mml unselectable="on" display="inline"><math xmlns="http://www.w3.org/1998/Math/MathML"><msub><mi>S</mi><mn>1</mn></msub></math></mjx-assistive-mml><span aria-hidden="true" class="no-mathjax mjx-copytext">$S_1$</span> </mjx-container></p>

<p><mjx-container class="MathJax" jax="CHTML" style="font-size: 109%; position: relative;"> <mjx-math class="MJX-TEX" aria-hidden="true"><mjx-msub><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D446 TEX-I"></mjx-c></mjx-mi><mjx-script style="vertical-align: -0.15em; margin-left: -0.032em;"><mjx-mn class="mjx-n" size="s"><mjx-c class="mjx-c32"></mjx-c></mjx-mn></mjx-script></mjx-msub></mjx-math><mjx-assistive-mml unselectable="on" display="inline"><math xmlns="http://www.w3.org/1998/Math/MathML"><msub><mi>S</mi><mn>2</mn></msub></math></mjx-assistive-mml><span aria-hidden="true" class="no-mathjax mjx-copytext">$S_2$</span> </mjx-container></p>

<p><mjx-container class="MathJax" jax="CHTML" style="font-size: 109%; position: relative;"> <mjx-math class="MJX-TEX" aria-hidden="true"><mjx-mo class="mjx-n"><mjx-c class="mjx-c2026"></mjx-c></mjx-mo></mjx-math><mjx-assistive-mml unselectable="on" display="inline"><math xmlns="http://www.w3.org/1998/Math/MathML"><mo>…</mo></math></mjx-assistive-mml><span aria-hidden="true" class="no-mathjax mjx-copytext">$…$</span> </mjx-container></p>

<p><mjx-container class="MathJax" jax="CHTML" style="font-size: 109%; position: relative;"> <mjx-math class="MJX-TEX" aria-hidden="true"><mjx-msub><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D446 TEX-I"></mjx-c></mjx-mi><mjx-script style="vertical-align: -0.15em; margin-left: -0.032em;"><mjx-mi class="mjx-i" size="s"><mjx-c class="mjx-c1D441 TEX-I"></mjx-c></mjx-mi></mjx-script></mjx-msub></mjx-math><mjx-assistive-mml unselectable="on" display="inline"><math xmlns="http://www.w3.org/1998/Math/MathML"><msub><mi>S</mi><mi>N</mi></msub></math></mjx-assistive-mml><span aria-hidden="true" class="no-mathjax mjx-copytext">$S_N$</span> </mjx-container></p>
</blockquote>

<p>最初の行はひとつの整数からなる． <mjx-container class="MathJax" jax="CHTML" style="font-size: 109%; position: relative;"><mjx-math class="MJX-TEX" aria-hidden="true"><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D441 TEX-I"></mjx-c></mjx-mi></mjx-math><mjx-assistive-mml unselectable="on" display="inline"><math xmlns="http://www.w3.org/1998/Math/MathML"><mi>N</mi></math></mjx-assistive-mml><span aria-hidden="true" class="no-mathjax mjx-copytext">$N$</span></mjx-container> は，記録に含まれる前田さんが<code>A</code>と発言した回数と後藤さんが<code>Un</code>と返事した回数の合計を表し，<mjx-container class="MathJax" jax="CHTML" style="font-size: 109%; position: relative;"><mjx-math class="MJX-TEX" aria-hidden="true"><mjx-mn class="mjx-n"><mjx-c class="mjx-c31"></mjx-c></mjx-mn><mjx-mo class="mjx-n" space="4"><mjx-c class="mjx-c2264"></mjx-c></mjx-mo><mjx-mi class="mjx-i" space="4"><mjx-c class="mjx-c1D441 TEX-I"></mjx-c></mjx-mi><mjx-mo class="mjx-n" space="4"><mjx-c class="mjx-c2264"></mjx-c></mjx-mo><mjx-mn class="mjx-n" space="4"><mjx-c class="mjx-c31"></mjx-c><mjx-c class="mjx-c30"></mjx-c><mjx-c class="mjx-c30"></mjx-c></mjx-mn></mjx-math><mjx-assistive-mml unselectable="on" display="inline"><math xmlns="http://www.w3.org/1998/Math/MathML"><mn>1</mn><mo>≤</mo><mi>N</mi><mo>≤</mo><mn>100</mn></math></mjx-assistive-mml><span aria-hidden="true" class="no-mathjax mjx-copytext">$1 \leq N \leq 100$</span></mjx-container> を満たす． その後 <mjx-container class="MathJax" jax="CHTML" style="font-size: 109%; position: relative;"><mjx-math class="MJX-TEX" aria-hidden="true"><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D441 TEX-I"></mjx-c></mjx-mi></mjx-math><mjx-assistive-mml unselectable="on" display="inline"><math xmlns="http://www.w3.org/1998/Math/MathML"><mi>N</mi></math></mjx-assistive-mml><span aria-hidden="true" class="no-mathjax mjx-copytext">$N$</span></mjx-container> 行に，文字列 <mjx-container class="MathJax" jax="CHTML" style="font-size: 109%; position: relative;"><mjx-math class="MJX-TEX" aria-hidden="true"><mjx-msub><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D446 TEX-I"></mjx-c></mjx-mi><mjx-script style="vertical-align: -0.15em; margin-left: -0.032em;"><mjx-mi class="mjx-i" size="s"><mjx-c class="mjx-c1D456 TEX-I"></mjx-c></mjx-mi></mjx-script></mjx-msub></mjx-math><mjx-assistive-mml unselectable="on" display="inline"><math xmlns="http://www.w3.org/1998/Math/MathML"><msub><mi>S</mi><mi>i</mi></msub></math></mjx-assistive-mml><span aria-hidden="true" class="no-mathjax mjx-copytext">$S_i$</span></mjx-container> が続き，各 <mjx-container class="MathJax" jax="CHTML" style="font-size: 109%; position: relative;"><mjx-math class="MJX-TEX" aria-hidden="true"><mjx-msub><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D446 TEX-I"></mjx-c></mjx-mi><mjx-script style="vertical-align: -0.15em; margin-left: -0.032em;"><mjx-mi class="mjx-i" size="s"><mjx-c class="mjx-c1D456 TEX-I"></mjx-c></mjx-mi></mjx-script></mjx-msub><mjx-mo class="mjx-n"><mjx-c class="mjx-c28"></mjx-c></mjx-mo><mjx-mn class="mjx-n"><mjx-c class="mjx-c31"></mjx-c></mjx-mn><mjx-mo class="mjx-n" space="4"><mjx-c class="mjx-c2264"></mjx-c></mjx-mo><mjx-mi class="mjx-i" space="4"><mjx-c class="mjx-c1D456 TEX-I"></mjx-c></mjx-mi><mjx-mo class="mjx-n" space="4"><mjx-c class="mjx-c2264"></mjx-c></mjx-mo><mjx-mi class="mjx-i" space="4"><mjx-c class="mjx-c1D441 TEX-I"></mjx-c></mjx-mi><mjx-mo class="mjx-n"><mjx-c class="mjx-c29"></mjx-c></mjx-mo></mjx-math><mjx-assistive-mml unselectable="on" display="inline"><math xmlns="http://www.w3.org/1998/Math/MathML"><msub><mi>S</mi><mi>i</mi></msub><mo stretchy="false">(</mo><mn>1</mn><mo>≤</mo><mi>i</mi><mo>≤</mo><mi>N</mi><mo stretchy="false">)</mo></math></mjx-assistive-mml><span aria-hidden="true" class="no-mathjax mjx-copytext">$S_i (1 \leq i \leq N)$</span></mjx-container> は<code>A</code>か<code>Un</code>のどちらかに一致する．ここで<code>A</code>は前田さんの発言，<code>Un</code>は後藤さんの返事を表す． <mjx-container class="MathJax" jax="CHTML" style="font-size: 109%; position: relative;"><mjx-math class="MJX-TEX" aria-hidden="true"><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D456 TEX-I"></mjx-c></mjx-mi></mjx-math><mjx-assistive-mml unselectable="on" display="inline"><math xmlns="http://www.w3.org/1998/Math/MathML"><mi>i</mi></math></mjx-assistive-mml><span aria-hidden="true" class="no-mathjax mjx-copytext">$i$</span></mjx-container> の小さい順に <mjx-container class="MathJax" jax="CHTML" style="font-size: 109%; position: relative;"><mjx-math class="MJX-TEX" aria-hidden="true"><mjx-msub><mjx-mi class="mjx-i"><mjx-c class="mjx-c1D446 TEX-I"></mjx-c></mjx-mi><mjx-script style="vertical-align: -0.15em; margin-left: -0.032em;"><mjx-mi class="mjx-i" size="s"><mjx-c class="mjx-c1D456 TEX-I"></mjx-c></mjx-mi></mjx-script></mjx-msub></mjx-math><mjx-assistive-mml unselectable="on" display="inline"><math xmlns="http://www.w3.org/1998/Math/MathML"><msub><mi>S</mi><mi>i</mi></msub></math></mjx-assistive-mml><span aria-hidden="true" class="no-mathjax mjx-copytext">$S_i$</span></mjx-container> が記録されたものとする． 前田さんと後藤さんが同時に発言することは無かったとする．</p>

### 출력 

 <p>後藤さんが習慣通りに反応したとみなすことが出来れば<code>YES</code>，出来なければ<code>NO</code>を1行で出力すること．</p>

