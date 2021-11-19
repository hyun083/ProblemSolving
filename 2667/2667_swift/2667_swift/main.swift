//
//  main.swift
//  2667_swift
//
//  Created by Hyun on 2021/11/19.
//

import Foundation

let nx = [-1,1,0,0]
let ny = [0,0,-1,1]

func dfs(_ x:Int, _ y:Int) -> Int{
    var cnt = 0
    visited[x][y] = 1
    cnt += 1
    
    for i in 0...3{
        let X = x+nx[i]
        let Y = y+ny[i]
        if(X < 0 || X >= N || Y < 0 || Y >= N){
            continue
        }
        
        if (map[X][Y] == 1 && visited[X][Y] == 0){
            cnt += dfs(X, Y)
        }
        
    }
    
    return cnt
}

var N = Int(readLine()!)!

var map = Array(repeating: Array(repeating: 0, count: N), count: N)
var visited = Array(repeating: Array(repeating: 0, count: N), count: N)

for idx in 0..<N{
    let numbers = readLine()!
    for idx2 in 0..<N{
        map[idx][idx2] = Int(String(numbers[numbers.index(numbers.startIndex, offsetBy: idx2)]))!
    }
}

var cntArr = [Int]()

for x in 0..<N{
    for y in 0..<N{
        if(map[x][y] == 1 && visited[x][y] == 0){
            cntArr.append(dfs(x, y))
        }
    }
}

print(cntArr.count)
for cnt in cntArr.sorted(by: <){
    print(cnt)
}
