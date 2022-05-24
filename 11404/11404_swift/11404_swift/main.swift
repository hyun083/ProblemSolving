//
//  main.swift
//  11404_swift
//
//  Created by Hyun on 2022/05/24.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var map = Array(repeating: Array(repeating: 1000000000, count: n), count: n)
for i in 0..<n{
    for k in 0..<n{
        if i==k{
            map[i][k] = 0
        }
    }
}
for _ in 0..<m{
    let bus = readLine()!.split(separator: " ").map{Int(String($0))!}
    let u = bus[0]-1
    let v = bus[1]-1
    let c = bus[2]
    map[u][v] = min(map[u][v], c)
}
for k in 0..<n{
    for u in 0..<n{
        for v in 0..<n{
            map[u][v] = min(map[u][v], map[u][k] + map[k][v])
        }
    }
}

for dist in map{
    for d in dist{
        if d == 1000000000{
            print(0,terminator: " ")
        }else{
            print(d,terminator: " ")
        }
    }
    print("")
}
