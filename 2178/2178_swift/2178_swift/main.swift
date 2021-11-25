//
//  main.swift
//  2178_swift
//
//  Created by Hyun on 2021/11/25.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0]
let M = input[1]

var map = Array(repeating: Array<Int>(), count: N)
var visited = Array(repeating: Array(repeating: false, count: M), count: N)

for idx in 0..<N{
    let input = readLine()!
    for i in input{
        map[idx].append(Int(String(i))!)
    }
}

let nx = [1,-1,0,0]
let ny = [0,0,-1,1]

func bfs() -> Int{
    visited[0][0] = true
    var q = [[Int]]()
    q.append([0,0])
    var cnt = 1
    
    while(!q.isEmpty){
        cnt += 1
        for _ in 1...q.count{
            let curr =  q.removeFirst()
            for i in 0...3{
                let X = curr[0] + nx[i]
                let Y = curr[1] + ny[i]
                if(X<0 || X>=N || Y<0 || Y>=M){
                    continue
                }
                
                if(map[X][Y] == 1 && visited[X][Y]==false){
                    if(X == N-1 && Y == M-1){return cnt}
                    q.append([X,Y])
                    visited[X][Y] = true
                }
            }
        }
    }
    return -1
}

print(bfs())
