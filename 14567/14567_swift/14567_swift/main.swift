//
//  main.swift
//  14567_swift
//
//  Created by Hyun on 2023/01/01.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var map = Array(repeating: [Int](), count: n)
var arr = Array(repeating: 0, count: n)
var ans = Array(repeating: 1, count: n)

for _ in 0..<m{
    let info = readLine()!.split(separator: " ").map{Int($0)!-1}
    let u = info[0]
    let v = info[1]
    map[u].append(v)
    arr[v] += 1
}

var q = [Int]()
var idx = 0
var semester = 2

for i in 0..<n{
    if arr[i]==0{ q.append(i) }
}

while idx < q.count{
    for _ in 0..<q.count-idx{
        let curr = q[idx]
        for next in map[curr]{
            arr[next] -= 1
            if arr[next]==0{
                q.append(next)
                ans[next] = semester
            }
        }
        idx += 1
    }
    semester += 1
}

for ans in ans{
    print(ans, terminator: " ")
}
