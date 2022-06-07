//
//  main.swift
//  1058_swift
//
//  Created by Hyun on 2022/06/07.
//

import Foundation

let n = Int(readLine()!)!
var arr = Array(repeating: [Bool](), count: n)
for i in 0..<n{
    let line = readLine()!.map{String($0)}
    for l in line{
        if l == "N"{
            arr[i].append(false)
        }else{
            arr[i].append(true)
        }
    }
}
for k in 0..<n{
    for u in 0..<n{
        for v in 0..<n{
            if u==v{continue}
            if arr[u][k] && arr[k][v]{arr[u][v] = true}
        }
    }
}
var result = 0
for u in 0..<n{
    var cnt = 0
    for v in 0..<n{
        if u==v{continue}
        if arr[u][v]{cnt += 1}
    }
    result = max(result, cnt)
}
print(result)
