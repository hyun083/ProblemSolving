//
//  main.swift
//  2232_swift
//
//  Created by Hyun on 2022/12/21.
//

import Foundation

let n = Int(readLine()!)!
var visited = Array(repeating: false, count: n)
var arr = [(Int,Int)]()
var map = [Int]()
var ans = [Int]()

func bfs(from a:Int){
    ans.append(a+1)
    let nx = [-1,1]
    var q = [a]
    var idx = 0
    while idx<q.count{
        let curr = q[idx]
        let value = map[curr]
        for i in 0..<2{
            let next = nx[i]+curr
            if next<0 || next>=n{ continue }
            if !visited[next] && map[next]<value{
                visited[next] = true
                q.append(next)
            }
        }
        idx += 1
    }
}

for i in 0..<n{
    let power = Int(readLine()!)!
    arr.append((i,power))
    map.append(power)
}
arr.sort(by: {$0.1<$1.1})

for _ in 0..<n{
    let curr = arr.removeLast()
    let idx = curr.0
    if !visited[idx]{
        visited[idx] = true
        bfs(from: idx)
    }
}
for ans in ans.sorted(by: <){
    print(ans)
}
