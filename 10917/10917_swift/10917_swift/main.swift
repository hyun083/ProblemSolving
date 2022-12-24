//
//  main.swift
//  10917_swift
//
//  Created by Hyun on 2022/12/23.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]
var ans = -1

var arr = Array(repeating: [Int](), count: n)
var visited = Array(repeating: false, count: n)

func bfs(from a:Int, count cnt:Int){
    var q = [(a,cnt)]
    var idx = 0
    
    while idx<q.count{
        let curr = q[idx].0
        let count = q[idx].1
        
        if curr == n-1{
            ans = count
            return
        }
        
        for next in arr[curr]{
            if !visited[next]{
                visited[next] = true
                q.append((next,count+1))
            }
        }
        
        idx += 1
    }
}

for _ in 0..<m{
    let info = readLine()!.split(separator: " ").map{Int($0)!-1}
    let u = info[0]
    let v = info[1]
    arr[u].append(v)
    arr[v].append(u)
}
bfs(from: 0, count: 0)
print(ans)
