//
//  main.swift
//  14464_swift
//
//  Created by Hyun on 2023/02/01.
//

import Foundation

let cn = readLine()!.split(separator: " ").map{Int($0)!}
let c = cn[0]
let n = cn[1]

var chicken = [Int]()
var cow = [(Int,Int)]()

for _ in 0..<c{
    chicken.append(Int(readLine()!)!)
}

for _ in 0..<n{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    cow.append((info[0],info[1]))
}

chicken.sort(by: <)
cow.sort(by: {
    if $0.1 == $1.1{
        return $0.0 < $1.0
    }else{
        return $0.1 < $1.1
    }
})

var cnt = 0
var visited = Array(repeating: false, count: n)

for t in 0..<c{
    let time = chicken[t]
    for k in 0..<n{
        if !visited[k]{
            let s = cow[k].0
            let e = cow[k].1
            if s<=time && time<=e{
                cnt += 1
                visited[k] = true
                break
            }
        }
    }
}

print(cnt)
