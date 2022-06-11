//
//  main.swift
//  11724_swift
//
//  Created by Hyun on 2022/06/12.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var arr = Array(repeating: [Int](), count: n)
var visited = Array(repeating: false, count: n)

for _ in 0..<m{
    let uv = readLine()!.split(separator: " ").map{Int(String($0))!}
    let u = uv[0]-1
    let v = uv[1]-1
    arr[u].append(v)
    arr[v].append(u)
}

func dfs(from n: Int){
    let curr = n
    visited[curr] = true
    for next in arr[curr]{
        if !visited[next]{
            dfs(from: next)
        }
    }
}
var components = 0
for i in 0..<n{
    if !visited[i]{
        components += 1
        dfs(from: i)
    }
}
print(components)
