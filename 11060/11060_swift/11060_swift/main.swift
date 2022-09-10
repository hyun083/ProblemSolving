//
//  main.swift
//  11060_swift
//
//  Created by Hyun on 2022/09/10.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var visited = Array(repeating: false, count: n)

var q = [Int]()
var dq = [Int]()
var level = 0
var ans = Int.max
func bfs(){
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        level += 1
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            if curr == n-1{
                ans = min(ans, level-1)
                return
            }
            if arr[curr] >= 1{
                for i in 1...arr[curr]{
                    let next = curr + i
                    if next >= n {continue}
                    if !visited[next]{
                        visited[next] = true
                        q.append(next)
                    }
                }
            }
        }
    }
}
q.append(0)
visited[0] = true
bfs()
if ans == Int.max{
    print(-1)
}else{
    print(ans)
}
