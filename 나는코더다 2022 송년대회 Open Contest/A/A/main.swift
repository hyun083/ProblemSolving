//
//  main.swift
//  A
//
//  Created by Hyun on 2023/01/01.
//

import Foundation

let nkx = readLine()!.split(separator: " ").map{Int($0)!}
let n = nkx[0]
let k = nkx[1]
let x = nkx[2]
var stat = 0

var arr = [(Int,Int)]()
for _ in 0..<n{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    arr.append((info[0],info[1]))
}

func btk(idx:Int,cnt:Int,score:(Int,Int)){
    if cnt == k{
        stat = max(stat, score.0*score.1)
        return
    }else if idx==n{
        return
    }
    btk(idx: idx+1, cnt: cnt+1, score: (score.0+arr[idx].0,score.1+arr[idx].1))
    btk(idx: idx+1, cnt: cnt, score: score)
}

btk(idx: 0, cnt: 0, score: (0,0))
print(stat)
