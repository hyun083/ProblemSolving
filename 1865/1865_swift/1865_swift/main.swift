//
//  main.swift
//  1865_swift
//
//  Created by Hyun on 2022/10/20.
//

import Foundation

let tc = Int(readLine()!)!
for _ in 0..<tc{
    let nmw = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = nmw[0]
    let m = nmw[1]
    let w = nmw[2]
    var map = Array(repeating: [[Int]](), count: n)
    var visited = Array(repeating: false, count: n)
    var ans = Array(repeating: 10001, count: n)
    for _ in 0..<m{
        let set = readLine()!.split(separator: " ").map{Int(String($0))!}
        let s = set[0]-1
        let e = set[1]-1
        let t = set[2]
        map[s].append([e,t])
        map[e].append([s,t])
    }
    for _ in 0..<w{
        let set = readLine()!.split(separator: " ").map{Int(String($0))!}
        let s = set[0]-1
        let e = set[1]-1
        let t = -1*set[2]
        map[s].append([e,t])
    }
    
    func warp(from curr:Int, to:Int, time:Int){
        for next in map[curr]{
            if next[0] == to{
                ans[to] = min(ans[to], time+next[1])
            }
            if !visited[next[0]]{
                warp(from: next[0], to: to, time: time+next[1])
                visited[next[0]] = true
            }
        }
    }
    for i in 0..<n{
        visited = Array(repeating: false, count: n)
        warp(from: i, to: i, time: 0)
    }
    for m in map{
        print(m)
    }
    print(ans)
    if ans.min()! < 0 {
        print("YES")
    }else{
        print("NO")
    }
}
