//
//  main.swift
//  11403_swift
//
//  Created by Hyun on 2021/11/20.
//

import Foundation

func dfs(_ x:Int, _ y:Int) -> String{
    var idx = String(y)
    visited[x][y] = 1
    for i in 0..<N{
        if(map[y][i]==1 && visited[y][i]==0){
            idx += dfs(y, i)
        }
    }
    return idx
}

let N = Int(readLine()!)!

var map = Array(repeating: Array(repeating: 0, count: N), count: N)
var visited = Array(repeating: Array(repeating: 0, count: N), count: N)
var ans = Array(repeating: Array(repeating: 0, count: N), count: N)

for i in 0..<N{
    var inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
    for k in 0..<N{
        map[i][k] = inputs.removeFirst()
    }
}

for x in 0..<N{
    visited = Array(repeating: Array(repeating: 0, count: N), count: N)
    var txt = ""
    for y in 0..<N{
        if(map[x][y] == 1 && visited[x][y] == 0){
            txt += dfs(x, y)
        }
    }
    for idx in txt{
        ans[x][Int(String(idx))!] = 1
    }
}

for x in 0..<N{
    for y in 0..<N{
        if(y == N-1){
            print(ans[x][y])
        }else{
            print(ans[x][y],terminator: " ")
        }
    }
}
