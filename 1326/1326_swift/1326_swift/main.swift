//
//  main.swift
//  1326_swift
//
//  Created by Hyun on 2022/11/05.
//

import Foundation

let n = Int(readLine()!)!
let map = readLine()!.split(separator: " ").map{Int(String($0))!}
var visited = Array(repeating: Int.max, count: n)
let ab = readLine()!.split(separator: " ").map{Int(String($0))!-1}
let a = ab[0]
let b = ab[1]
var ans = 0

func bfs(from x:Int, cnt:Int){
    var q = [(x,cnt)]
    var idx = 0
    while idx < q.count{
        let curr = q[idx]
        let x = curr.0
        let cnt = curr.1
        
        for i in stride(from: x, to: n, by: +map[x]){
            if visited[i] > cnt+1{
                visited[i] = cnt+1
                q.append((i,cnt+1))
            }
        }
        for i in stride(from: x, through: 0, by: -map[x]){
            if visited[i] > cnt+1{
                visited[i] = cnt+1
                q.append((i,cnt+1))
            }
        }
        idx += 1
    }
}
visited[a] = 0
bfs(from: a, cnt: 0)
print(visited[b]==Int.max ? -1:visited[b])
