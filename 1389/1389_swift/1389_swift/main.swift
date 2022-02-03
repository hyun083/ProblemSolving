//
//  main.swift
//  1389_swift
//
//  Created by Hyun on 2022/02/03.
//

import Foundation

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NM[0]
let M = NM[1]
var map = Array(repeating: [Int](), count: N)

for _ in 0..<M{
    let edge = readLine()!.split(separator: " ").map{Int(String($0))! - 1}
    map[edge[0]].append(edge[1])
    map[edge[1]].append(edge[0])
}

var result = Array(repeating: 0, count: N)

func bfs(from:Int){
    var visited = Array(repeating: false, count: N)
    var queue = [Int]()
    queue.append(from)
    visited[from] = true
    
    var cnt = 0
    while !queue.isEmpty{
        for _ in 0..<queue.count{
            let curr = queue.removeFirst()
            result[from] += cnt
            for next in map[curr]{
                if !visited[next]{
                    visited[next] = true
                    queue.append(next)
                }
            }
        }
        cnt += 1
    }
}

for i in 0..<N{
    bfs(from: i)
}
print(result.firstIndex(of: result.min()!)! + 1)
