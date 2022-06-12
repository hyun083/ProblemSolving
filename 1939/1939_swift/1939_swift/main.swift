//
//  main.swift
//  1939_swift
//
//  Created by Hyun on 2022/06/12.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m  = nm[1]
var map = Array(repeating: [Int:Int](), count: n)
var visited = Array(repeating: false, count: n)
for _ in 0..<m{
    let abc = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = abc[0]-1
    let b = abc[1]-1
    let c = abc[2]
    if map[a][b] == nil{
        map[a][b] = c
        map[b][a] = c
    }else{
        map[a][b] = max(map[a][b]!, c)
        map[b][a] = max(map[b][a]!, c)
    }
}

func bfs(from u:Int, by c:Int){
    visited[u] = true
    var q = [Int]()
    q.append(u)
    
    while !q.isEmpty{
        let curr = q.removeFirst()
        for next in map[curr]{
            if !visited[next.key] && next.value>=c{
                visited[next.key] = true
                q.append(next.key)
            }
        }
    }
}

let uv = readLine()!.split(separator: " ").map{Int(String($0))!}
let u = uv[0]-1
let v = uv[1]-1

var left = 0
var right = 1000000001
var ans = 0

while left <= right{
    let mid = (left+right)/2
    visited = Array(repeating: false, count: n)
    bfs(from: u, by: mid)
    if visited[v]{
        left = mid + 1
        ans = mid
    }else{
        right = mid - 1
    }
}
print(ans)
