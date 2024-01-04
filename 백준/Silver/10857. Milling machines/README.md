# [Silver III] Milling machines - 10857 

[문제 링크](https://www.acmicpc.net/problem/10857) 

### 성능 요약

메모리: 87872 KB, 시간: 1112 ms

### 분류

구현

### 제출 일자

2024년 1월 4일 16:45:53

### 문제 설명

<p>A fab lab is an open, small-scale workshop where you can create or fabricate almost anything you want mostly by using computer controlled tools like a laser cutter or a 3D printer. The FAU fab lab recently got a CNC milling machine. Using the milling machine you can cut or remove material with different tools from the surface of a workpiece. It is controlled via a computer program.</p>

<p>I sometimes wondered what happens if multiple different shaped workpieces are sent through the same milling program. For simplification assume that we have only two dimensional workpieces without holes. A milling program consists of multiple steps; each step describes where the milling machine has to remove material (using different tools) from the top of the surface.</p>

### 입력 

 <p>The first line consists of two integers W and S, where W gives the number of workpieces and S the number of steps in the milling program (1 ≤ W, S ≤ 10<sup>4</sup>). The next line consists of two integers X and Y , where X gives the width and Y gives the maximal possible height of workpieces (1 ≤ X, Y ≤ 100).</p>

<p>Then follow W lines, each describing one workpiece. Each workpiece description consists of X non-negative integers specifying the surface height in that column.</p>

<p>Then follow S lines, each describing one milling step of the milling progam. Each milling step description consists of X non-negative integers s<sub>i</sub> (0 ≤ s<sub>i</sub> ≤ Y ) specifying the amount of surface to cut off in each column (relative to the height of the milling area, i.e. Y , not relative to the top of the workpiece). See Fig. I.1 for details.</p>

### 출력 

 <p>For each workpiece, output one line containing X integers specifying the remaining surface heights (in the same order as in the input).</p>

<p style="text-align:center"><img alt="" src="https://onlinejudgeimages.s3-ap-northeast-1.amazonaws.com/problem/10857/1.png" style="height:119px; width:289px"></p>

<p>Figure I.1: Second workpiece in first sample: initial workpiece followed by milling in each column – the value in the milling program determines the vertical position of the cutter head.</p>

