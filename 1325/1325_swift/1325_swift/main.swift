//
//  main.swift
//  1325_swift
//
//  Created by Hyun on 2022/09/07.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]
var map = Array(repeating: [Int](), count: n)
var visited = Array(repeating: false, count: n)

for _ in 0..<m{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let u = line[1]-1
    let v = line[0]-1
    map[u].append(v)
}

func dfs(from curr:Int)->Int{
    visited[curr] = true
    var cnt = 1
    for next in map[curr]{
        if !visited[next]{
            cnt += dfs(from: next)
        }
    }
    return cnt
}

var ans = Array(repeating: 0, count: n)
var target = 0
for u in 0..<n{
    visited = Array(repeating: false, count: n)
    ans[u] = dfs(from: u)
    target = max(target, ans[u])
}
var output = ""
for i in 0..<n{
    if ans[i] == target{
        output += "\(i+1) "
    }
}
print(output)
