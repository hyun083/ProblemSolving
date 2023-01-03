//
//  main.swift
//  1889_swift
//
//  Created by Hyun on 2023/01/03.
//

import Foundation

let n = Int(readLine()!)!
var map = Array(repeating: [Int](), count: n)
var degree = Array(repeating: 0, count: n)

for i in 0..<n{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    map[i] = info
    degree[info[0]] += 1
    degree[info[1]] += 1
}

func bfs(from a:Int){
    var q = [a]
    var idx = 0
    while idx < q.count{
        
        idx+=1
    }
}

for i in 0..<n{
    if degree[i] < 2{
        for next in map[i]{
            degree[next] -= 1
        }
        map[i] = [Int]()
    }
}

for i in 0..<n{
    if degree[i]==2{
        
    }
}
