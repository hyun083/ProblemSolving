//
//  main.swift
//  15683_swift
//
//  Created by Hyun on 2022/11/08.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]
var map = Array(repeating: Array(repeating: 0, count: m), count: n)
var q = [(Int,Int,Int)]()
var ans = 0

for i in 0..<n{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    for k in 0..<m{
        map[i][k] = line[k]
        if map[i][k] > 0{
            q.append((i,k,map[i][k]))
        }
    }
}

func btk(x:Int, y:Int, cnt:Int){
    
}
